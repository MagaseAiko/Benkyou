-- n1-grammar-208 — 〜というわけではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-208',
    'grammar',
    'N1',
    $$〜というわけではない$$,
    $$to iu wake dewa nai$$,
    $$Não quer dizer que / Não é que / Não significa que$$,
    $$というわけではない serve para negar uma conclusão que os outros poderiam tirar. Equivale a "não quer dizer que" ou "não é que".

A pessoa corrige um possível mal-entendido. Por exemplo, "não é que eu odeie, só não gosto muito" ou "ser caro não quer dizer que seja bom".

Muitas vezes vem com からといって antes.$$,
    $$É parecido com わけではない, mas というわけではない é um pouco mais enfático.

É usado para suavizar uma negação.$$,
    $$Frase (forma simples) + というわけではない
Substantivo / Adjetivo な + だ + というわけではない
〜からといって、〜というわけではない$$,
    $$というわけではない$$,
    $$というわけではない|というわけではありません|というわけじゃない|ってわけじゃない$$,
    ARRAY['という', 'わけ', 'では', 'ない']::text[],
    ARRAY['というわけではない', 'というわけではありません', 'というわけじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-208', $$嫌いというわけではないが、あまり好きではない。$$, $$きらいというわけではないが、あまりすきではない。$$, $$Não é que eu odeie, só não gosto muito.$$),
    ('n1-grammar-208', $$高いからといって、いいものだというわけではない。$$, $$たかいからといって、いいものだというわけではない。$$, $$Ser caro não quer dizer que seja bom.$$),
    ('n1-grammar-208', $$忙しいから行けないというわけではありません。$$, $$いそがしいからいけないというわけではありません。$$, $$Não é que eu não possa ir por estar ocupado.$$),
    ('n1-grammar-208', $$日本人だから、誰でも敬語が上手というわけじゃない。$$, $$にほんじんだから、だれでもけいごがじょうずというわけじゃない。$$, $$Ser japonês não significa que todo mundo seja bom em linguagem honorífica.$$),
    ('n1-grammar-208', $$お金があれば幸せというわけではない。$$, $$おかねがあればしあわせというわけではない。$$, $$Ter dinheiro não quer dizer que se seja feliz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$反対している____が、少し心配だ。$$, $$Não é que eu seja contra, mas estou um pouco preocupado.$$),
        (2, $$有名な大学を出たからといって、仕事ができる____。$$, $$Ter se formado numa universidade famosa não quer dizer que seja bom no trabalho.$$),
        (3, $$毎日運動すれば、やせる____。$$, $$Fazer exercício todo dia não significa que você vá emagrecer.$$),
        (4, $$彼が悪い____が、少し配慮が足りなかった。$$, $$Não é que ele esteja errado, mas faltou um pouco de consideração.$$),
        (5, $$子供だから何もわからない____。$$, $$Ser criança não quer dizer que não entenda nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-208', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というわけではない$$),
        (2, $$というわけではない$$),
        (2, $$というわけではありません$$),
        (2, $$というわけじゃない$$),
        (3, $$というわけではない$$),
        (3, $$というわけではありません$$),
        (3, $$というわけじゃない$$),
        (4, $$というわけではない$$),
        (5, $$というわけではない$$),
        (5, $$というわけではありません$$),
        (5, $$というわけじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
