-- n5-grammar-39 — 〜ないでください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-39',
    'grammar',
    'N5',
    $$〜ないでください$$,
    $$naide kudasai$$,
    $$Não faça... / Por favor não... / Evite...$$,
    $$ないでください é usado para pedir educadamente que alguém não faça alguma coisa. Equivale a "por favor, não...".

Ele é formado pela forma ない do verbo, seguida de でください. É o oposto de てください, que pede para fazer algo.

É muito usado em avisos, regras, instruções e pedidos do dia a dia. Também aparece em frases de cuidado e gentileza, como "não se preocupe" e "não se esqueça".

Na fala informal, entre amigos e família, ください costuma ser omitido, e a frase termina só com ないで, muitas vezes com ね ou よ para suavizar.$$,
    $$Mesmo sendo educado, ないでください é um pedido direto. Com superiores, os japoneses costumam suavizar com explicações antes, como dizer o motivo com から.

A expressão 心配しないでください é uma das mais comuns e serve para tranquilizar alguém.

Em placas e avisos escritos, também é comum ver formas mais curtas e firmes, mas na conversa ないでください é a forma padrão.$$,
    $$Verbo na forma ない + でください (educado)
Verbo na forma ない + で (informal)
Verbo na forma ない + でね / でよ (informal, mais suave)$$,
    $$ないでください$$,
    $$ないでください|ないで。|ないでね|ないでよ$$,
    ARRAY['ない', 'で', 'ください']::text[],
    ARRAY['ないでください', 'ないで', 'ないでね', 'ないでよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-39', $$ここで写真を撮らないでください。$$, $$ここでしゃしんをとらないでください。$$, $$Por favor, não tire fotos aqui.$$),
    ('n5-grammar-39', $$心配しないでください。$$, $$しんぱいしないでください。$$, $$Não se preocupe.$$),
    ('n5-grammar-39', $$授業中に話さないでください。$$, $$じゅぎょうちゅうにはなさないでください。$$, $$Por favor, não converse durante a aula.$$),
    ('n5-grammar-39', $$このことは誰にも言わないでね。$$, $$このことはだれにもいわないでね。$$, $$Não conte isso para ninguém, tá?$$),
    ('n5-grammar-39', $$明日の約束を忘れないでください。$$, $$あしたのやくそくをわすれないでください。$$, $$Não se esqueça do compromisso de amanhã, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここに車を止め____。$$, $$Por favor, não estacione aqui.$$),
        (2, $$危ないですから、押さ____。$$, $$É perigoso, então não empurre, por favor.$$),
        (3, $$図書館で食べ物を食べ____。$$, $$Por favor, não coma na biblioteca.$$),
        (4, $$まだ帰ら____。$$, $$Não vá embora ainda, por favor.$$),
        (5, $$泣か____よ。$$, $$Não chore.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないでください$$),
        (2, $$ないでください$$),
        (3, $$ないでください$$),
        (4, $$ないでください$$),
        (4, $$ないで$$),
        (5, $$ないで$$),
        (5, $$ないでください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
