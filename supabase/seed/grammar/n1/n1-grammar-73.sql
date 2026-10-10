-- n1-grammar-73 — 〜まみれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-73',
    'grammar',
    'N1',
    $$〜まみれ$$,
    $$mamire$$,
    $$Coberto de / Cheio de / Todo sujo de$$,
    $$まみれ indica que algo está completamente coberto por algo sujo ou desagradável, como lama, suor, sangue ou poeira. Equivale a "coberto de" ou "todo sujo de".

Por exemplo, "as crianças voltaram cobertas de lama".

Também pode ser usado de forma figurada, como "cheio de dívidas" ou "cheio de erros".$$,
    $$Combinações comuns são 泥まみれ, 汗まみれ, 血まみれ, ほこりまみれ e 借金まみれ.

É parecido com だらけ, mas まみれ indica que algo está coberto na superfície.$$,
    $$Substantivo + まみれ
Substantivo + まみれ + の + Substantivo
Substantivo + まみれ + に + なる$$,
    $$まみれ$$,
    $$まみれ$$,
    ARRAY['まみれ']::text[],
    ARRAY['まみれ', 'まみれの', 'まみれになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-73', $$子供たちは泥まみれになって遊んでいた。$$, $$こどもたちはどろまみれになってあそんでいた。$$, $$As crianças brincavam cobertas de lama.$$),
    ('n1-grammar-73', $$一日中働いて、汗まみれになった。$$, $$いちにちじゅうはたらいて、あせまみれになった。$$, $$Trabalhei o dia todo e fiquei encharcado de suor.$$),
    ('n1-grammar-73', $$古い本はほこりまみれだった。$$, $$ふるいほんはほこりまみれだった。$$, $$Os livros velhos estavam cobertos de poeira.$$),
    ('n1-grammar-73', $$彼は借金まみれの生活をしている。$$, $$かれはしゃっきんまみれのせいかつをしている。$$, $$Ele vive cheio de dívidas.$$),
    ('n1-grammar-73', $$けがをした選手は血まみれだった。$$, $$けがをしたせんしゅはちまみれだった。$$, $$O atleta ferido estava coberto de sangue.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の中のサッカーで、ユニフォームが泥____になった。$$, $$No futebol debaixo de chuva, o uniforme ficou coberto de lama.$$),
        (2, $$引っ越しの作業で、ほこり____になった。$$, $$Com a mudança, fiquei coberto de poeira.$$),
        (3, $$マラソンを走り終えた彼は、汗____だった。$$, $$Ao terminar a maratona, ele estava encharcado de suor.$$),
        (4, $$油____の手で、機械を直していた。$$, $$Consertava a máquina com as mãos cobertas de óleo.$$),
        (5, $$その政治家は、うそ____だ。$$, $$Aquele político está cheio de mentiras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まみれ$$),
        (2, $$まみれ$$),
        (3, $$まみれ$$),
        (4, $$まみれ$$),
        (5, $$まみれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
