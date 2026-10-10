-- n1-grammar-160 — 〜を前提として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-160',
    'grammar',
    'N1',
    $$〜を前提として$$,
    $$wo zentei to shite$$,
    $$Pressupondo / Tendo como premissa / Partindo do princípio de$$,
    $$を前提として indica que algo é feito tendo uma condição como base ou premissa. Equivale a "pressupondo" ou "partindo do princípio de".

Por exemplo, "namoramos pensando em casamento" ou "o plano foi feito pressupondo que haveria verba".

É uma expressão formal, comum no trabalho e em discussões.$$,
    $$A forma を前提に tem o mesmo sentido e é muito comum, como 結婚を前提に付き合う.

É parecido com を条件に.$$,
    $$Substantivo + を前提として / を前提に
Verbo (forma simples) + こと + を前提として$$,
    $$を前提として$$,
    $$を前提として|を前提に|を前提と$$,
    ARRAY['を', '前提', 'として']::text[],
    ARRAY['を前提として', 'を前提に', 'を前提とした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-160', $$結婚を前提として、付き合っています。$$, $$けっこんをぜんていとして、つきあっています。$$, $$Namoramos pensando em casamento.$$),
    ('n1-grammar-160', $$この計画は、予算が増えることを前提にしている。$$, $$このけいかくは、よさんがふえることをぜんていにしている。$$, $$Este plano parte do princípio de que o orçamento vai aumentar.$$),
    ('n1-grammar-160', $$全員が参加することを前提として、準備を進めた。$$, $$ぜんいんがさんかすることをぜんていとして、じゅんびをすすめた。$$, $$Avançamos com os preparativos pressupondo que todos participariam.$$),
    ('n1-grammar-160', $$返品しないことを前提に、値段を安くした。$$, $$へんぴんしないことをぜんていに、ねだんをやすくした。$$, $$Baixamos o preço tendo como premissa que não haveria devolução.$$),
    ('n1-grammar-160', $$話し合いは、お互いを信頼することを前提とした。$$, $$はなしあいは、おたがいをしんらいすることをぜんていとした。$$, $$A conversa partiu do princípio de que haveria confiança mútua.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$長く働くこと____、採用された。$$, $$Fui contratado pressupondo que trabalharia por muito tempo.$$),
        (2, $$留学____、英語を勉強している。$$, $$Estudo inglês tendo como premissa fazer intercâmbio.$$),
        (3, $$この議論は、事実が正しいこと____いる。$$, $$Esta discussão parte do princípio de que os fatos estão corretos.$$),
        (4, $$将来の結婚____、二人は同居を始めた。$$, $$Pensando em casamento no futuro, os dois começaram a morar juntos.$$),
        (5, $$成功すること____、計画を立てるのは危険だ。$$, $$É perigoso fazer planos pressupondo que vai dar certo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を前提として$$),
        (1, $$を前提に$$),
        (2, $$を前提として$$),
        (2, $$を前提に$$),
        (3, $$を前提として$$),
        (3, $$を前提にして$$),
        (4, $$を前提として$$),
        (4, $$を前提に$$),
        (5, $$を前提として$$),
        (5, $$を前提に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
