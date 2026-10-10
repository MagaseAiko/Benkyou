-- n3-grammar-18 — 〜だけど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-18',
    'grammar',
    'N3',
    $$〜だけど$$,
    $$da kedo$$,
    $$Mas / Porém / Só que$$,
    $$だけど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "porém". É a combinação de だ (forma simples de です) com けど.

Ele aparece depois de substantivos e adjetivos な, na forma simples. Por exemplo, "hoje é folga, mas vou trabalhar".

Também pode ser usado no começo de uma frase, sozinho, como conjunção: "está chovendo. Mas tenho que sair". Nesse uso, é parecido com でも, porém um pouco mais informal.

Na forma んだけど, ele suaviza pedidos e explicações, como "eu queria ir, mas...", deixando a frase mais delicada.

Por ser casual, だけど é usado em conversas informais. Em situações educadas, usa-se ですが ou ですけど.$$,
    $$だけど no começo da frase é comum na fala, mas, na escrita, prefira でも ou しかし.

A forma んだけど… deixa a frase em aberto e é uma maneira muito natural de começar um pedido ou uma explicação.

だけど soa um pouco mais suave que だが, que é mais formal e literário.$$,
    $$Substantivo / Adjetivo な + だけど + Frase
Frase 1 (com ponto final) + だけど、 + Frase 2
Frase + んだけど (suavização / introdução de pedido)

Educado: ですが / ですけど$$,
    $$だけど$$,
    $$だけど$$,
    ARRAY['だ', 'けど']::text[],
    ARRAY['だけど', 'んだけど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-18', $$今日は休みだけど、仕事に行きます。$$, $$きょうはやすみだけど、しごとにいきます。$$, $$Hoje é folga, mas vou trabalhar.$$),
    ('n3-grammar-18', $$彼は学生だけど、とても忙しい。$$, $$かれはがくせいだけど、とてもいそがしい。$$, $$Ele é estudante, mas é muito ocupado.$$),
    ('n3-grammar-18', $$この町は静かだけど、少し不便だ。$$, $$このまちはしずかだけど、すこしふべんだ。$$, $$Esta cidade é tranquila, mas um pouco inconveniente.$$),
    ('n3-grammar-18', $$外は雨だ。だけど、出かけなければならない。$$, $$そとはあめだ。だけど、でかけなければならない。$$, $$Lá fora está chovendo. Mas eu tenho que sair.$$),
    ('n3-grammar-18', $$行きたいんだけど、時間がないんだ。$$, $$いきたいんだけど、じかんがないんだ。$$, $$Eu queria ir, mas não tenho tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんは便利____、ちょっと重い。$$, $$Esta bolsa é prática, mas um pouco pesada.$$),
        (2, $$彼女は外国育ちの日本人____、日本語があまり上手じゃない。$$, $$Ela é japonesa criada no exterior, mas não fala japonês muito bem.$$),
        (3, $$明日は日曜日____、学校に行く。$$, $$Amanhã é domingo, mas vou à escola.$$),
        (4, $$もう疲れた。____、もう少し頑張ろう。$$, $$Já estou cansado. Mas vamos nos esforçar mais um pouco.$$),
        (5, $$「その本、借りたいん____。」「いいよ。」$$, $$"Eu queria pegar esse livro emprestado..." "Pode pegar."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけど$$),
        (2, $$だけど$$),
        (3, $$だけど$$),
        (4, $$だけど$$),
        (5, $$だけど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
