-- n4-grammar-138 — 伺う・参る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-138',
    'grammar',
    'N4',
    $$伺う・参る$$,
    $$ukagau / mairu$$,
    $$Visitar / Perguntar / Ir / Vir (humilde)$$,
    $$伺う e 参る são formas humildes (謙譲語) usadas para as próprias ações, quando se fala com alguém que merece respeito.

伺う tem dois sentidos principais. O primeiro é "visitar" ou "ir" à casa ou ao local de alguém respeitado. O segundo é "perguntar" ou "ouvir", como em "queria perguntar uma coisa" ou "ouvi a palestra do professor".

参る é a forma humilde de 行く (ir) e 来る (vir). Ela é muito usada no trabalho e em anúncios, como avisos em estações de trem. Também aparece na apresentação: 〜から参りました ("vim de...").

A diferença é que 伺う tem uma pessoa respeitada como destino ou fonte, enquanto 参る é mais geral e soa formal e educado.$$,
    $$Nas estações, o aviso 電車がまいります ("o trem está chegando") usa 参る de forma polida, mesmo sem uma pessoa humilde envolvida.

A expressão お話を伺う significa "ouvir o que alguém tem a dizer" de forma respeitosa.

Para o "ir / vir" de outras pessoas respeitadas, usa-se いらっしゃる, e nunca 参る.$$,
    $$Lugar de alguém respeitado + に + 伺う (visitar)
Pessoa respeitada + に + 伺う (perguntar / ouvir)
Lugar + に / へ + 参る (ir / vir, humilde)

Formas: 伺います / 伺いました; 参ります / 参りました

Escrita: 伺う / うかがう, 参る / まいる$$,
    $$伺う$$,
    $$伺|うかが|参り|参る|まいり|まいる$$,
    ARRAY['伺う', '参る']::text[],
    ARRAY['伺う', '伺います', '参る', '参ります', '参りました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-138', $$明日、先生のお宅に伺います。$$, $$あした、せんせいのおたくにうかがいます。$$, $$Amanhã, vou visitar a casa do professor.$$),
    ('n4-grammar-138', $$ちょっと伺いたいことがあるのですが。$$, $$ちょっとうかがいたいことがあるのですが。$$, $$Eu gostaria de perguntar uma coisa.$$),
    ('n4-grammar-138', $$来週、御社に参ります。$$, $$らいしゅう、おんしゃにまいります。$$, $$Semana que vem, irei à sua empresa.$$),
    ('n4-grammar-138', $$まもなく電車がまいります。ご注意ください。$$, $$まもなくでんしゃがまいります。ごちゅういください。$$, $$O trem está chegando. Tenham cuidado.$$),
    ('n4-grammar-138', $$先生のお話を伺って、勉強になりました。$$, $$せんせいのおはなしをうかがって、べんきょうになりました。$$, $$Ouvir o que o professor disse foi muito instrutivo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の午後、事務所に____。$$, $$Amanhã à tarde, irei ao escritório.$$),
        (2, $$すみません、ちょっと____たいことがあります。$$, $$Com licença, gostaria de perguntar uma coisa.$$),
        (3, $$部長、すぐ____。$$, $$Gerente, já estou indo.$$),
        (4, $$先生のお話を____、とても感動しました。$$, $$Fiquei muito emocionado ao ouvir o que o professor disse.$$),
        (5, $$はじめまして。ブラジルから____ました。$$, $$Muito prazer. Vim do Brasil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$伺います$$),
        (1, $$参ります$$),
        (2, $$伺い$$),
        (3, $$参ります$$),
        (3, $$伺います$$),
        (4, $$伺って$$),
        (5, $$参り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
