-- n1-grammar-118 — 〜に難くない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-118',
    'grammar',
    'N1',
    $$〜に難くない$$,
    $$ni kataku nai$$,
    $$Não é difícil de / É fácil de / Compreende-se facilmente$$,
    $$に難くない indica que algo é fácil de imaginar ou compreender, com base na situação. Equivale a "não é difícil de..." ou "é fácil de...".

Costuma vir com verbos como imaginar, compreender e supor. Por exemplo, "não é difícil imaginar como ela se sentiu".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 想像に難くない, 理解するに難くない e 察するに難くない.

É bem mais formal que 簡単に想像できる.$$,
    $$Verbo (forma dicionário) + に難くない
Substantivo (ação) + に難くない$$,
    $$に難くない$$,
    $$に難くない|にかたくない|に難くありません$$,
    ARRAY['に', '難く', 'ない']::text[],
    ARRAY['に難くない', 'にかたくない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-118', $$彼女の悲しみは想像に難くない。$$, $$かのじょのかなしみはそうぞうにかたくない。$$, $$Não é difícil imaginar a tristeza dela.$$),
    ('n1-grammar-118', $$親の苦労は察するに難くない。$$, $$おやのくろうはさっするにかたくない。$$, $$É fácil compreender o sofrimento dos pais.$$),
    ('n1-grammar-118', $$彼が怒った理由は理解するに難くない。$$, $$かれがおこったりゆうはりかいするにかたくない。$$, $$Não é difícil entender por que ele ficou bravo.$$),
    ('n1-grammar-118', $$このままでは会社が倒産することは、予想に難くない。$$, $$このままではかいしゃがとうさんすることは、よそうにかたくない。$$, $$Não é difícil prever que, do jeito que está, a empresa vai falir.$$),
    ('n1-grammar-118', $$一人で子供を育てる大変さは、想像に難くない。$$, $$ひとりでこどもをそだてるたいへんさは、そうぞうにかたくない。$$, $$Não é difícil imaginar o quanto é difícil criar um filho sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝した選手の喜びは想像____。$$, $$Não é difícil imaginar a alegria do atleta campeão.$$),
        (2, $$事故にあった家族の気持ちは察する____。$$, $$É fácil compreender o sentimento da família que sofreu o acidente.$$),
        (3, $$彼の努力が実を結ぶことは予想____。$$, $$Não é difícil prever que o esforço dele vai dar frutos.$$),
        (4, $$そんな生活が苦しいことは想像____。$$, $$Não é difícil imaginar que uma vida assim seja dura.$$),
        (5, $$彼女が反対する理由は理解する____。$$, $$Não é difícil entender por que ela é contra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に難くない$$),
        (1, $$にかたくない$$),
        (2, $$に難くない$$),
        (2, $$にかたくない$$),
        (3, $$に難くない$$),
        (3, $$にかたくない$$),
        (4, $$に難くない$$),
        (4, $$にかたくない$$),
        (5, $$に難くない$$),
        (5, $$にかたくない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
