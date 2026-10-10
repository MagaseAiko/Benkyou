-- n4-grammar-71 — 〜さ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-71',
    'grammar',
    'N4',
    $$〜さ$$,
    $$sa$$,
    $$Grau de / Qualidade de (substantivação)$$,
    $$さ é um sufixo que transforma adjetivos em substantivos. Ele indica o grau ou a medida de uma característica. Por exemplo, 高い (alto) vira 高さ (altura), e 重い (pesado) vira 重さ (peso).

Com adjetivos い, tira-se o い e acrescenta-se さ. Com adjetivos な, basta acrescentar さ, sem な.

O substantivo formado pode ser usado como qualquer outro, com partículas como は, が, を e に.

Ele é muito usado para falar de medidas, como altura, profundidade e tamanho, e também de qualidades abstratas, como gentileza, importância e beleza.$$,
    $$Existe também o sufixo み, que forma substantivos a partir de alguns adjetivos, como 甘み e 楽しみ. A diferença é que さ indica grau ou medida, enquanto み indica a sensação ou o aspecto percebido.

さ pode ser usado com quase todos os adjetivos, enquanto み é usado com poucos.

Para perguntar uma medida, é comum usar どのくらい, como em "qual é a altura?".$$,
    $$Adjetivo い sem い + さ (高い → 高さ / 重い → 重さ)
Adjetivo な + さ (大切 → 大切さ / 静か → 静かさ)
Exceção: いい → よさ$$,
    $$さ$$,
    $$さが|さは|さを|さに|さで|さの|さです$$,
    ARRAY['さ']::text[],
    ARRAY['さ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-71', $$富士山の高さは三千七百七十六メートルです。$$, $$ふじさんのたかさはさんぜんななひゃくななじゅうろくメートルです。$$, $$A altura do Monte Fuji é de três mil setecentos e setenta e seis metros.$$),
    ('n4-grammar-71', $$この箱の重さを測ってください。$$, $$このはこのおもさをはかってください。$$, $$Meça o peso desta caixa, por favor.$$),
    ('n4-grammar-71', $$彼女の優しさに感動しました。$$, $$かのじょのやさしさにかんどうしました。$$, $$Fiquei emocionado com a gentileza dela.$$),
    ('n4-grammar-71', $$健康の大切さは、病気になってわかる。$$, $$けんこうのたいせつさは、びょうきになってわかる。$$, $$A importância da saúde a gente só entende quando fica doente.$$),
    ('n4-grammar-71', $$この部屋の広さはどのくらいですか。$$, $$このへやのひろさはどのくらいですか。$$, $$Qual é o tamanho deste quarto?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この川の深____はどのくらいですか。$$, $$Qual é a profundidade deste rio?$$),
        (2, $$日本の夏の暑____にはもう慣れました。$$, $$Já me acostumei com o calor do verão japonês.$$),
        (3, $$母の料理のおいし____は忘れられない。$$, $$Não consigo esquecer o sabor da comida da minha mãe.$$),
        (4, $$失敗して、友達の大切____がわかった。$$, $$Depois de errar, entendi a importância dos amigos.$$),
        (5, $$このかばんの大き____がちょうどいい。$$, $$O tamanho desta bolsa é perfeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さ$$),
        (2, $$さ$$),
        (3, $$さ$$),
        (4, $$さ$$),
        (5, $$さ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
