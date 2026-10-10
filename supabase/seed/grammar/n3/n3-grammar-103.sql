-- n3-grammar-103 — さらに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-103',
    'grammar',
    'N3',
    $$さらに$$,
    $$sara ni$$,
    $$Ainda mais / Além disso / Mais ainda$$,
    $$さらに é um advérbio com dois usos principais.

O primeiro é indicar que algo aumentou ou se intensificou: "ainda mais". Por exemplo, "a chuva ficou ainda mais forte" ou "depois de praticar, fiquei ainda melhor".

O segundo é acrescentar uma informação nova, no começo de uma frase: "além disso". Por exemplo, "esta loja é barata. Além disso, o atendimento é bom".

さらに soa um pouco mais formal que もっと e é muito usado em textos, notícias, apresentações e propagandas.

Antes de expressões de quantidade, como 多くの, indica um aumento: "ainda mais pessoas".$$,
    $$Comparado a もっと, さらに indica que algo já era alto e aumentou ainda mais.

Em propagandas, さらに aparece muito para apresentar vantagens extras: "e mais...".

Para listar argumentos em textos, さらに funciona como "além disso" ou "ademais".$$,
    $$さらに + Adjetivo / Verbo de mudança (ainda mais)
Frase 1 (com ponto final) + さらに、 + Frase 2 (além disso)
さらに + 多くの / 大きな + Substantivo

Escrita: さらに / 更に$$,
    $$さらに$$,
    $$さらに|更に$$,
    ARRAY['さらに']::text[],
    ARRAY['さらに', '更に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-103', $$夜になって、雨はさらに強くなった。$$, $$よるになって、あめはさらにつよくなった。$$, $$À noite, a chuva ficou ainda mais forte.$$),
    ('n3-grammar-103', $$たくさん練習して、さらに上手になった。$$, $$たくさんれんしゅうして、さらにじょうずになった。$$, $$Pratiquei bastante e fiquei ainda melhor.$$),
    ('n3-grammar-103', $$この店は安い。さらに、サービスもいい。$$, $$このみせはやすい。さらに、サービスもいい。$$, $$Esta loja é barata. Além disso, o atendimento é bom.$$),
    ('n3-grammar-103', $$来年は、さらに多くの観光客が来るだろう。$$, $$らいねんは、さらにおおくのかんこうきゃくがくるだろう。$$, $$No ano que vem, devem vir ainda mais turistas.$$),
    ('n3-grammar-103', $$説明を聞いて、さらにわからなくなった。$$, $$せつめいをきいて、さらにわからなくなった。$$, $$Ouvi a explicação e fiquei ainda mais confuso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜になって、寒さが____厳しくなった。$$, $$À noite, o frio ficou ainda mais rigoroso.$$),
        (2, $$この部屋は広い。____、日当たりもいい。$$, $$Este quarto é amplo. Além disso, recebe bastante sol.$$),
        (3, $$薬を飲んだら、____悪くなった。$$, $$Depois de tomar o remédio, piorei ainda mais.$$),
        (4, $$新しい店は、前の店より____大きい。$$, $$A loja nova é ainda maior que a anterior.$$),
        (5, $$来月から、料金が____上がる予定です。$$, $$A partir do mês que vem, a tarifa vai subir ainda mais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さらに$$),
        (1, $$更に$$),
        (2, $$さらに$$),
        (2, $$更に$$),
        (3, $$さらに$$),
        (3, $$更に$$),
        (4, $$さらに$$),
        (4, $$更に$$),
        (5, $$さらに$$),
        (5, $$更に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
