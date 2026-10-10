-- n2-grammar-53 — 〜からと言って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-53',
    'grammar',
    'N2',
    $$〜からと言って$$,
    $$kara to itte$$,
    $$Só porque / Não é porque... que$$,
    $$からと言って é usado para dizer que um motivo não justifica necessariamente uma conclusão. Equivale a "só porque..." ou "não é porque... que...".

A primeira parte apresenta um fato que poderia levar a uma conclusão, e a segunda nega essa conclusão. Por isso, a segunda parte costuma terminar com expressões negativas ou de correção, como とは限らない, わけではない, てはいけない ou必要はない.

Por exemplo, "só porque é caro, não significa que seja bom" ou "não é porque falhou que deve desistir".

Na fala casual, からと言って costuma virar からって.$$,
    $$からと言って é uma ótima forma de corrigir generalizações e preconceitos.

A segunda parte quase nunca é afirmativa simples. Ela corrige ou nega a conclusão esperada.

Em conselhos, からと言って aparece para dizer que algo não é desculpa: 忙しいからと言って、連絡しないのはよくない.$$,
    $$Frase (forma simples) + からと言って、 + Negação
… + とは限らない / わけではない / てはいけない / 必要はない

Fala: からって
Escrita: からと言って / からといって$$,
    $$からと言って$$,
    $$からと言って|からといって|からって$$,
    ARRAY['から', 'と', '言って']::text[],
    ARRAY['からと言って', 'からといって', 'からって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-53', $$高いからと言って、いい物とは限らない。$$, $$たかいからといって、いいものとはかぎらない。$$, $$Só porque é caro, não significa que seja bom.$$),
    ('n2-grammar-53', $$日本人だからと言って、みんな敬語が上手なわけではない。$$, $$にほんじんだからといって、みんなけいごがじょうずなわけではない。$$, $$Não é porque é japonês que todos são bons em linguagem honorífica.$$),
    ('n2-grammar-53', $$一度失敗したからと言って、あきらめてはいけない。$$, $$いちどしっぱいしたからといって、あきらめてはいけない。$$, $$Não é porque falhou uma vez que deve desistir.$$),
    ('n2-grammar-53', $$忙しいからと言って、連絡しないのはよくない。$$, $$いそがしいからといって、れんらくしないのはよくない。$$, $$Estar ocupado não justifica não dar notícias.$$),
    ('n2-grammar-53', $$嫌いだからって、食べないのはだめだよ。$$, $$きらいだからって、たべないのはだめだよ。$$, $$Só porque não gosta, não pode deixar de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金がある____、幸せとは限らない。$$, $$Só porque tem dinheiro, não significa que seja feliz.$$),
        (2, $$若い____、無理をしてはいけない。$$, $$Não é porque é jovem que pode exagerar.$$),
        (3, $$一度失敗した____、才能がないわけではない。$$, $$Só porque falhou uma vez, não significa que não tenha talento.$$),
        (4, $$安い____、たくさん買う必要はない。$$, $$Só porque é barato, não precisa comprar muito.$$),
        (5, $$先生だ____、何でも知っているわけではない。$$, $$Não é porque é professor que sabe de tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からと言って$$),
        (1, $$からといって$$),
        (2, $$からと言って$$),
        (2, $$からといって$$),
        (3, $$からと言って$$),
        (3, $$からといって$$),
        (4, $$からと言って$$),
        (4, $$からといって$$),
        (5, $$からと言って$$),
        (5, $$からといって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
