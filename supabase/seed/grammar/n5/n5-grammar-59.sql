-- n5-grammar-59 — 〜をください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-59',
    'grammar',
    'N5',
    $$〜をください$$,
    $$o kudasai$$,
    $$Me dê... / Quero... (por favor)$$,
    $$をください é usado para pedir uma coisa a alguém. Equivale a "me dê..., por favor" ou "quero...".

A coisa pedida vem antes de を, e ください é a forma educada de pedir. É a forma mais simples e comum de pedir algo em lojas, restaurantes e no dia a dia.

Para dizer a quantidade, o número com contador vem depois de を e antes de ください. Assim, a ordem fica: coisa + を + quantidade + ください.

Também é possível pedir coisas abstratas, como tempo, um momento ou uma resposta.$$,
    $$Na fala, é muito comum omitir を e dizer só a coisa + ください.

Em restaurantes, também se usa お願いします no lugar de ください, o que soa um pouco mais educado.

Não confunda com てください, que vem depois de um verbo e pede para alguém fazer uma ação. をください pede uma coisa.$$,
    $$Substantivo + を + ください
Substantivo + を + Quantidade + ください
Substantivo A + を + Quantidade + と + Substantivo B + を + Quantidade + ください$$,
    $$をください$$,
    $$をください|ください$$,
    ARRAY['を', 'ください']::text[],
    ARRAY['をください', 'ください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-59', $$水をください。$$, $$みずをください。$$, $$Me dê água, por favor.$$),
    ('n5-grammar-59', $$このりんごを三つください。$$, $$このりんごをみっつください。$$, $$Me dê três destas maçãs, por favor.$$),
    ('n5-grammar-59', $$すみません、メニューをください。$$, $$すみません、メニューをください。$$, $$Com licença, me traga o cardápio, por favor.$$),
    ('n5-grammar-59', $$コーヒーを一つとケーキを二つください。$$, $$コーヒーをひとつとケーキをふたつください。$$, $$Um café e dois bolos, por favor.$$),
    ('n5-grammar-59', $$少し時間をください。$$, $$すこしじかんをください。$$, $$Me dê um pouco de tempo, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、お茶____。$$, $$Com licença, me dê um chá, por favor.$$),
        (2, $$郵便局で切手を五枚____。$$, $$No correio: me dê cinco selos, por favor.$$),
        (3, $$この赤いシャツ____。$$, $$Quero esta camisa vermelha, por favor.$$),
        (4, $$もう少し考える時間____。$$, $$Me dê um pouco mais de tempo para pensar, por favor.$$),
        (5, $$「ご注文は？」「ラーメンを一つ____。」$$, $$"O que vai pedir?" "Um ramen, por favor."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をください$$),
        (2, $$ください$$),
        (3, $$をください$$),
        (4, $$をください$$),
        (5, $$ください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
