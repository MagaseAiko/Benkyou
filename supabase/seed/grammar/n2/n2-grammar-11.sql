-- n2-grammar-11 — 〜だけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-11',
    'grammar',
    'N2',
    $$〜だけに$$,
    $$dake ni$$,
    $$Justamente por / Exatamente porque / Como era de se esperar$$,
    $$だけに é usado para dizer que, justamente por causa de uma condição ou situação, o resultado é especialmente intenso. Equivale a "justamente por", "exatamente porque" ou "como era de se esperar de".

Ele tem dois tons principais.

O primeiro é de expectativa correspondida, parecido com だけあって: "por ter muita experiência, ele trabalha rápido".

O segundo, muito comum, é de intensificação de um sentimento: justamente porque havia expectativa ou esforço, a decepção ou a alegria é maior. Por exemplo, "justamente por ter esperado tanto, fiquei decepcionado" ou "justamente por ter me preparado tanto, a frustração de errar foi grande".

Diferente de だけあって, que é quase sempre positivo, だけに pode ter tom positivo ou negativo.$$,
    $$Com sentimentos negativos, だけに aparece muito com 残念, がっかり e 悔しい.

A frase だけに… sozinha às vezes é usada de forma humorística, depois de um trocadilho.

Comparando: だけあって = "faz jus a"; だけに = "justamente por isso, ainda mais".$$,
    $$Verbo / Adjetivo (forma simples) + だけに、 + Resultado intensificado
Adjetivo な + な + だけに
Substantivo + だけに / であるだけに$$,
    $$だけに$$,
    $$だけに$$,
    ARRAY['だけ', 'に']::text[],
    ARRAY['だけに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-11', $$期待していただけに、がっかりした。$$, $$きたいしていただけに、がっかりした。$$, $$Justamente por ter tanta expectativa, fiquei decepcionado.$$),
    ('n2-grammar-11', $$彼は経験が長いだけに、仕事が速い。$$, $$かれはけいけんがながいだけに、しごとがはやい。$$, $$Justamente por ter muita experiência, ele trabalha rápido.$$),
    ('n2-grammar-11', $$有名な店だけに、値段も高い。$$, $$ゆうめいなみせだけに、ねだんもたかい。$$, $$Como era de se esperar de uma loja famosa, o preço também é alto.$$),
    ('n2-grammar-11', $$一生懸命準備しただけに、失敗して悔しい。$$, $$いっしょうけんめいじゅんびしただけに、しっぱいしてくやしい。$$, $$Justamente por ter me preparado tanto, a frustração de errar é grande.$$),
    ('n2-grammar-11', $$若いだけに、回復が早い。$$, $$わかいだけに、かいふくがはやい。$$, $$Justamente por ser jovem, a recuperação é rápida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ずっと楽しみにしていた____、中止になって残念だ。$$, $$Justamente por estar esperando tanto, que pena que foi cancelado.$$),
        (2, $$彼は医者の息子な____、体のことに詳しい。$$, $$Justamente por ser filho de médico, ele entende bem de saúde.$$),
        (3, $$高かった____、壊れてショックだ。$$, $$Justamente por ter sido caro, fiquei chocado quando quebrou.$$),
        (4, $$毎日練習した____、勝ててうれしい。$$, $$Justamente por ter treinado todo dia, estou feliz por ter vencido.$$),
        (5, $$人気のある店な____、予約が取りにくい。$$, $$Como era de se esperar de uma loja popular, é difícil conseguir reserva.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけに$$),
        (2, $$だけに$$),
        (3, $$だけに$$),
        (4, $$だけに$$),
        (5, $$だけに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
