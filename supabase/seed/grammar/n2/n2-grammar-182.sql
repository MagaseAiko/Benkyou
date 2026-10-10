-- n2-grammar-182 — 〜はもとより
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-182',
    'grammar',
    'N2',
    $$〜はもとより$$,
    $$wa moto yori$$,
    $$Sem falar de / Não só... como também / É claro que$$,
    $$はもとより indica que algo é óbvio e, além disso, outra coisa também vale. Equivale a "sem falar de" ou "não só... como também".

A primeira parte é o caso mais natural ou evidente, e a segunda amplia a ideia. Por exemplo, "este restaurante é popular não só entre os moradores, como também entre os turistas". Depois, costuma vir も.

É uma expressão formal, parecida com はもちろん.$$,
    $$É mais formal que はもちろん.

Também é escrito は元より.$$,
    $$Substantivo + はもとより + Substantivo + も$$,
    $$はもとより$$,
    $$はもとより|は元より$$,
    ARRAY['は', 'もとより']::text[],
    ARRAY['はもとより', 'は元より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-182', $$この店は地元の人はもとより、観光客にも人気がある。$$, $$このみせはじもとのひとはもとより、かんこうきゃくにもにんきがある。$$, $$Esta loja é popular não só entre os moradores, como também entre os turistas.$$),
    ('n2-grammar-182', $$彼は英語はもとより、フランス語も話せる。$$, $$かれはえいごはもとより、フランスごもはなせる。$$, $$Ele fala inglês, é claro, e também francês.$$),
    ('n2-grammar-182', $$この問題は大人はもとより、子供でもわかる。$$, $$このもんだいはおとなはもとより、こどもでもわかる。$$, $$Este problema, sem falar dos adultos, até as crianças entendem.$$),
    ('n2-grammar-182', $$平日はもとより、休日も働いている。$$, $$へいじつはもとより、きゅうじつもはたらいている。$$, $$Trabalho não só nos dias úteis, como também nos feriados.$$),
    ('n2-grammar-182', $$味はもとより、見た目も美しい料理だ。$$, $$あじはもとより、みためもうつくしいりょうりだ。$$, $$É um prato bonito não só no sabor, mas também na aparência.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は歌____、ダンスも上手だ。$$, $$Ela é boa não só no canto, como também na dança.$$),
        (2, $$この公園は春____、秋も美しい。$$, $$Este parque é bonito na primavera, é claro, e também no outono.$$),
        (3, $$日本国内____、海外でも有名な作家だ。$$, $$É um escritor famoso não só no Japão, como também no exterior.$$),
        (4, $$家族____、友人もみんな賛成してくれた。$$, $$Não só a família, mas também todos os amigos me apoiaram.$$),
        (5, $$この映画は子供____、大人も楽しめる。$$, $$Este filme diverte não só as crianças, como também os adultos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はもとより$$),
        (1, $$は元より$$),
        (2, $$はもとより$$),
        (2, $$は元より$$),
        (3, $$はもとより$$),
        (3, $$は元より$$),
        (4, $$はもとより$$),
        (4, $$は元より$$),
        (5, $$はもとより$$),
        (5, $$は元より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
