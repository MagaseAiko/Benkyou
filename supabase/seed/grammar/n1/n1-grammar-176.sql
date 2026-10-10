-- n1-grammar-176 — 〜たところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-176',
    'grammar',
    'N1',
    $$〜たところで$$,
    $$ta tokoro de$$,
    $$Mesmo que / Por mais que / Não adianta$$,
    $$たところで indica que, mesmo que alguém faça algo, o resultado esperado não vai acontecer. Equivale a "mesmo que" ou "não adianta".

A segunda parte costuma ser negativa ou mostrar que algo é inútil. Por exemplo, "mesmo que corra agora, não vai dar tempo".

Muitas vezes vem com palavras interrogativas, como どんなに ou いくら.$$,
    $$É parecido com ても, mas たところで destaca que a ação é inútil.

Não se confunde com たところ, que significa "quando fiz...".$$,
    $$Verbo (forma た) + ところで + Resultado negativo
Palavra interrogativa + Verbo (forma た) + ところで$$,
    $$たところで$$,
    $$たところで|だところで$$,
    ARRAY['た', 'ところ', 'で']::text[],
    ARRAY['たところで', 'だところで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-176', $$今から急いだところで、間に合わない。$$, $$いまからいそいだところで、まにあわない。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-176', $$彼に説明したところで、わかってくれないだろう。$$, $$かれにせつめいしたところで、わかってくれないだろう。$$, $$Mesmo que eu explique, ele provavelmente não vai entender.$$),
    ('n1-grammar-176', $$いくら悩んだところで、答えは出ない。$$, $$いくらなやんだところで、こたえはでない。$$, $$Por mais que se angustie, não vai encontrar a resposta.$$),
    ('n1-grammar-176', $$謝ったところで、許してもらえないだろう。$$, $$あやまったところで、ゆるしてもらえないだろう。$$, $$Mesmo que peça desculpas, provavelmente não vai ser perdoado.$$),
    ('n1-grammar-176', $$どんなに頼んだところで、彼は手伝わない。$$, $$どんなにたのんだところで、かれはてつだわない。$$, $$Por mais que eu peça, ele não vai ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今さら後悔し____、もう遅い。$$, $$Mesmo que se arrependa agora, já é tarde.$$),
        (2, $$一人で頑張っ____、この仕事は終わらない。$$, $$Mesmo se esforçando sozinho, este trabalho não vai terminar.$$),
        (3, $$文句を言っ____、何も変わらない。$$, $$Não adianta reclamar, nada vai mudar.$$),
        (4, $$いくら読ん____、この本は理解できない。$$, $$Por mais que eu leia, não consigo entender este livro.$$),
        (5, $$彼に頼んで____、無駄だよ。$$, $$Mesmo que peça a ele, é inútil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たところで$$),
        (2, $$たところで$$),
        (3, $$たところで$$),
        (4, $$だところで$$),
        (5, $$みたところで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
