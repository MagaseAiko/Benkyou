-- n2-grammar-173 — とっくに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-173',
    'grammar',
    'N2',
    $$とっくに$$,
    $$tokku ni$$,
    $$Há muito tempo / Já faz tempo / Faz tempo que$$,
    $$とっくに indica que algo aconteceu muito antes do que se imagina. Equivale a "há muito tempo" ou "já faz tempo".

Muitas vezes mostra surpresa ou impaciência, porque a outra pessoa não sabia ou está atrasada. Por exemplo, "o trem já partiu faz tempo".

É uma expressão coloquial, comum na fala.$$,
    $$É mais coloquial e enfático que もう e すでに.

A forma とっくの昔に significa "há muitíssimo tempo".$$,
    $$とっくに + Verbo (forma た / ている)
とっくに + Verbo (forma ている)$$,
    $$とっくに$$,
    $$とっくに|とっくの$$,
    ARRAY['とっくに']::text[],
    ARRAY['とっくに', 'とっくの昔に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-173', $$電車はとっくに出発した。$$, $$でんしゃはとっくにしゅっぱつした。$$, $$O trem já partiu faz tempo.$$),
    ('n2-grammar-173', $$その仕事ならとっくに終わっているよ。$$, $$そのしごとならとっくにおわっているよ。$$, $$Esse trabalho já terminou faz tempo.$$),
    ('n2-grammar-173', $$彼女はとっくに家に帰りました。$$, $$かのじょはとっくにいえにかえりました。$$, $$Ela foi para casa há muito tempo.$$),
    ('n2-grammar-173', $$締め切りはとっくに過ぎている。$$, $$しめきりはとっくにすぎている。$$, $$O prazo já passou faz tempo.$$),
    ('n2-grammar-173', $$その話ならとっくの昔に知っていた。$$, $$そのはなしならとっくのむかしにしっていた。$$, $$Essa história eu já sabia há muitíssimo tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$映画は____始まっているよ。$$, $$O filme já começou faz tempo.$$),
        (2, $$宿題なら____終わった。$$, $$A lição de casa eu terminei faz tempo.$$),
        (3, $$そのニュースは____みんな知っている。$$, $$Todo mundo já sabe dessa notícia faz tempo.$$),
        (4, $$彼は____会社を辞めていた。$$, $$Ele já tinha saído da empresa há muito tempo.$$),
        (5, $$お店は____閉まっている時間だ。$$, $$É um horário em que a loja já fechou faz tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とっくに$$),
        (2, $$とっくに$$),
        (3, $$とっくに$$),
        (4, $$とっくに$$),
        (5, $$とっくに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
