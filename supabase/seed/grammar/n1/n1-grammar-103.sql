-- n1-grammar-103 — 〜なしに / 〜なしで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-103',
    'grammar',
    'N1',
    $$〜なしに / 〜なしで$$,
    $$nashi ni / nashi de$$,
    $$Sem / Sem que haja / Na falta de$$,
    $$なしに e なしで indicam que algo é feito sem uma coisa que normalmente estaria presente. Equivalem a "sem".

なしに é mais formal e muitas vezes indica que algo necessário não foi feito, como "entrar sem permissão". なしで é mais comum na fala, como "viver sem celular".

A forma なしには, com uma frase negativa depois, significa "sem isso, não é possível".$$,
    $$Expressões comuns são 許可なしに, 断りなしに, 予約なしで e 休みなしで.

É parecido com を抜きにして e がなくて.$$,
    $$Substantivo + なしに + Verbo
Substantivo + なしで + Verbo
Substantivo + なしには + Frase negativa$$,
    $$なしに$$,
    $$なしに|なしで|なしには$$,
    ARRAY['なし', 'に']::text[],
    ARRAY['なしに', 'なしで', 'なしには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-103', $$許可なしに、この部屋に入ってはいけない。$$, $$きょかなしに、このへやにはいってはいけない。$$, $$Não se pode entrar nesta sala sem permissão.$$),
    ('n1-grammar-103', $$彼は何の連絡もなしに会社を休んだ。$$, $$かれはなんのれんらくもなしにかいしゃをやすんだ。$$, $$Ele faltou ao trabalho sem avisar nada.$$),
    ('n1-grammar-103', $$予約なしで入れるレストランを探している。$$, $$よやくなしではいれるレストランをさがしている。$$, $$Estou procurando um restaurante em que dê para entrar sem reserva.$$),
    ('n1-grammar-103', $$スマホなしでは生活できない。$$, $$スマホなしではせいかつできない。$$, $$Não consigo viver sem celular.$$),
    ('n1-grammar-103', $$努力なしには、成功はありえない。$$, $$どりょくなしには、せいこうはありえない。$$, $$Sem esforço, o sucesso é impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$断り____、人の物を使わないでください。$$, $$Não use as coisas dos outros sem pedir.$$),
        (2, $$彼は休み____、十時間働き続けた。$$, $$Ele trabalhou dez horas seguidas sem descanso.$$),
        (3, $$辞書____、この本を読むのは難しい。$$, $$Ler este livro sem dicionário é difícil.$$),
        (4, $$家族の支え____は、ここまで来られなかった。$$, $$Sem o apoio da família, eu não teria chegado até aqui.$$),
        (5, $$砂糖____コーヒーを飲む。$$, $$Bebo café sem açúcar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なしに$$),
        (1, $$なしで$$),
        (2, $$なしで$$),
        (2, $$なしに$$),
        (3, $$なしで$$),
        (3, $$なしに$$),
        (4, $$なしに$$),
        (5, $$なしで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
