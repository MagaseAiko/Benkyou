-- n2-grammar-79 — 〜ないことには〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-79',
    'grammar',
    'N2',
    $$〜ないことには〜ない$$,
    $$nai koto niwa ~ nai$$,
    $$Se não... não / Sem... não dá / A menos que$$,
    $$ないことには〜ない indica que, se uma condição não for cumprida, algo não vai acontecer ou não vai ser possível. Equivale a "se não..., não..." ou "sem..., não dá".

A primeira parte mostra uma condição necessária. A segunda parte é sempre negativa. Por exemplo, "se não experimentar, não dá para saber se é gostoso".

É uma expressão que reforça a importância da condição.$$,
    $$A segunda parte costuma ser わからない, できない, 始まらない ou 話にならない.

É parecido com なければ〜ない, mas ないことには dá mais ênfase à condição.$$,
    $$Verbo (forma ない) + ことには + Frase negativa
Adjetivo い (forma くない) + ことには + Frase negativa
Adjetivo な / Substantivo + でない + ことには + Frase negativa$$,
    $$ないことには$$,
    $$ないことには$$,
    ARRAY['ない', 'こと', 'には']::text[],
    ARRAY['ないことには', 'でないことには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-79', $$実際に食べてみないことには、おいしいかどうかわからない。$$, $$じっさいにたべてみないことには、おいしいかどうかわからない。$$, $$Se não experimentar de verdade, não dá para saber se é gostoso.$$),
    ('n2-grammar-79', $$社長が来ないことには、会議が始められない。$$, $$しゃちょうがこないことには、かいぎがはじめられない。$$, $$Se o presidente não vier, não dá para começar a reunião.$$),
    ('n2-grammar-79', $$お金がないことには、何もできない。$$, $$おかねがないことには、なにもできない。$$, $$Sem dinheiro, não dá para fazer nada.$$),
    ('n2-grammar-79', $$健康でないことには、仕事も楽しめない。$$, $$けんこうでないことには、しごともたのしめない。$$, $$Sem saúde, não dá para aproveitar nem o trabalho.$$),
    ('n2-grammar-79', $$本人に会わないことには、何とも言えない。$$, $$ほんにんにあわないことには、なんともいえない。$$, $$Se eu não encontrar a pessoa, não posso dizer nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$練習し____、上手にならない。$$, $$Se não praticar, não vai melhorar.$$),
        (2, $$やってみ____、結果はわからない。$$, $$Se não tentar, não dá para saber o resultado.$$),
        (3, $$天気がよくなら____、出発できない。$$, $$Se o tempo não melhorar, não dá para partir.$$),
        (4, $$詳しい話を聞か____、判断できない。$$, $$Se eu não ouvir os detalhes, não posso decidir.$$),
        (5, $$パスポートが____、海外には行けない。$$, $$Sem passaporte, não dá para ir ao exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないことには$$),
        (2, $$ないことには$$),
        (3, $$ないことには$$),
        (4, $$ないことには$$),
        (5, $$ないことには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
