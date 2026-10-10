-- n2-grammar-106 — 〜に沿って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-106',
    'grammar',
    'N2',
    $$〜に沿って$$,
    $$ni sotte$$,
    $$Ao longo de / De acordo com / Seguindo$$,
    $$に沿って tem dois usos principais.

O primeiro indica que algo segue ao longo de uma linha física, como um rio, uma rua ou uma linha de trem. Equivale a "ao longo de". Por exemplo, "andei ao longo do rio".

O segundo indica que algo é feito de acordo com um plano, uma regra, um desejo ou uma orientação. Equivale a "de acordo com" ou "seguindo". Por exemplo, "vamos seguir o manual".$$,
    $$No segundo uso, é parecido com に基づいて e に従って.

A forma に沿った vem antes de substantivos, como 希望に沿った商品.$$,
    $$Substantivo + に沿って + Verbo
Substantivo + に沿った + Substantivo
Substantivo + に沿い$$,
    $$に沿って$$,
    $$に沿って|に沿い|に沿った|にそって$$,
    ARRAY['に', '沿って']::text[],
    ARRAY['に沿って', 'に沿い', 'に沿った', 'にそって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-106', $$川に沿って、桜の木が並んでいる。$$, $$かわにそって、さくらのきがならんでいる。$$, $$Ao longo do rio, há cerejeiras enfileiradas.$$),
    ('n2-grammar-106', $$この道に沿ってまっすぐ行くと、駅があります。$$, $$このみちにそってまっすぐいくと、えきがあります。$$, $$Seguindo reto por esta rua, você encontra a estação.$$),
    ('n2-grammar-106', $$マニュアルに沿って作業を進めてください。$$, $$マニュアルにそってさぎょうをすすめてください。$$, $$Faça o trabalho de acordo com o manual.$$),
    ('n2-grammar-106', $$お客様の希望に沿ったプランを用意しました。$$, $$おきゃくさまのきぼうにそったプランをよういしました。$$, $$Preparamos um plano de acordo com o desejo do cliente.$$),
    ('n2-grammar-106', $$線路に沿い、細い道が続いている。$$, $$せんろにそい、ほそいみちがつづいている。$$, $$Uma rua estreita segue ao longo da linha do trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$海岸____、ホテルが建っている。$$, $$Ao longo da costa, há hotéis construídos.$$),
        (2, $$計画____、工事を進める。$$, $$A obra segue de acordo com o plano.$$),
        (3, $$会社の方針____行動してください。$$, $$Aja de acordo com a política da empresa.$$),
        (4, $$この線____紙を切ってください。$$, $$Corte o papel seguindo esta linha.$$),
        (5, $$ご要望____、内容を変更いたしました。$$, $$Atendendo ao seu pedido, alteramos o conteúdo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に沿って$$),
        (1, $$に沿い$$),
        (1, $$にそって$$),
        (2, $$に沿って$$),
        (2, $$に沿い$$),
        (2, $$にそって$$),
        (3, $$に沿って$$),
        (3, $$に沿い$$),
        (3, $$にそって$$),
        (4, $$に沿って$$),
        (4, $$に沿い$$),
        (4, $$にそって$$),
        (5, $$に沿って$$),
        (5, $$に沿い$$),
        (5, $$にそって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
