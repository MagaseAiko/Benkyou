-- n4-grammar-139 — 召し上がる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-139',
    'grammar',
    'N4',
    $$召し上がる$$,
    $$meshiagaru$$,
    $$Comer / Beber (respeitoso)$$,
    $$召し上がる é a forma respeitosa (尊敬語) de 食べる (comer) e 飲む (beber). Ela é usada quando alguém que merece respeito come ou bebe, como um cliente, um professor ou um superior.

É muito comum em restaurantes, lojas e ao oferecer comida para alguém. A frase どうぞ召し上がってください significa "por favor, sirva-se".

Existe também a forma お召し上がりください, que é ainda mais polida e aparece muito em embalagens de alimentos e restaurantes.

Como é respeitosa, nunca é usada para falar de si mesmo. Para a própria ação de comer de forma humilde, usa-se いただく.$$,
    $$O par respeitoso e humilde é: 召し上がる (o outro come) e いただく (eu como).

いただきます, dito antes das refeições, vem justamente da forma humilde de "receber" e "comer".

Na pergunta 何を召し上がりますか, um atendente pergunta educadamente o que o cliente vai comer ou beber.$$,
    $$Pessoa respeitada + が / は + Comida + を + 召し上がる

Educado: 召し上がります
Passado: 召し上がった / 召し上がりました
Convite: 召し上がってください / お召し上がりください

Escrita: 召し上がる / めしあがる$$,
    $$召し上がる$$,
    $$召し上が|めしあが$$,
    ARRAY['召し上がる']::text[],
    ARRAY['召し上がる', '召し上がります', '召し上がった', '召し上がってください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-139', $$先生は何を召し上がりますか。$$, $$せんせいはなにをめしあがりますか。$$, $$O que o professor vai comer?$$),
    ('n4-grammar-139', $$どうぞ、召し上がってください。$$, $$どうぞ、めしあがってください。$$, $$Por favor, sirva-se.$$),
    ('n4-grammar-139', $$社長はもう昼ご飯を召し上がりました。$$, $$しゃちょうはもうひるごはんをめしあがりました。$$, $$O presidente já almoçou.$$),
    ('n4-grammar-139', $$冷めないうちに、お召し上がりください。$$, $$さめないうちに、おめしあがりください。$$, $$Por favor, coma antes que esfrie.$$),
    ('n4-grammar-139', $$お客様はコーヒーを召し上がりますか。$$, $$おきゃくさまはコーヒーをめしあがりますか。$$, $$O senhor vai querer café?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$温かいうちに、どうぞ____ください。$$, $$Por favor, sirva-se enquanto está quente.$$),
        (2, $$先生、お茶を____か。$$, $$Professor, aceita um chá?$$),
        (3, $$社長はケーキを二つも____。$$, $$O presidente comeu dois pedaços inteiros de bolo.$$),
        (4, $$お客様、お飲み物は何を____か。$$, $$Senhor, o que vai querer beber?$$),
        (5, $$部長は昨日、お寿司を____そうです。$$, $$Dizem que o gerente comeu sushi ontem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$召し上がって$$),
        (2, $$召し上がります$$),
        (3, $$召し上がりました$$),
        (4, $$召し上がります$$),
        (5, $$召し上がった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
