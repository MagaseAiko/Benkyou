-- n1-grammar-162 — 〜折に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-162',
    'grammar',
    'N1',
    $$〜折に$$,
    $$ori ni$$,
    $$Na ocasião de / Quando / Na oportunidade de$$,
    $$折に indica uma ocasião ou um momento, de forma formal e educada. Equivale a "na ocasião de" ou "quando".

É muito usado em cartas, e-mails formais e cumprimentos. Por exemplo, "quando vier a Tóquio, passe aqui em casa".

As formas 折には e 折の também são usadas.$$,
    $$É mais formal que 時に.

Não se usa para situações negativas, como acidentes ou desastres.

Expressões comuns são お近くにお越しの折には e 何かの折に.$$,
    $$Verbo (forma simples) + 折に / 折には
Substantivo + の + 折に / 折には$$,
    $$折に$$,
    $$折に|折には|折の|おりに$$,
    ARRAY['折', 'に']::text[],
    ARRAY['折に', '折には', '折の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-162', $$東京にお越しの折には、ぜひお立ち寄りください。$$, $$とうきょうにおこしのおりには、ぜひおたちよりください。$$, $$Quando vier a Tóquio, não deixe de passar aqui.$$),
    ('n1-grammar-162', $$先日お会いした折に、お話しした件ですが。$$, $$せんじつおあいしたおりに、おはなししたけんですが。$$, $$É sobre o assunto que mencionei quando nos encontramos outro dia.$$),
    ('n1-grammar-162', $$何かの折に、また連絡します。$$, $$なにかのおりに、またれんらくします。$$, $$Numa próxima oportunidade, entro em contato de novo.$$),
    ('n1-grammar-162', $$京都を訪ねた折に、古いお寺を見学した。$$, $$きょうとをたずねたおりに、ふるいおてらをけんがくした。$$, $$Na ocasião em que visitei Kyoto, conheci um templo antigo.$$),
    ('n1-grammar-162', $$帰国の折には、お土産を持っていきます。$$, $$きこくのおりには、おみやげをもっていきます。$$, $$Quando eu voltar ao meu país, levarei lembrancinhas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お近くにお越しの____、お声をかけてください。$$, $$Quando estiver por perto, me chame.$$),
        (2, $$前回お目にかかった____、名刺をいただきました。$$, $$Recebi seu cartão quando nos encontramos da última vez.$$),
        (3, $$今度お会いする____、詳しくご説明します。$$, $$Na próxima vez que nos encontrarmos, explicarei em detalhes.$$),
        (4, $$出張の____、取引先に挨拶に行った。$$, $$Na ocasião da viagem de negócios, fui cumprimentar um cliente.$$),
        (5, $$何かの____、思い出してください。$$, $$Lembre-se de mim numa oportunidade qualquer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$折には$$),
        (1, $$折に$$),
        (2, $$折に$$),
        (3, $$折に$$),
        (3, $$折には$$),
        (4, $$折に$$),
        (5, $$折に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
