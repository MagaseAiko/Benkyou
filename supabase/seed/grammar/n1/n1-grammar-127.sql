-- n1-grammar-127 — 〜に足らない / 〜に足りない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-127',
    'grammar',
    'N1',
    $$〜に足らない / 〜に足りない$$,
    $$ni taranai / ni tarinai$$,
    $$Não vale a pena / Insignificante / Não merece$$,
    $$に足らない e に足りない indicam que algo é tão pequeno ou sem importância que não merece atenção. Equivalem a "não vale a pena" ou "insignificante".

Costumam vir com verbos como temer, preocupar-se, levar em conta ou falar. Por exemplo, "é um problema que não merece preocupação".

É uma expressão formal.$$,
    $$Expressões comuns são 取るに足らない, 恐れるに足らない e 心配するに足りない.

取るに足らない significa "insignificante" ou "sem importância".$$,
    $$Verbo (forma dicionário) + に足らない / に足りない
Substantivo + に足らない$$,
    $$に足らない$$,
    $$に足らない|に足りない|にたらない|にたりない$$,
    ARRAY['に', '足らない']::text[],
    ARRAY['に足らない', 'に足りない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-127', $$それは取るに足らない問題だ。$$, $$それはとるにたらないもんだいだ。$$, $$Isso é um problema insignificante.$$),
    ('n1-grammar-127', $$あんな相手は恐れるに足らない。$$, $$あんなあいてはおそれるにたらない。$$, $$Um adversário daqueles não merece ser temido.$$),
    ('n1-grammar-127', $$この程度の失敗は、心配するに足りない。$$, $$このていどのしっぱいは、しんぱいするにたりない。$$, $$Um erro desses não vale a preocupação.$$),
    ('n1-grammar-127', $$彼の意見は聞くに足らない。$$, $$かれのいけんはきくにたらない。$$, $$A opinião dele não merece ser ouvida.$$),
    ('n1-grammar-127', $$取るに足りないことで、けんかをしてしまった。$$, $$とるにたりないことで、けんかをしてしまった。$$, $$Acabamos brigando por algo insignificante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなうわさは信じる____。$$, $$Um boato desses não merece crédito.$$),
        (2, $$取る____ことで悩むのはやめよう。$$, $$Vamos parar de nos preocupar com coisas insignificantes.$$),
        (3, $$この程度の雨は、恐れる____。$$, $$Uma chuva dessas não merece medo.$$),
        (4, $$彼の批判は気にする____。$$, $$As críticas dele não merecem atenção.$$),
        (5, $$それは議論する____小さな問題だ。$$, $$É um problema pequeno que não vale a pena discutir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に足らない$$),
        (1, $$に足りない$$),
        (2, $$に足らない$$),
        (2, $$に足りない$$),
        (3, $$に足らない$$),
        (3, $$に足りない$$),
        (4, $$に足らない$$),
        (4, $$に足りない$$),
        (5, $$に足らない$$),
        (5, $$に足りない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
