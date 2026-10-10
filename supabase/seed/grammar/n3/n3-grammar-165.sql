-- n3-grammar-165 — 〜は〜で有名
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-165',
    'grammar',
    'N3',
    $$〜は〜で有名$$,
    $$wa ~ de yuumei$$,
    $$Ser famoso por / Ser conhecido por$$,
    $$は〜で有名 é usado para dizer pelo que um lugar, uma pessoa ou uma coisa é famoso. Equivale a "ser famoso por" ou "ser conhecido por".

O tema vem com は, e o motivo da fama vem com で, antes de 有名. Por exemplo, "Kyoto é famosa pelos templos" ou "esta cidade é conhecida pelas fontes termais".

Para dizer que é famoso por uma ação ou característica, usa-se こと + で: "ele é famoso por cantar bem".

Antes de um substantivo, usa-se で有名な: ケーキで有名な店 (uma loja famosa pelos bolos).

A partícula で aqui indica o motivo ou a razão da fama.$$,
    $$Para "famoso entre" um grupo de pessoas, usa-se に: 若者に有名だ (famoso entre os jovens).

Também se usa として有名 para "famoso como": 観光地として有名だ.

É uma estrutura muito útil para apresentar cidades e pontos turísticos.$$,
    $$Lugar / Pessoa / Coisa + は + Substantivo + で有名だ / です
Frase + こと + で有名だ
Substantivo + で有名な + Substantivo$$,
    $$で有名$$,
    $$で有名|でゆうめい$$,
    ARRAY['は', 'で', '有名']::text[],
    ARRAY['で有名', 'で有名だ', 'で有名な']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-165', $$京都はお寺で有名です。$$, $$きょうとはおてらでゆうめいです。$$, $$Kyoto é famosa pelos templos.$$),
    ('n3-grammar-165', $$この町は温泉で有名だ。$$, $$このまちはおんせんでゆうめいだ。$$, $$Esta cidade é conhecida pelas fontes termais.$$),
    ('n3-grammar-165', $$北海道はラーメンで有名です。$$, $$ほっかいどうはラーメンでゆうめいです。$$, $$Hokkaido é famosa pelo ramen.$$),
    ('n3-grammar-165', $$ここはケーキで有名な店です。$$, $$ここはケーキでゆうめいなみせです。$$, $$Aqui é uma loja famosa pelos bolos.$$),
    ('n3-grammar-165', $$彼は歌がうまいことで有名だ。$$, $$かれはうたがうまいことでゆうめいだ。$$, $$Ele é famoso por cantar bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$静岡はお茶____です。$$, $$Shizuoka é famosa pelo chá.$$),
        (2, $$この村は桜____な場所だ。$$, $$Esta vila é um lugar famoso pelas cerejeiras.$$),
        (3, $$奈良は鹿____です。$$, $$Nara é famosa pelos cervos.$$),
        (4, $$この店は安いこと____だ。$$, $$Esta loja é conhecida por ser barata.$$),
        (5, $$ブラジルはサッカー____です。$$, $$O Brasil é famoso pelo futebol.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で有名$$),
        (2, $$で有名$$),
        (3, $$で有名$$),
        (4, $$で有名$$),
        (5, $$で有名$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
