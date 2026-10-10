-- n1-grammar-28 — 〜が / 〜も〜なら、〜も〜だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-28',
    'grammar',
    'N1',
    $$〜が / 〜も〜なら、〜も〜だ$$,
    $$ga / mo ~ nara, ~ mo ~ da$$,
    $$Tal pai tal filho / Um é tão ruim quanto o outro / Ambos são iguais$$,
    $$Esta estrutura indica que duas pessoas ou coisas relacionadas têm o mesmo defeito ou problema. Equivale a "um é tão ruim quanto o outro" ou "tal pai, tal filho".

A pessoa critica os dois lados ao mesmo tempo. Por exemplo, "o pai é irresponsável, e o filho também é".

É uma expressão coloquial, com tom de crítica.$$,
    $$Os dois elementos costumam ser pares, como pais e filhos, chefe e subordinado, ou marido e mulher.

O adjetivo ou substantivo costuma ser repetido nas duas partes.$$,
    $$Substantivo A + も + Adjetivo / Substantivo + なら、Substantivo B + も + Adjetivo / Substantivo + だ
Substantivo A + が + Adjetivo + なら、Substantivo B + も + Adjetivo + だ$$,
    $$〜も〜なら、〜も〜だ$$,
    $$なら$$,
    ARRAY['も', 'なら', 'も', 'だ']::text[],
    ARRAY['〜も〜なら、〜も〜だ', '〜が〜なら、〜も〜だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-28', $$親も親なら、子も子だ。$$, $$おやもおやなら、こもこだ。$$, $$Tal pai, tal filho.$$),
    ('n1-grammar-28', $$社長も無責任なら、社員も無責任だ。$$, $$しゃちょうもむせきにんなら、しゃいんもむせきにんだ。$$, $$O presidente é irresponsável, e os funcionários também.$$),
    ('n1-grammar-28', $$夫が夫なら、妻も妻だ。$$, $$おっとがおっとなら、つまもつまだ。$$, $$O marido é daquele jeito, e a mulher também.$$),
    ('n1-grammar-28', $$店も店なら、客も客だ。$$, $$みせもみせなら、きゃくもきゃくだ。$$, $$A loja é ruim, e os clientes não ficam atrás.$$),
    ('n1-grammar-28', $$先生がいい加減なら、学生もいい加減だ。$$, $$せんせいがいいかげんなら、がくせいもいいかげんだ。$$, $$Se o professor é desleixado, os alunos também são.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄も兄____、弟も弟だ。$$, $$O irmão mais velho é daquele jeito, e o mais novo também.$$),
        (2, $$上司も上司____、部下も部下だ。$$, $$O chefe é daquele jeito, e o subordinado também.$$),
        (3, $$政治家も政治家____、国民も国民だ。$$, $$Os políticos são daquele jeito, e o povo também.$$),
        (4, $$母親が甘い____、父親も甘い。$$, $$A mãe é mole, e o pai também.$$),
        (5, $$売る方も売る方____、買う方も買う方だ。$$, $$Quem vende é daquele jeito, e quem compra também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なら$$),
        (2, $$なら$$),
        (3, $$なら$$),
        (4, $$なら$$),
        (5, $$なら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
