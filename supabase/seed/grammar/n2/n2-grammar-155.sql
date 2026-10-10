-- n2-grammar-155 — 〜ていては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-155',
    'grammar',
    'N2',
    $$〜ていては$$,
    $$te ite wa$$,
    $$Se continuar / Se ficar / Desse jeito$$,
    $$ていては indica que, se uma situação ou atitude continuar, o resultado será ruim. Equivale a "se continuar..." ou "se ficar...".

A primeira parte mostra um comportamento que se repete ou se mantém, e a segunda mostra uma consequência negativa. Por exemplo, "se continuar dormindo até tarde, vai se atrasar".

O tom é de advertência ou preocupação.$$,
    $$Na fala, aparece como てちゃ ou てたら.

É parecido com ていたら, mas ていては destaca mais o resultado ruim.$$,
    $$Verbo (forma て) + いては + Resultado negativo$$,
    $$ていては$$,
    $$ていては|でいては$$,
    ARRAY['て', 'いて', 'は']::text[],
    ARRAY['ていては', 'でいては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-155', $$毎日遊んでいては、試験に合格できない。$$, $$まいにちあそんでいては、しけんにごうかくできない。$$, $$Se continuar brincando todo dia, não vai passar na prova.$$),
    ('n2-grammar-155', $$そんなに食べていては、太ってしまうよ。$$, $$そんなにたべていては、ふとってしまうよ。$$, $$Se continuar comendo tanto assim, vai engordar.$$),
    ('n2-grammar-155', $$文句ばかり言っていては、何も変わらない。$$, $$もんくばかりいっていては、なにもかわらない。$$, $$Se ficar só reclamando, nada vai mudar.$$),
    ('n2-grammar-155', $$こんなに休んでいては、仕事が終わらない。$$, $$こんなにやすんでいては、しごとがおわらない。$$, $$Descansando tanto assim, o trabalho não vai terminar.$$),
    ('n2-grammar-155', $$人に頼っていては、成長できない。$$, $$ひとにたよっていては、せいちょうできない。$$, $$Se continuar dependendo dos outros, não vai crescer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩遅くまで起き____、体を壊すよ。$$, $$Se continuar acordado até tarde toda noite, vai acabar doente.$$),
        (2, $$そんなにお金を使っ____、すぐになくなる。$$, $$Se continuar gastando tanto assim, o dinheiro vai acabar logo.$$),
        (3, $$待っ____、チャンスを逃してしまう。$$, $$Se ficar só esperando, vai perder a chance.$$),
        (4, $$ゲームばかりし____、目が悪くなる。$$, $$Se ficar só jogando videogame, vai prejudicar a vista.$$),
        (5, $$失敗を怖がっ____、何もできない。$$, $$Se continuar com medo de errar, não vai conseguir fazer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていては$$),
        (2, $$ていては$$),
        (3, $$ていては$$),
        (4, $$ていては$$),
        (5, $$ていては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
