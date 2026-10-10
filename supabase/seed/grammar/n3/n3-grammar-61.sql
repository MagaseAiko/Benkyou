-- n3-grammar-61 — 〜向け
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-61',
    'grammar',
    'N3',
    $$〜向け$$,
    $$muke$$,
    $$Para / Destinado a / Voltado para$$,
    $$向け é usado para dizer que algo foi feito ou planejado especialmente para um público ou destino específico. Equivale a "para", "destinado a" ou "voltado para".

Ele vem diretamente depois de um substantivo que indica o público ou o destino, como crianças, jovens, estrangeiros, iniciantes ou um país.

Antes de outro substantivo, usa-se 向けの: 子供向けの本 (livro para crianças). Antes de um verbo, usa-se 向けに: 若者向けに作られた (feito para jovens).

A ideia é de intenção: quem criou o produto ou serviço pensou naquele público desde o início.$$,
    $$A diferença entre 向け e 向き é importante. 向け indica para quem algo foi feito, de propósito. 向き indica para quem algo é adequado, mesmo que não tenha sido feito pensando nisso.

Em lojas e propagandas, expressões como 女性向け e 初心者向け são muito comuns.

Com destinos geográficos, 向け também indica exportação: 海外向けの商品 (produtos para o exterior).$$,
    $$Substantivo (público / destino) + 向け + の + Substantivo
Substantivo + 向け + に + Verbo
Substantivo + 向け + だ / です$$,
    $$向け$$,
    $$向け$$,
    ARRAY['向け']::text[],
    ARRAY['向け', '向けの', '向けに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-61', $$これは子供向けの本です。$$, $$これはこどもむけのほんです。$$, $$Este é um livro para crianças.$$),
    ('n3-grammar-61', $$この番組は若者向けに作られた。$$, $$このばんぐみはわかものむけにつくられた。$$, $$Este programa foi feito para os jovens.$$),
    ('n3-grammar-61', $$この町には外国人向けの日本語教室がある。$$, $$このまちにはがいこくじんむけのにほんごきょうしつがある。$$, $$Nesta cidade há aulas de japonês para estrangeiros.$$),
    ('n3-grammar-61', $$初心者向けのパソコン教室に通っている。$$, $$しょしんしゃむけのパソコンきょうしつにかよっている。$$, $$Estou fazendo um curso de computação para iniciantes.$$),
    ('n3-grammar-61', $$この商品はアジア向けに輸出されている。$$, $$このしょうひんはアジアむけにゆしゅつされている。$$, $$Este produto é exportado para a Ásia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$これは高齢者____の雑誌です。$$, $$Esta é uma revista voltada para idosos.$$),
        (2, $$女性____に新しい車が発売された。$$, $$Foi lançado um carro novo voltado para mulheres.$$),
        (3, $$留学生____の奨学金に申し込んだ。$$, $$Me inscrevi numa bolsa de estudos para estudantes estrangeiros.$$),
        (4, $$この映画は大人____だ。$$, $$Este filme é para adultos.$$),
        (5, $$この工場では、海外____の商品を作っている。$$, $$Esta fábrica produz itens destinados ao exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$向け$$),
        (2, $$向け$$),
        (3, $$向け$$),
        (4, $$向け$$),
        (5, $$向け$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
