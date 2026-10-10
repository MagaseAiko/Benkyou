"""Gera os scripts SQL de gramática a partir dos módulos de dados (data_*.py)."""
import glob
import importlib.util
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = r"C:\Users\aiko4\Documents\Github\Benkyou\supabase\seed\grammar"

ID_RE = re.compile(r"^n([1-5])-grammar-(\d{2,})$")
BAD_RX = re.compile(r"[\[\]()^$]|\?:| \||\| |^/|/$")


def load(level):
    items = []
    for path in sorted(glob.glob(os.path.join(HERE, f"data_{level}_*.py"))):
        spec = importlib.util.spec_from_file_location(os.path.basename(path)[:-3], path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        items.extend(mod.G)
    return items


def q(s):
    s = s.strip()
    assert "$$" not in s, s
    return "$$" + s + "$$"


def arr(xs):
    return "ARRAY[" + ", ".join("'" + x.replace("'", "''") + "'" for x in xs) + "]::text[]"


def validate(level, g):
    gid = f"{level}-grammar-{g['n']:02d}"
    errs = []
    m = ID_RE.match(gid)
    if not m or m.group(1) != level[1] or int(m.group(2)) == 0:
        errs.append("id inválido")
    for k in ("jp", "rd", "tr", "ex", "st", "no", "bf", "rx", "tk", "va", "E", "R"):
        if not g.get(k):
            errs.append(f"campo vazio: {k}")
    if len(g["E"]) != 5:
        errs.append(f"{len(g['E'])} exemplos")
    if len(g["R"]) != 5:
        errs.append(f"{len(g['R'])} exercícios")
    for part in g["tr"].split("/"):
        p = part.strip()
        if not p or not p[0].isupper() and not p[0] in "“\"":
            errs.append(f"tradução sem maiúscula: {p!r}")
    if " /" not in g["tr"] and "/" in g["tr"]:
        errs.append("separador de tradução sem espaços")
    if "," in g["tr"] or ";" in g["tr"]:
        errs.append("tradução com vírgula/ponto e vírgula")
    for k in ("ex", "no", "st"):
        if "。" in g[k]:
            errs.append(f"frase japonesa em {k}")
        if re.search(r"regex|sql|supabase|postgre|banco de dados", g[k], re.I):
            errs.append(f"termo técnico em {k}")
    if BAD_RX.search(g["rx"]):
        errs.append(f"regex fora do formato: {g['rx']}")
    rx = re.compile(g["rx"])
    for jp, rd, pt in g["E"]:
        if not rx.search(jp):
            errs.append(f"regex não casa exemplo: {jp}")
        if re.search(r"[a-zA-Z]", rd):
            errs.append(f"romaji na leitura: {rd}")
        if re.search(r"[\u4e00-\u9fff]", rd):
            errs.append(f"kanji na leitura: {rd}")
    sents = [r[0] for r in g["R"]]
    if len(set(sents)) != len(sents):
        errs.append("exercícios repetidos")
    for s, pt, answers in g["R"]:
        if s.count("____") != 1 or "_____" in s:
            errs.append(f"lacuna inválida: {s}")
        if not answers or len(set(answers)) != len(answers):
            errs.append(f"respostas vazias/duplicadas: {s}")
        for a in answers:
            if not rx.search(s.replace("____", a)):
                errs.append(f"regex não casa resposta {a!r}: {s}")
    return gid, errs


def sql(level, g, gid):
    L = level.upper()
    out = [f"-- {gid} — {g['jp']}", "BEGIN;", "", "-- grammar"]
    out.append(
        "INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)\nVALUES (\n"
        + ",\n".join(
            "    " + v
            for v in [
                f"'{gid}'", "'grammar'", f"'{L}'", q(g["jp"]), q(g["rd"]), q(g["tr"]),
                q(g["ex"]), q(g["no"]), q(g["st"]), q(g["bf"]), q(g["rx"]), arr(g["tk"]), arr(g["va"]),
            ]
        )
        + "\n);"
    )
    out += ["", "-- examples", "INSERT INTO public.examples (grammar_id, japanese, reading, translation)\nVALUES"]
    out.append(",\n".join(f"    ('{gid}', {q(a)}, {q(b)}, {q(c)})" for a, b, c in g["E"]) + ";")
    out += ["", "-- review_sentences + review_answers",
            "WITH src (k, sentence, translation) AS (\n    VALUES"]
    out.append(",\n".join(f"        ({i}, {q(s)}, {q(t)})" for i, (s, t, _) in enumerate(g["R"], 1)) + "\n),")
    out.append(
        "inserted_reviews AS (\n"
        "    INSERT INTO public.review_sentences (grammar_id, sentence, translation)\n"
        f"    SELECT '{gid}', sentence, translation FROM src ORDER BY k\n"
        "    RETURNING id, sentence\n),\nans (k, answer) AS (\n    VALUES"
    )
    out.append(",\n".join(f"        ({i}, {q(a)})" for i, (_, _, ans) in enumerate(g["R"], 1) for a in ans) + "\n)")
    out.append(
        "INSERT INTO public.review_answers (review_sentence_id, answer)\n"
        "SELECT r.id, a.answer\nFROM ans a\nJOIN src s ON s.k = a.k\nJOIN inserted_reviews r ON r.sentence = s.sentence\nORDER BY a.k;"
    )
    out += ["", "COMMIT;", ""]
    return "\n".join(out)


def main(level):
    items = load(level)
    nums = [g["n"] for g in items]
    assert len(nums) == len(set(nums)), "números repetidos"
    d = os.path.join(OUT, level)
    os.makedirs(d, exist_ok=True)
    bad = 0
    allsql = []
    for g in sorted(items, key=lambda x: x["n"]):
        gid, errs = validate(level, g)
        if errs:
            bad += 1
            print(gid, g["jp"])
            for e in errs:
                print("   -", e)
            continue
        s = sql(level, g, gid)
        open(os.path.join(d, gid + ".sql"), "w", encoding="utf-8", newline="\n").write(s)
        allsql.append(s)
    open(os.path.join(OUT, f"{level}_all.sql"), "w", encoding="utf-8", newline="\n").write("\n".join(allsql))
    print(f"{level}: {len(items) - bad} ok, {bad} com erro; números: {sorted(nums)[:1]}..{sorted(nums)[-1:]}")
    print("faltando:", [n for n in range(1, max(nums) + 1) if n not in nums])


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "n5")
