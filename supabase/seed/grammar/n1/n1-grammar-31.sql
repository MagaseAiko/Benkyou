-- n1-grammar-31 — 〜ごとき / 〜ごとく / 〜ごとし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-31',
    'grammar',
    'N1',
    $$〜ごとき / 〜ごとく / 〜ごとし$$,
    $$gotoki / gotoku / gotoshi$$,
    $$Como / Tal qual / Igual a$$,
    $$ごとき, ごとく e ごとし são formas antigas e formais de ような, ように e ようだ. Equivalem a "como" ou "tal qual".

ごとく funciona como advérbio, como em "o tempo passou como uma flecha". ごとき vem antes de substantivos, como em "uma pessoa como ele". ごとし fica no fim da frase, como em "a vida é como um sonho".

ごとき também pode expressar desprezo ou modéstia, como em "alguém como eu" ou "uma coisa dessas".$$,
    $$São usadas principalmente na escrita, em provérbios e em textos literários.

Expressões comuns são 例のごとく, 前述のごとく e 光陰矢のごとし.

Na fala, ごとき aparece com tom de desprezo, como 私ごとき ou お前ごとき.$$,
    $$Substantivo + の + ごとく + Verbo
Substantivo + の + ごとき + Substantivo
Substantivo + の + ごとし
Verbo (forma simples) + が + ごとく$$,
    $$ごとく$$,
    $$ごとく|ごとき|ごとし$$,
    ARRAY['ごとく']::text[],
    ARRAY['ごとく', 'ごとき', 'ごとし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-31', $$時間は矢のごとく過ぎていく。$$, $$じかんはやのごとくすぎていく。$$, $$O tempo passa como uma flecha.$$),
    ('n1-grammar-31', $$例のごとく、彼は遅れてきた。$$, $$れいのごとく、かれはおくれてきた。$$, $$Como de costume, ele chegou atrasado.$$),
    ('n1-grammar-31', $$私ごときに、そんな大役は務まりません。$$, $$わたしごときに、そんなたいやくはつとまりません。$$, $$Alguém como eu não daria conta de um papel tão importante.$$),
    ('n1-grammar-31', $$人生は夢のごとし。$$, $$じんせいはゆめのごとし。$$, $$A vida é como um sonho.$$),
    ('n1-grammar-31', $$彼は何事もなかったかのごとく笑っていた。$$, $$かれはなにごともなかったかのごとくわらっていた。$$, $$Ele ria como se nada tivesse acontecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$前述の____、この計画には問題がある。$$, $$Como mencionado anteriormente, este plano tem problemas.$$),
        (2, $$彼女は花の____美しい。$$, $$Ela é bela como uma flor.$$),
        (3, $$お前____に負けるはずがない。$$, $$Não tenho como perder para alguém como você.$$),
        (4, $$光陰矢の____。$$, $$O tempo voa como uma flecha.$$),
        (5, $$彼は自分が王である____振る舞った。$$, $$Ele agiu como se fosse um rei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごとく$$),
        (2, $$ごとく$$),
        (3, $$ごとき$$),
        (4, $$ごとし$$),
        (5, $$かのごとく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
