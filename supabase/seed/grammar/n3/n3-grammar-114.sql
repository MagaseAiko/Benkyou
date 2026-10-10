-- n3-grammar-114 — 数量＋は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-114',
    'grammar',
    'N3',
    $$数量＋は$$,
    $$suuryou + wa$$,
    $$Pelo menos / No mínimo$$,
    $$Quando a partícula は vem depois de uma quantidade, ela indica o mínimo esperado ou estimado. Equivale a "pelo menos" ou "no mínimo".

Por exemplo, 二十分はかかります significa "leva pelo menos vinte minutos". A ideia é que o número real pode ser igual ou maior, mas não menor.

É usado para estimativas ("esta bolsa deve custar pelo menos cinquenta mil ienes"), metas pessoais ("procuro estudar pelo menos uma hora por dia") e avisos sobre tempo ou custo.

Para reforçar, é comum acrescentar 少なくとも (pelo menos) no começo da frase.$$,
    $$Esse uso de は é diferente do は que marca o tema. Aqui, ele vem logo depois de um número com contador.

Com も, o sentido é o oposto: 二時間もかかった destaca que é muito; 二時間はかかる indica o mínimo.

Em conversas sobre planos e orçamentos, essa estrutura é muito útil para dar estimativas realistas.$$,
    $$Quantidade + は + Verbo (かかる / する / 必要だ / 来る)
少なくとも + Quantidade + は + …$$,
    $$は$$,
    $$は$$,
    ARRAY['は']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-114', $$この仕事は、少なくとも三日はかかる。$$, $$このしごとは、すくなくともみっかはかかる。$$, $$Este trabalho vai levar pelo menos três dias.$$),
    ('n3-grammar-114', $$駅まで歩くと、二十分はかかります。$$, $$えきまであるくと、にじゅっぷんはかかります。$$, $$A pé, até a estação leva pelo menos vinte minutos.$$),
    ('n3-grammar-114', $$毎日一時間は勉強するようにしている。$$, $$まいにちいちじかんはべんきょうするようにしている。$$, $$Procuro estudar pelo menos uma hora todos os dias.$$),
    ('n3-grammar-114', $$あの店には、一日に百人は客が来る。$$, $$あのみせには、いちにちにひゃくにんはきゃくがくる。$$, $$Aquela loja recebe pelo menos cem clientes por dia.$$),
    ('n3-grammar-114', $$このブランドのかばんは、五万円はするだろう。$$, $$このブランドのかばんは、ごまんえんはするだろう。$$, $$Uma bolsa desta marca deve custar pelo menos cinquenta mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$休みの日は、一日に八時間____寝たい。$$, $$Nos dias de folga, quero dormir pelo menos oito horas.$$),
        (2, $$東京まで、車で三時間____かかる。$$, $$Até Tóquio leva pelo menos três horas de carro.$$),
        (3, $$彼は一日に二リットル____水を飲む。$$, $$Ele bebe pelo menos dois litros de água por dia.$$),
        (4, $$この料理を作るには、一時間____必要だ。$$, $$Para fazer esta comida, é preciso pelo menos uma hora.$$),
        (5, $$その時計は十万円____すると思う。$$, $$Acho que esse relógio custa pelo menos cem mil ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は$$),
        (2, $$は$$),
        (3, $$は$$),
        (4, $$は$$),
        (5, $$は$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
