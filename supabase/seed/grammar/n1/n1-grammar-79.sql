-- n1-grammar-79 — もはや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-79',
    'grammar',
    'N1',
    $$もはや$$,
    $$mohaya$$,
    $$Já não / Agora já / A esta altura$$,
    $$もはや indica que a situação mudou e chegou a um ponto em que não há mais volta. Equivale a "já não" ou "a esta altura".

Muitas vezes vem com uma forma negativa ou com expressões de impossibilidade. Por exemplo, "a esta altura, já não há como voltar atrás".

É uma palavra formal, mais forte que もう.$$,
    $$É parecido com もう e すでに, mas もはや mostra que a mudança é definitiva.

Expressões comuns são もはやこれまでだ e もはや手遅れだ.$$,
    $$もはや + Frase negativa
もはや + Substantivo + だ$$,
    $$もはや$$,
    $$もはや$$,
    ARRAY['もはや']::text[],
    ARRAY['もはや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-79', $$もはや後戻りはできない。$$, $$もはやあともどりはできない。$$, $$A esta altura, já não dá para voltar atrás.$$),
    ('n1-grammar-79', $$もはや手遅れだ。$$, $$もはやておくれだ。$$, $$Agora já é tarde demais.$$),
    ('n1-grammar-79', $$スマホはもはや生活に欠かせないものだ。$$, $$スマホはもはやせいかつにかかせないものだ。$$, $$O smartphone já virou algo indispensável na vida.$$),
    ('n1-grammar-79', $$彼はもはや昔の彼ではない。$$, $$かれはもはやむかしのかれではない。$$, $$Ele já não é mais aquele de antigamente.$$),
    ('n1-grammar-79', $$もはや誰も彼を止められない。$$, $$もはやだれもかれをとめられない。$$, $$A esta altura, ninguém mais consegue pará-lo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここまで来たら、____あきらめるしかない。$$, $$Chegando até aqui, já não resta nada senão desistir.$$),
        (2, $$この技術は____古い。$$, $$Esta tecnologia já é ultrapassada.$$),
        (3, $$____彼女を信じることはできない。$$, $$Já não consigo mais confiar nela.$$),
        (4, $$インターネットは____日常の一部だ。$$, $$A internet já virou parte do dia a dia.$$),
        (5, $$____これまでだ。$$, $$Agora já não há mais o que fazer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もはや$$),
        (2, $$もはや$$),
        (3, $$もはや$$),
        (4, $$もはや$$),
        (5, $$もはや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
