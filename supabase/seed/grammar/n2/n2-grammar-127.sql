-- n2-grammar-127 — お〜願う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-127',
    'grammar',
    'N2',
    $$お〜願う$$,
    $$o ~ negau$$,
    $$Pedimos que / Por gentileza / Solicitamos que$$,
    $$お〜願う é uma forma muito educada de pedir algo a alguém. Equivale a "pedimos que" ou "por gentileza".

É muito usada em avisos públicos, anúncios, cartas e no atendimento ao cliente. Por exemplo, "pedimos que aguarde um momento".

A forma mais comum é お〜願います, e a forma ainda mais respeitosa é お〜願えますか ou お〜願えませんか.$$,
    $$Com palavras de origem chinesa, usa-se ご em vez de お, como em ご協力願います e ご注意願います.

É mais formal que お〜ください.$$,
    $$お + Verbo (forma ます sem ます) + 願います
ご + Substantivo (ação) + 願います
お + Verbo (forma ます sem ます) + 願えますか$$,
    $$お〜願う$$,
    $$願います|願えます|願えません|願いたい|願う$$,
    ARRAY['お', '願う']::text[],
    ARRAY['お〜願います', 'ご〜願います', 'お〜願えますか', 'お〜願えませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-127', $$しばらくお待ち願います。$$, $$しばらくおまちねがいます。$$, $$Pedimos que aguarde um momento.$$),
    ('n2-grammar-127', $$ご協力願います。$$, $$ごきょうりょくねがいます。$$, $$Pedimos a sua colaboração.$$),
    ('n2-grammar-127', $$こちらにお名前をお書き願えますか。$$, $$こちらにおなまえをおかきねがえますか。$$, $$Poderia, por gentileza, escrever seu nome aqui?$$),
    ('n2-grammar-127', $$館内ではお静かに願います。$$, $$かんないではおしずかにねがいます。$$, $$Pedimos silêncio dentro do prédio.$$),
    ('n2-grammar-127', $$足元にご注意願います。$$, $$あしもとにごちゅういねがいます。$$, $$Pedimos atenção ao degrau.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会場内での撮影はご遠慮____。$$, $$Pedimos que não tire fotos dentro do local.$$),
        (2, $$こちらの書類にご記入____。$$, $$Pedimos que preencha este documento.$$),
        (3, $$もう一度お確かめ____か。$$, $$Poderia, por gentileza, verificar mais uma vez?$$),
        (4, $$お手数ですが、ご返信____。$$, $$Desculpe o incômodo, mas pedimos que responda.$$),
        (5, $$少々お待ち____か。$$, $$Poderia aguardar um momento, por gentileza?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$願います$$),
        (2, $$願います$$),
        (2, $$願えますか$$),
        (3, $$願えます$$),
        (3, $$願えません$$),
        (4, $$願います$$),
        (5, $$願えます$$),
        (5, $$願えません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
