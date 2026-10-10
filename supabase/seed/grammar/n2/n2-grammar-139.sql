-- n2-grammar-139 — 次第に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-139',
    'grammar',
    'N2',
    $$次第に$$,
    $$shidai ni$$,
    $$Gradualmente / Aos poucos / Pouco a pouco$$,
    $$次第に indica que uma mudança acontece de forma gradual, ao longo do tempo. Equivale a "gradualmente" ou "aos poucos".

Costuma vir com verbos de mudança, como なる, 増える, 減る e 変わる. Por exemplo, "aos poucos foi ficando escuro".

É um pouco mais formal que だんだん.$$,
    $$É parecido com だんだん e 徐々に.

だんだん é mais coloquial, 次第に é mais comum na escrita e 徐々に destaca uma mudança lenta e constante.$$,
    $$次第に + Verbo (mudança)$$,
    $$次第に$$,
    $$次第に|しだいに$$,
    ARRAY['次第', 'に']::text[],
    ARRAY['次第に', 'しだいに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-139', $$空が次第に暗くなってきた。$$, $$そらがしだいにくらくなってきた。$$, $$O céu foi escurecendo aos poucos.$$),
    ('n2-grammar-139', $$日本の生活にも次第に慣れてきた。$$, $$にほんのせいかつにもしだいになれてきた。$$, $$Fui me acostumando gradualmente com a vida no Japão.$$),
    ('n2-grammar-139', $$雨は次第に強くなった。$$, $$あめはしだいにつよくなった。$$, $$A chuva foi ficando mais forte.$$),
    ('n2-grammar-139', $$彼の病気は次第によくなっている。$$, $$かれのびょうきはしだいによくなっている。$$, $$A doença dele está melhorando pouco a pouco.$$),
    ('n2-grammar-139', $$町の人口は次第に減っている。$$, $$まちのじんこうはしだいにへっている。$$, $$A população da cidade está diminuindo gradualmente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$春になって、____暖かくなってきた。$$, $$Com a chegada da primavera, foi esquentando aos poucos.$$),
        (2, $$練習を続けて、____上手になった。$$, $$Continuando a praticar, fui melhorando gradualmente.$$),
        (3, $$二人の関係は____悪くなった。$$, $$A relação dos dois foi piorando aos poucos.$$),
        (4, $$緊張も____ほぐれてきた。$$, $$O nervosismo também foi passando pouco a pouco.$$),
        (5, $$台風が近づき、風が____強まった。$$, $$Com a aproximação do tufão, o vento foi ficando mais forte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第に$$),
        (1, $$しだいに$$),
        (2, $$次第に$$),
        (2, $$しだいに$$),
        (3, $$次第に$$),
        (3, $$しだいに$$),
        (4, $$次第に$$),
        (4, $$しだいに$$),
        (5, $$次第に$$),
        (5, $$しだいに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
