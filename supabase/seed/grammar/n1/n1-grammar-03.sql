-- n1-grammar-03 — 案の定
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-03',
    'grammar',
    'N1',
    $$案の定$$,
    $$an no jou$$,
    $$Como esperado / Dito e feito / Como previsto$$,
    $$案の定 indica que algo aconteceu exatamente como a pessoa tinha imaginado ou temido. Equivale a "como esperado" ou "dito e feito".

Na maioria das vezes é usado para resultados negativos que a pessoa já previa. Por exemplo, "achei que ia chover e, dito e feito, choveu".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com やっぱり e 思った通り, mas 案の定 costuma ser usado com resultados ruins.

Não se usa para planos ou intenções, apenas para previsões que se confirmaram.$$,
    $$案の定、 + Frase (resultado previsto)$$,
    $$案の定$$,
    $$案の定|あんのじょう$$,
    ARRAY['案', 'の', '定']::text[],
    ARRAY['案の定']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-03', $$雨が降りそうだと思っていたら、案の定降ってきた。$$, $$あめがふりそうだとおもっていたら、あんのじょうふってきた。$$, $$Achei que ia chover e, dito e feito, começou a chover.$$),
    ('n1-grammar-03', $$勉強しなかったので、案の定試験に落ちた。$$, $$べんきょうしなかったので、あんのじょうしけんにおちた。$$, $$Como não estudei, reprovei na prova, como era de esperar.$$),
    ('n1-grammar-03', $$案の定、彼は遅れてきた。$$, $$あんのじょう、かれはおくれてきた。$$, $$Como previsto, ele chegou atrasado.$$),
    ('n1-grammar-03', $$無理をしたら、案の定熱が出た。$$, $$むりをしたら、あんのじょうねつがでた。$$, $$Forcei demais e, como esperado, tive febre.$$),
    ('n1-grammar-03', $$案の定、道が混んでいた。$$, $$あんのじょう、みちがこんでいた。$$, $$Dito e feito, a estrada estava congestionada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$嫌な予感がしたが、____事故が起きた。$$, $$Tive um mau pressentimento e, dito e feito, houve um acidente.$$),
        (2, $$____、彼は約束を忘れていた。$$, $$Como previsto, ele tinha esquecido a promessa.$$),
        (3, $$安すぎると思ったら、____すぐに壊れた。$$, $$Achei que era barato demais e, como esperado, quebrou logo.$$),
        (4, $$____、店は休みだった。$$, $$Como era de esperar, a loja estava fechada.$$),
        (5, $$食べすぎたので、____お腹が痛くなった。$$, $$Comi demais e, dito e feito, fiquei com dor de barriga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$案の定$$),
        (2, $$案の定$$),
        (3, $$案の定$$),
        (4, $$案の定$$),
        (5, $$案の定$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
