-- n2-grammar-58 — 〜ことなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-58',
    'grammar',
    'N2',
    $$〜ことなく$$,
    $$koto naku$$,
    $$Sem / Sem jamais / Nem uma vez$$,
    $$ことなく é usado para dizer que algo é feito sem que outra coisa aconteça. Equivale a "sem" ou "sem jamais".

Ele vem depois do verbo na forma de dicionário. O sentido é o mesmo de ないで e ずに, mas ことなく soa mais formal e literário.

Muitas vezes, indica uma ação que seria natural ou esperada, mas que não aconteceu nem uma vez. Por exemplo, "ele trabalhou sem parar" ou "perseguiu o sonho sem desistir nem uma vez".

É muito usado em textos escritos, notícias, discursos e narrativas, especialmente para descrever persistência ou continuidade.$$,
    $$Na conversa do dia a dia, ないで ou ずに são mais naturais.

ことなく aparece muito em frases sobre persistência, como 休むことなく e あきらめることなく.

Em textos sobre tradição, 変わることなく ("sem mudar") é comum para falar de algo que se mantém.$$,
    $$Verbo na forma de dicionário + ことなく + Verbo
一度も + Verbo + ことなく (sem nem uma vez)

Variação: こともなく$$,
    $$ことなく$$,
    $$ことなく|こともなく$$,
    ARRAY['こと', 'なく']::text[],
    ARRAY['ことなく', 'こともなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-58', $$彼は休むことなく働き続けた。$$, $$かれはやすむことなくはたらきつづけた。$$, $$Ele continuou trabalhando sem parar.$$),
    ('n2-grammar-58', $$一度もあきらめることなく、夢を追い続けた。$$, $$いちどもあきらめることなく、ゆめをおいつづけた。$$, $$Perseguiu o sonho sem desistir nem uma vez.$$),
    ('n2-grammar-58', $$誰にも知られることなく、彼は町を出た。$$, $$だれにもしられることなく、かれはまちをでた。$$, $$Ele deixou a cidade sem que ninguém soubesse.$$),
    ('n2-grammar-58', $$彼女は迷うことなく、その仕事を選んだ。$$, $$かのじょはまようことなく、そのしごとをえらんだ。$$, $$Ela escolheu esse trabalho sem hesitar.$$),
    ('n2-grammar-58', $$雨は止むことなく降り続いた。$$, $$あめはやむことなくふりつづいた。$$, $$A chuva continuou caindo sem parar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は一日も休む____、学校に通った。$$, $$Ela frequentou a escola sem faltar nem um dia.$$),
        (2, $$彼は誰にも相談する____、一人で決めた。$$, $$Ele decidiu sozinho, sem consultar ninguém.$$),
        (3, $$失敗を恐れる____、挑戦してください。$$, $$Tente sem ter medo de errar.$$),
        (4, $$彼は振り返る____、去っていった。$$, $$Ele foi embora sem olhar para trás.$$),
        (5, $$この店は、百年間変わる____昔の味を守っている。$$, $$Esta loja mantém o sabor de antigamente há cem anos, sem mudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことなく$$),
        (2, $$ことなく$$),
        (3, $$ことなく$$),
        (4, $$ことなく$$),
        (5, $$ことなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
