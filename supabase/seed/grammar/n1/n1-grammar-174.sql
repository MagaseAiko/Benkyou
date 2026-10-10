-- n1-grammar-174 — 〜た弾みに / 〜た拍子に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-174',
    'grammar',
    'N1',
    $$〜た弾みに / 〜た拍子に$$,
    $$ta hazumi ni / ta hyoushi ni$$,
    $$No impulso de / No momento em que / Com o movimento de$$,
    $$た弾みに e た拍子に indicam que, no exato momento de uma ação, algo inesperado aconteceu como consequência. Equivalem a "no momento em que" ou "com o movimento de".

O resultado costuma ser um acidente ou algo não intencional. Por exemplo, "quando caí, quebrei os óculos" ou "no momento em que me levantei, bati a cabeça".

São expressões comuns para descrever acidentes.$$,
    $$Também aparecem como 弾みで e 拍子で.

A expressão 何かの弾みで significa "por algum motivo inesperado".$$,
    $$Verbo (forma た) + 弾みに / 拍子に
Substantivo + の + 弾みで$$,
    $$た弾みに$$,
    $$弾みに|拍子に|弾みで|拍子で|はずみに|ひょうしに$$,
    ARRAY['た', '弾み', 'に']::text[],
    ARRAY['た弾みに', 'た拍子に', '弾みで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-174', $$転んだ弾みに、眼鏡が壊れた。$$, $$ころんだはずみに、めがねがこわれた。$$, $$Quando caí, os óculos quebraram.$$),
    ('n1-grammar-174', $$立ち上がった拍子に、頭をぶつけた。$$, $$たちあがったひょうしに、あたまをぶつけた。$$, $$No momento em que me levantei, bati a cabeça.$$),
    ('n1-grammar-174', $$車が急に止まった弾みで、荷物が落ちた。$$, $$くるまがきゅうにとまったはずみで、にもつがおちた。$$, $$Com a freada brusca do carro, a bagagem caiu.$$),
    ('n1-grammar-174', $$くしゃみをした拍子に、腰を痛めた。$$, $$くしゃみをしたひょうしに、こしをいためた。$$, $$No momento em que espirrei, machuquei as costas.$$),
    ('n1-grammar-174', $$何かの弾みで、ドアが開いてしまった。$$, $$なにかのはずみで、ドアがあいてしまった。$$, $$Por algum motivo inesperado, a porta acabou abrindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ぶつかった____、コーヒーをこぼしてしまった。$$, $$No momento em que esbarrei, derrubei o café.$$),
        (2, $$振り向いた____、財布を落とした。$$, $$No momento em que me virei, deixei cair a carteira.$$),
        (3, $$電車が揺れた____、隣の人の足を踏んだ。$$, $$Com o balanço do trem, pisei no pé de quem estava ao lado.$$),
        (4, $$ボールを蹴った____、靴が飛んでいった。$$, $$No momento em que chutei a bola, o sapato saiu voando.$$),
        (5, $$座った____、椅子が壊れた。$$, $$No momento em que sentei, a cadeira quebrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$弾みに$$),
        (1, $$拍子に$$),
        (2, $$弾みに$$),
        (2, $$拍子に$$),
        (3, $$弾みに$$),
        (3, $$拍子に$$),
        (3, $$弾みで$$),
        (4, $$弾みに$$),
        (4, $$拍子に$$),
        (5, $$弾みに$$),
        (5, $$拍子に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
