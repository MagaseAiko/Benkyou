-- n1-grammar-07 — 〜ばそれまでだ / 〜たらそれまでだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-07',
    'grammar',
    'N1',
    $$〜ばそれまでだ / 〜たらそれまでだ$$,
    $$ba sore made da / tara sore made da$$,
    $$Se acontecer acabou / Aí não tem mais jeito / É o fim se$$,
    $$ばそれまでだ ou たらそれまでだ indica que, se algo acontecer, tudo termina ali e não há mais o que fazer. Equivale a "se acontecer, acabou" ou "aí não tem mais jeito".

Muitas vezes mostra que todo esforço ou valor anterior se perde por causa de uma única coisa. Por exemplo, "por mais que tenha dinheiro, se morrer, acabou".

O tom costuma ser de resignação ou de advertência.$$,
    $$Uma expressão comum é 死んでしまえばそれまでだ.

A forma それまでのことだ tem o mesmo sentido.

Muitas vezes vem com いくら〜ても antes, como "por mais que..., se..., acabou".$$,
    $$Verbo (forma ば) + それまでだ
Verbo (forma たら) + それまでだ$$,
    $$ばそれまでだ$$,
    $$ばそれまで|たらそれまで$$,
    ARRAY['ば', 'それまで', 'だ']::text[],
    ARRAY['ばそれまでだ', 'たらそれまでだ', 'ばそれまでのことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-07', $$いくらお金があっても、死んでしまえばそれまでだ。$$, $$いくらおかねがあっても、しんでしまえばそれまでだ。$$, $$Por mais dinheiro que tenha, se morrer, acabou.$$),
    ('n1-grammar-07', $$どんなにいい計画でも、実行しなければそれまでだ。$$, $$どんなにいいけいかくでも、じっこうしなければそれまでだ。$$, $$Por melhor que seja o plano, se não for executado, não serve de nada.$$),
    ('n1-grammar-07', $$雨が降ったらそれまでだ。$$, $$あめがふったらそれまでだ。$$, $$Se chover, aí não tem mais jeito.$$),
    ('n1-grammar-07', $$一度信用を失えばそれまでだ。$$, $$いちどしんようをうしなえばそれまでだ。$$, $$Uma vez que se perde a confiança, é o fim.$$),
    ('n1-grammar-07', $$頑張って作っても、誰も使わなかったらそれまでだ。$$, $$がんばってつくっても、だれもつかわなかったらそれまでだ。$$, $$Mesmo fazendo com esforço, se ninguém usar, acabou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どんなに練習しても、本番で失敗すれば____。$$, $$Por mais que pratique, se falhar na hora, acabou.$$),
        (2, $$せっかく買っても、壊れたら____。$$, $$Mesmo comprando, se quebrar, acabou.$$),
        (3, $$いい商品でも、売れなければ____。$$, $$Mesmo sendo um bom produto, se não vender, não serve de nada.$$),
        (4, $$説明しても、相手が聞かなかったら____。$$, $$Mesmo explicando, se a pessoa não ouvir, não tem mais jeito.$$),
        (5, $$体を壊してしまえば____。$$, $$Se você arruinar a saúde, é o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それまでだ$$),
        (1, $$それまでのことだ$$),
        (2, $$それまでだ$$),
        (2, $$それまでのことだ$$),
        (3, $$それまでだ$$),
        (3, $$それまでのことだ$$),
        (4, $$それまでだ$$),
        (4, $$それまでのことだ$$),
        (5, $$それまでだ$$),
        (5, $$それまでのことだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
