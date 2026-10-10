-- n3-grammar-33 — 一体
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-33',
    'grammar',
    'N3',
    $$一体$$,
    $$ittai$$,
    $$Afinal / Mas que / Diabos (ênfase em pergunta)$$,
    $$一体 é usado em perguntas para dar ênfase, mostrando surpresa, irritação, curiosidade forte ou confusão. Equivale a "afinal", "mas que..." ou "diabos" em perguntas como "o que diabos aconteceu?".

Ele sempre aparece junto com uma palavra interrogativa, como 何, 誰, どうして, いつ e どこ.

Também é usado em perguntas indiretas ou em frases de reflexão, como "não sei o que diabos ele está pensando".

O tom é forte e emocional. Por isso, deve ser usado com cuidado em situações formais, pois pode soar como uma cobrança.$$,
    $$Sozinho, 一体 também significa "um corpo" ou "uma unidade", como em 一体になる (tornar-se um só). Esse uso é diferente.

一体全体 é uma forma ainda mais enfática, com tom quase cômico.

Em textos literários, 一体 aparece em monólogos internos e momentos de surpresa.$$,
    $$一体 + Palavra interrogativa (何 / 誰 / どうして / いつ / どこ) + …か
一体 + … + のか、わからない (pergunta indireta)

Escrita: 一体 / いったい$$,
    $$一体$$,
    $$一体|いったい$$,
    ARRAY['一体']::text[],
    ARRAY['一体', 'いったい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-33', $$一体何が起きたんですか。$$, $$いったいなにがおきたんですか。$$, $$Afinal, o que aconteceu?$$),
    ('n3-grammar-33', $$こんな時間に一体誰だろう。$$, $$こんなじかんにいったいだれだろう。$$, $$Quem diabos será a esta hora?$$),
    ('n3-grammar-33', $$一体どうしてそんなことをしたの？$$, $$いったいどうしてそんなことをしたの？$$, $$Mas por que diabos você fez uma coisa dessas?$$),
    ('n3-grammar-33', $$彼は一体何を考えているのか、わからない。$$, $$かれはいったいなにをかんがえているのか、わからない。$$, $$Não sei o que diabos ele está pensando.$$),
    ('n3-grammar-33', $$この仕事は一体いつになったら終わるんだろう。$$, $$このしごとはいったいいつになったらおわるんだろう。$$, $$Quando é que, afinal, este trabalho vai terminar?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____ここはどこですか。$$, $$Afinal, onde estamos?$$),
        (2, $$そんなに慌てて、____何があったの？$$, $$Tão afobado assim, o que diabos aconteceu?$$),
        (3, $$____誰がこんなことをしたんだ。$$, $$Quem diabos fez uma coisa dessas?$$),
        (4, $$この問題は____どうすればいいんだろう。$$, $$Afinal, o que devo fazer com este problema?$$),
        (5, $$修理に____いくらかかるのか心配だ。$$, $$Estou preocupado com quanto, afinal, vai custar o conserto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一体$$),
        (1, $$いったい$$),
        (2, $$一体$$),
        (2, $$いったい$$),
        (3, $$一体$$),
        (3, $$いったい$$),
        (4, $$一体$$),
        (4, $$いったい$$),
        (5, $$一体$$),
        (5, $$いったい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
