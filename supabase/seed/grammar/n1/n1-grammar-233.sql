-- n1-grammar-233 — 〜わ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-233',
    'grammar',
    'N1',
    $$〜わ$$,
    $$wa$$,
    $$Viu / Hein / Ora$$,
    $$わ, no fim da frase, é uma partícula que dá ênfase leve ou mostra emoção, como surpresa ou decisão. Equivale a "viu", "hein" ou "ora".

No japonês padrão, é usada principalmente por mulheres, de forma suave. No dialeto de Kansai, é usada por todos, com um tom mais forte.

Também aparece como わよ e わね, para chamar a atenção do outro ou buscar concordância.$$,
    $$No japonês padrão, soa feminino e um pouco antiquado.

No dialeto de Kansai, é muito comum, como em 行くわ ou ええわ.

Não se usa em situações formais.$$,
    $$Frase (forma simples) + わ
Frase + わよ / わね$$,
    $$わ$$,
    $$わ。|わよ|わね$$,
    ARRAY['わ']::text[],
    ARRAY['わ', 'わよ', 'わね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-233', $$もう帰るわ。$$, $$もうかえるわ。$$, $$Já vou embora, viu.$$),
    ('n1-grammar-233', $$この服、すてきだわ。$$, $$このふく、すてきだわ。$$, $$Esta roupa é linda, hein.$$),
    ('n1-grammar-233', $$私も行きたいわね。$$, $$わたしもいきたいわね。$$, $$Eu também quero ir, né.$$),
    ('n1-grammar-233', $$それは知らなかったわ。$$, $$それはしらなかったわ。$$, $$Isso eu não sabia, ora.$$),
    ('n1-grammar-233', $$早く来ないと、置いていくわよ。$$, $$はやくこないと、おいていくわよ。$$, $$Se não vier logo, vou te deixar para trás, viu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日はとても疲れた____。$$, $$Hoje estou muito cansada, viu.$$),
        (2, $$あら、雨が降ってきた____。$$, $$Ah, começou a chover, hein.$$),
        (3, $$この料理、おいしい____ね。$$, $$Esta comida está gostosa, né.$$),
        (4, $$遅れたら、先生に怒られる____よ。$$, $$Se se atrasar, o professor vai brigar, viu.$$),
        (5, $$じゃあ、私が行く____。$$, $$Então eu vou, ora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-233', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わ$$),
        (2, $$わ$$),
        (3, $$わ$$),
        (4, $$わ$$),
        (5, $$わ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
