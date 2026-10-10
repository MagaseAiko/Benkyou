-- n3-grammar-148 — ところが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-148',
    'grammar',
    'N3',
    $$ところが$$,
    $$tokoro ga$$,
    $$Mas / No entanto / Só que (inesperado)$$,
    $$ところが é uma conjunção que introduz um resultado inesperado, contrário ao que se esperava. Equivale a "mas", "no entanto" ou "só que".

A primeira frase apresenta uma expectativa ou uma ação, e a segunda, iniciada por ところが, mostra que a realidade foi diferente e surpreendente. Por exemplo, "achei que seria fácil. No entanto, foi muito difícil".

A diferença em relação a しかし e でも é o elemento de surpresa. ところが destaca que o resultado foi inesperado para quem fala.

Por isso, a segunda parte é um fato que aconteceu, e não uma opinião, um pedido ou uma intenção.$$,
    $$ところが é muito comum em narrativas, histórias e relatos pessoais.

A segunda parte geralmente está no passado e descreve algo que de fato aconteceu.

Não confunda com ところで (a propósito), que muda de assunto, nem com ところ (lugar, momento).$$,
    $$Frase 1 (expectativa / ação, com ponto final) + ところが、 + Resultado inesperado$$,
    $$ところが$$,
    $$ところが$$,
    ARRAY['ところが']::text[],
    ARRAY['ところが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-148', $$天気予報では晴れだった。ところが、午後から雨が降った。$$, $$てんきよほうでははれだった。ところが、ごごからあめがふった。$$, $$A previsão era de sol. No entanto, choveu a partir da tarde.$$),
    ('n3-grammar-148', $$簡単だと思った。ところが、とても難しかった。$$, $$かんたんだとおもった。ところが、とてもむずかしかった。$$, $$Achei que seria fácil. Só que foi muito difícil.$$),
    ('n3-grammar-148', $$急いで駅に行った。ところが、電車はもう出ていた。$$, $$いそいでえきにいった。ところが、でんしゃはもうでていた。$$, $$Fui correndo para a estação. Mas o trem já tinha saído.$$),
    ('n3-grammar-148', $$彼は来ると言っていた。ところが、結局来なかった。$$, $$かれはくるといっていた。ところが、けっきょくこなかった。$$, $$Ele disse que viria. No entanto, no fim não veio.$$),
    ('n3-grammar-148', $$安いと思って買った。ところが、すぐに壊れた。$$, $$やすいとおもってかった。ところが、すぐにこわれた。$$, $$Comprei achando que estava barato. Só que quebrou logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ケーキを買いに店に行った。____、休みだった。$$, $$Fui à loja comprar um bolo. Mas estava fechada.$$),
        (2, $$試験は簡単だと聞いていた。____、全然できなかった。$$, $$Tinha ouvido que a prova era fácil. No entanto, não consegui fazer nada.$$),
        (3, $$彼に電話した。____、誰も出なかった。$$, $$Liguei para ele. Mas ninguém atendeu.$$),
        (4, $$晴れると思って傘を持たずに出かけた。____、雨が降り出した。$$, $$Saí sem guarda-chuva achando que ia fazer sol. Só que começou a chover.$$),
        (5, $$早く寝ようと思った。____、なかなか眠れなかった。$$, $$Pensei em dormir cedo. No entanto, não consegui pegar no sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-148', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところが$$),
        (2, $$ところが$$),
        (3, $$ところが$$),
        (4, $$ところが$$),
        (5, $$ところが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
