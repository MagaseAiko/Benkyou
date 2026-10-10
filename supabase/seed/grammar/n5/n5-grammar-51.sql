-- n5-grammar-51 — の
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-51',
    'grammar',
    'N5',
    $$の$$,
    $$no$$,
    $$De / Do / Da / O de$$,
    $$の é a partícula que liga dois substantivos. Ela mostra que o primeiro dá alguma informação sobre o segundo, como acontece com "de" em português.

A ordem é o contrário do português: a coisa principal vem depois de の. Assim, "o livro do Tanaka" fica Tanaka + の + livro.

Essa ligação pode indicar posse, origem, assunto, material, local e muitas outras relações. Por exemplo: o carro de alguém, um carro do Japão, um professor de inglês.

の também funciona como pronome, substituindo um substantivo que já ficou claro pelo contexto. Assim, pode significar "o de...", como "é da minha mãe", ou "o...", como em "o vermelho".$$,
    $$Em sequência, の pode aparecer várias vezes, como em "o livro do professor da escola". A lógica continua a mesma: cada の liga o que vem antes ao que vem depois.

Com adjetivos い, não se usa の para ligar a um substantivo: o adjetivo vem direto. Mas, quando o substantivo é omitido, entra の, como em "o vermelho".

Em níveis seguintes, の também transforma verbos em substantivos, como em "gostar de ler".$$,
    $$Substantivo A + の + Substantivo B (B de A)
Substantivo + の (é de... / o de...)
Adjetivo + の (o... / a...; substitui um substantivo)
Substantivo + の + posição + に / で (em cima de, embaixo de)$$,
    $$の$$,
    $$の$$,
    ARRAY['の']::text[],
    ARRAY['の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-51', $$これは私の本です。$$, $$これはわたしのほんです。$$, $$Este é o meu livro.$$),
    ('n5-grammar-51', $$日本の車はとても人気があります。$$, $$にほんのくるまはとてもにんきがあります。$$, $$Os carros japoneses são muito populares.$$),
    ('n5-grammar-51', $$田中さんは英語の先生です。$$, $$たなかさんはえいごのせんせいです。$$, $$O Tanaka é professor de inglês.$$),
    ('n5-grammar-51', $$このかばんは母のです。$$, $$このかばんはははのです。$$, $$Esta bolsa é da minha mãe.$$),
    ('n5-grammar-51', $$すみません、赤いのをください。$$, $$すみません、あかいのをください。$$, $$Com licença, me dê o vermelho, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あれは田中さん____車です。$$, $$Aquele é o carro do Tanaka.$$),
        (2, $$駅で東京____地図を買いました。$$, $$Comprei um mapa de Tóquio na estação.$$),
        (3, $$「この傘は誰のですか。」「私____です。」$$, $$"De quem é este guarda-chuva?" "É meu."$$),
        (4, $$机の上____本を取ってください。$$, $$Pegue o livro que está em cima da mesa, por favor.$$),
        (5, $$このシャツはちょっと小さいです。もっと大きい____はありますか。$$, $$Esta camisa está um pouco pequena. Tem uma maior?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の$$),
        (2, $$の$$),
        (3, $$の$$),
        (4, $$の$$),
        (5, $$の$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
