-- n1-grammar-235 — 〜はおろか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-235',
    'grammar',
    'N1',
    $$〜はおろか$$,
    $$wa oroka$$,
    $$Sem falar de / Nem mesmo / Muito menos$$,
    $$はおろか indica que, se nem o caso mais simples é possível, o caso mais difícil é ainda menos possível. Equivale a "sem falar de" ou "nem mesmo".

A primeira parte é algo mais óbvio ou grande, e a segunda é algo mais básico, que também não acontece. Por exemplo, "não sei nem escrever hiragana, sem falar de kanji".

É uma expressão formal, geralmente com tom negativo.$$,
    $$É parecido com どころか e はもちろん, mas はおろか costuma ter tom negativo e de surpresa.

A segunda parte costuma ter も, さえ ou すら.$$,
    $$Substantivo + はおろか + Substantivo + も / さえ / すら + Frase negativa$$,
    $$はおろか$$,
    $$はおろか$$,
    ARRAY['は', 'おろか']::text[],
    ARRAY['はおろか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-235', $$彼は漢字はおろか、ひらがなも書けない。$$, $$かれはかんじはおろか、ひらがなもかけない。$$, $$Ele não sabe escrever nem hiragana, sem falar de kanji.$$),
    ('n1-grammar-235', $$忙しくて、旅行はおろか、休む時間もない。$$, $$いそがしくて、りょこうはおろか、やすむじかんもない。$$, $$Estou tão ocupado que não tenho nem tempo para descansar, muito menos para viajar.$$),
    ('n1-grammar-235', $$車はおろか、自転車も持っていない。$$, $$くるまはおろか、じてんしゃももっていない。$$, $$Não tenho nem bicicleta, sem falar de carro.$$),
    ('n1-grammar-235', $$彼女は外国語はおろか、日本語の敬語さえ使えない。$$, $$かのじょはがいこくごはおろか、にほんごのけいごさえつかえない。$$, $$Ela não consegue usar nem a linguagem honorífica do japonês, muito menos línguas estrangeiras.$$),
    ('n1-grammar-235', $$けがで、走ることはおろか、歩くこともできない。$$, $$けがで、はしることはおろか、あるくこともできない。$$, $$Com a lesão, não consigo nem andar, muito menos correr.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は料理____、お湯も沸かせない。$$, $$Ele não sabe nem ferver água, sem falar de cozinhar.$$),
        (2, $$貯金____、生活費も足りない。$$, $$Não tenho nem para as despesas do dia a dia, muito menos para poupar.$$),
        (3, $$この村には病院____、コンビニさえない。$$, $$Esta vila não tem nem loja de conveniência, sem falar de hospital.$$),
        (4, $$彼は謝罪____、挨拶すらしなかった。$$, $$Ele não cumprimentou nem sequer, muito menos pediu desculpas.$$),
        (5, $$海外旅行____、国内旅行もしたことがない。$$, $$Nunca viajei nem dentro do país, sem falar do exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-235', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はおろか$$),
        (2, $$はおろか$$),
        (3, $$はおろか$$),
        (4, $$はおろか$$),
        (5, $$はおろか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
