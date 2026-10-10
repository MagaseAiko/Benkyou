-- n1-grammar-23 — 〜ではあるまいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-23',
    'grammar',
    'N1',
    $$〜ではあるまいか$$,
    $$dewa arumai ka$$,
    $$Será que não / Não seria / Talvez seja$$,
    $$ではあるまいか expressa uma suposição de forma suave e formal. Equivale a "será que não é...?" ou "não seria...?".

A pessoa apresenta sua opinião com cautela, como se fizesse uma pergunta. Na prática, o sentido é "acho que é...". Por exemplo, "será que a causa não é o estresse?".

É a forma escrita e literária de のではないだろうか.$$,
    $$É bem mais formal que んじゃないかな ou のではないだろうか.

Aparece em ensaios, artigos de opinião e textos acadêmicos.$$,
    $$Substantivo / Adjetivo な + ではあるまいか
Verbo / Adjetivo い (forma simples) + のではあるまいか$$,
    $$ではあるまいか$$,
    $$ではあるまいか|のではあるまいか$$,
    ARRAY['では', 'ある', 'まい', 'か']::text[],
    ARRAY['ではあるまいか', 'のではあるまいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-23', $$この問題の原因はストレスではあるまいか。$$, $$このもんだいのげんいんはストレスではあるまいか。$$, $$Será que a causa deste problema não é o estresse?$$),
    ('n1-grammar-23', $$彼は何か隠しているのではあるまいか。$$, $$かれはなにかかくしているのではあるまいか。$$, $$Será que ele não está escondendo alguma coisa?$$),
    ('n1-grammar-23', $$この計画は無理なのではあるまいか。$$, $$このけいかくはむりなのではあるまいか。$$, $$Não seria este plano impossível?$$),
    ('n1-grammar-23', $$彼女の言うことは正しいのではあるまいか。$$, $$かのじょのいうことはただしいのではあるまいか。$$, $$Talvez o que ela diz seja correto.$$),
    ('n1-grammar-23', $$それは誤解ではあるまいか。$$, $$それはごかいではあるまいか。$$, $$Será que isso não é um mal-entendido?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵は偽物____。$$, $$Será que este quadro não é falso?$$),
        (2, $$もう手遅れなの____。$$, $$Será que já não é tarde demais?$$),
        (3, $$彼は来ないの____。$$, $$Será que ele não vem?$$),
        (4, $$その説明は不十分____。$$, $$Não seria essa explicação insuficiente?$$),
        (5, $$私たちは大切なことを忘れているの____。$$, $$Será que não estamos esquecendo algo importante?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではあるまいか$$),
        (2, $$ではあるまいか$$),
        (3, $$ではあるまいか$$),
        (4, $$ではあるまいか$$),
        (5, $$ではあるまいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
