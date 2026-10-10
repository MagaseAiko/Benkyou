-- n3-grammar-110 — それとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-110',
    'grammar',
    'N3',
    $$それとも$$,
    $$soretomo$$,
    $$Ou / Ou então$$,
    $$それとも é uma conjunção usada para apresentar alternativas em perguntas. Equivale a "ou" ou "ou então".

Ela liga duas perguntas ou duas opções, para que a outra pessoa escolha uma. Por exemplo, "vai querer café? Ou chá?".

Diferente de または, que pode ser usada em afirmações, それとも é usada principalmente em perguntas, ou em frases de dúvida, como "não sei se ele está bravo ou triste".

Ela pode aparecer no começo de uma nova frase ou depois de uma vírgula, entre as duas opções.$$,
    $$Em afirmações e instruções, como "escreva com caneta preta ou azul", usa-se または ou か, e não それとも.

Na fala casual, as perguntas costumam terminar sem か, com entonação de pergunta: 電車で行く？それとも、バス？

それとも é muito comum em restaurantes e lojas, quando o atendente oferece opções.$$,
    $$Pergunta A + か (com ponto final) + それとも + Pergunta B + か
Pergunta A + か、 + それとも + Pergunta B + か
A + のか、 + それとも + B + のか (dúvida)$$,
    $$それとも$$,
    $$それとも$$,
    ARRAY['それとも']::text[],
    ARRAY['それとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-110', $$コーヒーにしますか。それとも紅茶にしますか。$$, $$コーヒーにしますか。それともこうちゃにしますか。$$, $$Vai querer café? Ou chá?$$),
    ('n3-grammar-110', $$電車で行く？それとも、バスで行く？$$, $$でんしゃでいく？それとも、バスでいく？$$, $$Vamos de trem? Ou de ônibus?$$),
    ('n3-grammar-110', $$会議は今日にしますか、それとも明日にしますか。$$, $$かいぎはきょうにしますか、それともあしたにしますか。$$, $$A reunião vai ser hoje ou amanhã?$$),
    ('n3-grammar-110', $$晩ご飯は家で食べる？それとも外で食べる？$$, $$ばんごはんはいえでたべる？それともそとでたべる？$$, $$Vamos jantar em casa? Ou fora?$$),
    ('n3-grammar-110', $$彼は来ないのか、それとも来られないのか。$$, $$かれはこないのか、それともこられないのか。$$, $$Será que ele não quer vir ou não pode vir?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$肉にしますか。____魚にしますか。$$, $$Vai querer carne? Ou peixe?$$),
        (2, $$週末、映画を見る？____、買い物に行く？$$, $$No fim de semana, vamos ver um filme? Ou fazer compras?$$),
        (3, $$現金で払いますか、____カードで払いますか。$$, $$Vai pagar em dinheiro ou com cartão?$$),
        (4, $$このまま続けますか、____少し休みますか。$$, $$Vamos continuar assim ou descansar um pouco?$$),
        (5, $$彼は怒っているのか、____悲しいのか、わからない。$$, $$Não sei se ele está bravo ou triste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それとも$$),
        (2, $$それとも$$),
        (3, $$それとも$$),
        (4, $$それとも$$),
        (5, $$それとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
