-- n3-grammar-85 — 〜にとって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-85',
    'grammar',
    'N3',
    $$〜にとって$$,
    $$ni totte$$,
    $$Para (alguém) / Do ponto de vista de$$,
    $$にとって é usado para indicar o ponto de vista de alguém, ou seja, para quem algo é importante, difícil, necessário ou especial. Equivale a "para" ou "do ponto de vista de".

Ele vem depois de uma pessoa, um grupo ou uma coisa, e a segunda parte traz uma avaliação, geralmente com adjetivos como 大切, 難しい, 必要 e 特別.

Por exemplo, "para mim, a família é o mais importante" ou "para estrangeiros, kanji é difícil".

Com は, にとっては destaca o contraste: "para os estudantes, pelo menos, as férias são a maior alegria". Com の, にとっての vem antes de um substantivo.

にとって é usado para avaliações e opiniões, e não para ações feitas para alguém. Para isso, usa-se のために.$$,
    $$Um erro comum é usar にとって com verbos de ação. Para "fiz um bolo para minha mãe", usa-se のために ou に, e não にとって.

Comparando: にとって indica para quem algo tem certo valor; に対して indica para quem uma ação é direcionada.

Em redações, 私にとって〜とは ("para mim, X é...") é uma forma comum de começar uma reflexão.$$,
    $$Pessoa / Grupo / Coisa + にとって + Avaliação (大切 / 難しい / 必要 / 特別)
Pessoa + にとっては + … (contraste)
Pessoa + にとっての + Substantivo$$,
    $$にとって$$,
    $$にとって|にとっては|にとっての$$,
    ARRAY['に', 'とって']::text[],
    ARRAY['にとって', 'にとっては', 'にとっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-85', $$私にとって、家族が一番大切です。$$, $$わたしにとって、かぞくがいちばんたいせつです。$$, $$Para mim, a família é o mais importante.$$),
    ('n3-grammar-85', $$この写真は私にとって大切な宝物だ。$$, $$このしゃしんはわたしにとってたいせつなたからものだ。$$, $$Esta foto é um tesouro precioso para mim.$$),
    ('n3-grammar-85', $$子供にとって、遊ぶことも勉強だ。$$, $$こどもにとって、あそぶこともべんきょうだ。$$, $$Para as crianças, brincar também é aprender.$$),
    ('n3-grammar-85', $$外国人にとって、漢字は難しい。$$, $$がいこくじんにとって、かんじはむずかしい。$$, $$Para os estrangeiros, kanji é difícil.$$),
    ('n3-grammar-85', $$学生にとっては、夏休みが一番の楽しみだ。$$, $$がくせいにとっては、なつやすみがいちばんのたのしみだ。$$, $$Para os estudantes, as férias de verão são a maior alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____、音楽はなくてはならないものだ。$$, $$Para mim, a música é algo indispensável.$$),
        (2, $$植物____、水と光は必要だ。$$, $$Para as plantas, água e luz são necessárias.$$),
        (3, $$経験が長い彼____、この仕事は簡単すぎる。$$, $$Para ele, que tem muita experiência, este trabalho é fácil demais.$$),
        (4, $$子供たち____、公園は大切な場所だ。$$, $$Para as crianças, o parque é um lugar importante.$$),
        (5, $$日本人____、桜は特別な花です。$$, $$Para os japoneses, a cerejeira é uma flor especial.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にとって$$),
        (2, $$にとって$$),
        (3, $$にとって$$),
        (4, $$にとって$$),
        (5, $$にとって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
