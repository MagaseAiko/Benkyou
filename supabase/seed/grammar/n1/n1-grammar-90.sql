-- n1-grammar-90 — 〜ないものでもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-90',
    'grammar',
    'N1',
    $$〜ないものでもない$$,
    $$nai mono demo nai$$,
    $$Não é impossível / Até que dá para / Não deixa de ser possível$$,
    $$ないものでもない é uma dupla negação que expressa uma possibilidade fraca. Equivale a "não é impossível" ou "até que dá para".

A pessoa admite que algo é possível, mas sem muita vontade ou certeza. Por exemplo, "se você insistir, até que dá para eu ajudar".

É uma expressão formal e indireta.$$,
    $$É parecido com なくはない e ないこともない, mas ないものでもない é mais formal.

Muitas vezes vem com uma condição, como ば ou なら.$$,
    $$Verbo (forma ない) + ものでもない
Verbo (forma potencial, forma ない) + ものでもない$$,
    $$ないものでもない$$,
    $$ないものでもない|ないものでもありません$$,
    ARRAY['ない', 'もの', 'でも', 'ない']::text[],
    ARRAY['ないものでもない', 'ないものでもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-90', $$急げば、間に合わないものでもない。$$, $$いそげば、まにあわないものでもない。$$, $$Se correr, não é impossível chegar a tempo.$$),
    ('n1-grammar-90', $$条件次第では、引き受けないものでもない。$$, $$じょうけんしだいでは、ひきうけないものでもない。$$, $$Dependendo das condições, até que dá para eu aceitar.$$),
    ('n1-grammar-90', $$頼まれれば、手伝わないものでもない。$$, $$たのまれれば、てつだわないものでもない。$$, $$Se me pedirem, até que posso ajudar.$$),
    ('n1-grammar-90', $$その気持ちはわからないものでもない。$$, $$そのきもちはわからないものでもない。$$, $$Esse sentimento não deixa de ser compreensível.$$),
    ('n1-grammar-90', $$二人で頑張れば、できないものでもありません。$$, $$ふたりでがんばれば、できないものでもありません。$$, $$Se nós dois nos esforçarmos, não é impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$値段によっては、買わ____。$$, $$Dependendo do preço, até que eu compro.$$),
        (2, $$練習すれば、勝て____。$$, $$Se treinar, não é impossível vencer.$$),
        (3, $$彼が謝るなら、許さ____。$$, $$Se ele pedir desculpas, até que dá para perdoar.$$),
        (4, $$時間があれば、行か____。$$, $$Se eu tiver tempo, até que posso ir.$$),
        (5, $$この問題は難しいが、解け____。$$, $$Este problema é difícil, mas não é impossível de resolver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないものでもない$$),
        (1, $$ないものでもありません$$),
        (2, $$ないものでもない$$),
        (2, $$ないものでもありません$$),
        (3, $$ないものでもない$$),
        (3, $$ないものでもありません$$),
        (4, $$ないものでもない$$),
        (4, $$ないものでもありません$$),
        (5, $$ないものでもない$$),
        (5, $$ないものでもありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
