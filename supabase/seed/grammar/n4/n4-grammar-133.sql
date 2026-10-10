-- n4-grammar-133 — 〜てもらえませんか・〜てくれませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-133',
    'grammar',
    'N4',
    $$〜てもらえませんか・〜てくれませんか$$,
    $$te moraemasen ka / te kuremasen ka$$,
    $$Poderia (fazer) para mim? / Você poderia...?$$,
    $$てもらえませんか e てくれませんか são formas educadas de pedir que alguém faça algo para você. Equivalem a "poderia...?" ou "você poderia...?".

As duas usam a forma negativa com pergunta, o que deixa o pedido suave, porque dá ao outro a liberdade de recusar.

A diferença está no ponto de vista. てくれませんか foca em quem vai fazer o favor: "você não faria isso por mim?". てもらえませんか usa a forma potencial de もらう e foca em quem recebe: "eu não poderia receber de você esse favor?". Por isso, てもらえませんか costuma soar um pouco mais educado.

As versões ますか (てくれますか, てもらえますか) também são educadas, mas um pouco mais diretas.

Para superiores e situações muito formais, usa-se ていただけませんか.$$,
    $$Entre amigos, a forma casual てくれない？ é muito comum e soa natural.

Com superiores, てくれませんか pode soar um pouco direto. Prefira ていただけませんか.

Para recusar um pedido assim, os japoneses costumam dizer すみません、ちょっと… e explicar o motivo.$$,
    $$Verbo na forma て + くれませんか / くれますか
Verbo na forma て + もらえませんか / もらえますか

Do mais casual ao mais formal:
てくれる？ → てくれない？ → てくれませんか → てもらえませんか → ていただけませんか$$,
    $$てもらえませんか$$,
    $$てもらえませんか|でもらえませんか|てくれませんか|でくれませんか|てもらえますか|てくれますか|でもらえますか|でくれますか$$,
    ARRAY['て', 'もらえません', 'くれません', 'か']::text[],
    ARRAY['てもらえませんか', 'てくれませんか', 'てもらえますか', 'てくれますか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-133', $$すみません、ちょっと手伝ってもらえませんか。$$, $$すみません、ちょっとてつだってもらえませんか。$$, $$Com licença, você poderia me ajudar um pouco?$$),
    ('n4-grammar-133', $$暑いので、窓を開けてくれませんか。$$, $$あついので、まどをあけてくれませんか。$$, $$Está quente, você poderia abrir a janela?$$),
    ('n4-grammar-133', $$この荷物を少し預かってもらえませんか。$$, $$このにもつをすこしあずかってもらえませんか。$$, $$Você poderia guardar esta bagagem um pouco para mim?$$),
    ('n4-grammar-133', $$もう少し静かにしてくれませんか。$$, $$もうすこししずかにしてくれませんか。$$, $$Você poderia fazer um pouco menos de barulho?$$),
    ('n4-grammar-133', $$駅まで車で送ってもらえますか。$$, $$えきまでくるまでおくってもらえますか。$$, $$Você poderia me levar de carro até a estação?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、ペンを貸し____。$$, $$Com licença, você poderia me emprestar uma caneta?$$),
        (2, $$この字の読み方を教え____。$$, $$Você poderia me ensinar como se lê esta letra?$$),
        (3, $$トイレに行くので、ちょっとここで待っ____。$$, $$Vou ao banheiro, você poderia me esperar aqui um pouco?$$),
        (4, $$この手紙を読ん____。$$, $$Você poderia ler esta carta para mim?$$),
        (5, $$明日、少し早く来____。$$, $$Você poderia vir um pouco mais cedo amanhã?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもらえませんか$$),
        (1, $$てくれませんか$$),
        (1, $$てもらえますか$$),
        (1, $$てくれますか$$),
        (2, $$てもらえませんか$$),
        (2, $$てくれませんか$$),
        (2, $$てもらえますか$$),
        (2, $$てくれますか$$),
        (3, $$てもらえませんか$$),
        (3, $$てくれませんか$$),
        (3, $$てもらえますか$$),
        (3, $$てくれますか$$),
        (4, $$でもらえませんか$$),
        (4, $$でくれませんか$$),
        (4, $$でもらえますか$$),
        (4, $$でくれますか$$),
        (5, $$てもらえませんか$$),
        (5, $$てくれませんか$$),
        (5, $$てもらえますか$$),
        (5, $$てくれますか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
