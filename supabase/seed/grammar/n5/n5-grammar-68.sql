-- n5-grammar-68 — 〜てください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-68',
    'grammar',
    'N5',
    $$〜てください$$,
    $$te kudasai$$,
    $$Por favor (faça) / Faça...$$,
    $$てください é usado para pedir que alguém faça alguma coisa. Equivale a "por favor, faça..." ou ao imperativo educado do português.

A estrutura junta o verbo na forma て com ください, que vem de くださる, um verbo respeitoso que significa "dar". A ideia literal é "faça isso por mim, por favor".

É usado em pedidos, instruções, orientações e convites gentis, como "entre, por favor" ou "fique à vontade".

Apesar de educado, てください ainda é um pedido direto. Com superiores ou desconhecidos, em pedidos maiores, o japonês prefere formas mais suaves, como てくださいませんか.

Na fala informal, ください costuma ser omitido, e o pedido fica só com a forma て.$$,
    $$Em instruções de professores, médicos e funcionários, てください é muito comum e não soa rude, porque faz parte do papel da pessoa orientar.

O oposto, para pedir que alguém não faça algo, é ないでください.

Para pedir uma coisa, e não uma ação, usa-se をください.$$,
    $$Verbo na forma て + ください
Verbo na forma て (informal, entre amigos e família)

Mais suave: てくださいませんか / てくれませんか$$,
    $$てください$$,
    $$てください|でください$$,
    ARRAY['て', 'ください']::text[],
    ARRAY['てください', 'でください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-68', $$ちょっと待ってください。$$, $$ちょっとまってください。$$, $$Espere um pouco, por favor.$$),
    ('n5-grammar-68', $$ここに名前を書いてください。$$, $$ここになまえをかいてください。$$, $$Escreva seu nome aqui, por favor.$$),
    ('n5-grammar-68', $$もう少しゆっくり話してください。$$, $$もうすこしゆっくりはなしてください。$$, $$Fale um pouco mais devagar, por favor.$$),
    ('n5-grammar-68', $$この本を読んでください。$$, $$このほんをよんでください。$$, $$Leia este livro, por favor.$$),
    ('n5-grammar-68', $$駅に着いたら、電話してください。$$, $$えきについたら、でんわしてください。$$, $$Quando chegar à estação, me ligue, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いですね。窓を開け____。$$, $$Está quente, né. Abra a janela, por favor.$$),
        (2, $$教科書の十ページを見____。$$, $$Olhem a página dez do livro, por favor.$$),
        (3, $$時間がありません。早く来____。$$, $$Não temos tempo. Venha rápido, por favor.$$),
        (4, $$この薬を一日三回飲ん____。$$, $$Tome este remédio três vezes ao dia, por favor.$$),
        (5, $$わからないときは、いつでも聞い____ね。$$, $$Quando não entender, pode perguntar a qualquer hora, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てください$$),
        (2, $$てください$$),
        (3, $$てください$$),
        (4, $$でください$$),
        (5, $$てください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
