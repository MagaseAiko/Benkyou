-- n1-grammar-187 — 〜てみせる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-187',
    'grammar',
    'N1',
    $$〜てみせる$$,
    $$te miseru$$,
    $$Vou conseguir / Vou provar / Mostrar como se faz$$,
    $$てみせる tem dois usos principais.

O primeiro expressa uma determinação forte de fazer algo, muitas vezes para provar algo aos outros. Equivale a "vou conseguir" ou "vou provar". Por exemplo, "da próxima vez, vou ganhar com certeza".

O segundo indica mostrar a alguém como se faz algo, como uma demonstração. Equivale a "mostrar como se faz". Por exemplo, "o professor mostrou como se faz o exercício".$$,
    $$No uso de determinação, costuma vir com 必ず, 絶対に ou きっと.

O sujeito do uso de determinação é a primeira pessoa.$$,
    $$Verbo (forma て) + みせる (determinação)
Verbo (forma て) + みせる (demonstração)$$,
    $$てみせる$$,
    $$てみせる|でみせる|てみせた|でみせた|てみせます|でみせます|てみせて$$,
    ARRAY['て', 'みせる']::text[],
    ARRAY['てみせる', 'てみせます', 'てみせた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-187', $$次の試合では、必ず勝ってみせる。$$, $$つぎのしあいでは、かならずかってみせる。$$, $$Na próxima partida, vou ganhar com certeza.$$),
    ('n1-grammar-187', $$いつか絶対に有名になってみせます。$$, $$いつかぜったいにゆうめいになってみせます。$$, $$Um dia vou ficar famoso, pode apostar.$$),
    ('n1-grammar-187', $$先生は生徒たちに泳いでみせた。$$, $$せんせいはせいとたちにおよいでみせた。$$, $$O professor mostrou aos alunos como se nada.$$),
    ('n1-grammar-187', $$今度こそ合格してみせる。$$, $$こんどこそごうかくしてみせる。$$, $$Desta vez vou passar, pode ter certeza.$$),
    ('n1-grammar-187', $$母は料理の作り方をやってみせてくれた。$$, $$はははりょうりのつくりかたをやってみせてくれた。$$, $$Minha mãe me mostrou como se faz a comida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$馬鹿にされたけど、絶対に成功し____。$$, $$Zombaram de mim, mas vou ter sucesso, pode apostar.$$),
        (2, $$この記録は、必ず破っ____。$$, $$Vou quebrar este recorde, com certeza.$$),
        (3, $$コーチは正しいフォームを見せるために、自分で投げ____。$$, $$Para mostrar a forma correta, o técnico arremessou ele mesmo.$$),
        (4, $$来年こそ、彼女を振り向かせ____。$$, $$No ano que vem, vou fazer ela me notar, pode ter certeza.$$),
        (5, $$どんなに難しくても、やり遂げ____。$$, $$Por mais difícil que seja, vou conseguir até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てみせる$$),
        (1, $$てみせます$$),
        (2, $$てみせる$$),
        (2, $$てみせます$$),
        (3, $$てみせた$$),
        (4, $$てみせる$$),
        (4, $$てみせます$$),
        (5, $$てみせる$$),
        (5, $$てみせます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
