-- n3-grammar-90 — 〜によって・〜による
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-90',
    'grammar',
    'N3',
    $$〜によって・〜による$$,
    $$ni yotte / ni yoru$$,
    $$Por / Devido a / Dependendo de / Por meio de$$,
    $$によって é uma expressão com vários usos importantes no N3.

• Agente da passiva: indica quem fez algo, principalmente em obras, descobertas e criações. Por exemplo, "este quadro foi pintado por Picasso".
• Causa: indica o motivo de algo, geralmente acontecimentos como desastres. Por exemplo, "muitas casas foram destruídas por causa do tufão".
• Meio: indica o meio pelo qual algo é feito. Por exemplo, "a vida ficou mais prática por meio da internet".
• Variação: indica que algo muda conforme cada caso. Por exemplo, "os costumes variam de país para país".

Antes de um substantivo, usa-se による: 地震による被害 (os danos causados pelo terremoto). A forma により é mais formal e aparece em avisos e notícias.$$,
    $$No uso de variação, によって costuma vir com 違う, 異なる ou 変わる.

Em avisos de trens, 〜により運転を見合わせています ("o serviço está suspenso por causa de...") é muito comum.

Na passiva comum do dia a dia, como "fui elogiado pelo professor", usa-se に, e não によって.$$,
    $$Substantivo + によって + Verbo passivo (agente)
Substantivo + によって / により + Resultado (causa)
Substantivo + によって + Verbo (meio)
Substantivo + によって + 違う / 異なる (variação)
Substantivo + による + Substantivo$$,
    $$によって$$,
    $$によって|による|により$$,
    ARRAY['に', 'よって']::text[],
    ARRAY['によって', 'による', 'により']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-90', $$この絵はピカソによって描かれた。$$, $$このえはピカソによってかかれた。$$, $$Este quadro foi pintado por Picasso.$$),
    ('n3-grammar-90', $$国によって、習慣が違う。$$, $$くにによって、しゅうかんがちがう。$$, $$Os costumes variam de país para país.$$),
    ('n3-grammar-90', $$台風によって、多くの家が壊れた。$$, $$たいふうによって、おおくのいえがこわれた。$$, $$Muitas casas foram destruídas por causa do tufão.$$),
    ('n3-grammar-90', $$インターネットによって、生活が便利になった。$$, $$インターネットによって、せいかつがべんりになった。$$, $$A vida ficou mais prática por meio da internet.$$),
    ('n3-grammar-90', $$地震による被害は大きかった。$$, $$じしんによるひがいはおおきかった。$$, $$Os danos causados pelo terremoto foram grandes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この小説は有名な作家____書かれた。$$, $$Este romance foi escrito por um autor famoso.$$),
        (2, $$人____、考え方は違う。$$, $$O modo de pensar varia de pessoa para pessoa.$$),
        (3, $$大雨____、電車が止まった。$$, $$Os trens pararam por causa da chuva forte.$$),
        (4, $$事故____けが人は三人だった。$$, $$Houve três feridos por causa do acidente.$$),
        (5, $$話し合い____、問題を解決した。$$, $$Resolvemos o problema por meio do diálogo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によって$$),
        (2, $$によって$$),
        (3, $$によって$$),
        (3, $$により$$),
        (4, $$による$$),
        (5, $$によって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
