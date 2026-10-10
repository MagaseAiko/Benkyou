-- n4-grammar-125 — 〜ように・〜ような
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-125',
    'grammar',
    'N4',
    $$〜ように・〜ような$$,
    $$you ni / you na$$,
    $$Como / Igual a / Do mesmo jeito que$$,
    $$ように e ような são formas de ようだ usadas para fazer comparações, dar exemplos ou indicar conformidade.

ような vem antes de um substantivo. Ela compara ou dá um exemplo: "uma pessoa como o professor", "uma cidade grande como Tóquio", "um dia que parece um sonho".

ように vem antes de um verbo ou adjetivo. Ela descreve o modo como algo é feito, comparando com outra coisa: "riu como uma criança", "bonita como uma flor".

ように também indica conformidade, ou seja, "do jeito que" ou "conforme", como em "faça como o professor disse".

São versões mais formais de みたいな e みたいに. Com substantivos, usa-se の antes: 先生のような.$$,
    $$A expressão 前にも話したように ("como já falei antes") é muito comum em explicações.

Na fala casual, みたいな e みたいに são mais frequentes, mas ような e ように são preferidos na escrita.

ように também tem outro uso importante: indicar objetivo ("para que..."), que aparece no N3.$$,
    $$Substantivo + の + ような + Substantivo
Substantivo + の + ように + Verbo / Adjetivo
Verbo (forma simples) + ように + Verbo (conforme / do jeito que)
Verbo + ような + Substantivo$$,
    $$ような$$,
    $$ように|ような$$,
    ARRAY['よう', 'に', 'な']::text[],
    ARRAY['ように', 'ような']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-125', $$私も先生のような人になりたい。$$, $$わたしもせんせいのようなひとになりたい。$$, $$Eu também quero ser uma pessoa como o professor.$$),
    ('n4-grammar-125', $$彼は子供のように笑った。$$, $$かれはこどものようにわらった。$$, $$Ele riu como uma criança.$$),
    ('n4-grammar-125', $$東京のような大きい町に住みたい。$$, $$とうきょうのようなおおきいまちにすみたい。$$, $$Quero morar numa cidade grande como Tóquio.$$),
    ('n4-grammar-125', $$先生が言ったように、もう一度やってみます。$$, $$せんせいがいったように、もういちどやってみます。$$, $$Vou tentar mais uma vez, como o professor disse.$$),
    ('n4-grammar-125', $$昨日は夢のような一日でした。$$, $$きのうはゆめのようないちにちでした。$$, $$Ontem foi um dia que pareceu um sonho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は花の____美しい。$$, $$Ela é bonita como uma flor.$$),
        (2, $$母の____優しい人になりたい。$$, $$Quero ser uma pessoa gentil como a minha mãe.$$),
        (3, $$前に話した____、明日は休みです。$$, $$Como falei antes, amanhã é folga.$$),
        (4, $$雪の____白いケーキを作りました。$$, $$Fiz um bolo branco como a neve.$$),
        (5, $$鳥の____空を飛んでみたい。$$, $$Quero experimentar voar pelo céu como um pássaro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように$$),
        (2, $$ような$$),
        (3, $$ように$$),
        (4, $$ような$$),
        (5, $$ように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
