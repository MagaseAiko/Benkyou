-- n2-grammar-193 — 要するに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-193',
    'grammar',
    'N2',
    $$要するに$$,
    $$you suru ni$$,
    $$Em resumo / Ou seja / Resumindo$$,
    $$要するに serve para resumir o que foi dito ou para chegar ao ponto principal. Equivale a "em resumo", "ou seja" ou "resumindo".

A pessoa simplifica uma explicação longa em uma ideia curta. Por exemplo, "ele falou muitas coisas, mas resumindo, não quer fazer".

É uma expressão muito usada tanto na fala quanto na escrita.$$,
    $$É parecido com つまり, mas 要するに destaca mais o resumo da ideia principal.

Às vezes tem um tom um pouco impaciente, quando a pessoa quer ir direto ao ponto.$$,
    $$Frase (explicação) + 要するに、 + Resumo$$,
    $$要するに$$,
    $$要するに|ようするに$$,
    ARRAY['要する', 'に']::text[],
    ARRAY['要するに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-193', $$いろいろ言っていたが、要するに彼はやりたくないのだ。$$, $$いろいろいっていたが、ようするにかれはやりたくないのだ。$$, $$Ele falou muitas coisas, mas resumindo, não quer fazer.$$),
    ('n2-grammar-193', $$要するに、お金が足りないということですね。$$, $$ようするに、おかねがたりないということですね。$$, $$Ou seja, falta dinheiro, é isso?$$),
    ('n2-grammar-193', $$要するに、もっと練習が必要だ。$$, $$ようするに、もっとれんしゅうがひつようだ。$$, $$Em resumo, é preciso treinar mais.$$),
    ('n2-grammar-193', $$要するに、君は何が言いたいの？$$, $$ようするに、きみはなにがいいたいの？$$, $$Resumindo, o que você quer dizer?$$),
    ('n2-grammar-193', $$要するに、計画は中止になったわけだ。$$, $$ようするに、けいかくはちゅうしになったわけだ。$$, $$Ou seja, o plano foi cancelado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、明日は休みということですね。$$, $$Ou seja, amanhã é folga, é isso?$$),
        (2, $$説明は長かったが、____この案には反対だということだ。$$, $$A explicação foi longa, mas resumindo, ele é contra esta proposta.$$),
        (3, $$____、彼女は君のことが好きなんだよ。$$, $$Em resumo, ela gosta de você.$$),
        (4, $$____、時間がないということです。$$, $$Resumindo, não há tempo.$$),
        (5, $$____、全部やり直しだ。$$, $$Ou seja, vamos ter que refazer tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-193', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$要するに$$),
        (1, $$ようするに$$),
        (2, $$要するに$$),
        (2, $$ようするに$$),
        (3, $$要するに$$),
        (3, $$ようするに$$),
        (4, $$要するに$$),
        (4, $$ようするに$$),
        (5, $$要するに$$),
        (5, $$ようするに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
