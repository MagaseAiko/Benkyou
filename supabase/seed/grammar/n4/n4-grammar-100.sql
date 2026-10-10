-- n4-grammar-100 — 〜ておく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-100',
    'grammar',
    'N4',
    $$〜ておく$$,
    $$te oku$$,
    $$Deixar feito / Fazer com antecedência / Deixar (como está)$$,
    $$ておく junta a forma て do verbo com おく (colocar, deixar). Ele tem dois usos principais.

O primeiro é preparação: fazer algo com antecedência, pensando no futuro. Por exemplo, reservar o hotel antes da viagem, ler os documentos antes da reunião, comprar bebidas antes da festa.

O segundo é deixar algo como está, sem mudar, de propósito. Por exemplo, deixar a janela aberta ou deixar algo no lugar.

Ele também é usado para ações de organização, como colocar algo de volta no lugar depois de usar, para que fique pronto para a próxima vez.

Na fala casual, ておく é muito reduzido para とく, e でおく para どく.$$,
    $$ておく é diferente de てある: ておく foca na ação de preparar; てある foca no estado já pronto.

Formas reduzidas como やっとく e 買っとく são muito comuns entre amigos.

A frase そのままにしておいてください significa "deixe como está, por favor".$$,
    $$Verbo na forma て + おく

Educado: ておきます
Passado: ておいた / ておきました
Pedido: ておいてください
Fala casual: とく / といて / といた (でおく → どく)$$,
    $$ておく$$,
    $$ておく|ておき|ておい|でおく|でおき|でおい|とく|といた|といて$$,
    ARRAY['て', 'おく']::text[],
    ARRAY['ておく', 'ておきます', 'ておいた', 'ておいてください', 'とく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-100', $$旅行の前に、ホテルを予約しておきます。$$, $$りょこうのまえに、ホテルをよやくしておきます。$$, $$Antes da viagem, vou deixar o hotel reservado.$$),
    ('n4-grammar-100', $$会議の前に資料を読んでおいてください。$$, $$かいぎのまえにしりょうをよんでおいてください。$$, $$Leia os documentos antes da reunião, por favor.$$),
    ('n4-grammar-100', $$パーティーのために、飲み物を買っておいた。$$, $$パーティーのために、のみものをかっておいた。$$, $$Deixei as bebidas compradas para a festa.$$),
    ('n4-grammar-100', $$使ったら、元の場所に戻しておいてください。$$, $$つかったら、もとのばしょにもどしておいてください。$$, $$Depois de usar, coloque de volta no lugar, por favor.$$),
    ('n4-grammar-100', $$暑いから、窓は開けておいてもいいですよ。$$, $$あついから、まどはあけておいてもいいですよ。$$, $$Está quente, então pode deixar a janela aberta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お客さんが来る前に、部屋を掃除し____。$$, $$Vou limpar o quarto antes de as visitas chegarem.$$),
        (2, $$試験の前に、よく復習し____ください。$$, $$Revisem bem antes da prova, por favor.$$),
        (3, $$寝る前に、明日の準備をし____。$$, $$Antes de dormir, vou deixar tudo pronto para amanhã.$$),
        (4, $$出かける前に、切符を買っ____。$$, $$Antes de sair, comprei a passagem com antecedência.$$),
        (5, $$暑いから、エアコンをつけ____ね。$$, $$Está quente, então vou deixar o ar-condicionado ligado, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ておきます$$),
        (1, $$ておく$$),
        (1, $$ておきましょう$$),
        (2, $$ておいて$$),
        (3, $$ておきます$$),
        (3, $$ておく$$),
        (4, $$ておきました$$),
        (4, $$ておいた$$),
        (5, $$ておく$$),
        (5, $$とく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
