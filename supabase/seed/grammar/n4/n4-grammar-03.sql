-- n4-grammar-03 — あまり〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-03',
    'grammar',
    'N4',
    $$あまり〜ない$$,
    $$amari ~ nai$$,
    $$Não muito / Quase não$$,
    $$あまり〜ない é usado para dizer que algo acontece pouco ou que uma característica não é forte. Equivale a "não muito" ou "quase não".

あまり sozinho não é negativo, mas, nesse uso, ele sempre aparece junto com uma forma negativa: verbo na forma ない ou ません, adjetivo い com くない, ou adjetivo な e substantivo com じゃない.

Com verbos, indica frequência baixa, como "não vejo muito" ou "quase não bebo". Com adjetivos, indica intensidade baixa, como "não é muito caro".

É uma forma suave de negar. Em vez de dizer que algo é ruim ou que você não gosta, あまり〜ない suaviza a frase, e por isso é muito usado por educação.$$,
    $$Na fala, あまり muitas vezes vira あんまり, com o mesmo sentido.

Em frases afirmativas, あまり tem outro sentido: "demais", como em あまりにも. Esse uso aparece em níveis seguintes.

Para dizer "nunca" ou "nada", o japonês usa 全然〜ない, que é mais forte que あまり〜ない.$$,
    $$あまり + Verbo na forma ない / ません
あまり + Adjetivo い sem い + くない
あまり + Adjetivo な / Substantivo + じゃない / ではありません

Forma falada: あんまり$$,
    $$あまり$$,
    $$あまり|あんまり$$,
    ARRAY['あまり', 'ない']::text[],
    ARRAY['あまり', 'あんまり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-03', $$私はあまりテレビを見ません。$$, $$わたしはあまりテレビをみません。$$, $$Eu não vejo muita TV.$$),
    ('n4-grammar-03', $$この料理はあまり辛くないです。$$, $$このりょうりはあまりからくないです。$$, $$Esta comida não é muito apimentada.$$),
    ('n4-grammar-03', $$今日はあまり時間がない。$$, $$きょうはあまりじかんがない。$$, $$Hoje não tenho muito tempo.$$),
    ('n4-grammar-03', $$昨日の映画はあんまりおもしろくなかった。$$, $$きのうのえいがはあんまりおもしろくなかった。$$, $$O filme de ontem não foi muito interessante.$$),
    ('n4-grammar-03', $$日本語はまだあまり上手じゃありません。$$, $$にほんごはまだあまりじょうずじゃありません。$$, $$Meu japonês ainda não é muito bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は____お酒を飲みません。$$, $$Meu irmão mais velho quase não bebe.$$),
        (2, $$この町は____にぎやかではありません。$$, $$Esta cidade não é muito animada.$$),
        (3, $$最近、____寝ていません。$$, $$Ultimamente, não tenho dormido muito.$$),
        (4, $$「旅行はどうでしたか。」「____楽しくなかったです。」$$, $$"Como foi a viagem?" "Não foi muito divertida."$$),
        (5, $$甘い物は____好きじゃない。$$, $$Não gosto muito de doces.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまり$$),
        (1, $$あんまり$$),
        (2, $$あまり$$),
        (2, $$あんまり$$),
        (3, $$あまり$$),
        (3, $$あんまり$$),
        (4, $$あまり$$),
        (4, $$あんまり$$),
        (5, $$あまり$$),
        (5, $$あんまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
