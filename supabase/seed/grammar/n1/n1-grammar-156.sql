-- n1-grammar-156 — 〜を押して / 〜を押し切って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-156',
    'grammar',
    'N1',
    $$〜を押して / 〜を押し切って$$,
    $$wo oshite / wo oshikitte$$,
    $$Apesar de / Contra / Passando por cima de$$,
    $$を押して e を押し切って indicam que alguém faz algo mesmo diante de um obstáculo ou de uma oposição.

を押して costuma vir com problemas físicos ou situações difíceis, como "apesar da febre, foi trabalhar".

を押し切って costuma vir com a oposição de outras pessoas, como "contra a vontade dos pais, ele se casou".

O tom pode ser de admiração ou de crítica.$$,
    $$Expressões comuns são 病気を押して, 無理を押して e 反対を押し切って.

É parecido com にもかかわらず.$$,
    $$Substantivo (dificuldade) + を押して + Verbo
Substantivo (oposição) + を押し切って + Verbo$$,
    $$を押して$$,
    $$を押して|を押し切って|をおして|を押し切り$$,
    ARRAY['を', '押して']::text[],
    ARRAY['を押して', 'を押し切って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-156', $$彼は熱を押して、会社に行った。$$, $$かれはねつをおして、かいしゃにいった。$$, $$Apesar da febre, ele foi trabalhar.$$),
    ('n1-grammar-156', $$両親の反対を押し切って、結婚した。$$, $$りょうしんのはんたいをおしきって、けっこんした。$$, $$Casei contra a vontade dos meus pais.$$),
    ('n1-grammar-156', $$病気を押して、試合に出場した。$$, $$びょうきをおして、しあいにしゅつじょうした。$$, $$Apesar da doença, participou da partida.$$),
    ('n1-grammar-156', $$彼女は周囲の反対を押し切って、会社を辞めた。$$, $$かのじょはしゅういのはんたいをおしきって、かいしゃをやめた。$$, $$Ela saiu da empresa passando por cima da oposição de todos.$$),
    ('n1-grammar-156', $$無理を押して働いたせいで、体を壊した。$$, $$むりをおしてはたらいたせいで、からだをこわした。$$, $$Por trabalhar além do limite, acabei adoecendo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$監督はけが____、指揮をとった。$$, $$Apesar da lesão, o técnico comandou o time.$$),
        (2, $$家族の反対____、彼は留学した。$$, $$Ele fez intercâmbio contra a vontade da família.$$),
        (3, $$体調不良____、彼女はステージに立った。$$, $$Apesar de não estar bem de saúde, ela subiu ao palco.$$),
        (4, $$社員の反対____、社長は計画を進めた。$$, $$O presidente seguiu com o plano passando por cima da oposição dos funcionários.$$),
        (5, $$悪天候____、船は出発した。$$, $$Apesar do mau tempo, o navio partiu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を押して$$),
        (2, $$を押し切って$$),
        (3, $$を押して$$),
        (4, $$を押し切って$$),
        (5, $$を押して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
