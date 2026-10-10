-- n2-grammar-142 — それなのに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-142',
    'grammar',
    'N2',
    $$それなのに$$,
    $$sore na noni$$,
    $$Mesmo assim / Apesar disso / E no entanto$$,
    $$それなのに liga duas frases quando o resultado é contrário ao esperado. Equivale a "mesmo assim" ou "apesar disso".

A pessoa que fala mostra surpresa, decepção ou insatisfação. Por exemplo, "estudei muito. Mesmo assim, reprovei".

É a forma de usar のに no começo de uma frase.$$,
    $$É parecido com それでも e けれども, mas それなのに tem mais emoção de frustração.

Não se usa para dar ordens ou fazer pedidos na segunda parte.$$,
    $$Frase (com ponto final) + それなのに + Frase (resultado inesperado)$$,
    $$それなのに$$,
    $$それなのに$$,
    ARRAY['それ', 'な', 'のに']::text[],
    ARRAY['それなのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-142', $$毎日練習した。それなのに、試合に負けた。$$, $$まいにちれんしゅうした。それなのに、しあいにまけた。$$, $$Treinei todos os dias. Mesmo assim, perdi a partida.$$),
    ('n2-grammar-142', $$彼は約束した。それなのに、来なかった。$$, $$かれはやくそくした。それなのに、こなかった。$$, $$Ele prometeu. E no entanto não veio.$$),
    ('n2-grammar-142', $$薬を飲んだ。それなのに、熱が下がらない。$$, $$くすりをのんだ。それなのに、ねつがさがらない。$$, $$Tomei o remédio. Apesar disso, a febre não baixa.$$),
    ('n2-grammar-142', $$一生懸命説明した。それなのに、誰もわかってくれない。$$, $$いっしょうけんめいせつめいした。それなのに、だれもわかってくれない。$$, $$Expliquei com todo o empenho. Mesmo assim, ninguém entende.$$),
    ('n2-grammar-142', $$天気予報は晴れだった。それなのに、雨が降った。$$, $$てんきよほうははれだった。それなのに、あめがふった。$$, $$A previsão era de sol. E no entanto choveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$早く家を出た。____、遅刻してしまった。$$, $$Saí cedo de casa. Mesmo assim, acabei me atrasando.$$),
        (2, $$ダイエットをしている。____、全然やせない。$$, $$Estou fazendo dieta. Apesar disso, não emagreço nada.$$),
        (3, $$何度も注意した。____、彼はまた同じことをした。$$, $$Avisei várias vezes. E no entanto ele fez a mesma coisa de novo.$$),
        (4, $$高いお金を払った。____、サービスは最悪だった。$$, $$Paguei caro. Mesmo assim, o serviço foi péssimo.$$),
        (5, $$彼女のために料理を作った。____、一口も食べなかった。$$, $$Fiz comida para ela. E no entanto ela não comeu nem um pedaço.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それなのに$$),
        (2, $$それなのに$$),
        (3, $$それなのに$$),
        (4, $$それなのに$$),
        (5, $$それなのに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
