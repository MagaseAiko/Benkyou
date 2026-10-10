-- n5-grammar-66 — 〜ている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-66',
    'grammar',
    'N5',
    $$〜ている$$,
    $$te iru$$,
    $$Estar fazendo / Estar (em um estado) / Costumar fazer$$,
    $$ている é uma das estruturas mais importantes do japonês. Ela é formada pelo verbo na forma て + いる e tem três usos principais.

O primeiro é indicar uma ação em andamento, como o nosso gerúndio: estar comendo, estar lendo, estar chovendo.

O segundo é indicar um estado que resultou de uma ação já terminada. Com verbos como casar, morar, saber, abrir e morrer, ている mostra a situação atual, e não uma ação acontecendo. Por exemplo, estar casado significa que a pessoa casou e continua casada.

O terceiro é indicar hábitos ou atividades que a pessoa faz regularmente, como trabalhar em algum lugar ou praticar um esporte toda semana.

O sentido depende do tipo de verbo. Verbos de ação contínua costumam indicar ação em andamento, e verbos de mudança instantânea costumam indicar estado.$$,
    $$知っている é usado para "saber" ou "conhecer", mas o negativo é 知らない, e não 知っていない.

Na fala, ている é muito reduzido para てる, e ています para てます.

Para descrever roupas e acessórios que alguém está usando, também se usa ている, porque a pessoa vestiu e continua vestida.$$,
    $$Verbo na forma て + いる
Verbo na forma て + います (educado)

Negativo: ていない / ていません
Passado: ていた / ていました

Fala informal: Verbo て + る (てる)$$,
    $$ている$$,
    $$ている|ています|ていた|ていました|でいる|でいます|でいた|でいました|てる$$,
    ARRAY['て', 'いる']::text[],
    ARRAY['ている', 'ています', 'ていた', 'ていました', 'でいる', 'でいます', 'てる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-66', $$今、雨が降っています。$$, $$いま、あめがふっています。$$, $$Agora está chovendo.$$),
    ('n5-grammar-66', $$弟は部屋で本を読んでいる。$$, $$おとうとはへやでほんをよんでいる。$$, $$Meu irmão mais novo está lendo um livro no quarto.$$),
    ('n5-grammar-66', $$姉は結婚しています。$$, $$あねはけっこんしています。$$, $$Minha irmã mais velha é casada.$$),
    ('n5-grammar-66', $$私は東京に住んでいます。$$, $$わたしはとうきょうにすんでいます。$$, $$Eu moro em Tóquio.$$),
    ('n5-grammar-66', $$毎朝、ジョギングをしています。$$, $$まいあさ、ジョギングをしています。$$, $$Toda manhã, faço corrida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちは公園で遊ん____。$$, $$As crianças estão brincando no parque.$$),
        (2, $$「今、何をしていますか。」「ご飯を食べ____。」$$, $$"O que você está fazendo agora?" "Estou comendo."$$),
        (3, $$父は銀行で働い____。$$, $$Meu pai trabalha no banco.$$),
        (4, $$田中さんの電話番号を知っ____か。$$, $$Você sabe o número de telefone do Tanaka?$$),
        (5, $$あの店はもう閉まっ____。$$, $$Aquela loja já está fechada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でいます$$),
        (1, $$でいる$$),
        (2, $$ています$$),
        (3, $$ています$$),
        (3, $$ている$$),
        (4, $$ています$$),
        (5, $$ています$$),
        (5, $$ている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
