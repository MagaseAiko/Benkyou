-- n3-grammar-105 — 〜せいで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-105',
    'grammar',
    'N3',
    $$〜せいで$$,
    $$sei de$$,
    $$Por culpa de / Por causa de (negativo)$$,
    $$せいで é usado para indicar a causa de um resultado negativo. Equivale a "por culpa de" ou "por causa de".

A primeira parte mostra a causa, e a segunda, o resultado ruim. Muitas vezes, há um tom de culpa, reclamação ou responsabilidade. Por exemplo, "por causa da chuva, a partida foi cancelada" ou "por culpa dele, o plano fracassou".

Ele vem depois de substantivos com の e da forma simples de verbos e adjetivos.

Na forma せいだ ou せいです, no fim da frase, indica diretamente de quem é a culpa: "a culpa é minha".

O oposto, para causas positivas, é おかげで.$$,
    $$Usar せいで com pessoas é uma forma direta de culpar alguém. Deve ser usado com cuidado.

Para assumir a responsabilidade com educação, a frase 私のせいです ("a culpa é minha") é comum.

A forma せいか (N2) indica uma causa provável: "talvez por causa de...".$$,
    $$Substantivo + の + せいで + Resultado negativo
Verbo / Adjetivo (forma simples) + せいで + Resultado negativo
Adjetivo な + な + せいで
… + のは + 〜のせいだ / せいです$$,
    $$せいで$$,
    $$せいで|せいだ|せいです|所為で$$,
    ARRAY['せい', 'で']::text[],
    ARRAY['せいで', 'せいだ', 'せいです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-105', $$雨のせいで、試合が中止になった。$$, $$あめのせいで、しあいがちゅうしになった。$$, $$Por causa da chuva, a partida foi cancelada.$$),
    ('n3-grammar-105', $$寝坊したせいで、遅刻してしまった。$$, $$ねぼうしたせいで、ちこくしてしまった。$$, $$Por ter dormido demais, acabei chegando atrasado.$$),
    ('n3-grammar-105', $$彼のせいで、計画が失敗した。$$, $$かれのせいで、けいかくがしっぱいした。$$, $$Por culpa dele, o plano fracassou.$$),
    ('n3-grammar-105', $$甘い物を食べすぎたせいで、太った。$$, $$あまいものをたべすぎたせいで、ふとった。$$, $$Engordei por ter comido doce demais.$$),
    ('n3-grammar-105', $$失敗したのは、私のせいです。$$, $$しっぱいしたのは、わたしのせいです。$$, $$A culpa pelo fracasso é minha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の____、電車が遅れた。$$, $$Por causa do acidente, o trem atrasou.$$),
        (2, $$風邪をひいた____、声が出ない。$$, $$Por causa do resfriado, estou sem voz.$$),
        (3, $$道が混んでいた____、約束の時間に間に合わなかった。$$, $$Por causa do trânsito, não cheguei a tempo para o compromisso.$$),
        (4, $$彼がうそをついた____、みんなが困った。$$, $$Por culpa da mentira dele, todos ficaram em apuros.$$),
        (5, $$寝不足の____、頭が痛い。$$, $$Por falta de sono, estou com dor de cabeça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいで$$),
        (2, $$せいで$$),
        (3, $$せいで$$),
        (4, $$せいで$$),
        (5, $$せいで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
