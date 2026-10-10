-- n2-grammar-185 — やがて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-185',
    'grammar',
    'N2',
    $$やがて$$,
    $$yagate$$,
    $$Em breve / Logo / Com o tempo$$,
    $$やがて indica que algo vai acontecer depois de algum tempo, de forma natural. Equivale a "em breve", "logo" ou "com o tempo".

Pode falar do futuro, como "em breve a primavera vai chegar", ou do passado, como "com o tempo, os dois se casaram".

É uma palavra um pouco formal, comum na escrita e em narrativas.$$,
    $$É parecido com そのうち e まもなく.

まもなく indica um tempo mais curto, e そのうち é mais coloquial.$$,
    $$やがて + Frase$$,
    $$やがて$$,
    $$やがて$$,
    ARRAY['やがて']::text[],
    ARRAY['やがて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-185', $$やがて春が来る。$$, $$やがてはるがくる。$$, $$Em breve a primavera vai chegar.$$),
    ('n2-grammar-185', $$雨はやがて雪に変わった。$$, $$あめはやがてゆきにかわった。$$, $$Com o tempo, a chuva virou neve.$$),
    ('n2-grammar-185', $$二人はやがて結婚した。$$, $$ふたりはやがてけっこんした。$$, $$Com o tempo, os dois se casaram.$$),
    ('n2-grammar-185', $$この悲しみもやがて消えるだろう。$$, $$このかなしみもやがてきえるだろう。$$, $$Esta tristeza também vai passar com o tempo.$$),
    ('n2-grammar-185', $$やがて日が暮れて、あたりは暗くなった。$$, $$やがてひがくれて、あたりはくらくなった。$$, $$Logo o sol se pôs e tudo ficou escuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちも____大人になる。$$, $$As crianças também vão crescer com o tempo.$$),
        (2, $$____電車が来るだろう。$$, $$O trem deve chegar logo.$$),
        (3, $$彼の努力は____実を結んだ。$$, $$Com o tempo, o esforço dele deu frutos.$$),
        (4, $$夏が終わり、____秋が来た。$$, $$O verão terminou e logo veio o outono.$$),
        (5, $$この町も____変わっていくだろう。$$, $$Esta cidade também deve mudar com o tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-185', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やがて$$),
        (2, $$やがて$$),
        (3, $$やがて$$),
        (4, $$やがて$$),
        (5, $$やがて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
