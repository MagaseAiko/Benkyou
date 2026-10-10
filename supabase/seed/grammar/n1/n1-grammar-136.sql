-- n1-grammar-136 — 〜には当たらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-136',
    'grammar',
    'N1',
    $$〜には当たらない$$,
    $$ni wa ataranai$$,
    $$Não há motivo para / Não é preciso / Não merece$$,
    $$には当たらない indica que não há razão para uma reação, porque a situação não é tão grave ou especial. Equivale a "não há motivo para" ou "não é preciso".

Costuma vir com verbos como surpreender-se, criticar, preocupar-se ou elogiar. Por exemplo, "não há motivo para se surpreender".

É uma expressão formal.$$,
    $$Expressões comuns são 驚くには当たらない, 非難するには当たらない e 心配するには当たらない.

Também é escrito にはあたらない.$$,
    $$Verbo (forma dicionário) + には当たらない
Substantivo (ação) + には当たらない$$,
    $$には当たらない$$,
    $$には当たらない|にはあたらない|には当たりません|にはあたりません$$,
    ARRAY['に', 'は', '当たらない']::text[],
    ARRAY['には当たらない', 'にはあたらない', 'には当たりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-136', $$彼が合格したのは、驚くには当たらない。$$, $$かれがごうかくしたのは、おどろくにはあたらない。$$, $$Não há motivo para se surpreender com a aprovação dele.$$),
    ('n1-grammar-136', $$この程度のミスは、非難するには当たらない。$$, $$このていどのミスは、ひなんするにはあたらない。$$, $$Um erro desses não merece crítica.$$),
    ('n1-grammar-136', $$子供がけんかをするのは、心配するには当たらない。$$, $$こどもがけんかをするのは、しんぱいするにはあたらない。$$, $$Não é preciso se preocupar com crianças brigando.$$),
    ('n1-grammar-136', $$彼の行動は、感心するには当たりません。$$, $$かれのこうどうは、かんしんするにはあたりません。$$, $$A atitude dele não merece admiração.$$),
    ('n1-grammar-136', $$たった一度の失敗で、落ち込むには当たらない。$$, $$たったいちどのしっぱいで、おちこむにはあたらない。$$, $$Não há motivo para ficar desanimado por um único erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が怒るのも、驚く____。$$, $$Não há motivo para se surpreender com ela ficar brava.$$),
        (2, $$それは謝る____。$$, $$Não é preciso pedir desculpas por isso.$$),
        (3, $$この結果は悲観する____。$$, $$Este resultado não é motivo para pessimismo.$$),
        (4, $$彼の判断は責める____。$$, $$A decisão dele não merece ser criticada.$$),
        (5, $$その程度のことは、褒める____。$$, $$Uma coisa dessas não merece elogio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には当たらない$$),
        (1, $$にはあたらない$$),
        (1, $$には当たりません$$),
        (2, $$には当たらない$$),
        (2, $$にはあたらない$$),
        (2, $$には当たりません$$),
        (3, $$には当たらない$$),
        (3, $$にはあたらない$$),
        (3, $$には当たりません$$),
        (4, $$には当たらない$$),
        (4, $$にはあたらない$$),
        (4, $$には当たりません$$),
        (5, $$には当たらない$$),
        (5, $$にはあたらない$$),
        (5, $$には当たりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
