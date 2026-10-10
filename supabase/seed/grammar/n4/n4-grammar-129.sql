-- n4-grammar-129 — ぜひ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-129',
    'grammar',
    'N4',
    $$ぜひ$$,
    $$zehi$$,
    $$Sem falta / Com certeza / Por favor (insistindo)$$,
    $$ぜひ é um advérbio que expressa um desejo forte ou um convite sincero. Equivale a "sem falta", "com certeza" ou "por favor, não deixe de...".

Ele é usado com expressões de desejo, pedido ou convite, como たい, てほしい, てください e ませんか. Isso porque ぜひ fala de algo que a pessoa quer muito que aconteça.

Por exemplo, convidar alguém dizendo "venha nos visitar sem falta" ou dizer "quero muito ir ao Japão um dia".

Sozinho, como resposta, ぜひ significa "com certeza!" ou "eu adoraria!", aceitando um convite com entusiasmo.$$,
    $$ぜひ não combina com frases negativas nem com simples fatos. Ele precisa de desejo, pedido ou convite.

Em convites, ぜひ deixa claro que o convite é sincero, e não apenas por educação.

O kanji 是非 também é usado na expressão 是非とも, que é ainda mais enfática.$$,
    $$ぜひ + Verbo たい (querer muito)
ぜひ + Verbo て + ください (por favor, não deixe de...)
ぜひ + Verbo て + ほしい
ぜひ + Verbo ませんか
ええ、ぜひ (resposta: com certeza!)

Escrita: ぜひ / 是非$$,
    $$ぜひ$$,
    $$ぜひ|是非$$,
    ARRAY['ぜひ']::text[],
    ARRAY['ぜひ', '是非']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-129', $$今度、ぜひ遊びに来てください。$$, $$こんど、ぜひあそびにきてください。$$, $$Da próxima vez, venha nos visitar sem falta.$$),
    ('n4-grammar-129', $$一度ぜひ日本へ行きたいです。$$, $$いちどぜひにほんへいきたいです。$$, $$Quero muito ir ao Japão pelo menos uma vez.$$),
    ('n4-grammar-129', $$この映画はぜひ見てほしい。$$, $$このえいがはぜひみてほしい。$$, $$Quero muito que você veja este filme.$$),
    ('n4-grammar-129', $$「今度一緒に食事しませんか。」「ええ、ぜひ。」$$, $$「こんどいっしょにしょくじしませんか。」「ええ、ぜひ。」$$, $$"Vamos comer juntos da próxima vez?" "Claro, eu adoraria."$$),
    ('n4-grammar-129', $$ぜひ私に手伝わせてください。$$, $$ぜひわたしにてつだわせてください。$$, $$Por favor, deixe-me ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$京都に来たら、____この寺を見てください。$$, $$Se vier a Kyoto, não deixe de ver este templo.$$),
        (2, $$機会があれば、____富士山に登りたい。$$, $$Se tiver a oportunidade, quero muito subir o Monte Fuji.$$),
        (3, $$「パーティーに来ませんか。」「____行きたいです。」$$, $$"Quer vir à festa?" "Quero muito ir."$$),
        (4, $$この本はおもしろいから、____読んでみてください。$$, $$Este livro é interessante, então não deixe de ler.$$),
        (5, $$「また会いましょう。」「はい、____。」$$, $$"Vamos nos ver de novo." "Sim, com certeza."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぜひ$$),
        (2, $$ぜひ$$),
        (3, $$ぜひ$$),
        (4, $$ぜひ$$),
        (5, $$ぜひ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
