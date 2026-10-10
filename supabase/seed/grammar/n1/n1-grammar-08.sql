-- n1-grammar-08 — 〜べからず / 〜べからざる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-08',
    'grammar',
    'N1',
    $$〜べからず / 〜べからざる$$,
    $$bekarazu / bekarazaru$$,
    $$É proibido / Não se deve / Inaceitável$$,
    $$べからず indica uma proibição forte, em estilo antigo e formal. Equivale a "é proibido" ou "não se deve".

Aparece principalmente em placas, avisos e regras escritas. Por exemplo, "proibido entrar" ou "proibido pisar na grama".

べからざる vem antes de substantivos e significa "que não se deve" ou "inaceitável". Por exemplo, "um erro inaceitável".$$,
    $$É uma forma da linguagem clássica e quase não é usada na fala.

Expressões comuns são 入るべからず, 欠くべからざる e 許すべからざる.$$,
    $$Verbo (forma dicionário) + べからず
Verbo (forma dicionário) + べからざる + Substantivo
する → するべからず / すべからず$$,
    $$べからず$$,
    $$べからず|べからざる$$,
    ARRAY['べからず']::text[],
    ARRAY['べからず', 'べからざる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-08', $$関係者以外入るべからず。$$, $$かんけいしゃいがいはいるべからず。$$, $$Proibida a entrada de pessoas não autorizadas.$$),
    ('n1-grammar-08', $$芝生に入るべからず。$$, $$しばふにはいるべからず。$$, $$Proibido pisar na grama.$$),
    ('n1-grammar-08', $$それは許すべからざる行為だ。$$, $$それはゆるすべからざるこういだ。$$, $$Isso é um ato inaceitável.$$),
    ('n1-grammar-08', $$水は生活に欠くべからざるものだ。$$, $$みずはせいかつにかくべからざるものだ。$$, $$A água é algo indispensável para a vida.$$),
    ('n1-grammar-08', $$ここでたばこを吸うべからず。$$, $$ここでたばこをすうべからず。$$, $$Proibido fumar aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここにごみを捨てる____。$$, $$Proibido jogar lixo aqui.$$),
        (2, $$教師として言う____発言だ。$$, $$É uma declaração que um professor não deveria fazer.$$),
        (3, $$初心忘る____。$$, $$Não se deve esquecer o espírito do começo.$$),
        (4, $$これは欠く____条件だ。$$, $$Esta é uma condição indispensável.$$),
        (5, $$無断で写真を撮る____。$$, $$Proibido tirar fotos sem permissão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べからず$$),
        (2, $$べからざる$$),
        (3, $$べからず$$),
        (4, $$べからざる$$),
        (5, $$べからず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
