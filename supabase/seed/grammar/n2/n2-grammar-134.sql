-- n2-grammar-134 — 〜せいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-134',
    'grammar',
    'N2',
    $$〜せいか$$,
    $$sei ka$$,
    $$Talvez por causa de / Será que é por / Quem sabe por$$,
    $$せいか indica uma causa provável, mas sem certeza. Equivale a "talvez por causa de" ou "será que é por".

A pessoa supõe que algo foi o motivo de um resultado, geralmente negativo. Por exemplo, "talvez por ter dormido pouco, estou com dor de cabeça".

Também pode ser usado com resultados positivos ou neutros, mas é mais comum com coisas ruins.$$,
    $$É uma variação de せいで, mas com dúvida.

Para resultados positivos, também se usa おかげか.

Uma expressão comum é 気のせいか, que significa "talvez seja impressão minha".$$,
    $$Verbo (forma simples) + せいか
Adjetivo い + せいか
Adjetivo な + な + せいか
Substantivo + の + せいか$$,
    $$せいか$$,
    $$せいか$$,
    ARRAY['せい', 'か']::text[],
    ARRAY['せいか', '気のせいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-134', $$寝不足のせいか、頭が痛い。$$, $$ねぶそくのせいか、あたまがいたい。$$, $$Talvez por ter dormido pouco, estou com dor de cabeça.$$),
    ('n2-grammar-134', $$年のせいか、最近疲れやすい。$$, $$としのせいか、さいきんつかれやすい。$$, $$Será que é pela idade? Ultimamente me canso fácil.$$),
    ('n2-grammar-134', $$天気が悪いせいか、客が少ない。$$, $$てんきがわるいせいか、きゃくがすくない。$$, $$Talvez por causa do mau tempo, há poucos clientes.$$),
    ('n2-grammar-134', $$気のせいか、彼女は元気がないように見える。$$, $$きのせいか、かのじょはげんきがないようにみえる。$$, $$Pode ser impressão minha, mas ela parece desanimada.$$),
    ('n2-grammar-134', $$緊張したせいか、うまく話せなかった。$$, $$きんちょうしたせいか、うまくはなせなかった。$$, $$Talvez por ter ficado nervoso, não consegui falar bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$食べすぎた____、お腹が痛い。$$, $$Talvez por ter comido demais, estou com dor de barriga.$$),
        (2, $$風邪の____、声が出ない。$$, $$Talvez por causa do resfriado, estou sem voz.$$),
        (3, $$暑い____、食欲がない。$$, $$Talvez por causa do calor, estou sem apetite.$$),
        (4, $$気の____、彼は少しやせたようだ。$$, $$Pode ser impressão minha, mas ele parece ter emagrecido um pouco.$$),
        (5, $$コーヒーを飲んだ____、眠れない。$$, $$Talvez por ter tomado café, não consigo dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいか$$),
        (2, $$せいか$$),
        (3, $$せいか$$),
        (4, $$せいか$$),
        (5, $$せいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
