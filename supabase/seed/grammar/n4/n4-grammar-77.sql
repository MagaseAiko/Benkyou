-- n4-grammar-77 — 〜し
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-77',
    'grammar',
    'N4',
    $$〜し$$,
    $$shi$$,
    $$E também / Além disso / E (motivos)$$,
    $$し é usado para listar razões ou características, mostrando que há mais de uma. Equivale a "e também" ou "além disso".

Quando aparece mais de uma vez, ele enumera vários motivos ou qualidades que, juntos, levam a uma conclusão. Por exemplo, "é barato, é gostoso, então venho sempre".

Quando aparece só uma vez, ele dá uma razão e deixa subentendido que existem outras. Isso torna a frase mais suave e natural.

É comum usar も junto, reforçando a ideia de acúmulo: "não tenho dinheiro, e também não tenho tempo".

し vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, coloca-se だ antes de し.$$,
    $$Comparado a から, し é mais suave e deixa a explicação aberta, como se houvesse outros motivos além dos citados.

No final da frase, し sozinho pode funcionar como uma justificativa informal, deixando a conclusão subentendida.

Com a forma educada (です / ます) antes de し, a frase fica um pouco mais formal, mas a forma simples é a mais comum.$$,
    $$Verbo / Adjetivo い (forma simples) + し
Substantivo / Adjetivo な + だ + し
A + し + B + し + Conclusão
Substantivo + も + … + し$$,
    $$し$$,
    $$し、|し。|しね$$,
    ARRAY['し']::text[],
    ARRAY['し']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-77', $$この店は安いし、おいしいし、よく来ます。$$, $$このみせはやすいし、おいしいし、よくきます。$$, $$Esta loja é barata, é gostosa, então venho sempre.$$),
    ('n4-grammar-77', $$雨も降っているし、今日は家にいよう。$$, $$あめもふっているし、きょうはいえにいよう。$$, $$Está chovendo, entre outras coisas, então vou ficar em casa hoje.$$),
    ('n4-grammar-77', $$彼は頭もいいし、優しいし、人気がある。$$, $$かれはあたまもいいし、やさしいし、にんきがある。$$, $$Ele é inteligente, gentil e por isso é popular.$$),
    ('n4-grammar-77', $$もう遅いし、帰りましょう。$$, $$もうおそいし、かえりましょう。$$, $$Já está tarde, vamos embora.$$),
    ('n4-grammar-77', $$この部屋は駅から近いし、静かだし、気に入っています。$$, $$このへやはえきからちかいし、しずかだし、きにいっています。$$, $$Este apartamento é perto da estação, é silencioso, e eu gosto muito dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金もない____、時間もないし、旅行は無理です。$$, $$Não tenho dinheiro, nem tempo, então viajar é impossível.$$),
        (2, $$熱もある____、今日は学校を休みます。$$, $$Estou com febre, entre outras coisas, então vou faltar à escola hoje.$$),
        (3, $$彼女はきれいだ____、料理も上手だ。$$, $$Ela é bonita e, além disso, cozinha bem.$$),
        (4, $$この町は便利だ____、人も親切です。$$, $$Esta cidade é prática, e as pessoas também são gentis.$$),
        (5, $$明日は休みだ____、映画でも見に行こうか。$$, $$Amanhã é folga, então vamos ver um filme ou algo assim?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$し$$),
        (2, $$し$$),
        (3, $$し$$),
        (4, $$し$$),
        (5, $$し$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
