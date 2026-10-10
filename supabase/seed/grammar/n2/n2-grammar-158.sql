-- n2-grammar-158 — 〜てならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-158',
    'grammar',
    'N2',
    $$〜てならない$$,
    $$te naranai$$,
    $$Não consigo deixar de / Sinto muito / Extremamente$$,
    $$てならない indica um sentimento muito forte que surge naturalmente e que a pessoa não consegue controlar. Equivale a "não consigo deixar de..." ou "sinto muito...".

Costuma vir com palavras de sentimento ou sensação, como preocupar-se, sentir saudade, achar estranho ou lamentar. Por exemplo, "não consigo deixar de me preocupar com o futuro".

É um pouco mais formal que てたまらない.$$,
    $$É usado principalmente com sentimentos da primeira pessoa.

É parecido com てたまらない, mas てならない é mais usado com sentimentos que surgem sem querer, como 気がしてならない.

Uma expressão comum é 気がしてならない, "não consigo tirar essa sensação".$$,
    $$Verbo (forma て) + ならない
Adjetivo い (sem い) + くてならない
Adjetivo な + でならない$$,
    $$てならない$$,
    $$てならない|でならない|てなりません|でなりません$$,
    ARRAY['て', 'ならない']::text[],
    ARRAY['てならない', 'でならない', 'てなりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-158', $$将来のことが心配でならない。$$, $$しょうらいのことがしんぱいでならない。$$, $$Não consigo deixar de me preocupar com o futuro.$$),
    ('n2-grammar-158', $$国に残した家族のことが気になってならない。$$, $$くににのこしたかぞくのことがきになってならない。$$, $$Não consigo parar de pensar na família que deixei no meu país.$$),
    ('n2-grammar-158', $$彼が嘘をついているような気がしてならない。$$, $$かれがうそをついているようなきがしてならない。$$, $$Não consigo tirar a sensação de que ele está mentindo.$$),
    ('n2-grammar-158', $$試験に落ちて、悔しくてならない。$$, $$しけんにおちて、くやしくてならない。$$, $$Reprovei na prova e estou extremamente frustrado.$$),
    ('n2-grammar-158', $$故郷が懐かしくてなりません。$$, $$こきょうがなつかしくてなりません。$$, $$Sinto muita saudade da minha terra natal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしの母のことが心配____。$$, $$Não consigo deixar de me preocupar com minha mãe, que mora sozinha.$$),
        (2, $$あの時の失敗が悔やまれ____。$$, $$Lamento muito aquele erro.$$),
        (3, $$試合の結果が気になっ____。$$, $$Não consigo parar de pensar no resultado da partida.$$),
        (4, $$彼女が来ないのが不思議に思われ____。$$, $$Acho muito estranho ela não vir.$$),
        (5, $$何か悪いことが起こる気がし____。$$, $$Não consigo tirar a sensação de que algo ruim vai acontecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でならない$$),
        (1, $$でなりません$$),
        (2, $$てならない$$),
        (2, $$てなりません$$),
        (3, $$てならない$$),
        (3, $$てなりません$$),
        (4, $$てならない$$),
        (4, $$てなりません$$),
        (5, $$てならない$$),
        (5, $$てなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
