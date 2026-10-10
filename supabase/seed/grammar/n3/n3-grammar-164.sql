-- n3-grammar-164 — 〜はもちろん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-164',
    'grammar',
    'N3',
    $$〜はもちろん$$,
    $$wa mochiron$$,
    $$Não só... mas também / Sem falar em / Claro que... e também$$,
    $$はもちろん é usado para dizer que algo é óbvio e, além disso, outra coisa também é verdade. Equivale a "não só... mas também", "sem falar em" ou "claro que..., e também...".

A primeira parte apresenta o caso mais óbvio ou esperado, e a segunda acrescenta outro caso, geralmente com も. Por exemplo, "ele fala inglês, claro, e também chinês" ou "a loja fica cheia não só nos dias úteis, mas também nos fins de semana".

Em frases negativas, a ideia se inverte: "kanji, nem se fala; ele não sabe escrever nem hiragana".

もちろん significa "é claro", "obviamente". Por isso, a estrutura destaca que o primeiro elemento é evidente.$$,
    $$はもちろん é parecido com はもとより (N2), que é mais formal.

A ordem é importante: o elemento mais óbvio vem primeiro, e o menos óbvio, depois.

É muito comum em propagandas: "não só para crianças, mas também para adultos".$$,
    $$A + はもちろん、 + B + も + …
A + はもちろん、 + B + も + Negativo (A nem se fala, nem B...)$$,
    $$はもちろん$$,
    $$はもちろん$$,
    ARRAY['は', 'もちろん']::text[],
    ARRAY['はもちろん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-164', $$彼は英語はもちろん、中国語も話せる。$$, $$かれはえいごはもちろん、ちゅうごくごもはなせる。$$, $$Ele fala inglês, é claro, e também chinês.$$),
    ('n3-grammar-164', $$この店は平日はもちろん、週末も混んでいる。$$, $$このみせはへいじつはもちろん、しゅうまつもこんでいる。$$, $$Esta loja fica cheia não só nos dias úteis, mas também nos fins de semana.$$),
    ('n3-grammar-164', $$子供はもちろん、大人も楽しめる映画だ。$$, $$こどもはもちろん、おとなもたのしめるえいがだ。$$, $$É um filme que não só crianças, mas também adultos podem aproveitar.$$),
    ('n3-grammar-164', $$彼は漢字はもちろん、ひらがなも書けない。$$, $$かれはかんじはもちろん、ひらがなもかけない。$$, $$Kanji, nem se fala; ele não sabe escrever nem hiragana.$$),
    ('n3-grammar-164', $$このお菓子は東京はもちろん、地方でも人気がある。$$, $$このおかしはとうきょうはもちろん、ちほうでもにんきがある。$$, $$Este doce é popular não só em Tóquio, mas também no interior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は料理____、掃除も得意だ。$$, $$Ela é boa não só em cozinhar, mas também em limpar.$$),
        (2, $$この歌は日本____、海外でも有名だ。$$, $$Esta música é famosa não só no Japão, mas também no exterior.$$),
        (3, $$去年は夏休み____、冬休みも働いた。$$, $$No ano passado, trabalhei não só nas férias de verão, mas também nas de inverno.$$),
        (4, $$彼は日本語____、英語も話せない。$$, $$Japonês, nem se fala; ele não fala nem inglês.$$),
        (5, $$イベントには学生____、先生も参加した。$$, $$Não só os alunos, mas também os professores participaram do evento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はもちろん$$),
        (2, $$はもちろん$$),
        (3, $$はもちろん$$),
        (4, $$はもちろん$$),
        (5, $$はもちろん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
