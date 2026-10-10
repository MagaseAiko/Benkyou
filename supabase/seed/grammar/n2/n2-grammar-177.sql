-- n2-grammar-177 — 〜とも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-177',
    'grammar',
    'N2',
    $$〜とも$$,
    $$tomo$$,
    $$Por mais que / Mesmo que / No mínimo$$,
    $$とも tem alguns usos importantes.

O primeiro, depois da forma volitiva ou de くとも, significa "mesmo que" ou "por mais que". É uma forma escrita e formal. Por exemplo, "por mais que seja difícil, não vou desistir".

O segundo vem com adjetivos de quantidade, como 遅くとも ou 少なくとも, e significa "no mínimo" ou "no máximo". Por exemplo, "no máximo até amanhã".

Também aparece no fim de frase, como もちろんですとも, para concordar com força, com o sentido de "claro que sim".$$,
    $$Expressões comuns são 遅くとも, 少なくとも, 多くとも e 何があろうとも.

O uso no fim da frase é um pouco antiquado, mas ainda aparece na fala.$$,
    $$Verbo (forma volitiva) + とも
Adjetivo い (sem い) + くとも
Adjetivo de quantidade (sem い) + くとも
Frase + とも (concordância forte)$$,
    $$とも$$,
    $$とも$$,
    ARRAY['とも']::text[],
    ARRAY['とも', 'くとも', 'うとも', 'ようとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-177', $$どんなに辛くとも、最後まで頑張る。$$, $$どんなにつらくとも、さいごまでがんばる。$$, $$Por mais difícil que seja, vou me esforçar até o fim.$$),
    ('n2-grammar-177', $$遅くとも明日までに返事をください。$$, $$おそくともあしたまでにへんじをください。$$, $$Responda no máximo até amanhã.$$),
    ('n2-grammar-177', $$何があろうとも、あなたの味方だ。$$, $$なにがあろうとも、あなたのみかただ。$$, $$Aconteça o que acontecer, estou do seu lado.$$),
    ('n2-grammar-177', $$「手伝ってくれる？」「いいとも。」$$, $$「てつだってくれる？」「いいとも。」$$, $$Pode me ajudar? Claro que sim.$$),
    ('n2-grammar-177', $$誰が反対しようとも、私は行く。$$, $$だれがはんたいしようとも、わたしはいく。$$, $$Mesmo que alguém se oponha, eu vou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅く____、九時には着きたい。$$, $$No máximo, quero chegar às nove.$$),
        (2, $$どんなに苦しく____、あきらめない。$$, $$Por mais doloroso que seja, não vou desistir.$$),
        (3, $$何を言われよう____、気にしない。$$, $$Digam o que disserem, não me importo.$$),
        (4, $$少なく____、三日はかかるだろう。$$, $$Vai levar no mínimo três dias.$$),
        (5, $$「一緒に行ってもいい？」「もちろんです____。」$$, $$Posso ir junto? Claro que sim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とも$$),
        (2, $$とも$$),
        (3, $$とも$$),
        (4, $$とも$$),
        (5, $$とも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
