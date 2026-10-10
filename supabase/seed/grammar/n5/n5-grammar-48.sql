-- n5-grammar-48 — 〜に行く
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-48',
    'grammar',
    'N5',
    $$〜に行く$$,
    $$ni iku$$,
    $$Ir (fazer algo) / Ir para$$,
    $$に行く é usado para dizer que alguém vai a algum lugar com um objetivo. Equivale a "ir fazer algo" ou "ir para fazer algo".

A estrutura junta o verbo da ação que a pessoa vai fazer, na forma ます sem ます, com に e o verbo de movimento. Assim, o に aqui marca a finalidade do deslocamento.

Além de 行く, a mesma estrutura funciona com 来る (vir) e 帰る (voltar), sempre com a ideia de "ir, vir ou voltar para fazer algo".

Com verbos do tipo "substantivo + する", como 買い物する ou 散歩する, é comum usar só o substantivo antes de に, como 買い物に行く.

O lugar para onde se vai pode aparecer antes, marcado com へ ou に.$$,
    $$Quando o lugar e a finalidade aparecem juntos, é comum usar へ para o lugar, evitando repetir に duas vezes seguidas.

Essa construção funciona só com verbos de movimento. Para outras finalidades, usa-se ために, que aparece em níveis seguintes.

Em convites, ela combina muito bem com ませんか, como ao chamar alguém para ir comer ou ver algo.$$,
    $$Verbo na forma ます sem ます + に + 行く / 来る / 帰る
Substantivo de ação + に + 行く / 来る / 帰る
Lugar + へ / に + Verbo sem ます + に + 行く$$,
    $$に行く$$,
    $$に行|にいく|にいき|にいっ|に来|にきます|にきました|にきた|に帰$$,
    ARRAY['に', '行く']::text[],
    ARRAY['に行く', 'に行きます', 'に行った', 'に行きました', 'に来る', 'に来ます', 'に帰る', 'に帰ります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-48', $$友達と映画を見に行きました。$$, $$ともだちとえいがをみにいきました。$$, $$Fui ver um filme com um amigo.$$),
    ('n5-grammar-48', $$昼ご飯を食べに行きませんか。$$, $$ひるごはんをたべにいきませんか。$$, $$Quer ir almoçar?$$),
    ('n5-grammar-48', $$週末、デパートへ買い物に行きます。$$, $$しゅうまつ、デパートへかいものにいきます。$$, $$No fim de semana, vou fazer compras na loja de departamentos.$$),
    ('n5-grammar-48', $$日本へ日本語を勉強しに来ました。$$, $$にほんへにほんごをべんきょうしにきました。$$, $$Vim ao Japão para estudar japonês.$$),
    ('n5-grammar-48', $$忘れ物を取りに家に帰りました。$$, $$わすれものをとりにいえにかえりました。$$, $$Voltei para casa para pegar uma coisa que esqueci.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館へ本を借り____。$$, $$Vou à biblioteca pegar um livro emprestado.$$),
        (2, $$週末、海へ泳ぎ____。$$, $$No fim de semana, fui nadar na praia.$$),
        (3, $$駅まで友達を迎え____。$$, $$Vou buscar meu amigo na estação.$$),
        (4, $$夕方、公園へ散歩____。$$, $$No fim da tarde, vou passear no parque.$$),
        (5, $$母が東京へ私に会い____。$$, $$Minha mãe veio a Tóquio para me ver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に行きます$$),
        (1, $$にいきます$$),
        (1, $$に行く$$),
        (1, $$にいく$$),
        (2, $$に行きました$$),
        (2, $$にいきました$$),
        (2, $$に行った$$),
        (2, $$にいった$$),
        (3, $$に行きます$$),
        (3, $$にいきます$$),
        (3, $$に行く$$),
        (3, $$にいく$$),
        (4, $$に行きます$$),
        (4, $$にいきます$$),
        (4, $$に行く$$),
        (4, $$にいく$$),
        (5, $$に来ました$$),
        (5, $$にきました$$),
        (5, $$に来た$$),
        (5, $$にきた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
