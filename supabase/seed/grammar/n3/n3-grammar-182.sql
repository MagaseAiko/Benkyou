-- n3-grammar-182 — 〜ずつ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-182',
    'grammar',
    'N3',
    $$〜ずつ$$,
    $$zutsu$$,
    $$Cada / De... em... / Aos poucos$$,
    $$ずつ é usado depois de quantidades para indicar distribuição igual ou repetição em partes iguais. Equivale a "cada", "de... em..." ou "aos poucos".

Ele tem dois usos principais. O primeiro é distribuir: cada pessoa recebe ou faz a mesma quantidade. Por exemplo, "peguem dois cada um" ou "dei três doces para cada criança".

O segundo é indicar progresso gradual, em partes iguais: "leio uma página por dia" ou, com 少し, "aos poucos": "a doença está melhorando aos poucos".

ずつ vem diretamente depois de números com contador e de palavras de quantidade, como 少し e 一つ.$$,
    $$少しずつ é uma das expressões mais usadas e combina muito com verbos de mudança, como なる, 増える e 慣れる.

一人ずつ significa "um de cada vez" ou "cada pessoa", dependendo do contexto.

Não confunda com づつ, que é uma grafia antiga e hoje considerada incorreta.$$,
    $$Número + Contador + ずつ + Verbo (cada / de... em...)
Pessoa + Número + ずつ (cada pessoa recebe...)
少しずつ + Verbo (aos poucos)$$,
    $$ずつ$$,
    $$ずつ$$,
    ARRAY['ずつ']::text[],
    ARRAY['ずつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-182', $$毎日少しずつ日本語を勉強している。$$, $$まいにちすこしずつにほんごをべんきょうしている。$$, $$Estudo japonês um pouco por dia.$$),
    ('n3-grammar-182', $$この紙は一人二枚ずつ取ってください。$$, $$このかみはひとりにまいずつとってください。$$, $$Peguem duas folhas cada um, por favor.$$),
    ('n3-grammar-182', $$子供たちにお菓子を三つずつあげた。$$, $$こどもたちにおかしをみっつずつあげた。$$, $$Dei três doces para cada criança.$$),
    ('n3-grammar-182', $$この本は一日に一ページずつ読んでいる。$$, $$このほんはいちにちにいちページずつよんでいる。$$, $$Estou lendo este livro uma página por dia.$$),
    ('n3-grammar-182', $$父の病気は少しずつよくなっている。$$, $$ちちのびょうきはすこしずつよくなっている。$$, $$A doença do meu pai está melhorando aos poucos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$パンフレットは一人一つ____持っていってください。$$, $$Leve um folheto cada um, por favor.$$),
        (2, $$毎日十個____漢字を覚えます。$$, $$Decoro dez kanji por dia.$$),
        (3, $$春になって、雪が少し____溶けてきた。$$, $$Com a chegada da primavera, a neve foi derretendo aos poucos.$$),
        (4, $$二人____グループを作ってください。$$, $$Formem grupos de duas pessoas cada.$$),
        (5, $$この薬は一回二錠____飲んでください。$$, $$Tome dois comprimidos de cada vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずつ$$),
        (2, $$ずつ$$),
        (3, $$ずつ$$),
        (4, $$ずつ$$),
        (5, $$ずつ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
