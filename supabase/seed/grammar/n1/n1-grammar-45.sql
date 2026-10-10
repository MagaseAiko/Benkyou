-- n1-grammar-45 — 〜かと思いきや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-45',
    'grammar',
    'N1',
    $$〜かと思いきや$$,
    $$ka to omoikiya$$,
    $$Quando se pensava que / Achei que... mas / Contrariando as expectativas$$,
    $$かと思いきや indica que a pessoa esperava um resultado, mas aconteceu algo diferente, para a surpresa dela. Equivale a "quando se pensava que..." ou "achei que..., mas".

A primeira parte mostra a expectativa, e a segunda mostra o resultado inesperado. Por exemplo, "achei que ia chover, mas fez sol".

É uma expressão um pouco literária, comum na escrita.$$,
    $$Não se usa para falar de algo que aconteceu de acordo com o esperado.

É parecido com と思ったら e と思っていたのに.$$,
    $$Frase (forma simples) + かと思いきや + Resultado inesperado
Substantivo + かと思いきや$$,
    $$かと思いきや$$,
    $$かと思いきや|かとおもいきや|と思いきや$$,
    ARRAY['か', 'と', '思いきや']::text[],
    ARRAY['かと思いきや', 'と思いきや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-45', $$雨が降るかと思いきや、晴れてきた。$$, $$あめがふるかとおもいきや、はれてきた。$$, $$Achei que ia chover, mas abriu o sol.$$),
    ('n1-grammar-45', $$簡単な試験かと思いきや、とても難しかった。$$, $$かんたんなしけんかとおもいきや、とてもむずかしかった。$$, $$Pensei que fosse uma prova fácil, mas foi muito difícil.$$),
    ('n1-grammar-45', $$彼は怒るかと思いきや、笑い出した。$$, $$かれはおこるかとおもいきや、わらいだした。$$, $$Achei que ele ia ficar bravo, mas começou a rir.$$),
    ('n1-grammar-45', $$もう終わったかと思いきや、まだ半分も残っていた。$$, $$もうおわったかとおもいきや、まだはんぶんものこっていた。$$, $$Achei que já tinha acabado, mas ainda faltava metade.$$),
    ('n1-grammar-45', $$高いと思いきや、意外に安かった。$$, $$たかいとおもいきや、いがいにやすかった。$$, $$Pensei que fosse caro, mas foi surpreendentemente barato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は泣く____、笑顔で別れを告げた。$$, $$Achei que ela fosse chorar, mas se despediu sorrindo.$$),
        (2, $$あの店は閉まっている____、まだ営業していた。$$, $$Achei que aquela loja estivesse fechada, mas ainda estava funcionando.$$),
        (3, $$弱いチームだ____、優勝してしまった。$$, $$Pensei que fosse um time fraco, mas acabou vencendo.$$),
        (4, $$春になった____、また雪が降った。$$, $$Pensei que a primavera tinha chegado, mas nevou de novo.$$),
        (5, $$すぐに返事が来る____、一週間たっても来ない。$$, $$Achei que a resposta viria logo, mas nem depois de uma semana chegou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かと思いきや$$),
        (1, $$かとおもいきや$$),
        (2, $$かと思いきや$$),
        (2, $$かとおもいきや$$),
        (3, $$と思いきや$$),
        (4, $$かと思いきや$$),
        (4, $$かとおもいきや$$),
        (5, $$かと思いきや$$),
        (5, $$かとおもいきや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
