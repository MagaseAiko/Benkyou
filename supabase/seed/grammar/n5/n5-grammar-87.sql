-- n5-grammar-87 — ない形
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-87',
    'grammar',
    'N5',
    $$ない形$$,
    $$nai-kei$$,
    $$Forma negativa simples / Não (fazer)$$,
    $$A forma ない é a forma negativa simples dos verbos. Ela é usada na fala informal, com amigos e família, e também serve de base para muitas outras gramáticas, como ないでください e なくてもいい.

Ela equivale a "não faço" ou "não vou fazer". Para o passado, troca-se ない por なかった ("não fiz").

A formação depende do grupo do verbo:
• Grupo 1: o último som muda de "u" para "a" e recebe ない. Verbos terminados em う viram わ, e não あ.
• Grupo 2: tira-se o る e acrescenta-se ない.
• Irregulares: する vira しない, e 来る vira 来ない (こない).

O verbo ある é especial: sua forma negativa é simplesmente ない.

Depois de formado, o verbo na forma ない se comporta como um adjetivo い: o passado é なかった, e a forma educada pode ser ないです.$$,
    $$Verbos como 帰る, 入る e 走る parecem do grupo 2, mas são do grupo 1. Por isso, a forma ない deles é 帰らない, 入らない e 走らない.

A leitura de 来ない é こない, com o som "ko", e não "ki".

Na fala muito casual de algumas regiões, ない pode virar ん, mas esse uso é dialetal ou bem informal.$$,
    $$Grupo 1: troque o som final "u" por "a" + ない (書く → 書かない / 飲む → 飲まない)
Grupo 1 terminados em う: う → わ + ない (買う → 買わない)
Grupo 2: tire o る + ない (食べる → 食べない / 見る → 見ない)
Irregulares: する → しない / 来る → 来ない (こない)
Especial: ある → ない

Passado: ない → なかった$$,
    $$ない$$,
    $$ない|なかった$$,
    ARRAY['ない']::text[],
    ARRAY['ない', 'なかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-87', $$私はタバコを吸わない。$$, $$わたしはタバコをすわない。$$, $$Eu não fumo.$$),
    ('n5-grammar-87', $$今日は学校に行かない。$$, $$きょうはがっこうにいかない。$$, $$Hoje não vou à escola.$$),
    ('n5-grammar-87', $$弟は野菜を食べない。$$, $$おとうとはやさいをたべない。$$, $$Meu irmão mais novo não come verdura.$$),
    ('n5-grammar-87', $$昨日は誰も来なかった。$$, $$きのうはだれもこなかった。$$, $$Ontem ninguém veio.$$),
    ('n5-grammar-87', $$明日は雨だから、出かけない。$$, $$あしたはあめだから、でかけない。$$, $$Amanhã vai chover, então não vou sair.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私はコーヒーを飲ま____。$$, $$Eu não bebo café.$$),
        (2, $$父は朝ご飯を食べ____。$$, $$Meu pai não toma café da manhã.$$),
        (3, $$昨日はテレビを見____。$$, $$Ontem não vi TV.$$),
        (4, $$今日は疲れたから、宿題を____。$$, $$Hoje estou cansado, então não vou fazer a lição.$$),
        (5, $$明日、田中さんは学校に____。$$, $$Amanhã, o Tanaka não vem à escola.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ない$$),
        (2, $$ない$$),
        (3, $$なかった$$),
        (4, $$しない$$),
        (5, $$来ない$$),
        (5, $$こない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
