-- n1-grammar-169 — 〜そばから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-169',
    'grammar',
    'N1',
    $$〜そばから$$,
    $$soba kara$$,
    $$Logo depois de / Mal / Assim que$$,
    $$そばから indica que, logo depois de uma ação, acontece algo que a anula ou a repete, de forma frustrante. Equivale a "logo depois de" ou "mal...".

Muitas vezes descreve situações repetitivas e irritantes. Por exemplo, "mal limpo o quarto, as crianças já bagunçam" ou "decoro as palavras e logo esqueço".

O tom é de frustração ou reclamação.$$,
    $$A ação costuma se repetir várias vezes.

É parecido com とすぐに e たとたんに, mas そばから destaca a repetição e a frustração.$$,
    $$Verbo (forma dicionário / forma た) + そばから$$,
    $$そばから$$,
    $$そばから$$,
    ARRAY['そば', 'から']::text[],
    ARRAY['そばから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-169', $$掃除するそばから、子供が散らかす。$$, $$そうじするそばから、こどもがちらかす。$$, $$Mal limpo, as crianças já bagunçam.$$),
    ('n1-grammar-169', $$覚えたそばから忘れてしまう。$$, $$おぼえたそばからわすれてしまう。$$, $$Logo depois de decorar, já esqueço.$$),
    ('n1-grammar-169', $$給料をもらうそばから、使ってしまう。$$, $$きゅうりょうをもらうそばから、つかってしまう。$$, $$Mal recebo o salário, já gasto tudo.$$),
    ('n1-grammar-169', $$注意したそばから、また同じミスをした。$$, $$ちゅういしたそばから、またおなじミスをした。$$, $$Logo depois de eu avisar, ele cometeu o mesmo erro de novo.$$),
    ('n1-grammar-169', $$雪かきをするそばから、また雪が積もる。$$, $$ゆきかきをするそばから、またゆきがつもる。$$, $$Mal tiro a neve, ela já se acumula de novo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$片付ける____、犬がおもちゃを出してくる。$$, $$Mal arrumo, o cachorro já traz os brinquedos de volta.$$),
        (2, $$お菓子を買ってくる____、子供たちが全部食べてしまう。$$, $$Mal compro doces, as crianças já comem tudo.$$),
        (3, $$洗濯した____、服が汚れる。$$, $$Logo depois de lavar, a roupa já suja.$$),
        (4, $$やめると言った____、またたばこを吸っている。$$, $$Logo depois de dizer que ia parar, já está fumando de novo.$$),
        (5, $$説明した____、また同じ質問をされた。$$, $$Logo depois de explicar, me fizeram a mesma pergunta de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そばから$$),
        (2, $$そばから$$),
        (3, $$そばから$$),
        (4, $$そばから$$),
        (5, $$そばから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
