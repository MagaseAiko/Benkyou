-- n5-grammar-33 — 〜ましょうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-33',
    'grammar',
    'N5',
    $$〜ましょうか$$,
    $$mashou ka$$,
    $$Vamos...? / Quer que eu...? / Devo...?$$,
    $$ましょうか é ましょう com か de pergunta. Ele tem dois usos principais.

O primeiro é oferecer ajuda. Quando a ação é feita por quem fala, a frase significa "quer que eu faça isso?". É um jeito educado de se oferecer para carregar algo, abrir uma janela, chamar um táxi.

O segundo é sugerir algo ao grupo de forma mais suave que ましょう. A pessoa propõe e, ao mesmo tempo, pergunta a opinião dos outros: "vamos...?".

Com palavras interrogativas, como 何, いつ e どこ, ましょうか serve para combinar detalhes junto com o outro, como "o que vamos comer?" ou "onde nos encontramos?".$$,
    $$Quando alguém se oferece com ましょうか, as respostas mais comuns são お願いします para aceitar e 大丈夫です ou いいえ、けっこうです para recusar com educação.

Para oferecer ajuda a um superior, ましょうか é natural e respeitoso. Em níveis mais altos, existem formas ainda mais formais, como お〜しましょうか.

O contexto mostra se a ação é de quem fala ou do grupo: se só quem fala vai agir, é uma oferta; se todos vão agir, é uma sugestão.$$,
    $$Verbo na forma ます sem ます + ましょうか
Palavra interrogativa + … + Verbo ましょうか

Informal: forma volitiva do verbo + か$$,
    $$ましょうか$$,
    $$ましょうか$$,
    ARRAY['ましょう', 'か']::text[],
    ARRAY['ましょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-33', $$荷物を持ちましょうか。$$, $$にもつをもちましょうか。$$, $$Quer que eu carregue a bagagem?$$),
    ('n5-grammar-33', $$窓を開けましょうか。$$, $$まどをあけましょうか。$$, $$Quer que eu abra a janela?$$),
    ('n5-grammar-33', $$そろそろ帰りましょうか。$$, $$そろそろかえりましょうか。$$, $$Vamos indo?$$),
    ('n5-grammar-33', $$明日は何時に会いましょうか。$$, $$あしたはなんじにあいましょうか。$$, $$Amanhã, que horas a gente se encontra?$$),
    ('n5-grammar-33', $$「タクシーを呼びましょうか。」「ええ、お願いします。」$$, $$「タクシーをよびましょうか。」「ええ、おねがいします。」$$, $$"Quer que eu chame um táxi?" "Sim, por favor."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いですね。エアコンをつけ____。$$, $$Está quente, né. Quer que eu ligue o ar-condicionado?$$),
        (2, $$その箱、重いでしょう。手伝い____。$$, $$Essa caixa deve estar pesada. Quer que eu ajude?$$),
        (3, $$次はどこへ行き____。$$, $$Aonde vamos agora?$$),
        (4, $$疲れましたね。ちょっと休み____。$$, $$Cansamos, né. Vamos descansar um pouco?$$),
        (5, $$「駅まで送り____。」「ありがとうございます。助かります。」$$, $$"Quer que eu te leve até a estação?" "Obrigado. Ajuda muito."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ましょうか$$),
        (2, $$ましょうか$$),
        (3, $$ましょうか$$),
        (4, $$ましょうか$$),
        (5, $$ましょうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
