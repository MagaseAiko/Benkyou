-- n1-grammar-24 — 〜ではあるまいし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-24',
    'grammar',
    'N1',
    $$〜ではあるまいし$$,
    $$dewa arumai shi$$,
    $$Não é como se / Afinal não sou / Já que não é$$,
    $$ではあるまいし indica que, como a pessoa não está em determinada situação, aquela atitude não faz sentido. Equivale a "não é como se..." ou "afinal não sou...".

A segunda parte costuma ser uma crítica, um conselho ou uma reclamação. Por exemplo, "não é como se fosse criança, então faça sozinho".

É uma expressão coloquial, comum na fala.$$,
    $$Na fala, também aparece como じゃあるまいし.

É parecido com ではないのだから.

Expressões comuns são 子供じゃあるまいし e 神様ではあるまいし.$$,
    $$Substantivo + ではあるまいし + Crítica / Conselho
Verbo (forma simples) + わけではあるまいし$$,
    $$ではあるまいし$$,
    $$ではあるまいし|じゃあるまいし$$,
    ARRAY['では', 'ある', 'まい', 'し']::text[],
    ARRAY['ではあるまいし', 'じゃあるまいし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-24', $$子供ではあるまいし、一人でできるでしょう。$$, $$こどもではあるまいし、ひとりでできるでしょう。$$, $$Não é como se fosse criança, dá para fazer sozinho, não é?$$),
    ('n1-grammar-24', $$神様じゃあるまいし、未来のことなんてわからない。$$, $$かみさまじゃあるまいし、みらいのことなんてわからない。$$, $$Não sou Deus, não tenho como saber do futuro.$$),
    ('n1-grammar-24', $$一生会えないわけではあるまいし、そんなに泣かないで。$$, $$いっしょうあえないわけではあるまいし、そんなになかないで。$$, $$Não é como se nunca mais fôssemos nos ver, não chore tanto.$$),
    ('n1-grammar-24', $$初心者じゃあるまいし、こんなミスをするなんて。$$, $$しょしんしゃじゃあるまいし、こんなミスをするなんて。$$, $$Não é como se fosse iniciante, e mesmo assim cometeu um erro desses.$$),
    ('n1-grammar-24', $$学生ではあるまいし、遅刻はだめだよ。$$, $$がくせいではあるまいし、ちこくはだめだよ。$$, $$Você não é mais estudante, atrasos não dão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$赤ちゃん____、自分で食べなさい。$$, $$Não é como se fosse um bebê, coma sozinho.$$),
        (2, $$魔法使い____、すぐには直せないよ。$$, $$Não sou mágico, não dá para consertar na hora.$$),
        (3, $$永遠に別れるわけ____、笑って見送ろう。$$, $$Não é como se fosse uma despedida para sempre, vamos nos despedir sorrindo.$$),
        (4, $$プロ____、完璧にできなくてもいい。$$, $$Não é como se fosse profissional, não precisa ser perfeito.$$),
        (5, $$小学生____、そんなことで泣くな。$$, $$Você não é criança do primário, não chore por uma coisa dessas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではあるまいし$$),
        (1, $$じゃあるまいし$$),
        (2, $$ではあるまいし$$),
        (2, $$じゃあるまいし$$),
        (3, $$ではあるまいし$$),
        (3, $$じゃあるまいし$$),
        (4, $$ではあるまいし$$),
        (4, $$じゃあるまいし$$),
        (5, $$ではあるまいし$$),
        (5, $$じゃあるまいし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
