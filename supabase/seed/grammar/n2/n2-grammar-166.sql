-- n2-grammar-166 — 〜といった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-166',
    'grammar',
    'N2',
    $$〜といった$$,
    $$to itta$$,
    $$Como / Tais como / Do tipo$$,
    $$といった serve para listar exemplos de um grupo. Equivale a "como" ou "tais como".

A pessoa dá alguns exemplos e depois diz a que categoria eles pertencem. Por exemplo, "frutas como maçã e laranja".

Também aparece na forma といった + Substantivo + はない, que significa "não há nada de especial", como "não tenho nenhum hobby em especial".$$,
    $$É parecido com などの, mas といった é um pouco mais formal.

A expressão これといった〜はない significa "nada de especial".$$,
    $$Substantivo + や + Substantivo + といった + Substantivo (categoria)
Substantivo + 、Substantivo + といった + Substantivo
これといった + Substantivo + はない$$,
    $$といった$$,
    $$といった$$,
    ARRAY['と', 'いった']::text[],
    ARRAY['といった', 'これといった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-166', $$りんごやみかんといった果物が好きだ。$$, $$りんごやみかんといったくだものがすきだ。$$, $$Gosto de frutas como maçã e laranja.$$),
    ('n2-grammar-166', $$京都や奈良といった古い町を訪ねたい。$$, $$きょうとやならといったふるいまちをたずねたい。$$, $$Quero visitar cidades antigas como Kyoto e Nara.$$),
    ('n2-grammar-166', $$サッカーや野球といったスポーツが人気だ。$$, $$サッカーややきゅうといったスポーツがにんきだ。$$, $$Esportes como futebol e beisebol são populares.$$),
    ('n2-grammar-166', $$これといった趣味はありません。$$, $$これといったしゅみはありません。$$, $$Não tenho nenhum hobby em especial.$$),
    ('n2-grammar-166', $$英語、中国語、韓国語といった言語を勉強している。$$, $$えいご、ちゅうごくご、かんこくごといったげんごをべんきょうしている。$$, $$Estudo línguas como inglês, chinês e coreano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$犬や猫____ペットを飼っている人が多い。$$, $$Muitas pessoas têm animais de estimação como cães e gatos.$$),
        (2, $$寿司や天ぷら____日本料理が食べたい。$$, $$Quero comer comida japonesa, como sushi e tempurá.$$),
        (3, $$これ____理由もなく、会社を辞めた。$$, $$Saí da empresa sem nenhum motivo em especial.$$),
        (4, $$地震や台風____自然災害に備えよう。$$, $$Vamos nos preparar para desastres naturais como terremotos e tufões.$$),
        (5, $$ピアノやバイオリン____楽器を習っている。$$, $$Faço aulas de instrumentos como piano e violino.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といった$$),
        (2, $$といった$$),
        (3, $$といった$$),
        (4, $$といった$$),
        (5, $$といった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
