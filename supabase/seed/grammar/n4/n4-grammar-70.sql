-- n4-grammar-70 — 〜らしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-70',
    'grammar',
    'N4',
    $$〜らしい$$,
    $$rashii$$,
    $$Parece que / Dizem que / Típico de$$,
    $$らしい tem dois usos principais.

O primeiro é indicar uma suposição baseada em informações que a pessoa ouviu ou leu. Equivale a "parece que" ou "dizem que". Quem fala não tem certeza e não se responsabiliza totalmente pela informação. Nesse uso, らしい vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な.

O segundo uso aparece depois de substantivos, com o sentido de "típico de" ou "com as características ideais de". Por exemplo, um dia "bem típico de primavera" ou uma atitude "típica" de alguém. Nesse caso, らしい descreve algo que combina com a imagem esperada daquilo.

Nos dois casos, らしい se conjuga como um adjetivo い: らしくない, らしかった, らしく.$$,
    $$Comparando suposições: らしい se baseia em informações de fora (algo que se ouviu); ようだ / みたいだ se baseiam em observação direta; そうだ (伝聞) apenas repassa uma informação.

A expressão 〜らしくない é muito usada para dizer que alguém está agindo de um jeito diferente do normal.

No uso de "típico de", らしい costuma ter um tom positivo, como algo que está à altura do esperado.$$,
    $$Suposição:
Verbo / Adjetivo い (forma simples) + らしい
Substantivo / Adjetivo な (sem だ) + らしい

Típico de:
Substantivo + らしい + Substantivo
Substantivo + らしくない (não é típico de)$$,
    $$らしい$$,
    $$らしい|らしく|らしかった$$,
    ARRAY['らしい']::text[],
    ARRAY['らしい', 'らしいです', 'らしくない', 'らしかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-70', $$田中さんは来月結婚するらしい。$$, $$たなかさんはらいげつけっこんするらしい。$$, $$Parece que o Tanaka vai se casar no mês que vem.$$),
    ('n4-grammar-70', $$天気予報によると、明日は雨らしいですね。$$, $$てんきよほうによると、あしたはあめらしいですね。$$, $$Segundo a previsão, parece que amanhã vai chover, né?$$),
    ('n4-grammar-70', $$あの店のラーメンはとてもおいしいらしい。$$, $$あのみせのラーメンはとてもおいしいらしい。$$, $$Dizem que o ramen daquela loja é muito gostoso.$$),
    ('n4-grammar-70', $$今日は本当に春らしい天気ですね。$$, $$きょうはほんとうにはるらしいてんきですね。$$, $$Hoje está um tempo bem típico de primavera, né?$$),
    ('n4-grammar-70', $$泣くなんて、君らしくないね。$$, $$なくなんて、きみらしくないね。$$, $$Chorar assim não é do seu feitio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$噂では、あの二人は付き合っている____。$$, $$Pelo que dizem, aqueles dois estão namorando.$$),
        (2, $$部長は今日休む____です。$$, $$Parece que o gerente vai faltar hoje.$$),
        (3, $$山田さんは昔、歌手だった____。$$, $$Dizem que o Yamada era cantor antigamente.$$),
        (4, $$今日は夏____暑い日だった。$$, $$Hoje foi um dia quente, bem típico de verão.$$),
        (5, $$そんなことを言うなんて、彼____ない。$$, $$Dizer uma coisa dessas não é do feitio dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$らしい$$),
        (1, $$らしいです$$),
        (2, $$らしい$$),
        (3, $$らしい$$),
        (3, $$らしいです$$),
        (4, $$らしい$$),
        (5, $$らしく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
