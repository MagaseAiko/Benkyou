-- n1-grammar-220 — 〜とも〜とも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-220',
    'grammar',
    'N1',
    $$〜とも〜とも$$,
    $$tomo ~ tomo$$,
    $$Nem... nem / Se... ou se / Seja... seja$$,
    $$とも〜とも apresenta duas possibilidades e mostra que não se sabe qual é a verdadeira, ou que nenhuma foi dita. Equivale a "nem... nem" ou "se... ou se".

Muitas vezes aparece com verbos como dizer, decidir ou responder. Por exemplo, "ele não disse nem que sim, nem que não".

É uma expressão um pouco literária.$$,
    $$Expressões comuns são 行くとも行かないとも言わない e 賛成とも反対とも言わない.

A segunda parte costuma ser negativa.$$,
    $$Verbo / Frase + とも + Verbo / Frase (oposto) + とも + Verbo (dizer / responder)$$,
    $$とも〜とも$$,
    $$とも$$,
    ARRAY['とも']::text[],
    ARRAY['とも〜とも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-220', $$彼は行くとも行かないとも言わなかった。$$, $$かれはいくともいかないともいわなかった。$$, $$Ele não disse nem que ia, nem que não ia.$$),
    ('n1-grammar-220', $$彼女は賛成とも反対とも言わない。$$, $$かのじょはさんせいともはんたいともいわない。$$, $$Ela não diz se é a favor ou contra.$$),
    ('n1-grammar-220', $$その話が本当とも嘘とも判断できない。$$, $$そのはなしがほんとうともうそともはんだんできない。$$, $$Não dá para julgar se essa história é verdade ou mentira.$$),
    ('n1-grammar-220', $$彼はおいしいともまずいとも言わずに食べた。$$, $$かれはおいしいともまずいともいわずにたべた。$$, $$Ele comeu sem dizer se estava gostoso ou ruim.$$),
    ('n1-grammar-220', $$社長は許可するともしないとも答えなかった。$$, $$しゃちょうはきょかするともしないともこたえなかった。$$, $$O presidente não respondeu se ia permitir ou não.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は来る____来ないとも言わなかった。$$, $$Ele não disse nem que vinha, nem que não vinha.$$),
        (2, $$先生はいい____悪いとも言わなかった。$$, $$O professor não disse se estava bom ou ruim.$$),
        (3, $$彼女は好きとも嫌い____言わない。$$, $$Ela não diz se gosta ou não.$$),
        (4, $$結果が成功____失敗とも言えない。$$, $$Não dá para dizer se o resultado foi sucesso ou fracasso.$$),
        (5, $$彼は買う____買わないとも決めていない。$$, $$Ele não decidiu se compra ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-220', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とも$$),
        (2, $$とも$$),
        (3, $$とも$$),
        (4, $$とも$$),
        (5, $$とも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
