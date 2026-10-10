-- n2-grammar-37 — いよいよ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-37',
    'grammar',
    'N2',
    $$いよいよ$$,
    $$iyoiyo$$,
    $$Finalmente / Enfim chegou / Cada vez mais$$,
    $$いよいよ é um advérbio com dois usos principais.

O primeiro, mais comum, indica que um momento esperado finalmente chegou ou está prestes a chegar. Equivale a "finalmente" ou "enfim chegou". O tom é de expectativa, emoção ou tensão. Por exemplo, "finalmente, amanhã é a prova" ou "enfim chegou o dia da partida".

O segundo indica que algo está se intensificando cada vez mais. Equivale a "cada vez mais". Por exemplo, "a chuva está ficando cada vez mais forte".

Comparado a ついに e やっと, いよいよ costuma se referir a algo que está acontecendo agora ou prestes a acontecer, com sensação de clímax.$$,
    $$いよいよ é muito usado em anúncios e programas: いよいよ最終回 ("finalmente, o último episódio").

Comparando: やっと = alívio depois de espera; ついに = finalmente aconteceu (após longo processo); いよいよ = o momento esperado está chegando.

No uso de intensificação, いよいよ é parecido com ますます.$$,
    $$いよいよ + Evento próximo / que começa
いよいよ + Adjetivo / Verbo de mudança (cada vez mais)$$,
    $$いよいよ$$,
    $$いよいよ$$,
    ARRAY['いよいよ']::text[],
    ARRAY['いよいよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-37', $$いよいよ明日は試験だ。$$, $$いよいよあしたはしけんだ。$$, $$Finalmente, amanhã é a prova.$$),
    ('n2-grammar-37', $$いよいよ夏休みが始まる。$$, $$いよいよなつやすみがはじまる。$$, $$Enfim, as férias de verão vão começar.$$),
    ('n2-grammar-37', $$雨がいよいよ強くなってきた。$$, $$あめがいよいよつよくなってきた。$$, $$A chuva está ficando cada vez mais forte.$$),
    ('n2-grammar-37', $$いよいよ出発の日が来た。$$, $$いよいよしゅっぱつのひがきた。$$, $$Enfim chegou o dia da partida.$$),
    ('n2-grammar-37', $$試合はいよいよ最後の五分になった。$$, $$しあいはいよいよさいごのごふんになった。$$, $$A partida finalmente chegou aos últimos cinco minutos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____来週から新しい仕事が始まる。$$, $$Finalmente, o novo trabalho começa na semana que vem.$$),
        (2, $$台風が近づいて、風が____強くなった。$$, $$Com a aproximação do tufão, o vento ficou cada vez mais forte.$$),
        (3, $$____結婚式の日がやってきた。$$, $$Enfim chegou o dia do casamento.$$),
        (4, $$このドラマも、____最終回です。$$, $$Esta novela finalmente chegou ao último episódio.$$),
        (5, $$試験まで____あと一日だ。$$, $$Finalmente, falta só um dia para a prova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いよいよ$$),
        (2, $$いよいよ$$),
        (3, $$いよいよ$$),
        (4, $$いよいよ$$),
        (5, $$いよいよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
