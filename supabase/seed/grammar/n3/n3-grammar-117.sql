-- n3-grammar-117 — 〜たびに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-117',
    'grammar',
    'N3',
    $$〜たびに$$,
    $$tabi ni$$,
    $$Toda vez que / Sempre que / A cada$$,
    $$たびに é usado para dizer que, toda vez que algo acontece, outra coisa também acontece. Equivale a "toda vez que", "sempre que" ou "a cada".

Ele vem depois do verbo na forma de dicionário ou de um substantivo com の. Por exemplo, "toda vez que ouço esta música, lembro da minha terra" ou "a cada viagem, ele traz lembrancinhas".

A segunda parte mostra uma reação, um hábito ou uma mudança que se repete. Muitas vezes, envolve lembranças, sentimentos ou mudanças graduais.

度 significa "vez". Por isso, a ideia é literalmente "a cada vez".$$,
    $$たびに é parecido com ごとに e com と (sempre que), mas destaca a repetição a cada ocasião.

Com verbos de percepção, como 見る e 聞く, たびに aparece muito para falar de lembranças.

Não confunda com 旅 (たび), que significa "viagem". Aqui, たび significa "vez".$$,
    $$Verbo na forma de dicionário + たびに + Frase
Substantivo + の + たびに + Frase

Escrita: たびに / 度に$$,
    $$たびに$$,
    $$たびに|度に$$,
    ARRAY['たび', 'に']::text[],
    ARRAY['たびに', '度に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-117', $$この歌を聞くたびに、故郷を思い出す。$$, $$このうたをきくたびに、こきょうをおもいだす。$$, $$Toda vez que ouço esta música, me lembro da minha terra natal.$$),
    ('n3-grammar-117', $$彼は会うたびに、背が高くなっている。$$, $$かれはあうたびに、せがたかくなっている。$$, $$Toda vez que o encontro, ele está mais alto.$$),
    ('n3-grammar-117', $$父は旅行のたびに、お土産を買ってくる。$$, $$ちちはりょこうのたびに、おみやげをかってくる。$$, $$A cada viagem, meu pai traz lembrancinhas.$$),
    ('n3-grammar-117', $$雨が降るたびに、この道は水でいっぱいになる。$$, $$あめがふるたびに、このみちはみずでいっぱいになる。$$, $$Sempre que chove, esta rua fica alagada.$$),
    ('n3-grammar-117', $$この写真を見るたびに、楽しかった日々を思い出す。$$, $$このしゃしんをみるたびに、たのしかったひびをおもいだす。$$, $$Toda vez que vejo esta foto, lembro dos dias felizes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母は会う____、お小遣いをくれる。$$, $$Toda vez que a encontro, minha avó me dá uns trocados.$$),
        (2, $$出張の____、新しい町を見るのが楽しみだ。$$, $$A cada viagem a trabalho, adoro conhecer cidades novas.$$),
        (3, $$この写真を見る____、笑ってしまう。$$, $$Toda vez que vejo esta foto, acabo rindo.$$),
        (4, $$彼は電話する____、違うことを言う。$$, $$Toda vez que ligo, ele diz uma coisa diferente.$$),
        (5, $$試験の____、緊張して眠れない。$$, $$A cada prova, fico tão nervoso que não consigo dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たびに$$),
        (2, $$たびに$$),
        (3, $$たびに$$),
        (4, $$たびに$$),
        (5, $$たびに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
