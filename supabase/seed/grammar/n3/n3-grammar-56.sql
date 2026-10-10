-- n3-grammar-56 — まさか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-56',
    'grammar',
    'N3',
    $$まさか$$,
    $$masaka$$,
    $$Não pode ser / Jamais imaginei que / Será possível$$,
    $$まさか é usado para expressar forte surpresa ou descrença diante de algo inesperado. Equivale a "não pode ser!", "jamais imaginei que..." ou "será possível?".

Ele tem dois usos principais. O primeiro é com とは思わなかった ou なんて, para dizer que algo que aconteceu era totalmente inesperado: "jamais imaginei que ele fosse o culpado".

O segundo é para negar a possibilidade de algo, com はずがない ou ないだろう: "não é possível que...".

Sozinho, como reação, まさか! significa "não acredito!" ou "não pode ser!".

O tom é emocional e mostra que a pessoa achava aquilo improvável ou impossível.$$,
    $$A expressão まさかの + Substantivo, como まさかの結果, significa "um resultado inesperado" e é comum em manchetes.

Em situações de emergência, まさかの時 significa "em caso de imprevisto".

まさか tem um tom parecido com "você está brincando?" em conversas informais.$$,
    $$まさか + Frase + とは思わなかった (jamais imaginei)
まさか + Frase + なんて (não acredito que...)
まさか + … + はずがない / ないだろう (não é possível que)
まさか！ (reação: não pode ser!)$$,
    $$まさか$$,
    $$まさか$$,
    ARRAY['まさか']::text[],
    ARRAY['まさか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-56', $$まさか彼が犯人だとは思わなかった。$$, $$まさかかれがはんにんだとはおもわなかった。$$, $$Jamais imaginei que ele fosse o culpado.$$),
    ('n3-grammar-56', $$まさか、そんなはずはない。$$, $$まさか、そんなはずはない。$$, $$Não pode ser, isso não é possível.$$),
    ('n3-grammar-56', $$まさか一位になるとは思わなかった。$$, $$まさかいちいになるとはおもわなかった。$$, $$Nunca imaginei que fosse ficar em primeiro lugar.$$),
    ('n3-grammar-56', $$「彼、会社をやめたよ。」「まさか！」$$, $$「かれ、かいしゃをやめたよ。」「まさか！」$$, $$"Ele saiu da empresa." "Não acredito!"$$),
    ('n3-grammar-56', $$まさか雨が降るなんて、思っていなかった。$$, $$まさかあめがふるなんて、おもっていなかった。$$, $$Jamais pensei que fosse chover.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____こんなところで会うとは思わなかった。$$, $$Jamais imaginei que fosse te encontrar num lugar destes.$$),
        (2, $$「田中さんが結婚したって。」「____！」$$, $$"Dizem que o Tanaka se casou." "Não pode ser!"$$),
        (3, $$あんなに勉強したのに、____試験に落ちるとは思わなかった。$$, $$Estudei tanto que jamais imaginei que fosse ser reprovado.$$),
        (4, $$____あの優しい人がそんなことを言うはずがない。$$, $$Não é possível que aquela pessoa tão gentil tenha dito isso.$$),
        (5, $$____宝くじが当たるなんて、信じられない。$$, $$Ganhar na loteria? Não dá para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まさか$$),
        (2, $$まさか$$),
        (3, $$まさか$$),
        (4, $$まさか$$),
        (5, $$まさか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
