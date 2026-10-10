-- n1-grammar-101 — 〜なりとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-101',
    'grammar',
    'N1',
    $$〜なりとも$$,
    $$nari tomo$$,
    $$Pelo menos / Nem que seja / Ainda que só$$,
    $$なりとも indica uma quantidade mínima que a pessoa deseja ou pede. Equivale a "pelo menos" ou "nem que seja".

Costuma vir depois de palavras de quantidade pequena, como um pouco, um momento, uma pessoa ou uma vez. Por exemplo, "se puder, ajude pelo menos um pouco".

É uma expressão formal e um pouco antiquada, usada em pedidos educados.$$,
    $$Expressões comuns são 少しなりとも, 一目なりとも, 多少なりとも e 何なりとも.

何なりとも significa "qualquer coisa", como em 何なりとお申し付けください.$$,
    $$Substantivo (quantidade mínima) + なりとも
Palavra interrogativa + なりとも (qualquer)$$,
    $$なりとも$$,
    $$なりとも|なりと$$,
    ARRAY['なり', 'とも']::text[],
    ARRAY['なりとも', 'なりと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-101', $$少しなりとも、お役に立てればうれしいです。$$, $$すこしなりとも、おやくにたてればうれしいです。$$, $$Fico feliz se puder ser útil, nem que seja um pouco.$$),
    ('n1-grammar-101', $$一目なりとも、母に会いたい。$$, $$ひとめなりとも、ははにあいたい。$$, $$Quero ver minha mãe, nem que seja por um instante.$$),
    ('n1-grammar-101', $$多少なりとも、経験がある人を募集しています。$$, $$たしょうなりとも、けいけんがあるひとをぼしゅうしています。$$, $$Procuramos pessoas com pelo menos um pouco de experiência.$$),
    ('n1-grammar-101', $$何なりとお申し付けください。$$, $$なんなりとおもうしつけください。$$, $$Peça qualquer coisa, por favor.$$),
    ('n1-grammar-101', $$一日なりとも休むわけにはいかない。$$, $$いちにちなりともやすむわけにはいかない。$$, $$Não posso descansar nem que seja um dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$わずか____、寄付をさせてください。$$, $$Deixe-me fazer uma doação, ainda que só um pouco.$$),
        (2, $$一時間____、話を聞いてもらえませんか。$$, $$Poderia me ouvir, nem que seja por uma hora?$$),
        (3, $$少し____、家計の助けになればいい。$$, $$Seria bom se ajudasse nas despesas da casa, pelo menos um pouco.$$),
        (4, $$ご質問があれば、何____どうぞ。$$, $$Se tiver perguntas, fique à vontade para perguntar qualquer coisa.$$),
        (5, $$一言____、お礼を言いたかった。$$, $$Queria agradecer, nem que fosse com uma palavra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なりとも$$),
        (2, $$なりとも$$),
        (3, $$なりとも$$),
        (4, $$なりと$$),
        (4, $$なりとも$$),
        (5, $$なりとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
