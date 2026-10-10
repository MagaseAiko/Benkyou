-- n3-grammar-139 — 〜ということだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-139',
    'grammar',
    'N3',
    $$〜ということだ$$,
    $$to iu koto da$$,
    $$Dizem que / Quer dizer que / Isso significa que$$,
    $$ということだ tem dois usos principais.

O primeiro é repassar uma informação que se ouviu ou leu, de forma um pouco formal. Equivale a "dizem que" ou "segundo informações". É comum junto com によると ou の話では. Por exemplo, "segundo a previsão, amanhã vai chover".

O segundo é tirar uma conclusão a partir de algo que se observou ou ouviu. Equivale a "quer dizer que" ou "isso significa que". Por exemplo, "as luzes estão apagadas. Quer dizer que não tem mais ninguém".

Com つまり, a estrutura つまり〜ということですね é muito usada para confirmar se você entendeu algo corretamente.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.$$,
    $$No uso de "dizem que", ということだ soa mais formal que そうだ.

No uso de conclusão, a frase muitas vezes começa com つまり ou それは.

Diferente de ということ (o fato de que), aqui a expressão termina a frase com だ ou です.$$,
    $$Fonte + によると、 + Frase (forma simples) + ということだ (dizem que)
Fato observado (com ponto final) + Frase + ということだ (conclusão)
つまり、 + Frase + ということですね (confirmação)

Educado: ということです
Fala casual: ってことだ$$,
    $$ということだ$$,
    $$ということだ|ということです|ってことだ$$,
    ARRAY['という', 'こと', 'だ']::text[],
    ARRAY['ということだ', 'ということです', 'ってことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-139', $$天気予報によると、明日は雨が降るということだ。$$, $$てんきよほうによると、あしたはあめがふるということだ。$$, $$Segundo a previsão do tempo, amanhã vai chover.$$),
    ('n3-grammar-139', $$先生の話では、試験は来週だということです。$$, $$せんせいのはなしでは、しけんはらいしゅうだということです。$$, $$Pelo que o professor disse, a prova é na semana que vem.$$),
    ('n3-grammar-139', $$新聞によると、来年から物価が上がるということだ。$$, $$しんぶんによると、らいねんからぶっかがあがるということだ。$$, $$Segundo o jornal, os preços vão subir a partir do ano que vem.$$),
    ('n3-grammar-139', $$電気が消えている。もう誰もいないということだ。$$, $$でんきがきえている。もうだれもいないということだ。$$, $$As luzes estão apagadas. Quer dizer que não tem mais ninguém.$$),
    ('n3-grammar-139', $$つまり、彼は来ないということですね。$$, $$つまり、かれはこないということですね。$$, $$Então, quer dizer que ele não vem, certo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ニュースによると、大きな台風が来る____。$$, $$Segundo o noticiário, vem um grande tufão.$$),
        (2, $$田中さんの話では、部長は来月退職する____。$$, $$Pelo que o Tanaka disse, o gerente vai se aposentar no mês que vem.$$),
        (3, $$返事がないのは、反対だ____。$$, $$Não ter resposta quer dizer que ele é contra.$$),
        (4, $$地図によると、この道をまっすぐ行けばいい____。$$, $$Segundo o mapa, basta seguir reto por esta rua.$$),
        (5, $$つまり、明日は休みだ____ね。$$, $$Então, quer dizer que amanhã é folga, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということだ$$),
        (1, $$ということです$$),
        (2, $$ということだ$$),
        (2, $$ということです$$),
        (3, $$ということだ$$),
        (3, $$ということです$$),
        (4, $$ということだ$$),
        (4, $$ということです$$),
        (5, $$ということです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
