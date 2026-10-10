-- n3-grammar-153 — 〜とは限らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-153',
    'grammar',
    'N3',
    $$〜とは限らない$$,
    $$to wa kagiranai$$,
    $$Nem sempre / Não necessariamente / Não é garantido que$$,
    $$とは限らない é usado para dizer que algo não é sempre verdade, ou que existem exceções. Equivale a "nem sempre", "não necessariamente" ou "não é garantido que".

限る significa "limitar". A ideia literal é "não se limita a ser assim", ou seja, pode ser diferente.

É muito usado para corrigir generalizações ou ideias comuns, como "coisa cara nem sempre é boa" ou "nem todo japonês é bom em linguagem honorífica".

Para reforçar, a frase costuma ter palavras como いつも, 必ず, みんな ou 全部. Por exemplo, "a previsão do tempo nem sempre está certa".

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, é comum usar だ antes.$$,
    $$とは限らない é uma forma suave e lógica de discordar de uma generalização, sem dizer que ela é totalmente falsa.

A forma ないとも限らない (N1) significa "não é impossível que..." e expressa um risco.

Em debates e redações, essa estrutura é muito útil para mostrar pensamento crítico.$$,
    $$Frase (forma simples) + とは限らない
Substantivo / Adjetivo な + (だ) + とは限らない
いつも / 必ず / みんな + … + とは限らない

Educado: とは限りません$$,
    $$とは限らない$$,
    $$とは限らない|とは限りません|とはかぎらない|とも限らない$$,
    ARRAY['とは', '限らない']::text[],
    ARRAY['とは限らない', 'とは限りません', 'とはかぎらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-153', $$高い物がいい物とは限らない。$$, $$たかいものがいいものとはかぎらない。$$, $$Coisa cara nem sempre é coisa boa.$$),
    ('n3-grammar-153', $$日本人がみんな敬語が上手だとは限らない。$$, $$にほんじんがみんなけいごがじょうずだとはかぎらない。$$, $$Nem todo japonês é bom em linguagem honorífica.$$),
    ('n3-grammar-153', $$有名な店がおいしいとは限りません。$$, $$ゆうめいなみせがおいしいとはかぎりません。$$, $$Loja famosa não é necessariamente gostosa.$$),
    ('n3-grammar-153', $$お金持ちが幸せだとは限らない。$$, $$おかねもちがしあわせだとはかぎらない。$$, $$Ser rico não garante ser feliz.$$),
    ('n3-grammar-153', $$天気予報がいつも正しいとは限らない。$$, $$てんきよほうがいつもただしいとはかぎらない。$$, $$A previsão do tempo nem sempre está certa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生の言うことがいつも正しい____。$$, $$O que o professor diz nem sempre está certo.$$),
        (2, $$勉強すれば必ず合格する____。$$, $$Estudar não garante necessariamente a aprovação.$$),
        (3, $$安い物が悪い物だ____。$$, $$Coisa barata nem sempre é coisa ruim.$$),
        (4, $$外国人がみんな英語を話せる____。$$, $$Nem todo estrangeiro fala inglês.$$),
        (5, $$大人がいつも子供より賢い____。$$, $$Os adultos nem sempre são mais sábios que as crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは限らない$$),
        (1, $$とは限りません$$),
        (2, $$とは限らない$$),
        (2, $$とは限りません$$),
        (3, $$とは限らない$$),
        (3, $$とは限りません$$),
        (4, $$とは限らない$$),
        (4, $$とは限りません$$),
        (5, $$とは限らない$$),
        (5, $$とは限りません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
