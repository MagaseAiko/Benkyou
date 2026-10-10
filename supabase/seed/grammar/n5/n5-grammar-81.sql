-- n5-grammar-81 — 〜ます・〜ません・〜ました・〜ませんでした
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-81',
    'grammar',
    'N5',
    $$〜ます・〜ません・〜ました・〜ませんでした$$,
    $$masu / masen / mashita / masen deshita$$,
    $$Faço / Não faço / Fiz / Não fiz$$,
    $$Essas são as quatro formas básicas dos verbos na linguagem educada. Elas são usadas com desconhecidos, no trabalho, na escola e em qualquer situação em que se queira falar com respeito.

• ます: afirmativo, presente ou futuro ("faço", "vou fazer").
• ません: negativo, presente ou futuro ("não faço", "não vou fazer").
• ました: afirmativo no passado ("fiz").
• ませんでした: negativo no passado ("não fiz").

Em japonês, o presente e o futuro usam a mesma forma. O contexto, ou palavras como 明日 e 来週, mostra quando a ação acontece.

Para formar essas terminações, primeiro é preciso encontrar a "base ます" do verbo. Ela muda conforme o grupo do verbo: nos verbos do grupo 1, o último som muda de "u" para "i"; nos verbos do grupo 2, tira-se o る; e する e 来る são irregulares.$$,
    $$Alguns verbos terminados em る pertencem ao grupo 1, como 帰る, 入る e 走る. Por isso, a forma ます deles é 帰ります, e não 帰ます.

O passado negativo ませんでした é formado juntando ません com でした. É uma das formas mais longas dos verbos educados.

Na conversa entre amigos, usa-se a forma simples: dicionário, ない, た e なかった.$$,
    $$Base ます + ます / ません / ました / ませんでした

Grupo 1: troque o som final "u" por "i" (書く → 書き / 飲む → 飲み / 買う → 買い)
Grupo 2: tire o る (食べる → 食べ / 見る → 見)
Irregulares: する → し / 来る → 来 (き)$$,
    $$ます$$,
    $$ます|ません|ました|ませんでした$$,
    ARRAY['ます', 'ません', 'ました', 'ませんでした']::text[],
    ARRAY['ます', 'ません', 'ました', 'ませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-81', $$毎朝、コーヒーを飲みます。$$, $$まいあさ、コーヒーをのみます。$$, $$Toda manhã, tomo café.$$),
    ('n5-grammar-81', $$私はお酒を飲みません。$$, $$わたしはおさけをのみません。$$, $$Eu não bebo álcool.$$),
    ('n5-grammar-81', $$昨日、駅で友達に会いました。$$, $$きのう、えきでともだちにあいました。$$, $$Ontem encontrei um amigo na estação.$$),
    ('n5-grammar-81', $$昨日は雨で、どこにも行きませんでした。$$, $$きのうはあめで、どこにもいきませんでした。$$, $$Ontem choveu e não fui a lugar nenhum.$$),
    ('n5-grammar-81', $$明日、母が東京に来ます。$$, $$あした、ははがとうきょうにきます。$$, $$Amanhã minha mãe vem a Tóquio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩十一時に寝____。$$, $$Toda noite, durmo às onze.$$),
        (2, $$私は肉を食べ____。$$, $$Eu não como carne.$$),
        (3, $$先週、京都へ行き____。$$, $$Semana passada, fui a Kyoto.$$),
        (4, $$昨日は疲れて、宿題をし____。$$, $$Ontem estava cansado e não fiz a lição.$$),
        (5, $$来週、友達がブラジルから来____。$$, $$Semana que vem, um amigo vem do Brasil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ます$$),
        (2, $$ません$$),
        (3, $$ました$$),
        (4, $$ませんでした$$),
        (5, $$ます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
