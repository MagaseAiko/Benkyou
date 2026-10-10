-- n4-grammar-18 — 〜始める
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-18',
    'grammar',
    'N4',
    $$〜始める$$,
    $$hajimeru$$,
    $$Começar a$$,
    $$始める, ligado a outro verbo, indica o começo de uma ação. Equivale a "começar a".

A estrutura junta o verbo na forma ます sem ます com 始める. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 始めます, 始めた, 始めて.

Ele pode indicar tanto ações que a pessoa decide começar, como estudar ou trabalhar, quanto mudanças naturais, como começar a chover ou as flores começarem a abrir.

Comparado a 出す, 始める é neutro e serve para qualquer começo. 出す destaca que o começo foi repentino ou inesperado.$$,
    $$O oposto de 始める é 終わる (terminar de) ou やむ, no caso da chuva. Com verbos, também se usa 〜終わる, como em 読み終わる (terminar de ler).

Sozinho, 始める significa "começar algo" e é transitivo: 授業を始める (começar a aula). Já 始まる é intransitivo: 授業が始まる (a aula começa).

Com ações de um instante, como chegar ou acordar, 始める normalmente não é usado, porque não faz sentido "começar" uma ação que acontece de uma vez.$$,
    $$Verbo na forma ます sem ます + 始める

Educado: 始めます
Passado: 始めた / 始めました

Escrita: 始める / はじめる$$,
    $$始める$$,
    $$始める|始め|はじめ$$,
    ARRAY['始める']::text[],
    ARRAY['始める', '始めます', '始めた', '始めました', 'はじめる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-18', $$去年から日本語を勉強し始めました。$$, $$きょねんからにほんごをべんきょうしはじめました。$$, $$Comecei a estudar japonês no ano passado.$$),
    ('n4-grammar-18', $$雨が降り始めた。$$, $$あめがふりはじめた。$$, $$Começou a chover.$$),
    ('n4-grammar-18', $$子供が歩き始めました。$$, $$こどもがあるきはじめました。$$, $$A criança começou a andar.$$),
    ('n4-grammar-18', $$この本は昨日読み始めたばかりです。$$, $$このほんはきのうよみはじめたばかりです。$$, $$Acabei de começar a ler este livro ontem.$$),
    ('n4-grammar-18', $$桜が咲き始めると、春が来たと感じます。$$, $$さくらがさきはじめると、はるがきたとかんじます。$$, $$Quando as cerejeiras começam a florir, sinto que a primavera chegou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先月からピアノを習い____。$$, $$Comecei a aprender piano no mês passado.$$),
        (2, $$九月になって、木の葉が赤くなり____。$$, $$Chegou setembro, e as folhas das árvores começaram a ficar vermelhas.$$),
        (3, $$何時から仕事をし____か。$$, $$A que horas você vai começar a trabalhar?$$),
        (4, $$最近、毎朝ジョギングをし____。$$, $$Recentemente, comecei a correr toda manhã.$$),
        (5, $$冬になると、みんな風邪をひき____。$$, $$Quando chega o inverno, todo mundo começa a pegar resfriado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$始めました$$),
        (1, $$はじめました$$),
        (1, $$始めた$$),
        (1, $$はじめた$$),
        (2, $$始めた$$),
        (2, $$始めました$$),
        (2, $$はじめた$$),
        (2, $$はじめました$$),
        (3, $$始めます$$),
        (3, $$はじめます$$),
        (4, $$始めました$$),
        (4, $$はじめました$$),
        (4, $$始めた$$),
        (4, $$はじめた$$),
        (5, $$始める$$),
        (5, $$始めます$$),
        (5, $$はじめる$$),
        (5, $$はじめます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
