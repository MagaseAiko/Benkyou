-- n2-grammar-69 — 〜ものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-69',
    'grammar',
    'N2',
    $$〜ものだ$$,
    $$mono da$$,
    $$É natural que / Costumava / Como é$$,
    $$ものだ tem alguns usos importantes.

O primeiro é falar de algo que é natural, uma verdade geral ou um costume. Equivale a "é natural que" ou "é assim que as coisas são". Por exemplo, "as pessoas mudam com o tempo".

O segundo é dar um conselho ou uma regra social, com o sentido de "deve-se". Por exemplo, "deve-se respeitar os mais velhos".

O terceiro, com a forma passada, é lembrar com nostalgia algo que se fazia com frequência. Equivale a "costumava". Por exemplo, "eu costumava brincar neste parque".

Também pode mostrar emoção ou surpresa, como "como o tempo passa rápido!".$$,
    $$Na fala, ものだ costuma virar もんだ.

Na forma negativa, ものではない significa "não se deve".

O uso de lembrança costuma vir com palavras como よく ou 昔は.$$,
    $$Verbo (forma dicionário) + ものだ (verdade geral / conselho)
Verbo (forma た) + ものだ (lembrança do passado)
Adjetivo い / Adjetivo な + な + ものだ (emoção)$$,
    $$ものだ$$,
    $$ものだ|もんだ|ものです$$,
    ARRAY['もの', 'だ']::text[],
    ARRAY['ものだ', 'もんだ', 'ものです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-69', $$子供のころは、よくこの川で泳いだものだ。$$, $$こどものころは、よくこのかわでおよいだものだ。$$, $$Quando criança, eu costumava nadar muito neste rio.$$),
    ('n2-grammar-69', $$人の心は変わるものだ。$$, $$ひとのこころはかわるものだ。$$, $$O coração das pessoas muda, é natural.$$),
    ('n2-grammar-69', $$年上の人には敬語を使うものです。$$, $$としうえのひとにはけいごをつかうものです。$$, $$Com pessoas mais velhas, deve-se usar linguagem respeitosa.$$),
    ('n2-grammar-69', $$時間がたつのは早いものだ。$$, $$じかんがたつのははやいものだ。$$, $$Como o tempo passa rápido.$$),
    ('n2-grammar-69', $$学生時代はよく徹夜したもんだ。$$, $$がくせいじだいはよくてつやしたもんだ。$$, $$Na época de estudante eu costumava virar a noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$若いころは、よく友達と旅行した____。$$, $$Quando jovem, eu costumava viajar muito com os amigos.$$),
        (2, $$約束は守る____。$$, $$Promessas devem ser cumpridas.$$),
        (3, $$お金はすぐになくなる____。$$, $$Dinheiro acaba rápido, é natural.$$),
        (4, $$昔はこの公園でよく遊んだ____。$$, $$Antigamente eu costumava brincar muito neste parque.$$),
        (5, $$人に会ったら挨拶をする____。$$, $$Quando se encontra alguém, deve-se cumprimentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだ$$),
        (1, $$もんだ$$),
        (2, $$ものだ$$),
        (2, $$ものです$$),
        (2, $$もんだ$$),
        (3, $$ものだ$$),
        (3, $$ものです$$),
        (3, $$もんだ$$),
        (4, $$ものだ$$),
        (4, $$もんだ$$),
        (5, $$ものだ$$),
        (5, $$ものです$$),
        (5, $$もんだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
