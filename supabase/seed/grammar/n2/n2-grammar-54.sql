-- n2-grammar-54 — 〜っこない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-54',
    'grammar',
    'N2',
    $$〜っこない$$,
    $$kkonai$$,
    $$Não tem como / Jamais / De jeito nenhum$$,
    $$っこない é uma expressão casual que nega uma possibilidade com muita força. Equivale a "não tem como", "jamais" ou "de jeito nenhum".

Ele vem depois do verbo na forma ます sem ます, geralmente com verbos potenciais ou verbos de resultado, como わかる, 勝てる, 終わる e 間に合う.

Por exemplo, "uma questão tão difícil, não tem como entender" ou "de jeito nenhum dá para ganhar dele".

O sentido é parecido com わけがない e はずがない, mas っこない é bem mais coloquial e emocional. Por isso, é usado com amigos e família, e não em situações formais.$$,
    $$っこない é muito comum entre jovens e em conversas informais.

Em situações formais, use わけがない ou はずがない.

Às vezes, っこない expressa desânimo ou falta de confiança, como em できっこない ("não vou conseguir de jeito nenhum").$$,
    $$Verbo na forma ます sem ます + っこない
Verbo potencial sem ます + っこない (できっこない / 勝てっこない)$$,
    $$っこない$$,
    $$っこない|っこありません$$,
    ARRAY['っこない']::text[],
    ARRAY['っこない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-54', $$こんな難しい問題、わかりっこない。$$, $$こんなむずかしいもんだい、わかりっこない。$$, $$Uma questão tão difícil assim, não tem como entender.$$),
    ('n2-grammar-54', $$一日でこの仕事が終わりっこない。$$, $$いちにちでこのしごとがおわりっこない。$$, $$Não tem como este trabalho terminar em um dia.$$),
    ('n2-grammar-54', $$あんなに強い人に勝てっこないよ。$$, $$あんなにつよいひとにかてっこないよ。$$, $$De jeito nenhum dá para ganhar de alguém tão forte.$$),
    ('n2-grammar-54', $$そんな話、誰も信じっこない。$$, $$そんなはなし、だれもしんじっこない。$$, $$Uma história dessas, ninguém vai acreditar jamais.$$),
    ('n2-grammar-54', $$今から走っても、間に合いっこない。$$, $$いまからはしっても、まにあいっこない。$$, $$Mesmo correndo agora, não tem como chegar a tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人でこんなに食べられ____。$$, $$Não tem como comer tudo isso sozinho.$$),
        (2, $$あんなに怒っていたから、彼女が許してくれ____。$$, $$Ela estava tão brava que jamais vai me perdoar.$$),
        (3, $$そんな高い車、買え____。$$, $$Um carro tão caro assim, não tem como comprar.$$),
        (4, $$今から勉強しても、合格でき____。$$, $$Mesmo estudando a partir de agora, não tem como passar.$$),
        (5, $$こんな難しい話、子供にわかり____。$$, $$Uma conversa tão difícil, criança nenhuma entende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っこない$$),
        (2, $$っこない$$),
        (3, $$っこない$$),
        (4, $$っこない$$),
        (5, $$っこない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
