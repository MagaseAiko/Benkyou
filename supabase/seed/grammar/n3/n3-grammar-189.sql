-- n3-grammar-189 — 〜ないうちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-189',
    'grammar',
    'N3',
    $$〜ないうちに$$,
    $$nai uchi ni$$,
    $$Antes que / Enquanto ainda não$$,
    $$ないうちに é usado para dizer que é bom fazer algo antes que uma situação mude, geralmente para pior. Equivale a "antes que" ou "enquanto ainda não...".

Ele junta a forma ない do verbo com うちに (enquanto). A ideia literal é "enquanto ainda não aconteceu". Por exemplo, "vamos voltar antes que escureça" ou "coma antes que esfrie".

A segunda parte costuma ser uma ação recomendada, um pedido ou uma intenção, para aproveitar o momento antes da mudança.

Outro uso importante é com verbos de percepção, como 知らない e 気がつかない, que significam "sem perceber": "quando vi, já tinha anoitecido sem eu perceber".$$,
    $$Em comparação com 前に, ないうちに destaca mais a urgência e a ideia de aproveitar o momento.

冷めないうちに ("antes que esfrie") é uma frase muito comum ao servir comida.

知らないうちに é usado para mudanças que acontecem sem que a pessoa perceba, como o tempo passar.$$,
    $$Verbo na forma ない + うちに + Ação (antes que...)
知らない / 気がつかない + うちに + Mudança (sem perceber)$$,
    $$ないうちに$$,
    $$ないうちに$$,
    ARRAY['ない', 'うち', 'に']::text[],
    ARRAY['ないうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-189', $$暗くならないうちに、帰りましょう。$$, $$くらくならないうちに、かえりましょう。$$, $$Vamos voltar antes que escureça.$$),
    ('n3-grammar-189', $$雨が降らないうちに、買い物に行こう。$$, $$あめがふらないうちに、かいものにいこう。$$, $$Vamos fazer compras antes que chova.$$),
    ('n3-grammar-189', $$忘れないうちに、メモしておきます。$$, $$わすれないうちに、メモしておきます。$$, $$Vou anotar antes que eu esqueça.$$),
    ('n3-grammar-189', $$冷めないうちに、どうぞ召し上がってください。$$, $$さめないうちに、どうぞめしあがってください。$$, $$Por favor, coma antes que esfrie.$$),
    ('n3-grammar-189', $$知らないうちに、寝てしまっていた。$$, $$しらないうちに、ねてしまっていた。$$, $$Sem perceber, acabei pegando no sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理が冷め____、食べてください。$$, $$Coma antes que a comida esfrie, por favor.$$),
        (2, $$先生に言われたことを忘れ____、宿題をしよう。$$, $$Vou fazer a lição antes de esquecer o que o professor disse.$$),
        (3, $$子供が起き____、掃除を終わらせたい。$$, $$Quero terminar a limpeza antes que as crianças acordem.$$),
        (4, $$本を読んでいたら、気がつか____、夜になっていた。$$, $$Estava lendo e, sem perceber, já tinha anoitecido.$$),
        (5, $$雨が降ら____、洗濯物を取り込んで。$$, $$Recolha a roupa antes que chova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないうちに$$),
        (2, $$ないうちに$$),
        (3, $$ないうちに$$),
        (4, $$ないうちに$$),
        (5, $$ないうちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
