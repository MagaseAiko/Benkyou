-- n2-grammar-50 — 〜からには
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-50',
    'grammar',
    'N2',
    $$〜からには$$,
    $$kara ni wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$からには é usado para dizer que, como uma situação ou decisão é assim, existe uma obrigação, uma vontade ou uma determinação natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão (vir ao Japão, prometer, participar, ser escolhido). A segunda mostra o que, por isso, deve ou se quer fazer, com expressões como たい, なければならない, べきだ, つもりだ ou uma determinação forte.

Por exemplo, "já que vim ao Japão, quero estudar japonês" ou "uma vez que prometi, tenho que cumprir".

O sentido é praticamente igual ao de 以上は e 上は. からには é o mais comum na conversa.$$,
    $$A segunda parte quase sempre expressa determinação, dever ou forte vontade.

やるからには ("já que vou fazer") é uma expressão muito usada para mostrar comprometimento.

以上は soa um pouco mais formal; 上は é o mais formal dos três.$$,
    $$Verbo (forma simples) + からには、 + Obrigação / Vontade / Determinação
Substantivo + である + からには$$,
    $$からには$$,
    $$からには$$,
    ARRAY['から', 'には']::text[],
    ARRAY['からには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-50', $$日本に来たからには、日本語を勉強したい。$$, $$にほんにきたからには、にほんごをべんきょうしたい。$$, $$Já que vim ao Japão, quero estudar japonês.$$),
    ('n2-grammar-50', $$約束したからには、守らなければならない。$$, $$やくそくしたからには、まもらなければならない。$$, $$Uma vez que prometi, tenho que cumprir.$$),
    ('n2-grammar-50', $$試合に出るからには、勝ちたい。$$, $$しあいにでるからには、かちたい。$$, $$Já que vou participar da partida, quero vencer.$$),
    ('n2-grammar-50', $$やると決めたからには、最後までやる。$$, $$やるときめたからには、さいごまでやる。$$, $$Uma vez que decidi fazer, vou até o fim.$$),
    ('n2-grammar-50', $$社長になったからには、会社を成長させたい。$$, $$しゃちょうになったからには、かいしゃをせいちょうさせたい。$$, $$Já que me tornei presidente, quero fazer a empresa crescer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学する____、その国の文化も学びたい。$$, $$Já que vou fazer intercâmbio, quero aprender também a cultura do país.$$),
        (2, $$仕事を引き受けた____、責任を持つべきだ。$$, $$Uma vez que aceitou o trabalho, deve assumir a responsabilidade.$$),
        (3, $$高いお金を払った____、楽しまないと。$$, $$Já que paguei caro, tenho que aproveitar.$$),
        (4, $$代表に選ばれた____、全力を尽くします。$$, $$Já que fui escolhido como representante, vou dar o meu melhor.$$),
        (5, $$始めた____、途中でやめない。$$, $$Uma vez que comecei, não vou parar no meio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からには$$),
        (2, $$からには$$),
        (3, $$からには$$),
        (4, $$からには$$),
        (5, $$からには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
