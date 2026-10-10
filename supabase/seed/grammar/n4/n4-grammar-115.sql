-- n4-grammar-115 — 〜るところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-115',
    'grammar',
    'N4',
    $$〜るところ$$,
    $$ru tokoro$$,
    $$Estar prestes a / Ia (fazer) agora$$,
    $$Quando ところ vem depois do verbo na forma de dicionário, ele indica que a ação está prestes a acontecer. Equivale a "estou prestes a..." ou "eu ia fazer isso agora".

ところ significa "ponto" ou "momento". Com a forma de dicionário, a ideia é "estou no ponto logo antes de fazer isso".

É muito comum com palavras como 今から, これから e ちょうど, que reforçam que a ação vai começar imediatamente.

No passado, るところだった indica que algo estava prestes a acontecer naquele momento. Em alguns contextos, também significa "quase aconteceu", como algo ruim que por pouco não ocorreu.$$,
    $$Esta é a primeira parte do trio com ところ: るところ (prestes a fazer), ているところ (fazendo agora) e たところ (acabou de fazer).

A forma ところだった também aparece com sentido de "quase", como em 遅れるところだった (quase me atrasei).

É uma resposta comum quando alguém pergunta se você já fez algo, e você está prestes a fazer.$$,
    $$Verbo na forma de dicionário + ところ + です / だ
今から / これから / ちょうど + Verbo + ところです
Passado: Verbo + ところだった$$,
    $$ところ$$,
    $$ところ$$,
    ARRAY['る', 'ところ']::text[],
    ARRAY['ところ', 'ところです', 'ところだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-115', $$今から出かけるところです。$$, $$いまからでかけるところです。$$, $$Estou prestes a sair agora.$$),
    ('n4-grammar-115', $$今、ちょうどご飯を食べるところだ。$$, $$いま、ちょうどごはんをたべるところだ。$$, $$Estou justamente prestes a comer agora.$$),
    ('n4-grammar-115', $$これから会議が始まるところです。$$, $$これからかいぎがはじまるところです。$$, $$A reunião está prestes a começar.$$),
    ('n4-grammar-115', $$「もう寝た？」「今から寝るところ。」$$, $$「もうねた？」「いまからねるところ。」$$, $$"Já dormiu?" "Estou indo dormir agora."$$),
    ('n4-grammar-115', $$そのとき、電車がちょうど駅に着くところだった。$$, $$そのとき、でんしゃがちょうどえきにつくところだった。$$, $$Naquele momento, o trem estava prestes a chegar à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今から家を出る____です。$$, $$Estou prestes a sair de casa agora.$$),
        (2, $$これから映画が始まる____だから、静かにして。$$, $$O filme está prestes a começar, então fique quieto.$$),
        (3, $$ちょうど今、あなたに電話をかける____でした。$$, $$Eu ia te ligar justamente agora.$$),
        (4, $$「宿題、もうした？」「今からする____。」$$, $$"Já fez a lição?" "Vou fazer agora."$$),
        (5, $$今、お風呂に入る____なので、後で電話します。$$, $$Estou prestes a entrar no banho, então ligo depois.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところ$$),
        (2, $$ところ$$),
        (3, $$ところ$$),
        (4, $$ところ$$),
        (5, $$ところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
