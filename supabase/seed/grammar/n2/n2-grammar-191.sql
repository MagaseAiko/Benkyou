-- n2-grammar-191 — 〜ようではないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-191',
    'grammar',
    'N2',
    $$〜ようではないか$$,
    $$you dewa nai ka$$,
    $$Vamos / Que tal / Façamos$$,
    $$ようではないか é uma forma forte e formal de convidar um grupo a fazer algo juntos. Equivale a "vamos..." ou "façamos...".

É usada em discursos, campanhas e textos de opinião, quando alguém tenta motivar várias pessoas. Por exemplo, "vamos proteger juntos o meio ambiente".

Na fala, aparece como ようじゃないか, que é mais informal.$$,
    $$É mais forte e formal que ましょう.

É usado principalmente por homens ou em discursos públicos.

A forma ようではありませんか é mais educada.$$,
    $$Verbo (forma volitiva) + ではないか
Verbo (forma volitiva) + じゃないか$$,
    $$ようではないか$$,
    $$ではないか|じゃないか|ではありませんか$$,
    ARRAY['よう', 'では', 'ない', 'か']::text[],
    ARRAY['ようではないか', 'ようじゃないか', 'ようではありませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-191', $$みんなで力を合わせて頑張ろうではないか。$$, $$みんなでちからをあわせてがんばろうではないか。$$, $$Vamos unir forças e nos esforçar todos juntos.$$),
    ('n2-grammar-191', $$地球の環境を守ろうではないか。$$, $$ちきゅうのかんきょうをまもろうではないか。$$, $$Façamos a proteção do meio ambiente da Terra.$$),
    ('n2-grammar-191', $$もう一度話し合おうじゃないか。$$, $$もういちどはなしあおうじゃないか。$$, $$Que tal conversarmos mais uma vez?$$),
    ('n2-grammar-191', $$未来のために行動しようではありませんか。$$, $$みらいのためにこうどうしようではありませんか。$$, $$Vamos agir pelo futuro.$$),
    ('n2-grammar-191', $$この町をもっと元気にしようではないか。$$, $$このまちをもっとげんきにしようではないか。$$, $$Vamos deixar esta cidade mais animada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちのために、安全な町を作ろう____。$$, $$Vamos construir uma cidade segura para as crianças.$$),
        (2, $$最後まであきらめずに戦おう____。$$, $$Vamos lutar até o fim sem desistir.$$),
        (3, $$過去の失敗から学ぼう____。$$, $$Vamos aprender com os erros do passado.$$),
        (4, $$一緒に新しい時代を作ろう____。$$, $$Vamos criar juntos uma nova era.$$),
        (5, $$困っている人を助けよう____。$$, $$Vamos ajudar as pessoas em dificuldade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-191', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではないか$$),
        (1, $$じゃないか$$),
        (1, $$ではありませんか$$),
        (2, $$ではないか$$),
        (2, $$じゃないか$$),
        (2, $$ではありませんか$$),
        (3, $$ではないか$$),
        (3, $$じゃないか$$),
        (3, $$ではありませんか$$),
        (4, $$ではないか$$),
        (4, $$じゃないか$$),
        (4, $$ではありませんか$$),
        (5, $$ではないか$$),
        (5, $$じゃないか$$),
        (5, $$ではありませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
