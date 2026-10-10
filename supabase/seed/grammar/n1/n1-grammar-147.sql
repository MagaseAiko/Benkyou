-- n1-grammar-147 — 〜を顧みず / 〜も顧みず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-147',
    'grammar',
    'N1',
    $$〜を顧みず / 〜も顧みず$$,
    $$wo kaerimizu / mo kaerimizu$$,
    $$Sem se importar com / Ignorando / Sem levar em conta$$,
    $$を顧みず indica que alguém age sem pensar nas consequências ou nos riscos. Equivale a "sem se importar com" ou "ignorando".

Pode ser usado de forma positiva, para elogiar a coragem, como "salvou a criança sem se importar com o perigo", ou de forma negativa, para criticar, como "ignorando a família, só trabalhava".

É uma expressão formal.$$,
    $$Expressões comuns são 危険を顧みず, 家族を顧みず e 周囲の迷惑も顧みず.

É parecido com を気にせず e もかまわず, mas を顧みず é mais formal.$$,
    $$Substantivo + を顧みず / も顧みず
Verbo / Adjetivo (forma simples) + の + を顧みず$$,
    $$を顧みず$$,
    $$を顧みず|も顧みず|をかえりみず|もかえりみず$$,
    ARRAY['を', '顧みず']::text[],
    ARRAY['を顧みず', 'も顧みず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-147', $$彼は危険を顧みず、子供を助けた。$$, $$かれはきけんをかえりみず、こどもをたすけた。$$, $$Ele salvou a criança sem se importar com o perigo.$$),
    ('n1-grammar-147', $$父は家族を顧みず、仕事ばかりしていた。$$, $$ちちはかぞくをかえりみず、しごとばかりしていた。$$, $$Meu pai só trabalhava, ignorando a família.$$),
    ('n1-grammar-147', $$周りの迷惑も顧みず、大声で話している。$$, $$まわりのめいわくもかえりみず、おおごえではなしている。$$, $$Está falando alto sem se importar com o incômodo dos outros.$$),
    ('n1-grammar-147', $$自分の体を顧みず、働き続けた。$$, $$じぶんのからだをかえりみず、はたらきつづけた。$$, $$Continuou trabalhando sem se importar com a própria saúde.$$),
    ('n1-grammar-147', $$彼女は反対も顧みず、留学を決めた。$$, $$かのじょははんたいもかえりみず、りゅうがくをきめた。$$, $$Ela decidiu fazer intercâmbio ignorando a oposição.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$消防士は自分の命____、火の中に飛び込んだ。$$, $$O bombeiro se jogou no fogo sem se importar com a própria vida.$$),
        (2, $$彼は健康____、毎晩お酒を飲んでいる。$$, $$Ele bebe toda noite sem se importar com a saúde.$$),
        (3, $$親の心配____、彼は一人で旅に出た。$$, $$Ele viajou sozinho ignorando a preocupação dos pais.$$),
        (4, $$会社の将来____、社長は自分の利益ばかり考えた。$$, $$O presidente só pensava no próprio lucro, sem levar em conta o futuro da empresa.$$),
        (5, $$嵐の危険____、漁師たちは海に出た。$$, $$Os pescadores saíram ao mar ignorando o perigo da tempestade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を顧みず$$),
        (1, $$も顧みず$$),
        (2, $$を顧みず$$),
        (2, $$も顧みず$$),
        (3, $$も顧みず$$),
        (3, $$を顧みず$$),
        (4, $$を顧みず$$),
        (4, $$も顧みず$$),
        (5, $$を顧みず$$),
        (5, $$も顧みず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
