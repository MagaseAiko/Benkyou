-- n3-grammar-32 — 〜一方だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-32',
    'grammar',
    'N3',
    $$〜一方だ$$,
    $$ippou da$$,
    $$Só aumentar / Só piorar / Continuar cada vez mais$$,
    $$一方だ é usado para dizer que uma situação muda continuamente em uma única direção, sem parar. Equivale a "só aumenta", "só piora" ou "fica cada vez mais...".

Ele vem depois do verbo na forma de dicionário, geralmente verbos de mudança, como 増える (aumentar), 減る (diminuir), 上がる (subir), 悪くなる (piorar).

O tom costuma ser negativo, indicando preocupação com uma tendência que não para, como preços que só sobem ou uma doença que só piora.

一方 significa "um lado só" ou "uma direção". Por isso, a ideia é que a mudança segue sempre o mesmo caminho.$$,
    $$一方だ é diferente de 一方で, que aparece no N2 e significa "por outro lado".

Em notícias e textos sobre economia e sociedade, 一方だ é muito usado para descrever tendências.

Para mudanças positivas, também é possível usar, mas o tom de preocupação é o mais comum.$$,
    $$Verbo de mudança (forma de dicionário) + 一方だ / 一方です
Passado: 一方だった
Contraste: 一方なのに$$,
    $$一方だ$$,
    $$一方だ|一方です|一方な|一方だった$$,
    ARRAY['一方', 'だ']::text[],
    ARRAY['一方だ', '一方です', '一方だった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-32', $$最近、物価は上がる一方だ。$$, $$さいきん、ぶっかはあがるいっぽうだ。$$, $$Ultimamente, os preços só sobem.$$),
    ('n3-grammar-32', $$彼の病気は悪くなる一方です。$$, $$かれのびょうきはわるくなるいっぽうです。$$, $$A doença dele só piora.$$),
    ('n3-grammar-32', $$この町の人口は減る一方だ。$$, $$このまちのじんこうはへるいっぽうだ。$$, $$A população desta cidade só diminui.$$),
    ('n3-grammar-32', $$仕事は増える一方なのに、給料は上がらない。$$, $$しごとはふえるいっぽうなのに、きゅうりょうはあがらない。$$, $$O trabalho só aumenta, mas o salário não sobe.$$),
    ('n3-grammar-32', $$夜になって、雨は強くなる一方だった。$$, $$よるになって、あめはつよくなるいっぽうだった。$$, $$À noite, a chuva só ficava mais forte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$カードを使いすぎて、借金は増える____。$$, $$Usei demais o cartão, e a dívida só aumenta.$$),
        (2, $$この町を訪れる外国人観光客は増える____。$$, $$Os turistas estrangeiros que visitam esta cidade só aumentam.$$),
        (3, $$夏になって、気温は上がる____です。$$, $$Com a chegada do verão, a temperatura só sobe.$$),
        (4, $$けんかの後、彼との関係は悪くなる____だった。$$, $$Depois da briga, a relação com ele só piorava.$$),
        (5, $$日本の子供の数は減る____。$$, $$O número de crianças no Japão só diminui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一方だ$$),
        (1, $$一方です$$),
        (2, $$一方だ$$),
        (2, $$一方です$$),
        (3, $$一方$$),
        (4, $$一方$$),
        (5, $$一方だ$$),
        (5, $$一方です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
