-- n3-grammar-58 — 〜も〜ば〜も
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-58',
    'grammar',
    'N3',
    $$〜も〜ば〜も$$,
    $$mo ~ ba ~ mo$$,
    $$Tanto... quanto... / Não só... como também...$$,
    $$も〜ば〜も é usado para listar duas características ou situações, mostrando que as duas são verdadeiras. Equivale a "tanto... quanto..." ou "não só... como também...".

A estrutura usa も duas vezes e ば no meio: "A も + verbo ば、B も + verbo". Por exemplo, "ele fala tanto inglês quanto francês".

Ela tem dois usos principais. O primeiro é somar qualidades ou fatos, como alguém que é bom em várias coisas. O segundo é mostrar que existem situações diferentes ou opostas, como "na vida há momentos bons e também momentos ruins".

Com ある e いる, a forma もあれば〜もある e もいれば〜もいる é muito comum para falar de variedade.$$,
    $$A forma いい時もあれば、悪い時もある é uma expressão quase fixa sobre os altos e baixos da vida.

Essa estrutura é um pouco mais formal e expressiva que simplesmente usar も〜も.

É comum em textos que descrevem diversidade, como opiniões diferentes entre as pessoas.$$,
    $$A + も + Verbo ば、 + B + も + Verbo
A + も + あれば、 + B + も + ある
A + も + いれば、 + B + も + いる
A + も + Adjetivo な + なら、 + B + も + Adjetivo な + だ$$,
    $$も$$,
    $$も$$,
    ARRAY['も', 'ば', 'も']::text[],
    ARRAY['も〜ば〜も', 'もあれば〜もある', 'もいれば〜もいる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-58', $$彼は英語も話せば、フランス語も話せる。$$, $$かれはえいごもはなせば、フランスごもはなせる。$$, $$Ele fala tanto inglês quanto francês.$$),
    ('n3-grammar-58', $$この部屋は広さもあれば、日当たりもいい。$$, $$このへやはひろさもあれば、ひあたりもいい。$$, $$Este quarto não só é espaçoso, como também tem boa luz do sol.$$),
    ('n3-grammar-58', $$人生にはいい時もあれば、悪い時もある。$$, $$じんせいにはいいときもあれば、わるいときもある。$$, $$Na vida há momentos bons e também momentos ruins.$$),
    ('n3-grammar-58', $$彼女は歌も上手なら、ダンスも上手だ。$$, $$かのじょはうたもじょうずなら、ダンスもじょうずだ。$$, $$Ela canta bem e também dança bem.$$),
    ('n3-grammar-58', $$外は雨も降れば、風も吹いている。$$, $$そとはあめもふれば、かぜもふいている。$$, $$Lá fora está chovendo e ventando também.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は料理____すれば、掃除もする。$$, $$Ele tanto cozinha quanto limpa a casa.$$),
        (2, $$晴れる日もあれば、雨の日____ある。$$, $$Há dias de sol e também dias de chuva.$$),
        (3, $$この意見に賛成する人もいれば、反対する人____いる。$$, $$Há quem concorde com esta opinião e também há quem discorde.$$),
        (4, $$この町は海____あれば、山もある。$$, $$Esta cidade tem tanto mar quanto montanha.$$),
        (5, $$彼女は頭____よければ、性格もいい。$$, $$Ela é inteligente e também tem um ótimo caráter.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も$$),
        (2, $$も$$),
        (3, $$も$$),
        (4, $$も$$),
        (5, $$も$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
