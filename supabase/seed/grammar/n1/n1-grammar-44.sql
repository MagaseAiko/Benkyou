-- n1-grammar-44 — 〜か否か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-44',
    'grammar',
    'N1',
    $$〜か否か$$,
    $$ka ina ka$$,
    $$Se... ou não / Sim ou não / Ou não$$,
    $$か否か indica duas possibilidades opostas, com o sentido de "se... ou não". É a forma formal de かどうか.

É muito usada em textos, notícias, documentos e discursos. Por exemplo, "ainda não se sabe se o plano vai dar certo ou não".

否 significa "não", então か否か é literalmente "sim ou não".$$,
    $$É mais formal que かどうか.

Costuma vir com verbos como わからない, 決める, 問題だ e 判断する.$$,
    $$Verbo (forma simples) + か否か
Adjetivo い + か否か
Adjetivo な / Substantivo + (である) + か否か$$,
    $$か否か$$,
    $$か否か|かいなか$$,
    ARRAY['か', '否', 'か']::text[],
    ARRAY['か否か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-44', $$計画が成功するか否かは、まだわからない。$$, $$けいかくがせいこうするかいなかは、まだわからない。$$, $$Ainda não se sabe se o plano vai dar certo ou não.$$),
    ('n1-grammar-44', $$参加するか否か、明日までに決めてください。$$, $$さんかするかいなか、あしたまでにきめてください。$$, $$Decida até amanhã se vai participar ou não.$$),
    ('n1-grammar-44', $$彼が犯人であるか否かが問題だ。$$, $$かれがはんにんであるかいなかがもんだいだ。$$, $$A questão é se ele é o culpado ou não.$$),
    ('n1-grammar-44', $$この薬が安全か否か、調べる必要がある。$$, $$このくすりがあんぜんかいなか、しらべるひつようがある。$$, $$É preciso investigar se este remédio é seguro ou não.$$),
    ('n1-grammar-44', $$合格するか否かは、本人の努力次第だ。$$, $$ごうかくするかいなかは、ほんにんのどりょくしだいだ。$$, $$Passar ou não depende do esforço da própria pessoa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その話が本当____、確かめたい。$$, $$Quero confirmar se essa história é verdade ou não.$$),
        (2, $$留学する____、まだ迷っている。$$, $$Ainda estou em dúvida se faço intercâmbio ou não.$$),
        (3, $$試合が行われる____は、天気によって決まる。$$, $$Se a partida será realizada ou não depende do tempo.$$),
        (4, $$彼が来る____、誰も知らない。$$, $$Ninguém sabe se ele vem ou não.$$),
        (5, $$この意見が正しい____、議論が続いている。$$, $$A discussão continua sobre se esta opinião está correta ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か否か$$),
        (2, $$か否か$$),
        (3, $$か否か$$),
        (4, $$か否か$$),
        (5, $$か否か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
