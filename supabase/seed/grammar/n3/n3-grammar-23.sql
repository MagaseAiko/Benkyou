-- n3-grammar-23 — ふと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-23',
    'grammar',
    'N3',
    $$ふと$$,
    $$futo$$,
    $$De repente / Sem querer / Por acaso$$,
    $$ふと é um advérbio que indica que algo aconteceu de forma espontânea, sem intenção nem motivo especial. Equivale a "de repente", "sem querer" ou "por acaso".

Ele é muito usado com ações mentais ou de percepção, como lembrar, pensar, perceber, olhar ou acordar. Por exemplo, "de repente me lembrei de um amigo antigo" ou "acordei de repente no meio da noite".

A diferença em relação a 急に é o tom. 急に destaca uma mudança brusca e rápida. ふと tem um tom mais suave e poético, ligado a pensamentos e sensações que surgem naturalmente.

A expressão ふと気がつくと significa "quando dei por mim" e é muito comum em narrativas.$$,
    $$ふと aparece muito em romances, músicas e textos literários, porque transmite uma sensação delicada.

Com verbos de ação física e intensa, como correr ou gritar, ふと soa estranho. Nesses casos, usa-se 急に ou 突然.

A expressão ふとした + Substantivo, como ふとしたきっかけ, significa "um motivo casual" ou "um acaso".$$,
    $$ふと + Verbo de percepção ou pensamento (思い出す / 気づく / 見る / 思う)
ふと + 目が覚める
ふと気がつくと、 + Frase$$,
    $$ふと$$,
    $$ふと$$,
    ARRAY['ふと']::text[],
    ARRAY['ふと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-23', $$ふと空を見上げると、虹が出ていた。$$, $$ふとそらをみあげると、にじがでていた。$$, $$Quando olhei para o céu por acaso, havia um arco-íris.$$),
    ('n3-grammar-23', $$ふと昔の友達のことを思い出した。$$, $$ふとむかしのともだちのことをおもいだした。$$, $$De repente, me lembrei de um velho amigo.$$),
    ('n3-grammar-23', $$夜中にふと目が覚めた。$$, $$よなかにふとめがさめた。$$, $$Acordei de repente no meio da noite.$$),
    ('n3-grammar-23', $$歩いているとき、ふといいアイデアが浮かんだ。$$, $$あるいているとき、ふといいアイデアがうかんだ。$$, $$Enquanto andava, de repente me veio uma boa ideia.$$),
    ('n3-grammar-23', $$ふと気がつくと、もう夜になっていた。$$, $$ふときがつくと、もうよるになっていた。$$, $$Quando dei por mim, já tinha anoitecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____窓の外を見ると、雪が降っていた。$$, $$Quando olhei pela janela por acaso, estava nevando.$$),
        (2, $$電車の中で、____母の顔が浮かんだ。$$, $$No trem, de repente me veio à mente o rosto da minha mãe.$$),
        (3, $$____時計を見たら、もう十二時だった。$$, $$Quando olhei o relógio sem querer, já era meia-noite.$$),
        (4, $$散歩中に、____子供のころを思い出した。$$, $$Durante a caminhada, de repente me lembrei da infância.$$),
        (5, $$彼は____立ち止まって、後ろを振り返った。$$, $$De repente, ele parou e olhou para trás.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふと$$),
        (2, $$ふと$$),
        (3, $$ふと$$),
        (4, $$ふと$$),
        (5, $$ふと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
