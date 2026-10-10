-- n2-grammar-156 — 〜てこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-156',
    'grammar',
    'N2',
    $$〜てこそ$$,
    $$te koso$$,
    $$Só quando / Somente ao / É justamente ao$$,
    $$てこそ indica que algo só tem valor ou só acontece de verdade quando uma condição é cumprida. Equivale a "só quando" ou "somente ao".

A pessoa reforça que aquela condição é essencial. Por exemplo, "só quando você mesmo experimenta é que entende".

A segunda parte costuma expressar algo positivo, como entender, ter valor ou ser possível.$$,
    $$こそ é uma partícula de ênfase, que destaca a palavra anterior.

É parecido com てはじめて, mas てこそ destaca o valor ou a importância da condição.$$,
    $$Verbo (forma て) + こそ$$,
    $$てこそ$$,
    $$てこそ|でこそ$$,
    ARRAY['て', 'こそ']::text[],
    ARRAY['てこそ', 'でこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-156', $$自分で経験してこそ、本当の意味がわかる。$$, $$じぶんでけいけんしてこそ、ほんとうのいみがわかる。$$, $$Só quando você mesmo vive é que entende o verdadeiro sentido.$$),
    ('n2-grammar-156', $$努力してこそ、成功できる。$$, $$どりょくしてこそ、せいこうできる。$$, $$Só com esforço é possível ter sucesso.$$),
    ('n2-grammar-156', $$みんなで協力してこそ、いいものができる。$$, $$みんなできょうりょくしてこそ、いいものができる。$$, $$Só quando todos cooperam é que se faz algo bom.$$),
    ('n2-grammar-156', $$健康であってこそ、仕事も楽しめる。$$, $$けんこうであってこそ、しごともたのしめる。$$, $$Só com saúde é que dá para aproveitar até o trabalho.$$),
    ('n2-grammar-156', $$失敗を経験してこそ、人は強くなる。$$, $$しっぱいをけいけんしてこそ、ひとはつよくなる。$$, $$É justamente ao passar por fracassos que as pessoas ficam mais fortes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$実際に使っ____、良さがわかる。$$, $$Só usando de verdade é que se percebe o valor.$$),
        (2, $$親になっ____、親の苦労がわかる。$$, $$Só quando se vira pai é que se entende o sofrimento dos pais.$$),
        (3, $$毎日練習し____、上手になれる。$$, $$Só praticando todo dia é que dá para melhorar.$$),
        (4, $$相手の話をよく聞い____、いい関係が作れる。$$, $$Só ouvindo bem o outro é que se constrói uma boa relação.$$),
        (5, $$苦労し____、喜びも大きい。$$, $$É justamente por ter sofrido que a alegria é grande.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てこそ$$),
        (2, $$てこそ$$),
        (3, $$てこそ$$),
        (4, $$てこそ$$),
        (5, $$てこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
