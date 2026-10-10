-- n1-grammar-30 — 〜がてら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-30',
    'grammar',
    'N1',
    $$〜がてら$$,
    $$gatera$$,
    $$Aproveitando para / Ao mesmo tempo que / Enquanto$$,
    $$がてら indica que, ao fazer uma ação, a pessoa aproveita para fazer outra também. Equivale a "aproveitando para" ou "ao mesmo tempo que".

A primeira parte é a ação principal ou o motivo, e a segunda é o que se aproveita para fazer. Por exemplo, "aproveitando o passeio, fui fazer compras".

Costuma vir com verbos de movimento na segunda parte, como 行く, 来る, 歩く ou 寄る.$$,
    $$Expressões comuns são 散歩がてら, 買い物がてら e 遊びがてら.

É parecido com かたがた e ついでに. がてら é mais coloquial e muito usado na fala.$$,
    $$Substantivo (ação) + がてら + Verbo de movimento
Verbo (forma ます sem ます) + がてら + Verbo de movimento$$,
    $$がてら$$,
    $$がてら$$,
    ARRAY['がてら']::text[],
    ARRAY['がてら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-30', $$散歩がてら、パンを買いに行った。$$, $$さんぽがてら、パンをかいにいった。$$, $$Aproveitando o passeio, fui comprar pão.$$),
    ('n1-grammar-30', $$駅まで送りがてら、少し話をした。$$, $$えきまでおくりがてら、すこしはなしをした。$$, $$Aproveitei que o levei até a estação para conversar um pouco.$$),
    ('n1-grammar-30', $$買い物がてら、友達の家に寄った。$$, $$かいものがてら、ともだちのいえによった。$$, $$Aproveitando as compras, passei na casa de um amigo.$$),
    ('n1-grammar-30', $$遊びがてら、日本の文化を学んだ。$$, $$あそびがてら、にほんのぶんかをまなんだ。$$, $$Enquanto me divertia, aprendi sobre a cultura japonesa.$$),
    ('n1-grammar-30', $$運動がてら、自転車で会社に行っている。$$, $$うんどうがてら、じてんしゃでかいしゃにいっている。$$, $$Vou de bicicleta para o trabalho, aproveitando para me exercitar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$花見____、公園を散歩した。$$, $$Aproveitando para ver as cerejeiras, caminhei pelo parque.$$),
        (2, $$出張____、昔の友達に会った。$$, $$Aproveitando a viagem a trabalho, encontrei um velho amigo.$$),
        (3, $$ドライブ____、海を見に行った。$$, $$Aproveitando o passeio de carro, fui ver o mar.$$),
        (4, $$お見舞い____、近くの店で花を買った。$$, $$Aproveitando a visita ao doente, comprei flores numa loja próxima.$$),
        (5, $$犬の散歩____、郵便局に寄った。$$, $$Aproveitando o passeio com o cachorro, passei nos correios.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がてら$$),
        (2, $$がてら$$),
        (3, $$がてら$$),
        (4, $$がてら$$),
        (5, $$がてら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
