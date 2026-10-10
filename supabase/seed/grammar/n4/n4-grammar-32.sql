-- n4-grammar-32 — きっと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-32',
    'grammar',
    'N4',
    $$きっと$$,
    $$kitto$$,
    $$Com certeza / Certamente / Sem falta$$,
    $$きっと é um advérbio que mostra uma forte convicção de quem fala. Equivale a "com certeza", "certamente" ou "tenho certeza de que".

Ele é usado quando a pessoa acredita fortemente que algo vai acontecer ou é verdade, mesmo sem uma prova absoluta. Por isso, combina muito com だろう, でしょう e と思う.

Também é usado para expressar determinação ou fazer um pedido forte, com o sentido de "sem falta": prometer que vai fazer algo ou pedir que alguém faça algo de qualquer jeito.

O tom de きっと é pessoal e emocional, ligado à convicção ou à esperança de quem fala.$$,
    $$きっと é diferente de 必ず. 必ず indica algo que acontece sempre ou uma certeza objetiva; きっと indica uma convicção pessoal.

Por isso, em regras e fatos gerais, como "sempre lave as mãos", usa-se 必ず, e não きっと.

Em frases negativas, きっと também funciona, como em "com certeza ele não vem", desde que a convicção seja de quem fala.$$,
    $$きっと + Verbo / Adjetivo + だろう / でしょう
きっと + … + と思う
きっと + Verbo (promessa / determinação)
きっと + Verbo て + ください (pedido forte)$$,
    $$きっと$$,
    $$きっと$$,
    ARRAY['きっと']::text[],
    ARRAY['きっと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-32', $$明日はきっと晴れるでしょう。$$, $$あしたはきっとはれるでしょう。$$, $$Amanhã com certeza vai fazer sol.$$),
    ('n4-grammar-32', $$彼ならきっと合格しますよ。$$, $$かれならきっとごうかくしますよ。$$, $$Ele com certeza vai passar.$$),
    ('n4-grammar-32', $$きっとまた会いましょう。$$, $$きっとまたあいましょう。$$, $$Vamos nos ver de novo, sem falta.$$),
    ('n4-grammar-32', $$田中さんはきっと忙しいんだと思う。$$, $$たなかさんはきっといそがしいんだとおもう。$$, $$Acho que o Tanaka com certeza está ocupado.$$),
    ('n4-grammar-32', $$パーティーには、きっと来てくださいね。$$, $$パーティーには、きっときてくださいね。$$, $$Venha à festa sem falta, tá?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あんなに練習したんだから、____勝てるよ。$$, $$Você treinou tanto que com certeza vai ganhar.$$),
        (2, $$このプレゼントを見たら、彼女は____喜ぶと思います。$$, $$Acho que ela com certeza vai ficar feliz quando vir este presente.$$),
        (3, $$この薬を飲めば、____よくなりますよ。$$, $$Se tomar este remédio, com certeza vai melhorar.$$),
        (4, $$来年は____日本へ行きます。$$, $$Ano que vem, vou ao Japão sem falta.$$),
        (5, $$電気が消えているから、____もう寝たのだろう。$$, $$As luzes estão apagadas, então com certeza já foram dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きっと$$),
        (2, $$きっと$$),
        (3, $$きっと$$),
        (4, $$きっと$$),
        (5, $$きっと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
