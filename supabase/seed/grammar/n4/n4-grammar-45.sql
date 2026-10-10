-- n4-grammar-45 — 〜みたいな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-45',
    'grammar',
    'N4',
    $$〜みたいな$$,
    $$mitai na$$,
    $$Como / Igual a / Do tipo de$$,
    $$みたいな é usado antes de um substantivo para comparar ou dar um exemplo. Equivale a "como", "igual a" ou "do tipo de".

Como みたい funciona como um adjetivo な, ele recebe な quando vem antes de um substantivo. Assim, "uma pessoa como ele" ou "uma cidade grande como Tóquio".

Ele tem dois sentidos principais. O primeiro é comparação: algo que se parece com outra coisa, como "uma história que parece um sonho". O segundo é exemplo: algo do tipo daquilo que foi citado, como "quero morar numa cidade como Tóquio".

É uma forma casual, muito usada na conversa. Em textos formais, usa-se のような.$$,
    $$Na fala jovem, みたいな também é usado no final da frase como uma espécie de "tipo assim", para suavizar ou resumir algo que se disse. Esse uso é bem coloquial.

A versão formal equivalente é のような: 彼のような人.

Muitas vezes, みたいな com uma pessoa expressa admiração, como querer ser alguém parecido com ela.$$,
    $$Substantivo + みたいな + Substantivo
Verbo / Adjetivo (forma simples) + みたいな + Substantivo$$,
    $$みたいな$$,
    $$みたいな$$,
    ARRAY['みたい', 'な']::text[],
    ARRAY['みたいな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-45', $$私は彼みたいな人になりたいです。$$, $$わたしはかれみたいなひとになりたいです。$$, $$Quero ser uma pessoa como ele.$$),
    ('n4-grammar-45', $$東京みたいな大きい町に住みたい。$$, $$とうきょうみたいなおおきいまちにすみたい。$$, $$Quero morar numa cidade grande como Tóquio.$$),
    ('n4-grammar-45', $$子供みたいなことを言わないで。$$, $$こどもみたいなことをいわないで。$$, $$Não diga coisas de criança.$$),
    ('n4-grammar-45', $$それは夢みたいな話ですね。$$, $$それはゆめみたいなはなしですね。$$, $$Essa é uma história que parece um sonho, hein.$$),
    ('n4-grammar-45', $$桜みたいなピンクの服を買いました。$$, $$さくらみたいなピンクのふくをかいました。$$, $$Comprei uma roupa de um rosa como o das cerejeiras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母は天使____人です。$$, $$Minha mãe é uma pessoa que parece um anjo.$$),
        (2, $$私もあなた____先生になりたいです。$$, $$Eu também quero ser um professor como você.$$),
        (3, $$冗談____話だけど、本当なんだ。$$, $$Parece uma piada, mas é verdade.$$),
        (4, $$わあ、お城____家ですね。$$, $$Nossa, é uma casa que parece um castelo!$$),
        (5, $$雪____白いケーキを作りました。$$, $$Fiz um bolo branco como a neve.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいな$$),
        (2, $$みたいな$$),
        (3, $$みたいな$$),
        (4, $$みたいな$$),
        (5, $$みたいな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
