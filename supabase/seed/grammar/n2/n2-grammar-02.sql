-- n2-grammar-02 — あるいは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-02',
    'grammar',
    'N2',
    $$あるいは$$,
    $$aruiwa$$,
    $$Ou / Ou então / Talvez$$,
    $$あるいは é uma conjunção formal que significa "ou". Ela apresenta alternativas, das quais uma é escolhida.

Ela é muito usada em textos escritos, avisos, formulários, documentos e notícias. Na conversa, os japoneses costumam usar か ou それか.

Por exemplo, "entre em contato por telefone ou e-mail" ou "amanhã vai chover ou nevar".

Além de "ou", あるいは também pode significar "talvez", no começo de uma frase, com かもしれない: "talvez o que ele diz esteja certo". Nesse uso, ela é parecida com もしかすると.

あるいは é um pouco mais formal e literária que または.$$,
    $$または e あるいは são muito parecidas. あるいは soa mais escrito e é comum em textos jornalísticos.

No uso de "talvez", あるいは deixa a suposição mais suave e literária.

Em formulários, frases como 本人あるいは家族 ("a própria pessoa ou um familiar") aparecem com frequência.$$,
    $$A + あるいは + B (A ou B)
A、 + あるいは + B
あるいは、 + Frase + かもしれない (talvez)

Escrita: あるいは / 或いは$$,
    $$あるいは$$,
    $$あるいは|或いは$$,
    ARRAY['あるいは']::text[],
    ARRAY['あるいは', '或いは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-02', $$電話あるいはメールで連絡してください。$$, $$でんわあるいはメールでれんらくしてください。$$, $$Entre em contato por telefone ou e-mail.$$),
    ('n2-grammar-02', $$明日は雨、あるいは雪になるでしょう。$$, $$あしたはあめ、あるいはゆきになるでしょう。$$, $$Amanhã deve chover ou nevar.$$),
    ('n2-grammar-02', $$申し込みは、インターネットあるいは郵送で受け付けます。$$, $$もうしこみは、インターネットあるいはゆうそうでうけつけます。$$, $$As inscrições são aceitas pela internet ou pelo correio.$$),
    ('n2-grammar-02', $$彼はもう帰ったか、あるいはまだ会議中かもしれない。$$, $$かれはもうかえったか、あるいはまだかいぎちゅうかもしれない。$$, $$Talvez ele já tenha ido embora, ou então ainda esteja em reunião.$$),
    ('n2-grammar-02', $$あるいは、彼の言うことが正しいのかもしれない。$$, $$あるいは、かれのいうことがただしいのかもしれない。$$, $$Talvez o que ele diz esteja certo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$黒____青のペンで記入してください。$$, $$Preencha com caneta preta ou azul.$$),
        (2, $$来週の月曜日、____火曜日に伺います。$$, $$Irei visitá-lo na segunda ou na terça da semana que vem.$$),
        (3, $$本人____家族の方が来てください。$$, $$Venha a própria pessoa ou um familiar.$$),
        (4, $$____、それが正しい答えかもしれない。$$, $$Talvez essa seja a resposta correta.$$),
        (5, $$現金____クレジットカードでお支払いください。$$, $$Pague em dinheiro ou com cartão de crédito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あるいは$$),
        (2, $$あるいは$$),
        (3, $$あるいは$$),
        (4, $$あるいは$$),
        (5, $$あるいは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
