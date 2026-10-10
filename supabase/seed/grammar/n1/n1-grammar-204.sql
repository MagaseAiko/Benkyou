-- n1-grammar-204 — 〜というか〜というか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-204',
    'grammar',
    'N1',
    $$〜というか〜というか$$,
    $$to iu ka ~ to iu ka$$,
    $$Ou melhor... ou / Não sei se é... ou / Seja... seja$$,
    $$というか〜というか serve para descrever algo usando duas palavras, porque a pessoa não encontra uma única palavra exata. Equivale a "não sei se é... ou..." ou "seja... seja".

Muitas vezes a pessoa está surpresa ou confusa com algo. Por exemplo, "não sei se ele é corajoso ou imprudente".

É uma expressão coloquial.$$,
    $$Na fala, também aparece como っていうか.

Muitas vezes termina com uma conclusão geral, como 〜人だ ou 〜ことだ.$$,
    $$Substantivo / Adjetivo + というか + Substantivo / Adjetivo + というか$$,
    $$というか〜というか$$,
    $$というか|っていうか$$,
    ARRAY['という', 'か']::text[],
    ARRAY['というか〜というか', 'っていうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-204', $$彼は勇敢というか無謀というか、何でも挑戦する。$$, $$かれはゆうかんというかむぼうというか、なんでもちょうせんする。$$, $$Não sei se ele é corajoso ou imprudente, mas encara qualquer coisa.$$),
    ('n1-grammar-204', $$その話は、悲しいというか、むなしいというか、複雑な気持ちになった。$$, $$そのはなしは、かなしいというか、むなしいというか、ふくざつなきもちになった。$$, $$Essa história me deixou com um sentimento misto, entre triste e vazio.$$),
    ('n1-grammar-204', $$彼女は素直というか単純というか、すぐ信じてしまう。$$, $$かのじょはすなおというかたんじゅんというか、すぐしんじてしまう。$$, $$Não sei se ela é sincera ou ingênua, mas acredita em tudo na hora.$$),
    ('n1-grammar-204', $$この料理は、甘いというか辛いというか、不思議な味だ。$$, $$このりょうりは、あまいというかからいというか、ふしぎなあじだ。$$, $$Este prato tem um sabor estranho, entre doce e apimentado.$$),
    ('n1-grammar-204', $$あの人は真面目というか頑固というか、ルールを絶対に曲げない。$$, $$あのひとはまじめというかがんこというか、ルールをぜったいにまげない。$$, $$Não sei se é seriedade ou teimosia, mas aquela pessoa nunca quebra as regras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は優しいというか弱い____、人に強く言えない。$$, $$Não sei se ele é gentil ou fraco, mas não consegue falar firme com as pessoas.$$),
        (2, $$あの子は元気____うるさいというか、とにかくよくしゃべる。$$, $$Não sei se essa criança é animada ou barulhenta, mas fala muito.$$),
        (3, $$その映画は怖いというか気持ち悪い____、二度と見たくない。$$, $$Esse filme é assustador ou nojento, sei lá, não quero ver de novo.$$),
        (4, $$彼女は大胆____無神経というか、何でも口に出す。$$, $$Não sei se ela é ousada ou insensível, mas diz tudo o que pensa.$$),
        (5, $$この部屋は広い____寂しいというか、落ち着かない。$$, $$Este quarto é espaçoso ou vazio, sei lá, não me sinto à vontade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-204', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というか$$),
        (2, $$というか$$),
        (3, $$というか$$),
        (4, $$というか$$),
        (5, $$というか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
