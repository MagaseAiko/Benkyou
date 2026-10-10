-- n1-grammar-167 — さぞ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-167',
    'grammar',
    'N1',
    $$さぞ$$,
    $$sazo$$,
    $$Certamente / Imagino que / Deve ter sido muito$$,
    $$さぞ expressa uma suposição forte sobre o sentimento ou a situação de outra pessoa, com empatia. Equivale a "certamente" ou "imagino que".

A frase costuma terminar com だろう, でしょう ou ことでしょう. Por exemplo, "você deve ter ficado muito cansado".

A forma さぞかし é mais enfática.$$,
    $$Não se usa para falar de si mesmo.

É muito usado para mostrar empatia ou consideração, como さぞお疲れでしょう.$$,
    $$さぞ / さぞかし + Adjetivo / Verbo + だろう / でしょう / ことでしょう$$,
    $$さぞ$$,
    $$さぞかし|さぞ$$,
    ARRAY['さぞ']::text[],
    ARRAY['さぞ', 'さぞかし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-167', $$長旅で、さぞお疲れでしょう。$$, $$ながたびで、さぞおつかれでしょう。$$, $$Depois de uma viagem longa, imagino que esteja muito cansado.$$),
    ('n1-grammar-167', $$息子さんが合格して、さぞうれしいことでしょう。$$, $$むすこさんがごうかくして、さぞうれしいことでしょう。$$, $$Seu filho passou, imagino que esteja muito feliz.$$),
    ('n1-grammar-167', $$一人で子供を育てるのは、さぞ大変だっただろう。$$, $$ひとりでこどもをそだてるのは、さぞたいへんだっただろう。$$, $$Criar um filho sozinho deve ter sido muito difícil.$$),
    ('n1-grammar-167', $$この景色を見たら、母もさぞかし喜ぶだろう。$$, $$このけしきをみたら、ははもさぞかしよろこぶだろう。$$, $$Se minha mãe visse esta paisagem, certamente ficaria muito feliz.$$),
    ('n1-grammar-167', $$家族と離れて、さぞ寂しいでしょう。$$, $$かぞくとはなれて、さぞさびしいでしょう。$$, $$Longe da família, imagino que se sinta muito sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故にあって、____怖かったでしょう。$$, $$Você sofreu um acidente, deve ter sentido muito medo.$$),
        (2, $$毎日残業で、____疲れているだろう。$$, $$Fazendo hora extra todo dia, ele certamente está muito cansado.$$),
        (3, $$ご両親も____お喜びのことでしょう。$$, $$Seus pais certamente devem estar muito felizes.$$),
        (4, $$優勝できなくて、____悔しかっただろう。$$, $$Não ter vencido deve ter sido muito frustrante.$$),
        (5, $$一人での海外生活は、____心細いことでしょう。$$, $$Morar sozinho no exterior deve ser muito solitário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さぞ$$),
        (1, $$さぞかし$$),
        (2, $$さぞ$$),
        (2, $$さぞかし$$),
        (3, $$さぞ$$),
        (3, $$さぞかし$$),
        (4, $$さぞ$$),
        (4, $$さぞかし$$),
        (5, $$さぞ$$),
        (5, $$さぞかし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
