-- n2-grammar-81 — 〜なくはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-81',
    'grammar',
    'N2',
    $$〜なくはない$$,
    $$naku wa nai$$,
    $$Não é que não / Até que dá para / Não deixa de$$,
    $$なくはない é uma dupla negação que expressa uma afirmação fraca ou com hesitação. Equivale a "não é que não..." ou "até que dá para...".

A pessoa admite que algo é possível ou verdadeiro, mas sem muita certeza ou entusiasmo. Por exemplo, "não é que eu não entenda o sentimento dele" ou "até que dá para comer".

Também aparece como ないこともない, com o mesmo sentido.$$,
    $$É uma forma indireta e educada de concordar parcialmente.

A forma ないこともない é muito parecida e também bastante usada.

Costuma vir com verbos de possibilidade, como できる, わかる ou 食べられる.$$,
    $$Verbo (forma ない sem ない) + なくはない
Substantivo + が + なくはない$$,
    $$なくはない$$,
    $$なくはない|なくもない|ないこともない$$,
    ARRAY['なく', 'は', 'ない']::text[],
    ARRAY['なくはない', 'なくもない', 'ないこともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-81', $$彼の気持ちもわからなくはない。$$, $$かれのきもちもわからなくはない。$$, $$Não é que eu não entenda o sentimento dele.$$),
    ('n2-grammar-81', $$辛い料理も食べられなくはない。$$, $$からいりょうりもたべられなくはない。$$, $$Até que dá para eu comer comida apimentada.$$),
    ('n2-grammar-81', $$急げば、間に合わなくはない。$$, $$いそげば、まにあわなくはない。$$, $$Se correr, até que dá para chegar a tempo.$$),
    ('n2-grammar-81', $$この問題は難しいけど、解けなくはない。$$, $$このもんだいはむずかしいけど、とけなくはない。$$, $$Este problema é difícil, mas até que dá para resolver.$$),
    ('n2-grammar-81', $$一人で行けないこともない。$$, $$ひとりでいけないこともない。$$, $$Não é que eu não consiga ir sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頑張れば、一日で終わら____。$$, $$Se eu me esforçar, até que dá para terminar em um dia.$$),
        (2, $$お酒は飲め____が、あまり好きではない。$$, $$Não é que eu não consiga beber, mas não gosto muito.$$),
        (3, $$彼の言うことも理解でき____。$$, $$Até que dá para entender o que ele diz.$$),
        (4, $$車で行けば、行け____。$$, $$Indo de carro, até que dá para ir.$$),
        (5, $$その意見に賛成でき____。$$, $$Não é que eu não possa concordar com essa opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくはない$$),
        (1, $$なくもない$$),
        (1, $$ないこともない$$),
        (2, $$なくはない$$),
        (2, $$なくもない$$),
        (2, $$ないこともない$$),
        (3, $$なくはない$$),
        (3, $$なくもない$$),
        (3, $$ないこともない$$),
        (4, $$なくはない$$),
        (4, $$なくもない$$),
        (4, $$ないこともない$$),
        (5, $$なくはない$$),
        (5, $$なくもない$$),
        (5, $$ないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
