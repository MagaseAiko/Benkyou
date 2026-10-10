-- n3-grammar-14 — 〜ぶりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-14',
    'grammar',
    'N3',
    $$〜ぶりに$$,
    $$buri ni$$,
    $$Pela primeira vez em / Depois de (tempo sem)$$,
    $$ぶりに é usado para dizer que algo aconteceu de novo depois de um longo intervalo. Equivale a "pela primeira vez em... (tempo)" ou "depois de... sem".

Ele vem depois de uma expressão de tempo. Por exemplo, 三年ぶりに significa "pela primeira vez em três anos", ou seja, a última vez foi há três anos.

A expressão 久しぶりに é a mais comum e significa "depois de muito tempo".

Antes de um substantivo, usa-se ぶりの, como em 十年ぶりの大雪 ("a maior nevasca em dez anos").

Sozinho, 久しぶり! é uma saudação muito comum para alguém que não se vê há muito tempo, como "quanto tempo!".$$,
    $$ぶり também aparece em outras palavras com sentido de "jeito", como 話しぶり (jeito de falar). São usos diferentes.

Para intervalos muito curtos, como um dia, ぶりに soa estranho, a não ser que a pessoa queira mostrar que sentiu muita falta.

お久しぶりです é a versão educada da saudação.$$,
    $$Período de tempo + ぶりに + Verbo
Período de tempo + ぶりの + Substantivo
久しぶりに / 久しぶりの / 久しぶり！

Escrita: ぶり / 振り$$,
    $$ぶりに$$,
    $$ぶりに|振りに|ぶりの|ぶり$$,
    ARRAY['ぶり', 'に']::text[],
    ARRAY['ぶりに', 'ぶりの', '久しぶり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-14', $$三年ぶりに国へ帰りました。$$, $$さんねんぶりにくにへかえりました。$$, $$Voltei para o meu país pela primeira vez em três anos.$$),
    ('n3-grammar-14', $$週末、久しぶりに友達に会った。$$, $$しゅうまつ、ひさしぶりにともだちにあった。$$, $$No fim de semana, encontrei um amigo depois de muito tempo.$$),
    ('n3-grammar-14', $$昨日は十年ぶりの大雪だった。$$, $$きのうはじゅうねんぶりのおおゆきだった。$$, $$Ontem foi a maior nevasca em dez anos.$$),
    ('n3-grammar-14', $$一週間ぶりに雨が降った。$$, $$いっしゅうかんぶりにあめがふった。$$, $$Choveu pela primeira vez em uma semana.$$),
    ('n3-grammar-14', $$五年ぶりに会った彼は、全然変わっていなかった。$$, $$ごねんぶりにあったかれは、ぜんぜんかわっていなかった。$$, $$Encontrei-o depois de cinco anos, e ele não tinha mudado nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$二年____日本へ行きました。$$, $$Fui ao Japão pela primeira vez em dois anos.$$),
        (2, $$久し____、いい天気ですね。$$, $$Finalmente, depois de muito tempo, um dia bonito, né?$$),
        (3, $$三か月____髪を切りました。$$, $$Cortei o cabelo pela primeira vez em três meses.$$),
        (4, $$あの二人にとって、二十年____の再会でした。$$, $$Para aqueles dois, foi um reencontro depois de vinte anos.$$),
        (5, $$一か月____に家族と食事をした。$$, $$Jantei com a família pela primeira vez em um mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶりに$$),
        (2, $$ぶりに$$),
        (3, $$ぶりに$$),
        (4, $$ぶり$$),
        (5, $$ぶり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
