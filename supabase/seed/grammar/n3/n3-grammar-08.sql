-- n3-grammar-08 — 〜ば〜のに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-08',
    'grammar',
    'N3',
    $$〜ば〜のに$$,
    $$ba ~ noni$$,
    $$Se... (mas não é assim) / Seria bom se... / Quem dera$$,
    $$ば〜のに é usado para expressar uma situação hipotética que é contrária à realidade, acompanhada de lamento, pena ou frustração. Equivale a "se..., (mas não é assim)" ou "quem dera...".

A primeira parte, com ば, apresenta uma condição que não existe na realidade. A segunda parte, terminada em のに, mostra o resultado que aconteceria, e o tom de "que pena que não é assim".

Por exemplo, "se eu tivesse tempo, poderia ir" (mas não tenho tempo).

No passado, a frase mostra arrependimento sobre algo que poderia ter acontecido: "se não tivesse chovido, teríamos ido à praia".

Com いい, a forma ばいいのに expressa um desejo ou uma leve crítica: "seria bom se ele viesse também".$$,
    $$A palavra のに no final da frase dá todo o tom emocional de lamento. Sem ela, a frase fica neutra.

たら também pode ser usado no lugar de ば: 時間があったら、行けるのに.

Essa estrutura é muito comum em conversas, para expressar frustrações do dia a dia.$$,
    $$Verbo / Adjetivo ば + … + のに (contrário à realidade)
Verbo ば + … + Verbo た + のに (passado: teria...)
Verbo ば + いいのに (seria bom se...)$$,
    $$のに$$,
    $$のに$$,
    ARRAY['ば', 'のに']::text[],
    ARRAY['ば〜のに', 'ばいいのに', 'ばよかったのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-08', $$時間があれば、一緒に行けるのに。$$, $$じかんがあれば、いっしょにいけるのに。$$, $$Se eu tivesse tempo, poderia ir junto. (Mas não tenho.)$$),
    ('n3-grammar-08', $$もう少し安ければ、買うのに。$$, $$もうすこしやすければ、かうのに。$$, $$Se fosse um pouco mais barato, eu compraria.$$),
    ('n3-grammar-08', $$雨が降らなければ、海に行けたのに。$$, $$あめがふらなければ、うみにいけたのに。$$, $$Se não tivesse chovido, teríamos ido à praia.$$),
    ('n3-grammar-08', $$もっと早く言ってくれれば、手伝ったのに。$$, $$もっとはやくいってくれれば、てつだったのに。$$, $$Se você tivesse me dito antes, eu teria ajudado.$$),
    ('n3-grammar-08', $$彼もパーティーに来ればいいのに。$$, $$かれもパーティーにくればいいのに。$$, $$Seria bom se ele também viesse à festa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金があれば、旅行に行ける____。$$, $$Se eu tivesse dinheiro, poderia viajar.$$),
        (2, $$天気がよければ、ここから富士山が見えた____。$$, $$Se o tempo estivesse bom, daria para ver o Monte Fuji daqui.$$),
        (3, $$言ってくれれば、駅まで迎えに行った____。$$, $$Se você tivesse me avisado, eu teria ido te buscar na estação.$$),
        (4, $$日本語が話せれば、旅行がもっと楽しい____。$$, $$Se eu falasse japonês, a viagem seria mais divertida.$$),
        (5, $$そんなに眠いなら、早く寝ればいい____。$$, $$Se está com tanto sono, devia ir dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のに$$),
        (2, $$のに$$),
        (3, $$のに$$),
        (4, $$のに$$),
        (5, $$のに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
