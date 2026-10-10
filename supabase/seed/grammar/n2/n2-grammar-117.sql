-- n2-grammar-117 — 〜の上では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-117',
    'grammar',
    'N2',
    $$〜の上では$$,
    $$no ue dewa$$,
    $$Segundo / Em termos de / No papel$$,
    $$の上では indica que algo é verdade de acordo com uma informação ou um ponto de vista, mas muitas vezes não corresponde à realidade. Equivale a "segundo", "em termos de" ou "no papel".

Costuma vir com palavras como calendário, dados, cálculo, lei e regra. Por exemplo, "segundo o calendário já é primavera, mas ainda está frio".

A segunda parte muitas vezes mostra uma diferença entre a teoria e a prática.$$,
    $$Expressões comuns são 暦の上では, 計算の上では, データの上では e 法律の上では.

O tom geralmente contrasta a teoria com a realidade.$$,
    $$Substantivo + の上では + Frase
Substantivo + の上で(は) + Frase$$,
    $$の上では$$,
    $$の上では|の上で|のうえでは$$,
    ARRAY['の', '上', 'では']::text[],
    ARRAY['の上では', 'の上で']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-117', $$暦の上では春だが、まだ寒い。$$, $$こよみのうえでははるだが、まださむい。$$, $$Segundo o calendário já é primavera, mas ainda está frio.$$),
    ('n2-grammar-117', $$計算の上では、十分に間に合うはずだ。$$, $$けいさんのうえでは、じゅうぶんにまにあうはずだ。$$, $$Em termos de cálculo, deve dar tempo de sobra.$$),
    ('n2-grammar-117', $$データの上では、売り上げは増えている。$$, $$データのうえでは、うりあげはふえている。$$, $$Segundo os dados, as vendas estão aumentando.$$),
    ('n2-grammar-117', $$法律の上では、彼に責任はない。$$, $$ほうりつのうえでは、かれにせきにんはない。$$, $$Do ponto de vista da lei, ele não tem responsabilidade.$$),
    ('n2-grammar-117', $$書類の上では問題ないが、実際はどうだろう。$$, $$しょるいのうえではもんだいないが、じっさいはどうだろう。$$, $$No papel não há problema, mas como será na prática?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暦____もう秋だが、毎日暑い。$$, $$Segundo o calendário já é outono, mas faz calor todos os dias.$$),
        (2, $$理論____可能だが、実際には難しい。$$, $$Na teoria é possível, mas na prática é difícil.$$),
        (3, $$数字____、景気は回復している。$$, $$Segundo os números, a economia está se recuperando.$$),
        (4, $$規則____、ここでたばこを吸ってはいけない。$$, $$Segundo as regras, não se pode fumar aqui.$$),
        (5, $$地図____近いが、実際は山道で遠い。$$, $$No mapa é perto, mas na realidade é longe por causa da estrada na montanha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の上では$$),
        (1, $$のうえでは$$),
        (2, $$の上では$$),
        (2, $$のうえでは$$),
        (3, $$の上では$$),
        (3, $$のうえでは$$),
        (4, $$の上では$$),
        (4, $$のうえでは$$),
        (5, $$の上では$$),
        (5, $$のうえでは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
