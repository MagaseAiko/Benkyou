-- n4-grammar-31 — 〜から作る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-31',
    'grammar',
    'N4',
    $$〜から作る$$,
    $$kara tsukuru$$,
    $$Ser feito de / Fazer a partir de$$,
    $$から作る é usado para dizer de qual matéria-prima algo é feito, quando essa matéria-prima se transforma e não pode mais ser vista no produto final. Equivale a "ser feito de" ou "fazer a partir de".

Por exemplo, o vinho é feito de uvas, mas, ao olhar para o vinho, não se vê mais a uva. O tofu é feito de soja, mas a soja não aparece mais. Nesses casos, usa-se から.

Quando o material continua visível e reconhecível, como a madeira de uma mesa ou o papel de um avião de dobradura, usa-se で no lugar de から.

Essa estrutura aparece muito na forma passiva, 〜から作られる, para explicar como produtos e alimentos são feitos.$$,
    $$A diferença entre から e で é um ponto clássico de provas: から para transformação química ou completa, で para material que continua reconhecível.

Para bebidas alcoólicas e grandes construções, às vezes se usa o kanji 造る no lugar de 作る.

Em textos sobre alimentos, também aparece 原料 (matéria-prima), como em 原料は大豆です.$$,
    $$Produto + は + Matéria-prima + から + 作る / 作ります
Produto + は + Matéria-prima + から + 作られる / 作られています (passiva)

Material visível: Produto + は + Material + で + 作る$$,
    $$から作る$$,
    $$から作|からつく$$,
    ARRAY['から', '作る']::text[],
    ARRAY['から作る', 'から作ります', 'から作られる', 'から作られています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-31', $$ワインはぶどうから作ります。$$, $$ワインはぶどうからつくります。$$, $$O vinho é feito de uvas.$$),
    ('n4-grammar-31', $$豆腐は大豆から作られています。$$, $$とうふはだいずからつくられています。$$, $$O tofu é feito de soja.$$),
    ('n4-grammar-31', $$このお酒は米から作られた。$$, $$このおさけはこめからつくられた。$$, $$Este saquê foi feito de arroz.$$),
    ('n4-grammar-31', $$チーズは牛乳から作ります。$$, $$チーズはぎゅうにゅうからつくります。$$, $$O queijo é feito de leite.$$),
    ('n4-grammar-31', $$紙は木から作られることを知っていますか。$$, $$かみはきからつくられることをしっていますか。$$, $$Você sabia que o papel é feito de madeira?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バターは牛乳____作ります。$$, $$A manteiga é feita de leite.$$),
        (2, $$しょうゆは大豆____作られています。$$, $$O shoyu é feito de soja.$$),
        (3, $$ビールは麦____作ります。$$, $$A cerveja é feita de cevada.$$),
        (4, $$日本酒は何____作られていますか。$$, $$De que é feito o saquê japonês?$$),
        (5, $$このジャムは庭のいちご____作りました。$$, $$Fiz esta geleia com os morangos do quintal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$から$$),
        (3, $$から$$),
        (4, $$から$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
