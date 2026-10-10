-- n2-grammar-52 — 〜からすると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-52',
    'grammar',
    'N2',
    $$〜からすると$$,
    $$kara suru to$$,
    $$A julgar por / Do ponto de vista de / Para$$,
    $$からすると tem dois usos principais.

O primeiro é fazer uma suposição a partir de algo observado. Equivale a "a julgar por". A pessoa observa uma pista, como a expressão de alguém, o céu ou pegadas, e chega a uma conclusão provável. A frase costuma terminar com ようだ, らしい, だろう ou そうだ.

O segundo é indicar o ponto de vista de alguém ou de um grupo. Equivale a "do ponto de vista de" ou "para". Por exemplo, "do ponto de vista dos pais, a segurança dos filhos é o mais importante".

A forma からすれば tem o mesmo sentido.$$,
    $$No uso de suposição, からすると é parecido com からして e から見ると.

No uso de ponto de vista, からすれば é um pouco mais comum.

É uma expressão muito usada em deduções e em discussões sobre diferentes pontos de vista.$$,
    $$Substantivo (pista observada) + からすると、 + Suposição + ようだ / らしい / だろう
Substantivo (pessoa / grupo / posição) + からすると / からすれば、 + Opinião$$,
    $$からすると$$,
    $$からすると|からすれば$$,
    ARRAY['から', 'すると']::text[],
    ARRAY['からすると', 'からすれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-52', $$彼の表情からすると、試験はうまくいったようだ。$$, $$かれのひょうじょうからすると、しけんはうまくいったようだ。$$, $$A julgar pela expressão dele, parece que a prova foi bem.$$),
    ('n2-grammar-52', $$親の立場からすると、子供の安全が一番だ。$$, $$おやのたちばからすると、こどものあんぜんがいちばんだ。$$, $$Do ponto de vista dos pais, a segurança dos filhos é o mais importante.$$),
    ('n2-grammar-52', $$この空からすると、午後は雨になりそうだ。$$, $$このそらからすると、ごごはあめになりそうだ。$$, $$A julgar por este céu, parece que vai chover à tarde.$$),
    ('n2-grammar-52', $$日本人からすれば、当たり前のことかもしれない。$$, $$にほんじんからすれば、あたりまえのことかもしれない。$$, $$Para os japoneses, talvez seja algo óbvio.$$),
    ('n2-grammar-52', $$彼の話し方からすると、関西の人だろう。$$, $$かれのはなしかたからすると、かんさいのひとだろう。$$, $$A julgar pelo jeito de falar, ele deve ser da região de Kansai.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の様子____、何か心配事があるようだ。$$, $$A julgar pelo jeito dela, parece que há alguma preocupação.$$),
        (2, $$子供の立場____、親の言うことは厳しすぎる。$$, $$Do ponto de vista das crianças, o que os pais dizem é rígido demais.$$),
        (3, $$足跡____、犯人は男性だろう。$$, $$A julgar pelas pegadas, o culpado deve ser um homem.$$),
        (4, $$専門家____、この計画は無理がある。$$, $$Do ponto de vista dos especialistas, este plano é inviável.$$),
        (5, $$彼の顔色____、体調が悪いみたいだ。$$, $$A julgar pela cor do rosto dele, parece que não está bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からすると$$),
        (1, $$からすれば$$),
        (2, $$からすると$$),
        (2, $$からすれば$$),
        (3, $$からすると$$),
        (3, $$からすれば$$),
        (4, $$からすると$$),
        (4, $$からすれば$$),
        (5, $$からすると$$),
        (5, $$からすれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
