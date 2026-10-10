-- n5-grammar-49 — 〜にする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-49',
    'grammar',
    'N5',
    $$〜にする$$,
    $$ni suru$$,
    $$Escolher / Decidir por / Ficar com$$,
    $$にする é usado para dizer que você escolheu ou decidiu algo entre várias opções. Equivale a "escolher", "decidir por" ou "ficar com".

É muito usado em restaurantes, lojas e na hora de combinar planos. Por exemplo, ao pedir uma bebida, dizer "vou ficar com café".

A coisa escolhida vem antes de に, e する indica a decisão. Na forma educada, usa-se にします para a escolha no momento e にしました para uma decisão já tomada.

Em perguntas, 何にしますか é a forma natural de perguntar "o que você vai querer?" ou "o que você escolhe?".

Com ましょう e よう, a estrutura vira uma proposta de escolha para o grupo.$$,
    $$Não confunda essa にする com a にする que indica transformação, como deixar algo limpo ou silencioso. A diferença é que aqui a palavra antes de に é uma opção escolhida.

Em lanchonetes e restaurantes, にします é uma forma mais delicada de pedir do que ください, porque soa como uma escolha pessoal.

Para decisões sobre ações, o japonês usa ことにする, que aparece no N4.$$,
    $$Substantivo + に + する
Substantivo + に + します / しました
何 / どれ / いつ + に + しますか
Substantivo + に + しましょう / しよう$$,
    $$にする$$,
    $$にする|にします|にしました|にした|にしよう|にしましょう$$,
    ARRAY['に', 'する']::text[],
    ARRAY['にする', 'にします', 'にしました', 'にした', 'にしよう', 'にしましょう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-49', $$私はコーヒーにします。$$, $$わたしはコーヒーにします。$$, $$Vou querer café.$$),
    ('n5-grammar-49', $$飲み物は何にしますか。$$, $$のみものはなににしますか。$$, $$O que você vai querer de bebida?$$),
    ('n5-grammar-49', $$旅行は来週にしました。$$, $$りょこうはらいしゅうにしました。$$, $$Decidi fazer a viagem na semana que vem.$$),
    ('n5-grammar-49', $$プレゼントはこのかばんにしよう。$$, $$プレゼントはこのかばんにしよう。$$, $$Vou escolher esta bolsa como presente.$$),
    ('n5-grammar-49', $$会議は三時からにしましょう。$$, $$かいぎはさんじからにしましょう。$$, $$Vamos marcar a reunião a partir das três.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「飲み物は何にしますか。」「紅茶____。」$$, $$"O que vai querer de bebida?" "Vou querer chá."$$),
        (2, $$今日の晩ご飯はカレー____。$$, $$Vamos de curry no jantar de hoje.$$),
        (3, $$迷ったけど、色は赤____。$$, $$Fiquei em dúvida, mas escolhi a cor vermelha.$$),
        (4, $$待ち合わせは駅の前____か。$$, $$Que tal nos encontrarmos em frente à estação?$$),
        (5, $$「どれにしますか。」「じゃ、これ____。」$$, $$"Qual você vai querer?" "Então, vou ficar com este."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にします$$),
        (2, $$にしましょう$$),
        (2, $$にしよう$$),
        (3, $$にしました$$),
        (3, $$にした$$),
        (4, $$にしましょう$$),
        (4, $$にします$$),
        (5, $$にします$$),
        (5, $$にする$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
