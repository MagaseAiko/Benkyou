-- n1-grammar-72 — 〜まくる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-72',
    'grammar',
    'N1',
    $$〜まくる$$,
    $$makuru$$,
    $$Sem parar / Muito / A rodo$$,
    $$まくる indica que uma ação é feita de forma intensa e repetida, sem parar. Equivale a "sem parar", "muito" ou "a rodo".

Por exemplo, "comi sem parar" ou "trabalhei feito louco".

É uma expressão coloquial e informal, comum entre jovens.$$,
    $$Não se usa em situações formais.

Combinações comuns são 食べまくる, 遊びまくる, 買いまくる, 書きまくる e 走りまくる.$$,
    $$Verbo (forma ます sem ます) + まくる$$,
    $$まくる$$,
    $$まくる|まくった|まくって|まくり$$,
    ARRAY['まくる']::text[],
    ARRAY['まくる', 'まくった', 'まくって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-72', $$休みの日は、ゲームをやりまくった。$$, $$やすみのひは、ゲームをやりまくった。$$, $$No dia de folga, joguei videogame sem parar.$$),
    ('n1-grammar-72', $$旅行先で、お土産を買いまくった。$$, $$りょこうさきで、おみやげをかいまくった。$$, $$No destino da viagem, comprei lembrancinhas a rodo.$$),
    ('n1-grammar-72', $$試験の前は、単語を書きまくって覚えた。$$, $$しけんのまえは、たんごをかきまくっておぼえた。$$, $$Antes da prova, decorei as palavras escrevendo sem parar.$$),
    ('n1-grammar-72', $$ストレスがたまったので、カラオケで歌いまくった。$$, $$ストレスがたまったので、カラオケでうたいまくった。$$, $$Como o estresse acumulou, cantei sem parar no karaokê.$$),
    ('n1-grammar-72', $$彼は会議で文句を言いまくっていた。$$, $$かれはかいぎでもんくをいいまくっていた。$$, $$Ele ficou reclamando sem parar na reunião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休みは毎日遊び____。$$, $$Nas férias de verão, brinquei sem parar todos os dias.$$),
        (2, $$ケーキ屋で甘いものを食べ____。$$, $$Na confeitaria, comi doces sem parar.$$),
        (3, $$彼女はセールで服を買い____いる。$$, $$Ela está comprando roupas a rodo na liquidação.$$),
        (4, $$就職活動で、会社に電話をかけ____。$$, $$Na busca por emprego, liguei para empresas sem parar.$$),
        (5, $$試合では、走り____疲れた。$$, $$Na partida, corri sem parar e fiquei exausto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まくった$$),
        (2, $$まくった$$),
        (3, $$まくって$$),
        (4, $$まくった$$),
        (5, $$まくって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
