-- n1-grammar-216 — 〜ところを
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-216',
    'grammar',
    'N1',
    $$〜ところを$$,
    $$tokoro wo$$,
    $$Apesar de / Num momento em que / Bem quando$$,
    $$ところを tem dois usos principais.

O primeiro é usado em agradecimentos e desculpas formais, para mostrar consideração pela situação da outra pessoa. Equivale a "apesar de". Por exemplo, "obrigado por ter vindo apesar de estar tão ocupado".

O segundo indica que alguém foi pego ou visto no momento de fazer algo. Equivale a "bem quando". Por exemplo, "o ladrão foi pego no momento em que roubava".$$,
    $$Expressões comuns são お忙しいところを, お休みのところを e お疲れのところを.

No segundo uso, costuma vir com verbos como 見られる, 見つかる e 捕まる.$$,
    $$Adjetivo い / Substantivo + の + ところを + Agradecimento / Desculpa
Verbo (forma ている / dicionário) + ところを + 見る / 見つかる / 捕まる$$,
    $$ところを$$,
    $$ところを$$,
    ARRAY['ところ', 'を']::text[],
    ARRAY['ところを']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-216', $$お忙しいところを、ありがとうございました。$$, $$おいそがしいところを、ありがとうございました。$$, $$Obrigado por ter vindo apesar de estar tão ocupado.$$),
    ('n1-grammar-216', $$お休みのところを、申し訳ありません。$$, $$おやすみのところを、もうしわけありません。$$, $$Desculpe incomodar no seu dia de folga.$$),
    ('n1-grammar-216', $$泥棒は盗んでいるところを警察に捕まった。$$, $$どろぼうはぬすんでいるところをけいさつにつかまった。$$, $$O ladrão foi pego pela polícia no momento em que roubava.$$),
    ('n1-grammar-216', $$たばこを吸っているところを先生に見られた。$$, $$たばこをすっているところをせんせいにみられた。$$, $$O professor me viu bem quando eu estava fumando.$$),
    ('n1-grammar-216', $$お疲れのところを、すみません。$$, $$おつかれのところを、すみません。$$, $$Desculpe incomodar quando você está cansado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お寒い____、お越しいただきありがとうございます。$$, $$Obrigado por ter vindo apesar do frio.$$),
        (2, $$寝ている____起こしてしまって、ごめんなさい。$$, $$Desculpe ter te acordado enquanto dormia.$$),
        (3, $$カンニングをしている____見つかった。$$, $$Fui descoberto bem quando estava colando.$$),
        (4, $$お食事中の____、失礼します。$$, $$Desculpe interromper sua refeição.$$),
        (5, $$彼女と歩いている____友達に見られた。$$, $$Um amigo me viu bem quando eu estava andando com ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-216', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところを$$),
        (2, $$ところを$$),
        (3, $$ところを$$),
        (4, $$ところを$$),
        (5, $$ところを$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
