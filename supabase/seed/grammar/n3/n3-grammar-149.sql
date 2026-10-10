-- n3-grammar-149 — 〜とおりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-149',
    'grammar',
    'N3',
    $$〜とおりに$$,
    $$toori ni$$,
    $$Do jeito que / Conforme / Exatamente como$$,
    $$とおりに é usado para dizer que algo é feito exatamente como foi indicado, dito, mostrado ou planejado. Equivale a "do jeito que", "conforme" ou "exatamente como".

Ele vem depois de verbos (na forma de dicionário ou た) e de substantivos com の. Com substantivos, também existe a forma どおりに, sem の, como em 予定どおりに (conforme o planejado).

Por exemplo, "monte conforme o manual", "fiz do jeito que o professor disse" ou "partimos conforme o planejado".

Sem に, とおり também aparece no começo de frases, como 思ったとおり ("como eu pensava"), indicando que algo aconteceu exatamente como se esperava.$$,
    $$Com substantivos, どおり (sem の) é muito comum em expressões como 予定どおり, 計画どおり e 時間どおり.

A expressão おっしゃるとおりです ("é exatamente como o senhor diz") é uma forma educada de concordar.

Não confunda com 通り (とおり) de rua, como em 大通り (avenida).$$,
    $$Verbo (forma de dicionário / た) + とおりに + Verbo
Substantivo + の + とおりに + Verbo
Substantivo + どおりに + Verbo (予定どおりに / 計画どおりに)
思ったとおり、 + Frase (como eu pensava)

Escrita: とおり / 通り$$,
    $$とおりに$$,
    $$とおりに|通りに|どおりに|とおり|通り$$,
    ARRAY['とおり', 'に']::text[],
    ARRAY['とおりに', '通りに', 'どおりに', 'とおり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-149', $$説明書のとおりに組み立ててください。$$, $$せつめいしょのとおりにくみたててください。$$, $$Monte conforme o manual, por favor.$$),
    ('n3-grammar-149', $$先生が言ったとおりにやってみた。$$, $$せんせいがいったとおりにやってみた。$$, $$Tentei fazer do jeito que o professor disse.$$),
    ('n3-grammar-149', $$飛行機は予定どおりに出発した。$$, $$ひこうきはよていどおりにしゅっぱつした。$$, $$O avião partiu conforme o planejado.$$),
    ('n3-grammar-149', $$思ったとおり、彼は来なかった。$$, $$おもったとおり、かれはこなかった。$$, $$Como eu pensava, ele não veio.$$),
    ('n3-grammar-149', $$私が書くとおりに書いてください。$$, $$わたしがかくとおりにかいてください。$$, $$Escreva exatamente como eu escrever, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地図の____行けば、駅に着きます。$$, $$Se seguir conforme o mapa, você chega à estação.$$),
        (2, $$母が教えてくれた____料理を作った。$$, $$Fiz a comida do jeito que minha mãe me ensinou.$$),
        (3, $$言われた____すれば、大丈夫です。$$, $$Se fizer do jeito que mandaram, vai dar tudo certo.$$),
        (4, $$仕事は計画____進んでいる。$$, $$O trabalho está avançando conforme o plano.$$),
        (5, $$見た____話してください。$$, $$Conte exatamente como você viu, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とおりに$$),
        (1, $$通りに$$),
        (2, $$とおりに$$),
        (2, $$通りに$$),
        (3, $$とおりに$$),
        (3, $$通りに$$),
        (4, $$どおりに$$),
        (4, $$通りに$$),
        (5, $$とおりに$$),
        (5, $$通りに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
