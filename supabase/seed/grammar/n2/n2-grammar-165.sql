-- n2-grammar-165 — 〜と同時に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-165',
    'grammar',
    'N2',
    $$〜と同時に$$,
    $$to douji ni$$,
    $$Ao mesmo tempo que / Assim que / Junto com$$,
    $$と同時に tem dois usos principais.

O primeiro indica que duas coisas acontecem ao mesmo tempo ou logo em seguida. Equivale a "assim que" ou "no mesmo instante em que". Por exemplo, "assim que o sinal tocou, os alunos saíram".

O segundo indica que algo tem duas características ao mesmo tempo, muitas vezes opostas. Equivale a "ao mesmo tempo que". Por exemplo, "este trabalho é difícil, mas ao mesmo tempo é gratificante".$$,
    $$No primeiro uso, é parecido com とたんに, mas と同時に é mais neutro.

No segundo uso, é parecido com 一方で.$$,
    $$Verbo (forma dicionário) + と同時に
Substantivo + と同時に
Adjetivo / Substantivo + である + と同時に$$,
    $$と同時に$$,
    $$と同時に|とどうじに|と同時$$,
    ARRAY['と', '同時', 'に']::text[],
    ARRAY['と同時に', 'と同時']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-165', $$ベルが鳴ると同時に、生徒たちは教室を出た。$$, $$ベルがなるとどうじに、せいとたちはきょうしつをでた。$$, $$Assim que o sinal tocou, os alunos saíram da sala.$$),
    ('n2-grammar-165', $$卒業と同時に、結婚した。$$, $$そつぎょうとどうじに、けっこんした。$$, $$Me casei logo depois da formatura.$$),
    ('n2-grammar-165', $$この仕事は大変だと同時に、やりがいがある。$$, $$このしごとはたいへんだとどうじに、やりがいがある。$$, $$Este trabalho é difícil, mas ao mesmo tempo é gratificante.$$),
    ('n2-grammar-165', $$彼は医者であると同時に、作家でもある。$$, $$かれはいしゃであるとどうじに、さっかでもある。$$, $$Ele é médico e, ao mesmo tempo, escritor.$$),
    ('n2-grammar-165', $$ドアが開くと同時に、客が店に入ってきた。$$, $$ドアがあくとどうじに、きゃくがみせにはいってきた。$$, $$Assim que a porta abriu, os clientes entraram na loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家に着く____、雨が降り出した。$$, $$Assim que cheguei em casa, começou a chover.$$),
        (2, $$就職____、一人暮らしを始めた。$$, $$Junto com o primeiro emprego, comecei a morar sozinho.$$),
        (3, $$合格してうれしい____、少し不安もある。$$, $$Estou feliz por ter passado, mas ao mesmo tempo um pouco inseguro.$$),
        (4, $$彼女は母親である____、社長でもある。$$, $$Ela é mãe e, ao mesmo tempo, presidente de empresa.$$),
        (5, $$試合終了____、観客から大きな拍手が起こった。$$, $$Assim que a partida terminou, o público aplaudiu muito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と同時に$$),
        (1, $$とどうじに$$),
        (2, $$と同時に$$),
        (2, $$とどうじに$$),
        (3, $$と同時に$$),
        (3, $$とどうじに$$),
        (4, $$と同時に$$),
        (4, $$とどうじに$$),
        (5, $$と同時に$$),
        (5, $$とどうじに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
