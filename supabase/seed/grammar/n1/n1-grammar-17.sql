-- n1-grammar-17 — 〜だろうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-17',
    'grammar',
    'N1',
    $$〜だろうに$$,
    $$darou ni$$,
    $$Teria sido / Provavelmente / Deve ser... mas$$,
    $$だろうに expressa uma suposição junto com um sentimento de pena, lamento ou empatia. Equivale a "teria sido..." ou "deve ser..., mas".

Tem dois usos comuns. O primeiro é imaginar uma situação diferente da real, com arrependimento, como "se tivesse estudado, teria passado". O segundo é imaginar o sentimento de outra pessoa com empatia, como "deve estar cansado, mas continua trabalhando".$$,
    $$Muitas vezes vem com ば ou たら, para falar de algo que não aconteceu.

É parecido com のに, mas だろうに inclui suposição.$$,
    $$Verbo / Adjetivo (forma simples) + だろうに
Frase com ば / たら + だろうに$$,
    $$だろうに$$,
    $$だろうに|でしょうに$$,
    ARRAY['だろう', 'に']::text[],
    ARRAY['だろうに', 'でしょうに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-17', $$もっと勉強していれば、合格できただろうに。$$, $$もっとべんきょうしていれば、ごうかくできただろうに。$$, $$Se tivesse estudado mais, teria passado.$$),
    ('n1-grammar-17', $$疲れているだろうに、彼は笑顔で働いている。$$, $$つかれているだろうに、かれはえがおではたらいている。$$, $$Ele deve estar cansado, mas trabalha sorrindo.$$),
    ('n1-grammar-17', $$言ってくれれば、手伝ったでしょうに。$$, $$いってくれれば、てつだったでしょうに。$$, $$Se tivesse me dito, eu teria ajudado.$$),
    ('n1-grammar-17', $$寒いだろうに、子供たちは外で遊んでいる。$$, $$さむいだろうに、こどもたちはそとであそんでいる。$$, $$Deve estar frio, mas as crianças estão brincando lá fora.$$),
    ('n1-grammar-17', $$早く出ていれば、間に合っただろうに。$$, $$はやくでていれば、まにあっただろうに。$$, $$Se tivesse saído mais cedo, teria dado tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$忙しい____、わざわざ来てくれてありがとう。$$, $$Você deve estar ocupado, obrigado por ter vindo mesmo assim.$$),
        (2, $$一言謝れば、許してもらえた____。$$, $$Se tivesse pedido desculpas, teria sido perdoado.$$),
        (3, $$辛かった____、彼女は何も言わなかった。$$, $$Deve ter sido duro, mas ela não disse nada.$$),
        (4, $$もう少し安ければ、買った____。$$, $$Se fosse um pouco mais barato, eu teria comprado.$$),
        (5, $$知っていれば、教えてあげた____。$$, $$Se eu soubesse, teria te contado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だろうに$$),
        (1, $$でしょうに$$),
        (2, $$だろうに$$),
        (2, $$でしょうに$$),
        (3, $$だろうに$$),
        (3, $$でしょうに$$),
        (4, $$だろうに$$),
        (4, $$でしょうに$$),
        (5, $$だろうに$$),
        (5, $$でしょうに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
