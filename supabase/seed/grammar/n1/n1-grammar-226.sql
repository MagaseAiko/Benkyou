-- n1-grammar-226 — 〜とはいえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-226',
    'grammar',
    'N1',
    $$〜とはいえ$$,
    $$to wa ie$$,
    $$Embora / Apesar de / Mesmo que$$,
    $$とはいえ reconhece um fato, mas mostra que a realidade não é exatamente como se esperaria. Equivale a "embora" ou "apesar de".

A primeira parte admite algo, e a segunda mostra uma ressalva. Por exemplo, "embora seja primavera, ainda faz frio".

Também aparece no começo da frase, com o sentido de "mesmo assim".$$,
    $$É parecido com といっても e けれども, mas とはいえ é mais formal.

Também é escrito とは言え.$$,
    $$Frase (forma simples) + とはいえ
Substantivo + とはいえ
とはいえ、 + Frase (no começo)$$,
    $$とはいえ$$,
    $$とはいえ|とは言え$$,
    ARRAY['と', 'は', 'いえ']::text[],
    ARRAY['とはいえ', 'とは言え']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-226', $$春とはいえ、まだ寒い日が続いている。$$, $$はるとはいえ、まださむいひがつづいている。$$, $$Embora seja primavera, os dias continuam frios.$$),
    ('n1-grammar-226', $$仕事とはいえ、毎日残業するのはつらい。$$, $$しごととはいえ、まいにちざんぎょうするのはつらい。$$, $$Embora seja trabalho, fazer hora extra todo dia é duro.$$),
    ('n1-grammar-226', $$わざとではないとはいえ、迷惑をかけてしまった。$$, $$わざとではないとはいえ、めいわくをかけてしまった。$$, $$Apesar de não ter sido de propósito, acabei causando incômodo.$$),
    ('n1-grammar-226', $$試験は終わった。とはいえ、まだ安心できない。$$, $$しけんはおわった。とはいえ、まだあんしんできない。$$, $$A prova acabou. Mesmo assim, ainda não dá para relaxar.$$),
    ('n1-grammar-226', $$安いとはいえ、この品質では買えない。$$, $$やすいとはいえ、このひんしつではかえない。$$, $$Embora seja barato, com esta qualidade não dá para comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、やっていいことと悪いことがある。$$, $$Embora seja criança, há coisas que se pode e não se pode fazer.$$),
        (2, $$夏休み____、毎日宿題がある。$$, $$Apesar de ser férias de verão, há lição de casa todos os dias.$$),
        (3, $$慣れた道____、夜は気をつけて運転しよう。$$, $$Embora seja um caminho conhecido, vamos dirigir com cuidado à noite.$$),
        (4, $$病気は治った。____、無理はしないほうがいい。$$, $$A doença sarou. Mesmo assim, é melhor não forçar.$$),
        (5, $$冗談____、言っていいことではない。$$, $$Mesmo que seja brincadeira, não é algo que se possa dizer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-226', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とはいえ$$),
        (1, $$とは言え$$),
        (2, $$とはいえ$$),
        (2, $$とは言え$$),
        (3, $$とはいえ$$),
        (3, $$とは言え$$),
        (4, $$とはいえ$$),
        (4, $$とは言え$$),
        (5, $$とはいえ$$),
        (5, $$とは言え$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
