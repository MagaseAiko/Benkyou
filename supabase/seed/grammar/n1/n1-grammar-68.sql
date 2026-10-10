-- n1-grammar-68 — 〜くらいのものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-68',
    'grammar',
    'N1',
    $$〜くらいのものだ$$,
    $$kurai no mono da$$,
    $$Só mesmo / O único é / No máximo$$,
    $$くらいのものだ indica que só existe aquele único caso, ou que é o máximo possível. Equivale a "só mesmo" ou "o único é".

A pessoa destaca que aquele exemplo é raro ou excepcional. Por exemplo, "quem consegue fazer isso é só mesmo ele" ou "o único dia em que descanso é domingo".

A forma ぐらいのものだ tem o mesmo sentido.$$,
    $$É parecido com だけだ, mas くらいのものだ destaca que o caso é excepcional.

Muitas vezes aparece com frases como 〜のは〜くらいのものだ.$$,
    $$Substantivo + くらいのものだ
Verbo (forma dicionário) + くらいのものだ$$,
    $$くらいのものだ$$,
    $$くらいのものだ|ぐらいのものだ|くらいのものです|ぐらいのものです$$,
    ARRAY['くらい', 'の', 'もの', 'だ']::text[],
    ARRAY['くらいのものだ', 'ぐらいのものだ', 'くらいのものです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-68', $$こんな難しい問題が解けるのは、彼くらいのものだ。$$, $$こんなむずかしいもんだいがとけるのは、かれくらいのものだ。$$, $$Quem consegue resolver um problema difícil desses é só mesmo ele.$$),
    ('n1-grammar-68', $$私が休めるのは、日曜日くらいのものだ。$$, $$わたしがやすめるのは、にちようびくらいのものだ。$$, $$O único dia em que consigo descansar é domingo.$$),
    ('n1-grammar-68', $$社長に意見を言えるのは、部長ぐらいのものです。$$, $$しゃちょうにいけんをいえるのは、ぶちょうぐらいのものです。$$, $$O único que consegue dar opinião ao presidente é o gerente.$$),
    ('n1-grammar-68', $$毎朝五時に起きるのは、祖父くらいのものだ。$$, $$まいあさごじにおきるのは、そふくらいのものだ。$$, $$Quem acorda às cinco toda manhã é só mesmo meu avô.$$),
    ('n1-grammar-68', $$この町で楽しめるのは、温泉ぐらいのものだ。$$, $$このまちでたのしめるのは、おんせんぐらいのものだ。$$, $$A única coisa para aproveitar nesta cidade é a fonte termal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなことを平気で言うのは、あなた____。$$, $$Quem diz uma coisa dessas sem se importar é só mesmo você.$$),
        (2, $$家族で旅行するのは、夏休み____。$$, $$A única vez que viajamos em família é nas férias de verão.$$),
        (3, $$彼女に勝てるのは、プロの選手____。$$, $$Quem consegue vencê-la é só mesmo um atleta profissional.$$),
        (4, $$最近料理をするのは、週末____。$$, $$Ultimamente, só cozinho no fim de semana.$$),
        (5, $$この漢字が読めるのは、専門家____。$$, $$Quem consegue ler este kanji é só mesmo um especialista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらいのものだ$$),
        (1, $$ぐらいのものだ$$),
        (1, $$くらいのものです$$),
        (1, $$ぐらいのものです$$),
        (2, $$くらいのものだ$$),
        (2, $$ぐらいのものだ$$),
        (2, $$くらいのものです$$),
        (2, $$ぐらいのものです$$),
        (3, $$くらいのものだ$$),
        (3, $$ぐらいのものだ$$),
        (3, $$くらいのものです$$),
        (3, $$ぐらいのものです$$),
        (4, $$くらいのものだ$$),
        (4, $$ぐらいのものだ$$),
        (4, $$くらいのものです$$),
        (4, $$ぐらいのものです$$),
        (5, $$くらいのものだ$$),
        (5, $$ぐらいのものだ$$),
        (5, $$くらいのものです$$),
        (5, $$ぐらいのものです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
