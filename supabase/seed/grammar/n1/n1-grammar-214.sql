-- n1-grammar-214 — 〜とされる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-214',
    'grammar',
    'N1',
    $$〜とされる$$,
    $$to sareru$$,
    $$É considerado / Diz-se que / Acredita-se que$$,
    $$とされる indica que algo é considerado ou aceito de forma geral, por pessoas, especialistas ou pela sociedade. Equivale a "é considerado" ou "diz-se que".

É uma expressão objetiva e formal, usada em textos, notícias e explicações. Por exemplo, "este templo é considerado o mais antigo do Japão".

A forma とされている é a mais comum.$$,
    $$É parecido com と言われている, mas とされる é mais formal.

Muitas vezes é usado para regras ou definições, como 〜は禁止とされている.$$,
    $$Frase (forma simples) + とされる / とされている
Substantivo + とされる$$,
    $$とされる$$,
    $$とされる|とされている|とされています|とされた|とされて$$,
    ARRAY['と', 'される']::text[],
    ARRAY['とされる', 'とされている', 'とされています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-214', $$この寺は日本で一番古いとされている。$$, $$このてらはにほんでいちばんふるいとされている。$$, $$Este templo é considerado o mais antigo do Japão.$$),
    ('n1-grammar-214', $$この地域では、白い鳥は幸運のしるしとされる。$$, $$このちいきでは、しろいとりはこううんのしるしとされる。$$, $$Nesta região, os pássaros brancos são considerados sinal de boa sorte.$$),
    ('n1-grammar-214', $$ストレスは多くの病気の原因とされている。$$, $$ストレスはおおくのびょうきのげんいんとされている。$$, $$Acredita-se que o estresse seja a causa de muitas doenças.$$),
    ('n1-grammar-214', $$この絵は有名な画家の作品とされています。$$, $$このえはゆうめいながかのさくひんとされています。$$, $$Diz-se que este quadro é obra de um pintor famoso.$$),
    ('n1-grammar-214', $$館内での撮影は禁止とされている。$$, $$かんないでのさつえいはきんしとされている。$$, $$Fotografar dentro do prédio é considerado proibido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この薬は効果がある____。$$, $$Considera-se que este remédio é eficaz.$$),
        (2, $$日本では、四は縁起が悪い数字____。$$, $$No Japão, o quatro é considerado um número de azar.$$),
        (3, $$この遺跡は二千年前のもの____。$$, $$Acredita-se que estas ruínas sejam de dois mil anos atrás.$$),
        (4, $$運動不足は肥満の原因____。$$, $$Considera-se que a falta de exercício seja causa de obesidade.$$),
        (5, $$この行為は法律違反____。$$, $$Este ato é considerado uma violação da lei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-214', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とされる$$),
        (1, $$とされている$$),
        (1, $$とされています$$),
        (2, $$とされる$$),
        (2, $$とされている$$),
        (2, $$とされています$$),
        (3, $$とされる$$),
        (3, $$とされている$$),
        (3, $$とされています$$),
        (4, $$とされる$$),
        (4, $$とされている$$),
        (4, $$とされています$$),
        (5, $$とされる$$),
        (5, $$とされている$$),
        (5, $$とされています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
