-- n4-grammar-106 — 〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-106',
    'grammar',
    'N4',
    $$〜ても$$,
    $$te mo$$,
    $$Mesmo que / Ainda que / Por mais que$$,
    $$ても é usado para dizer que o resultado não muda, mesmo que uma condição aconteça. Equivale a "mesmo que", "ainda que" ou "por mais que".

Ele é formado pela forma て + も. A primeira parte apresenta uma situação que poderia mudar algo, e a segunda mostra que, mesmo assim, o resultado continua o mesmo.

Com palavras como いくら e 何度, forma expressões como "por mais que coma" ou "por mais vezes que leia", destacando que o esforço não muda o resultado.

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A condição pode ser hipotética ("mesmo que chova amanhã") ou real ("mesmo tendo tomado remédio").$$,
    $$Para reforçar a ideia de hipótese, usa-se たとえ no começo: たとえ雨が降っても.

Não confunda com てもいい (permissão), que usa a mesma forma, mas com いい depois.

Com palavras interrogativas, como 何を食べても, a ideia é "não importa o que...".$$,
    $$Verbo na forma て + も
Adjetivo い sem い + くても
Substantivo / Adjetivo な + でも
いくら / 何度 / どんなに + … + ても (por mais que)

Negativo: Verbo ない sem い + くても$$,
    $$ても$$,
    $$ても|でも$$,
    ARRAY['て', 'も']::text[],
    ARRAY['ても', 'でも', 'くても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-106', $$明日雨が降っても、試合をします。$$, $$あしたあめがふっても、しあいをします。$$, $$Mesmo que chova amanhã, vamos jogar.$$),
    ('n4-grammar-106', $$彼はいくら食べても、太らない。$$, $$かれはいくらたべても、ふとらない。$$, $$Por mais que coma, ele não engorda.$$),
    ('n4-grammar-106', $$高くても、この本が欲しい。$$, $$たかくても、このほんがほしい。$$, $$Mesmo que seja caro, quero este livro.$$),
    ('n4-grammar-106', $$この店は、日曜日でも開いています。$$, $$このみせは、にちようびでもあいています。$$, $$Esta loja abre mesmo aos domingos.$$),
    ('n4-grammar-106', $$何度読んでも、意味がわからない。$$, $$なんどよんでも、いみがわからない。$$, $$Por mais que eu leia, não entendo o sentido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲ん____、熱が下がらない。$$, $$Mesmo tomando remédio, a febre não baixa.$$),
        (2, $$疲れ____、毎日走ります。$$, $$Mesmo cansado, corro todo dia.$$),
        (3, $$安く____、品質が悪い物は買いません。$$, $$Mesmo que seja barato, não compro coisas de má qualidade.$$),
        (4, $$この問題は簡単だから、子供____解けます。$$, $$Esta questão é fácil, então até uma criança consegue resolver.$$),
        (5, $$何回電話し____、彼は出ない。$$, $$Por mais que eu ligue, ele não atende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$ても$$),
        (3, $$ても$$),
        (4, $$でも$$),
        (5, $$ても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
