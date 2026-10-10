-- n3-grammar-27 — 〜ごとに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-27',
    'grammar',
    'N3',
    $$〜ごとに$$,
    $$goto ni$$,
    $$A cada / Cada vez que / Por (cada)$$,
    $$ごとに é usado para indicar repetição em intervalos regulares ou para dizer que algo acontece "a cada" unidade. Equivale a "a cada", "cada vez que" ou "por cada".

Com expressões de tempo e distância, indica intervalos regulares: "a cada quatro anos", "a cada três horas".

Com substantivos de grupo, indica que algo acontece separadamente para cada unidade: "por turma", "por estação do ano", "por região".

Com verbos na forma de dicionário, significa "toda vez que": "toda vez que encontro alguém".

Também aparece em expressões que indicam mudança gradual, como 一雨ごとに ("a cada chuva", ou seja, aos poucos).$$,
    $$Com dias, 一日ごとに significa "todo dia" ou "a cada dia", enquanto 一日おきに significa "dia sim, dia não". É uma diferença importante.

Com verbos, ごとに é parecido com たびに, que também significa "toda vez que".

ごとに soa um pouco mais formal que 毎 (まい) em palavras como 毎日 e 毎週.$$,
    $$Período / Distância + ごとに
Substantivo (grupo / unidade) + ごとに
Verbo na forma de dicionário + ごとに (toda vez que)

Escrita: ごとに / 毎に$$,
    $$ごとに$$,
    $$ごとに|毎に$$,
    ARRAY['ごと', 'に']::text[],
    ARRAY['ごとに', '毎に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-27', $$オリンピックは四年ごとに開かれる。$$, $$オリンピックはよねんごとにひらかれる。$$, $$As Olimpíadas são realizadas a cada quatro anos.$$),
    ('n3-grammar-27', $$この薬は三時間ごとに飲んでください。$$, $$このくすりはさんじかんごとにのんでください。$$, $$Tome este remédio a cada três horas.$$),
    ('n3-grammar-27', $$会う人ごとに、同じ質問をされた。$$, $$あうひとごとに、おなじしつもんをされた。$$, $$Cada pessoa que eu encontrava me fazia a mesma pergunta.$$),
    ('n3-grammar-27', $$季節ごとに、店の飾りが変わる。$$, $$きせつごとに、みせのかざりがかわる。$$, $$A decoração da loja muda a cada estação.$$),
    ('n3-grammar-27', $$一雨ごとに暖かくなっていく。$$, $$ひとあめごとにあたたかくなっていく。$$, $$A cada chuva, o tempo vai ficando mais quente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バスは十五分____来ます。$$, $$O ônibus passa a cada quinze minutos.$$),
        (2, $$クラス____、テーマを決めて発表した。$$, $$Cada turma escolheu um tema e fez uma apresentação.$$),
        (3, $$一か月____、部屋の大掃除をしています。$$, $$Faço uma faxina geral no quarto a cada mês.$$),
        (4, $$会う____、彼は背が高くなっている。$$, $$Cada vez que o encontro, ele está mais alto.$$),
        (5, $$地域____、言葉が少しずつ違う。$$, $$A língua muda um pouco de região para região.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごとに$$),
        (2, $$ごとに$$),
        (3, $$ごとに$$),
        (4, $$ごとに$$),
        (5, $$ごとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
