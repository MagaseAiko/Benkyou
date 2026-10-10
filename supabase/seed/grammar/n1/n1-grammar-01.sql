-- n1-grammar-01 — 敢えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-01',
    'grammar',
    'N1',
    $$敢えて$$,
    $$aete$$,
    $$Propositalmente / Ousar / De propósito$$,
    $$敢えて indica que a pessoa faz algo de propósito, mesmo sabendo que é difícil, arriscado ou que não seria necessário. Equivale a "propositalmente", "de propósito" ou "ousar".

Por exemplo, "escolhi de propósito o caminho mais difícil" ou "ouso dizer que...".

Com uma forma negativa, 敢えて〜ない significa "não fazer questão de" ou "não há necessidade de".$$,
    $$Também é escrito あえて, em hiragana, o que é bastante comum.

Uma expressão comum é 敢えて言えば, "se for para dizer algo".

É parecido com わざと, mas わざと costuma ter um sentido mais negativo.$$,
    $$敢えて + Verbo
敢えて + Verbo (forma ない) (não fazer questão)$$,
    $$敢えて$$,
    $$敢えて|あえて$$,
    ARRAY['敢えて']::text[],
    ARRAY['敢えて', 'あえて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-01', $$彼は敢えて難しい道を選んだ。$$, $$かれはあえてむずかしいみちをえらんだ。$$, $$Ele escolheu de propósito o caminho mais difícil.$$),
    ('n1-grammar-01', $$敢えて言わせてもらうと、その計画には反対だ。$$, $$あえていわせてもらうと、そのけいかくにははんたいだ。$$, $$Se me permite ousar dizer, sou contra esse plano.$$),
    ('n1-grammar-01', $$その件については、敢えて何も言わなかった。$$, $$そのけんについては、あえてなにもいわなかった。$$, $$Sobre esse assunto, propositalmente não disse nada.$$),
    ('n1-grammar-01', $$あえて厳しいことを言うのは、君のためだ。$$, $$あえてきびしいことをいうのは、きみのためだ。$$, $$Digo coisas duras de propósito, é para o seu bem.$$),
    ('n1-grammar-01', $$敢えて説明する必要はないだろう。$$, $$あえてせつめいするひつようはないだろう。$$, $$Não deve haver necessidade de explicar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は____反対意見を述べた。$$, $$Ela ousou expressar uma opinião contrária.$$),
        (2, $$____危険を冒す必要はない。$$, $$Não há necessidade de correr riscos de propósito.$$),
        (3, $$____一言言わせてください。$$, $$Deixe-me ousar dizer uma palavra.$$),
        (4, $$彼は____何も知らないふりをした。$$, $$Ele fingiu de propósito que não sabia de nada.$$),
        (5, $$____高い方を選んだのは、品質がいいからだ。$$, $$Escolhi propositalmente o mais caro porque a qualidade é boa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$敢えて$$),
        (1, $$あえて$$),
        (2, $$敢えて$$),
        (2, $$あえて$$),
        (3, $$敢えて$$),
        (3, $$あえて$$),
        (4, $$敢えて$$),
        (4, $$あえて$$),
        (5, $$敢えて$$),
        (5, $$あえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
