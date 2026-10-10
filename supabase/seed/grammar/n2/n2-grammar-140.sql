-- n2-grammar-140 — しかも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-140',
    'grammar',
    'N2',
    $$しかも$$,
    $$shikamo$$,
    $$Além disso / E ainda / E mais$$,
    $$しかも serve para acrescentar uma informação que reforça a anterior. Equivale a "além disso" ou "e ainda".

A segunda informação costuma ser algo ainda mais surpreendente ou importante. Por exemplo, "este restaurante é gostoso e, além disso, barato".

Também pode ligar ideias contrastantes, com o sentido de "e mesmo assim".$$,
    $$É parecido com その上 e おまけに. しかも é neutro, おまけに é mais coloquial e その上 é mais formal.

Pode ser usado tanto com coisas boas quanto ruins.$$,
    $$Frase (com ponto final) + しかも + Frase
Adjetivo / Substantivo + で、しかも + Frase$$,
    $$しかも$$,
    $$しかも$$,
    ARRAY['しかも']::text[],
    ARRAY['しかも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-140', $$この店はおいしい。しかも安い。$$, $$このみせはおいしい。しかもやすい。$$, $$Esta loja é gostosa. E, além disso, barata.$$),
    ('n2-grammar-140', $$彼は頭がよくて、しかもスポーツも得意だ。$$, $$かれはあたまがよくて、しかもスポーツもとくいだ。$$, $$Ele é inteligente e ainda é bom em esportes.$$),
    ('n2-grammar-140', $$雨が降ってきた。しかも雷まで鳴っている。$$, $$あめがふってきた。しかもかみなりまでなっている。$$, $$Começou a chover. E ainda por cima está trovejando.$$),
    ('n2-grammar-140', $$この部屋は広くて、しかも駅から近い。$$, $$このへやはひろくて、しかもえきからちかい。$$, $$Este quarto é espaçoso e, além disso, perto da estação.$$),
    ('n2-grammar-140', $$彼は試験に合格した。しかも一番の成績で。$$, $$かれはしけんにごうかくした。しかもいちばんのせいせきで。$$, $$Ele passou na prova. E com a melhor nota.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このパソコンは軽い。____バッテリーも長持ちする。$$, $$Este computador é leve. Além disso, a bateria dura bastante.$$),
        (2, $$彼女は美人で、____優しい。$$, $$Ela é bonita e ainda por cima gentil.$$),
        (3, $$道に迷った。____携帯の電池も切れた。$$, $$Me perdi. E ainda por cima a bateria do celular acabou.$$),
        (4, $$このホテルは安くて、____朝食付きだ。$$, $$Este hotel é barato e, além disso, inclui café da manhã.$$),
        (5, $$彼は遅刻した。____宿題も忘れた。$$, $$Ele se atrasou. E ainda esqueceu a lição de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しかも$$),
        (2, $$しかも$$),
        (3, $$しかも$$),
        (4, $$しかも$$),
        (5, $$しかも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
