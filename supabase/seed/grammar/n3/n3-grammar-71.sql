-- n3-grammar-71 — なぜなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-71',
    'grammar',
    'N3',
    $$なぜなら$$,
    $$nazenara$$,
    $$Porque / Isso porque / A razão é que$$,
    $$なぜなら é uma conjunção que introduz o motivo de algo que já foi dito. Equivale a "porque", "isso porque" ou "a razão é que".

Primeiro vem a afirmação ou a decisão. Depois, numa nova frase, なぜなら apresenta a explicação. A frase com なぜなら costuma terminar com からだ ou からです, que reforçam a ideia de motivo.

Por exemplo, "eu ando todo dia. Isso porque faz bem para a saúde".

Esse uso soa formal e lógico. Ele aparece muito em redações, discursos, debates e textos argumentativos, quando a pessoa quer justificar claramente sua opinião.

A forma なぜかというと tem o mesmo sentido e é um pouco mais falada.$$,
    $$Na conversa do dia a dia, os japoneses preferem simplesmente usar から ou ので. なぜなら soa mais explicativo, quase como numa apresentação.

O final からだ é importante: sem ele, a frase com なぜなら fica incompleta.

なぜ, sozinho, significa "por quê" e é a forma mais formal de どうして.$$,
    $$Frase 1 (afirmação) + なぜなら、 + Motivo + からだ / からです
Frase 1 + なぜかというと、 + Motivo + からだ (mais falado)$$,
    $$なぜなら$$,
    $$なぜなら|なぜかというと$$,
    ARRAY['なぜなら', 'からだ']::text[],
    ARRAY['なぜなら', 'なぜかというと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-71', $$私は毎日歩きます。なぜなら、健康にいいからです。$$, $$わたしはまいにちあるきます。なぜなら、けんこうにいいからです。$$, $$Eu ando todos os dias. Isso porque faz bem para a saúde.$$),
    ('n3-grammar-71', $$今日は休みます。なぜなら、熱があるからです。$$, $$きょうはやすみます。なぜなら、ねつがあるからです。$$, $$Hoje vou faltar. A razão é que estou com febre.$$),
    ('n3-grammar-71', $$私は彼を信じている。なぜなら、一度もうそをついたことがないからだ。$$, $$わたしはかれをしんじている。なぜなら、いちどもうそをついたことがないからだ。$$, $$Eu confio nele. Isso porque ele nunca mentiu.$$),
    ('n3-grammar-71', $$この計画には反対です。なぜなら、お金がかかりすぎるからです。$$, $$このけいかくにははんたいです。なぜなら、おかねがかかりすぎるからです。$$, $$Sou contra este plano. A razão é que ele custa caro demais.$$),
    ('n3-grammar-71', $$日本語を勉強している。なぜかというと、日本で働きたいからだ。$$, $$にほんごをべんきょうしている。なぜかというと、にほんではたらきたいからだ。$$, $$Estou estudando japonês. É que quero trabalhar no Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行は中止です。____、台風が来るからです。$$, $$A viagem está cancelada. Isso porque vem um tufão.$$),
        (2, $$私は猫が好きだ。____、かわいいからだ。$$, $$Eu gosto de gatos. Isso porque são fofos.$$),
        (3, $$今日は早く寝ます。____、明日は早いからです。$$, $$Hoje vou dormir cedo. A razão é que amanhã acordo cedo.$$),
        (4, $$その意見に賛成です。____、みんなのためになるからです。$$, $$Concordo com essa opinião. Isso porque ela beneficia a todos.$$),
        (5, $$彼は人気がある。____、いつも優しいからだ。$$, $$Ele é popular. Isso porque é sempre gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なぜなら$$),
        (2, $$なぜなら$$),
        (3, $$なぜなら$$),
        (4, $$なぜなら$$),
        (5, $$なぜなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
