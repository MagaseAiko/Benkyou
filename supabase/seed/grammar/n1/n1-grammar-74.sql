-- n1-grammar-74 — まるっきり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-74',
    'grammar',
    'N1',
    $$まるっきり$$,
    $$marukkiri$$,
    $$Totalmente / Completamente / Nada$$,
    $$まるっきり indica algo total ou completo. Equivale a "totalmente" ou "completamente".

Muitas vezes vem com formas negativas, com o sentido de "nada" ou "nem um pouco". Por exemplo, "não entendi nada".

É uma forma coloquial de まるで e まったく.$$,
    $$É mais coloquial que まったく e 全然.

Também pode ser usado em frases afirmativas, como まるっきり違う, "totalmente diferente".$$,
    $$まるっきり + Verbo (forma ない)
まるっきり + Adjetivo / Substantivo$$,
    $$まるっきり$$,
    $$まるっきり|まるきり$$,
    ARRAY['まるっきり']::text[],
    ARRAY['まるっきり', 'まるきり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-74', $$彼の話はまるっきりわからなかった。$$, $$かれのはなしはまるっきりわからなかった。$$, $$Não entendi nada do que ele disse.$$),
    ('n1-grammar-74', $$この二つはまるっきり違う。$$, $$このふたつはまるっきりちがう。$$, $$Estas duas coisas são totalmente diferentes.$$),
    ('n1-grammar-74', $$私は料理がまるっきりだめだ。$$, $$わたしはりょうりがまるっきりだめだ。$$, $$Sou completamente negado na cozinha.$$),
    ('n1-grammar-74', $$彼はまるっきり子供みたいだ。$$, $$かれはまるっきりこどもみたいだ。$$, $$Ele parece totalmente uma criança.$$),
    ('n1-grammar-74', $$昨日のことはまるっきり覚えていない。$$, $$きのうのことはまるっきりおぼえていない。$$, $$Não me lembro de nada de ontem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その問題は____解けなかった。$$, $$Não consegui resolver nada daquele problema.$$),
        (2, $$写真と実物は____違う。$$, $$A foto e o produto real são totalmente diferentes.$$),
        (3, $$彼女の言うことは____うそだった。$$, $$O que ela disse era totalmente mentira.$$),
        (4, $$私は運動が____苦手だ。$$, $$Sou completamente ruim em esportes.$$),
        (5, $$この町は昔と____変わってしまった。$$, $$Esta cidade mudou completamente em relação ao passado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まるっきり$$),
        (1, $$まるきり$$),
        (2, $$まるっきり$$),
        (2, $$まるきり$$),
        (3, $$まるっきり$$),
        (3, $$まるきり$$),
        (4, $$まるっきり$$),
        (4, $$まるきり$$),
        (5, $$まるっきり$$),
        (5, $$まるきり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
