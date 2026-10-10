-- n5-grammar-56 — 〜の中で〜が一番
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-56',
    'grammar',
    'N5',
    $$〜の中で〜が一番$$,
    $$no naka de ~ ga ichiban$$,
    $$Entre... o mais / De todos... o mais$$,
    $$Essa estrutura é usada para dizer qual elemento de um grupo é "o mais" em alguma característica. É o superlativo dentro de um grupo.

A primeira parte, の中で, apresenta o grupo de comparação: "entre as frutas", "na família", "entre os esportes". Literalmente, 中 significa "dentro", então a ideia é "dentro desse grupo".

Depois vem o elemento escolhido, marcado com が, e 一番 com o adjetivo ou com 好き / 嫌い.

Para perguntar, usa-se uma palavra interrogativa no lugar do elemento: 何 para coisas, 誰 para pessoas, どこ para lugares e いつ para tempo. A resposta repete a estrutura com o elemento escolhido.$$,
    $$Quando o grupo é um lugar, como um país ou uma cidade, é comum usar só で, sem の中, para dizer "no Japão" ou "na turma".

Para comparar exatamente duas coisas, não se usa の中で〜一番, e sim より e ほうが.

A palavra de pergunta muda conforme o tipo de coisa no grupo. Escolher a palavra certa é um ponto que costuma cair em provas.$$,
    $$[Grupo] + の中で + [A] + が + 一番 + Adjetivo / 好き
[Grupo] + の中で + 何 / 誰 / どこ / いつ / どれ + が + 一番 + Adjetivo + ですか

Escrita: の中で / のなかで$$,
    $$の中で$$,
    $$の中で|のなかで$$,
    ARRAY['の', '中', 'で', 'が', '一番']::text[],
    ARRAY['の中で', 'のなかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-56', $$果物の中でいちごが一番好きです。$$, $$くだもののなかでいちごがいちばんすきです。$$, $$Entre as frutas, a que eu mais gosto é morango.$$),
    ('n5-grammar-56', $$家族の中で父が一番背が高いです。$$, $$かぞくのなかでちちがいちばんせがたかいです。$$, $$Na minha família, o mais alto é meu pai.$$),
    ('n5-grammar-56', $$日本の町の中でどこが一番好きですか。$$, $$にほんのまちのなかでどこがいちばんすきですか。$$, $$Entre as cidades do Japão, qual você mais gosta?$$),
    ('n5-grammar-56', $$一年の中で八月が一番暑いです。$$, $$いちねんのなかではちがつがいちばんあついです。$$, $$No ano, o mês mais quente é agosto.$$),
    ('n5-grammar-56', $$クラスの中で誰が一番速く走りますか。$$, $$クラスのなかでだれがいちばんはやくはしりますか。$$, $$Na turma, quem corre mais rápido?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$スポーツ____サッカーが一番好きです。$$, $$Entre os esportes, o que eu mais gosto é futebol.$$),
        (2, $$季節____いつが一番好きですか。$$, $$Entre as estações, qual você mais gosta?$$),
        (3, $$この三つの____どれが一番安いですか。$$, $$Destes três, qual é o mais barato?$$),
        (4, $$兄弟____私が一番若いです。$$, $$Entre os irmãos, eu sou o mais novo.$$),
        (5, $$日本料理の中で何____好きですか。$$, $$Da culinária japonesa, o que você mais gosta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の中で$$),
        (1, $$のなかで$$),
        (2, $$の中で$$),
        (2, $$のなかで$$),
        (3, $$中で$$),
        (3, $$なかで$$),
        (4, $$の中で$$),
        (4, $$のなかで$$),
        (5, $$が一番$$),
        (5, $$がいちばん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
