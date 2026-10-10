-- n3-grammar-172 — わざわざ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-172',
    'grammar',
    'N3',
    $$わざわざ$$,
    $$wazawaza$$,
    $$Dar-se ao trabalho de / Especialmente / Sem necessidade$$,
    $$わざわざ é um advérbio que indica que alguém fez um esforço especial, que não era necessário ou que exigiu tempo e trabalho. Equivale a "dar-se ao trabalho de" ou "especialmente".

Ele tem dois tons principais.

O primeiro é de gratidão: quando alguém faz um esforço por você, わざわざ mostra que você reconhece isso. Por exemplo, "obrigado por ter vindo até aqui" ou "ele se deu ao trabalho de vir me buscar na estação".

O segundo é de "sem necessidade": quando o esforço não era preciso. Por exemplo, "um e-mail basta, não precisa se dar ao trabalho de ligar". Nesse caso, わざわざ aparece muito com なくてもいい ou ことはない.$$,
    $$Em agradecimentos formais, わざわざありがとうございます é uma das frases mais usadas pelos japoneses.

Não confunda com わざと, que significa "de propósito", geralmente com intenção negativa.

わざわざ também pode expressar crítica, como alguém que fez um esforço desnecessário: なんでわざわざそんなことを?$$,
    $$わざわざ + Verbo + てくれる / てくださる (gratidão)
わざわざ + Verbo + なくてもいい / ことはない (sem necessidade)
わざわざ + ありがとうございます (agradecimento)$$,
    $$わざわざ$$,
    $$わざわざ$$,
    ARRAY['わざわざ']::text[],
    ARRAY['わざわざ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-172', $$遠いのに、わざわざ来てくれて、ありがとう。$$, $$とおいのに、わざわざきてくれて、ありがとう。$$, $$Mesmo sendo longe, obrigado por ter vindo até aqui.$$),
    ('n3-grammar-172', $$彼はわざわざ駅まで迎えに来てくれた。$$, $$かれはわざわざえきまでむかえにきてくれた。$$, $$Ele se deu ao trabalho de vir me buscar na estação.$$),
    ('n3-grammar-172', $$メールで十分なので、わざわざ電話しなくてもいい。$$, $$メールでじゅうぶんなので、わざわざでんわしなくてもいい。$$, $$Um e-mail basta, não precisa se dar ao trabalho de ligar.$$),
    ('n3-grammar-172', $$そのパンのために、わざわざ遠くの店まで買いに行った。$$, $$そのパンのために、わざわざとおくのみせまでかいにいった。$$, $$Fui especialmente até uma loja longe para comprar esse pão.$$),
    ('n3-grammar-172', $$お忙しいところ、わざわざありがとうございます。$$, $$おいそがしいところ、わざわざありがとうございます。$$, $$Muito obrigado por ter se dado ao trabalho, mesmo estando ocupado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$入院中、____お見舞いに来てくれて、ありがとう。$$, $$Obrigado por ter se dado ao trabalho de me visitar no hospital.$$),
        (2, $$近くにもあるのに、____遠くの店に行った。$$, $$Mesmo tendo uma perto, fui especialmente a uma loja longe.$$),
        (3, $$そんな物、____届けてくれなくてもよかったのに。$$, $$Não precisava ter se dado ao trabalho de me entregar uma coisa dessas.$$),
        (4, $$彼は私の誕生日のために、____ケーキを作ってくれた。$$, $$Ele se deu ao trabalho de fazer um bolo para o meu aniversário.$$),
        (5, $$そのことは、____説明しなくても、みんな知っている。$$, $$Isso todo mundo já sabe, não precisa se dar ao trabalho de explicar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わざわざ$$),
        (2, $$わざわざ$$),
        (3, $$わざわざ$$),
        (4, $$わざわざ$$),
        (5, $$わざわざ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
