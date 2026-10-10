-- n1-grammar-159 — 〜をよそに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-159',
    'grammar',
    'N1',
    $$〜をよそに$$,
    $$wo yoso ni$$,
    $$Ignorando / Sem se importar com / Indiferente a$$,
    $$をよそに indica que alguém age sem se importar com a preocupação, as expectativas ou os sentimentos dos outros. Equivale a "ignorando" ou "indiferente a".

A primeira parte costuma ser algo que deveria ser levado em conta, como a preocupação dos pais ou as críticas. Por exemplo, "ignorando a preocupação dos pais, ele viajou sozinho".

O tom pode ser de crítica ou de surpresa.$$,
    $$Expressões comuns são 心配をよそに, 期待をよそに, 反対をよそに e 批判をよそに.

É parecido com を顧みず e を無視して.$$,
    $$Substantivo + をよそに$$,
    $$をよそに$$,
    $$をよそに|を余所に$$,
    ARRAY['を', 'よそ', 'に']::text[],
    ARRAY['をよそに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-159', $$親の心配をよそに、彼は一人で海外に行った。$$, $$おやのしんぱいをよそに、かれはひとりでかいがいにいった。$$, $$Ignorando a preocupação dos pais, ele foi sozinho para o exterior.$$),
    ('n1-grammar-159', $$周囲の期待をよそに、彼は試合に負けた。$$, $$しゅういのきたいをよそに、かれはしあいにまけた。$$, $$Contrariando as expectativas de todos, ele perdeu a partida.$$),
    ('n1-grammar-159', $$住民の反対をよそに、工事が始まった。$$, $$じゅうみんのはんたいをよそに、こうじがはじまった。$$, $$A obra começou ignorando a oposição dos moradores.$$),
    ('n1-grammar-159', $$世間の批判をよそに、社長は高い給料をもらっている。$$, $$せけんのひはんをよそに、しゃちょうはたかいきゅうりょうをもらっている。$$, $$Indiferente às críticas do público, o presidente recebe um salário alto.$$),
    ('n1-grammar-159', $$試験が近いのをよそに、弟は毎日遊んでいる。$$, $$しけんがちかいのをよそに、おとうとはまいにちあそんでいる。$$, $$Indiferente à prova que se aproxima, meu irmão brinca todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$医者の忠告____、彼はお酒を飲み続けた。$$, $$Ignorando o conselho do médico, ele continuou bebendo.$$),
        (2, $$家族の心配____、彼女は危険な山に登った。$$, $$Sem se importar com a preocupação da família, ela subiu uma montanha perigosa.$$),
        (3, $$ファンの期待____、その歌手は引退した。$$, $$Contrariando as expectativas dos fãs, a cantora se aposentou.$$),
        (4, $$みんなが忙しいの____、彼は昼寝をしている。$$, $$Indiferente a todos estarem ocupados, ele está tirando uma soneca.$$),
        (5, $$国民の不安____、政府は何もしない。$$, $$Ignorando a apreensão da população, o governo não faz nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をよそに$$),
        (2, $$をよそに$$),
        (3, $$をよそに$$),
        (4, $$をよそに$$),
        (5, $$をよそに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
