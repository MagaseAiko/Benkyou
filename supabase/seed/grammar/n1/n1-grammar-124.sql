-- n1-grammar-124 — 〜にして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-124',
    'grammar',
    'N1',
    $$〜にして$$,
    $$ni shite$$,
    $$Só mesmo / Justamente por ser / Já aos$$,
    $$にして tem alguns usos formais.

O primeiro indica que algo só é possível por causa de uma pessoa com nível muito alto. Equivale a "só mesmo". Por exemplo, "só mesmo um gênio como ele conseguiria isso".

O segundo indica uma idade ou momento em que algo acontece, muitas vezes com surpresa. Equivale a "já aos" ou "só aos". Por exemplo, "só aos quarenta anos ele se casou".

Também aparece em expressões fixas, como 一瞬にして, "num instante".$$,
    $$Expressões comuns são 一瞬にして, 一夜にして, 四十にして e この親にしてこの子あり.

Também pode indicar duas qualidades ao mesmo tempo, como 医者にして作家, "médico e escritor".$$,
    $$Substantivo (pessoa de alto nível) + にして + はじめて / ようやく
Número (idade / tempo) + にして + Frase
Substantivo + にして + Substantivo (ao mesmo tempo)$$,
    $$にして$$,
    $$にして$$,
    ARRAY['に', 'して']::text[],
    ARRAY['にして', 'にしてはじめて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-124', $$彼のような天才にしてはじめてできることだ。$$, $$かれのようなてんさいにしてはじめてできることだ。$$, $$É algo que só mesmo um gênio como ele consegue fazer.$$),
    ('n1-grammar-124', $$彼は四十歳にしてようやく結婚した。$$, $$かれはよんじゅっさいにしてようやくけっこんした。$$, $$Ele só se casou aos quarenta anos.$$),
    ('n1-grammar-124', $$家は一瞬にして火に包まれた。$$, $$いえはいっしゅんにしてひにつつまれた。$$, $$A casa foi tomada pelas chamas num instante.$$),
    ('n1-grammar-124', $$この親にしてこの子ありだ。$$, $$このおやにしてこのこありだ。$$, $$Tal pai, tal filho.$$),
    ('n1-grammar-124', $$彼は医者にして、有名な作家でもある。$$, $$かれはいしゃにして、ゆうめいなさっかでもある。$$, $$Ele é médico e, ao mesmo tempo, um escritor famoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$町は一夜____廃墟になった。$$, $$A cidade virou ruínas da noite para o dia.$$),
        (2, $$彼女は二十歳____社長になった。$$, $$Ela se tornou presidente de empresa já aos vinte anos.$$),
        (3, $$ベテランの彼____はじめて解決できる問題だ。$$, $$É um problema que só mesmo ele, veterano, consegue resolver.$$),
        (4, $$財産は一瞬____消えた。$$, $$A fortuna sumiu num instante.$$),
        (5, $$六十歳____初めて海外旅行をした。$$, $$Só aos sessenta anos viajei para o exterior pela primeira vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にして$$),
        (2, $$にして$$),
        (3, $$にして$$),
        (4, $$にして$$),
        (5, $$にして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
