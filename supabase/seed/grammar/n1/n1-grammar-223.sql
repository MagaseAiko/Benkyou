-- n1-grammar-223 — とっさに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-223',
    'grammar',
    'N1',
    $$とっさに$$,
    $$tossa ni$$,
    $$Instintivamente / Num reflexo / Sem pensar$$,
    $$とっさに indica que alguém reage imediatamente a uma situação inesperada, sem tempo para pensar. Equivale a "instintivamente" ou "num reflexo".

Por exemplo, "quando a bola veio, me abaixei instintivamente" ou "sem pensar, menti".

É muito usado para descrever reações rápidas em situações de surpresa ou perigo.$$,
    $$A forma とっさの vem antes de substantivos, como とっさの判断 e とっさの出来事.

É parecido com 思わず, mas とっさに destaca a rapidez da reação.$$,
    $$とっさに + Verbo
とっさの + Substantivo$$,
    $$とっさに$$,
    $$とっさに|とっさの$$,
    ARRAY['とっさ', 'に']::text[],
    ARRAY['とっさに', 'とっさの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-223', $$ボールが飛んできたので、とっさに頭を下げた。$$, $$ボールがとんできたので、とっさにあたまをさげた。$$, $$A bola veio voando, e eu me abaixei instintivamente.$$),
    ('n1-grammar-223', $$名前を聞かれて、とっさに嘘をついてしまった。$$, $$なまえをきかれて、とっさにうそをついてしまった。$$, $$Quando me perguntaram o nome, menti sem pensar.$$),
    ('n1-grammar-223', $$車が来たので、とっさに子供の手を引いた。$$, $$くるまがきたので、とっさにこどものてをひいた。$$, $$Um carro veio e, num reflexo, puxei a mão da criança.$$),
    ('n1-grammar-223', $$とっさの判断で、事故を防ぐことができた。$$, $$とっさのはんだんで、じこをふせぐことができた。$$, $$Graças a uma decisão rápida, conseguimos evitar o acidente.$$),
    ('n1-grammar-223', $$急に質問されて、とっさに答えられなかった。$$, $$きゅうにしつもんされて、とっさにこたえられなかった。$$, $$Me perguntaram de repente e não consegui responder na hora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$転びそうになって、____手すりにつかまった。$$, $$Quase caí e, instintivamente, me segurei no corrimão.$$),
        (2, $$彼は____ブレーキを踏んだ。$$, $$Ele pisou no freio num reflexo.$$),
        (3, $$____のことで、何も言えなかった。$$, $$Foi tão de repente que não consegui dizer nada.$$),
        (4, $$知らない人に話しかけられて、____逃げてしまった。$$, $$Um desconhecido falou comigo e, sem pensar, saí correndo.$$),
        (5, $$彼女は____目を閉じた。$$, $$Ela fechou os olhos instintivamente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-223', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とっさに$$),
        (2, $$とっさに$$),
        (3, $$とっさ$$),
        (4, $$とっさに$$),
        (5, $$とっさに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
