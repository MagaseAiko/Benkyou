-- n1-grammar-205 — 〜というもの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-205',
    'grammar',
    'N1',
    $$〜というもの$$,
    $$to iu mono$$,
    $$Durante todo / Por todo esse tempo / Ao longo de$$,
    $$というもの, depois de uma expressão de tempo, indica que algo continuou durante todo aquele período. Equivale a "durante todo" ou "por todo esse tempo".

A pessoa destaca que o período foi longo e que a situação se manteve. Por exemplo, "nestes três dias, não dormi quase nada".

É uma expressão um pouco literária.$$,
    $$Costuma vir com ここ, como ここ一週間というもの.

É diferente de てからというもの, que significa "desde que".$$,
    $$Expressão de tempo + というもの + Situação contínua
ここ + Expressão de tempo + というもの$$,
    $$というもの$$,
    $$というもの$$,
    ARRAY['と', 'いう', 'もの']::text[],
    ARRAY['というもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-205', $$この三日間というもの、ほとんど寝ていない。$$, $$このみっかかんというもの、ほとんどねていない。$$, $$Nestes três dias inteiros, quase não dormi.$$),
    ('n1-grammar-205', $$ここ一週間というもの、雨が降り続いている。$$, $$ここいっしゅうかんというもの、あめがふりつづいている。$$, $$Durante toda esta última semana, não parou de chover.$$),
    ('n1-grammar-205', $$この一年というもの、彼から何の連絡もない。$$, $$このいちねんというもの、かれからなんのれんらくもない。$$, $$Durante todo este ano, não tive nenhuma notícia dele.$$),
    ('n1-grammar-205', $$ここ数か月というもの、仕事が忙しくて休みがない。$$, $$ここすうかげつというもの、しごとがいそがしくてやすみがない。$$, $$Nestes últimos meses, o trabalho está tão corrido que não tenho folga.$$),
    ('n1-grammar-205', $$この十年というもの、彼女は一度も故郷に帰っていない。$$, $$このじゅうねんというもの、かのじょはいちどもこきょうにかえっていない。$$, $$Nestes dez anos, ela não voltou nenhuma vez à terra natal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここ二、三日____、食欲がない。$$, $$Nestes últimos dois ou três dias, estou sem apetite.$$),
        (2, $$この一か月____、毎日残業している。$$, $$Durante todo este mês, faço hora extra todos os dias.$$),
        (3, $$この半年____、一度も映画を見ていない。$$, $$Nestes seis meses, não vi nenhum filme.$$),
        (4, $$ここ数年____、物価が上がり続けている。$$, $$Nestes últimos anos, os preços não param de subir.$$),
        (5, $$この一週間____、彼女は元気がない。$$, $$Durante toda esta semana, ela anda desanimada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-205', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というもの$$),
        (2, $$というもの$$),
        (3, $$というもの$$),
        (4, $$というもの$$),
        (5, $$というもの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
