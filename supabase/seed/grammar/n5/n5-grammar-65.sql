-- n5-grammar-65 — 〜てある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-65',
    'grammar',
    'N5',
    $$〜てある$$,
    $$te aru$$,
    $$Estar feito / Ter sido deixado / Estar preparado$$,
    $$てある é usado para descrever o estado de algo que alguém fez de propósito. A ação já terminou, e o resultado continua visível.

A estrutura usa um verbo transitivo, ou seja, um verbo de ação que alguém faz em alguma coisa, como escrever, abrir, colocar e comprar. Esse verbo vai para a forma て e recebe ある.

Existem dois usos principais. O primeiro é descrever o que se vê: algo está escrito, aberto, colocado em algum lugar. Nesse caso, a coisa é marcada com が. O foco está no resultado, e não em quem fez.

O segundo é mostrar que algo foi feito com antecedência, como preparação. Nesse caso, a coisa costuma ser marcada com を e a frase passa a ideia de "já deixei feito".

É diferente de ている com verbos intransitivos, que só descreve um estado, sem a ideia de que alguém fez aquilo de propósito.$$,
    $$Compare: 窓が開いている descreve apenas que a janela está aberta. 窓が開けてある mostra que alguém abriu a janela de propósito, e ela continua assim.

てある não é usado com verbos intransitivos, como 開く ou 閉まる.

No uso de preparação, てある fica parecido com ておく, que aparece no N4. ておく foca na ação de preparar, e てある foca no estado já pronto.$$,
    $$Substantivo + が + Verbo transitivo na forma て + ある (estado visível)
Substantivo + を + Verbo transitivo na forma て + ある (preparação)

Educado: てあります
Passado: てあった / てありました$$,
    $$てある$$,
    $$てある|てあります|てあった|てありました$$,
    ARRAY['て', 'ある']::text[],
    ARRAY['てある', 'てあります', 'てあった', 'てありました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-65', $$壁に絵がかけてあります。$$, $$かべにえがかけてあります。$$, $$Tem um quadro pendurado na parede.$$),
    ('n5-grammar-65', $$部屋の窓が開けてあります。$$, $$へやのまどがあけてあります。$$, $$A janela do quarto foi deixada aberta.$$),
    ('n5-grammar-65', $$机の上にメモが置いてある。$$, $$つくえのうえにメモがおいてある。$$, $$Tem um bilhete deixado em cima da mesa.$$),
    ('n5-grammar-65', $$パーティーの飲み物はもう買ってあります。$$, $$パーティーののみものはもうかってあります。$$, $$As bebidas da festa já estão compradas.$$),
    ('n5-grammar-65', $$ホテルはもう予約してありますから、大丈夫ですよ。$$, $$ホテルはもうよやくしてありますから、だいじょうぶですよ。$$, $$O hotel já está reservado, então pode ficar tranquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ドアに名前が書い____。$$, $$O nome está escrito na porta.$$),
        (2, $$冷蔵庫にビールが冷やし____。$$, $$Tem cerveja gelando na geladeira.$$),
        (3, $$誰もいないのに、部屋の電気がつけ____。$$, $$Não tem ninguém, mas a luz do quarto foi deixada acesa.$$),
        (4, $$テーブルの上にお皿が並べ____。$$, $$Os pratos estão arrumados em cima da mesa.$$),
        (5, $$旅行の切符はもう買っ____から、心配しないで。$$, $$As passagens da viagem já estão compradas, então não se preocupe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てあります$$),
        (1, $$てある$$),
        (2, $$てあります$$),
        (2, $$てある$$),
        (3, $$てあります$$),
        (3, $$てある$$),
        (4, $$てあります$$),
        (4, $$てある$$),
        (5, $$てある$$),
        (5, $$てあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
