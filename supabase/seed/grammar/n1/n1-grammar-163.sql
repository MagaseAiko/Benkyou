-- n1-grammar-163 — およそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-163',
    'grammar',
    'N1',
    $$およそ$$,
    $$oyoso$$,
    $$Aproximadamente / Cerca de / De modo algum$$,
    $$およそ tem dois usos principais.

O primeiro, antes de números, indica uma quantidade aproximada. Equivale a "aproximadamente" ou "cerca de". Por exemplo, "leva cerca de uma hora".

O segundo, com formas negativas, reforça a negação. Equivale a "de modo algum" ou "nem um pouco". Por exemplo, "isso não tem nada a ver comigo".

É uma palavra um pouco formal.$$,
    $$No primeiro uso, é parecido com 約 e だいたい.

No segundo uso, é parecido com 全く e 全然.$$,
    $$およそ + Número
およそ + Frase negativa (reforço)$$,
    $$およそ$$,
    $$およそ|凡そ$$,
    ARRAY['およそ']::text[],
    ARRAY['およそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-163', $$駅までおよそ三十分かかる。$$, $$えきまでおよそさんじゅっぷんかかる。$$, $$Leva cerca de trinta minutos até a estação.$$),
    ('n1-grammar-163', $$参加者はおよそ百人だった。$$, $$さんかしゃはおよそひゃくにんだった。$$, $$Os participantes eram aproximadamente cem.$$),
    ('n1-grammar-163', $$それは私にはおよそ関係のない話だ。$$, $$それはわたしにはおよそかんけいのないはなしだ。$$, $$Isso não tem nada a ver comigo, de modo algum.$$),
    ('n1-grammar-163', $$この町の人口はおよそ五万人だ。$$, $$このまちのじんこうはおよそごまんにんだ。$$, $$A população desta cidade é de cerca de cinquenta mil pessoas.$$),
    ('n1-grammar-163', $$彼の考えは、およそ現実的ではない。$$, $$かれのかんがえは、およそげんじつてきではない。$$, $$A ideia dele não é nem um pouco realista.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この橋の長さは____五百メートルだ。$$, $$O comprimento desta ponte é de aproximadamente quinhentos metros.$$),
        (2, $$完成まで____一年かかる予定だ。$$, $$Está previsto levar cerca de um ano até a conclusão.$$),
        (3, $$その話は____信じられない。$$, $$Essa história é impossível de acreditar, de modo algum.$$),
        (4, $$この本は____三百ページある。$$, $$Este livro tem cerca de trezentas páginas.$$),
        (5, $$彼は____スポーツとは縁がない。$$, $$Ele não tem nenhuma ligação com esportes, de modo algum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$およそ$$),
        (2, $$およそ$$),
        (3, $$およそ$$),
        (4, $$およそ$$),
        (5, $$およそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
