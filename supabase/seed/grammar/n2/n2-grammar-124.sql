-- n2-grammar-124 — 〜をもとに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-124',
    'grammar',
    'N2',
    $$〜をもとに$$,
    $$wo moto ni$$,
    $$Com base em / A partir de / Inspirado em$$,
    $$をもとに indica o material, a fonte ou a referência usada para criar ou fazer algo. Equivale a "com base em" ou "a partir de".

Por exemplo, "um filme feito a partir de um romance" ou "fazer um gráfico com base nos dados".

É muito usado para falar de criações, como obras, produtos, planos e relatórios.$$,
    $$É parecido com に基づいて, mas をもとに é usado quando algo serve de material ou inspiração. に基づいて é mais rígido e usado com regras ou dados.

Também é escrito を元に.$$,
    $$Substantivo + をもとに / をもとにして + Verbo
Substantivo + をもとにした + Substantivo$$,
    $$をもとに$$,
    $$をもとに|を元に|を基に$$,
    ARRAY['を', 'もと', 'に']::text[],
    ARRAY['をもとに', 'をもとにして', 'をもとにした', 'を元に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-124', $$この映画は小説をもとに作られた。$$, $$このえいがはしょうせつをもとにつくられた。$$, $$Este filme foi feito com base em um romance.$$),
    ('n2-grammar-124', $$アンケートの結果をもとに、新商品を開発した。$$, $$アンケートのけっかをもとに、しんしょうひんをかいはつした。$$, $$Desenvolvemos um novo produto a partir dos resultados da pesquisa.$$),
    ('n2-grammar-124', $$実際の事件をもとにしたドラマが人気だ。$$, $$じっさいのじけんをもとにしたドラマがにんきだ。$$, $$Uma série baseada em um caso real está fazendo sucesso.$$),
    ('n2-grammar-124', $$自分の経験をもとにして、本を書いた。$$, $$じぶんのけいけんをもとにして、ほんをかいた。$$, $$Escrevi um livro com base nas minhas experiências.$$),
    ('n2-grammar-124', $$このデータを元に、グラフを作ってください。$$, $$このデータをもとに、グラフをつくってください。$$, $$Faça um gráfico com base nestes dados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昔話____、新しい物語を作った。$$, $$Criei uma nova história a partir de um conto antigo.$$),
        (2, $$この曲は民謡____作られた。$$, $$Esta música foi composta com base em uma canção folclórica.$$),
        (3, $$お客様の意見____、サービスを改善しました。$$, $$Melhoramos o serviço com base na opinião dos clientes.$$),
        (4, $$写真____、絵を描いた。$$, $$Desenhei a partir de uma foto.$$),
        (5, $$事実____した小説を読んだ。$$, $$Li um romance baseado em fatos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をもとに$$),
        (1, $$をもとにして$$),
        (1, $$を元に$$),
        (2, $$をもとに$$),
        (2, $$をもとにして$$),
        (2, $$を元に$$),
        (3, $$をもとに$$),
        (3, $$をもとにして$$),
        (3, $$を元に$$),
        (4, $$をもとに$$),
        (4, $$をもとにして$$),
        (4, $$を元に$$),
        (5, $$をもとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
