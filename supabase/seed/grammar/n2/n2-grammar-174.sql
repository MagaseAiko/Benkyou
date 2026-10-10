-- n2-grammar-174 — 〜ところだった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-174',
    'grammar',
    'N2',
    $$〜ところだった$$,
    $$tokoro datta$$,
    $$Por pouco não / Quase / Estive a ponto de$$,
    $$ところだった indica que algo quase aconteceu, mas no fim não aconteceu. Equivale a "por pouco não" ou "quase".

Geralmente é usado para coisas ruins que a pessoa evitou por pouco, o que traz alívio. Por exemplo, "por pouco não perdi o trem".

Muitas vezes aparece junto com もう少しで, 危うく ou あやうく.$$,
    $$É comum usar もう少しで ou 危うく no começo da frase para reforçar.

Também pode aparecer em frases com ば ou たら, como "se você não tivesse avisado, eu teria esquecido".$$,
    $$Verbo (forma dicionário) + ところだった
Verbo (forma ない) + ところだった$$,
    $$ところだった$$,
    $$ところだった|ところでした$$,
    ARRAY['ところ', 'だった']::text[],
    ARRAY['ところだった', 'ところでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-174', $$もう少しで電車に乗り遅れるところだった。$$, $$もうすこしででんしゃにのりおくれるところだった。$$, $$Por pouco não perdi o trem.$$),
    ('n2-grammar-174', $$危うく車にひかれるところだった。$$, $$あやうくくるまにひかれるところだった。$$, $$Quase fui atropelado por um carro.$$),
    ('n2-grammar-174', $$あなたが言ってくれなかったら、忘れるところだった。$$, $$あなたがいってくれなかったら、わすれるところだった。$$, $$Se você não tivesse dito, eu teria esquecido.$$),
    ('n2-grammar-174', $$もう少しで大事な書類を捨てるところでした。$$, $$もうすこしでだいじなしょるいをすてるところでした。$$, $$Por pouco não joguei fora um documento importante.$$),
    ('n2-grammar-174', $$目覚ましがなかったら、遅刻するところだった。$$, $$めざましがなかったら、ちこくするところだった。$$, $$Sem o despertador, eu teria me atrasado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$危うく階段から落ちる____。$$, $$Quase caí da escada.$$),
        (2, $$もう少しで試験に間に合わない____。$$, $$Por pouco não cheguei a tempo da prova.$$),
        (3, $$注意されなかったら、間違える____。$$, $$Se não tivessem me avisado, eu teria errado.$$),
        (4, $$もう少しで財布をなくす____。$$, $$Por pouco não perdi a carteira.$$),
        (5, $$あと一秒遅かったら、ぶつかる____。$$, $$Se fosse um segundo mais tarde, teria batido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところだった$$),
        (1, $$ところでした$$),
        (2, $$ところだった$$),
        (2, $$ところでした$$),
        (3, $$ところだった$$),
        (3, $$ところでした$$),
        (4, $$ところだった$$),
        (4, $$ところでした$$),
        (5, $$ところだった$$),
        (5, $$ところでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
