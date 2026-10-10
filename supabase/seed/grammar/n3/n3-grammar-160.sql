-- n3-grammar-160 — 〜うちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-160',
    'grammar',
    'N3',
    $$〜うちに$$,
    $$uchi ni$$,
    $$Enquanto / Antes que / No decorrer de$$,
    $$うちに tem dois usos principais.

O primeiro é "enquanto ainda": fazer algo aproveitando que uma situação ainda existe, antes que ela mude. Por exemplo, "enquanto é jovem, é bom ter várias experiências" ou "coma enquanto está quente". Com a forma ない, ないうちに significa "antes que": "vamos voltar antes que escureça".

O segundo é "no decorrer de": enquanto uma ação continua, uma mudança acontece naturalmente, sem a pessoa perceber. Por exemplo, "conversando com ele, acabei gostando dele" ou "lendo, acabei dormindo".

No primeiro uso, うちに vem depois de adjetivos, de verbos de estado (いる) e da forma ない. No segundo, vem depois de verbos na forma ている.$$,
    $$Comparado a 間に, うちに destaca mais a ideia de "aproveitar enquanto dá", com a ideia de que a situação vai mudar.

A expressão 熱いうちにどうぞ ("coma enquanto está quente") é muito comum ao servir comida.

No segundo uso, a mudança na segunda parte costuma ser algo que aconteceu sem a pessoa planejar.$$,
    $$Adjetivo い + うちに (enquanto ainda está...)
Adjetivo な + な + うちに
Substantivo + の + うちに
Verbo de estado (いる / ある) + うちに
Verbo na forma ない + うちに (antes que)
Verbo na forma ている + うちに + Mudança (no decorrer de)

Escrita: うちに / 内に$$,
    $$うちに$$,
    $$うちに|内に$$,
    ARRAY['うち', 'に']::text[],
    ARRAY['うちに', 'ないうちに', 'ているうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-160', $$若いうちに、いろいろな経験をしたほうがいい。$$, $$わかいうちに、いろいろなけいけんをしたほうがいい。$$, $$Enquanto é jovem, é bom ter várias experiências.$$),
    ('n3-grammar-160', $$どうぞ、熱いうちに食べてください。$$, $$どうぞ、あついうちにたべてください。$$, $$Por favor, coma enquanto está quente.$$),
    ('n3-grammar-160', $$暗くならないうちに、帰りましょう。$$, $$くらくならないうちに、かえりましょう。$$, $$Vamos voltar antes que escureça.$$),
    ('n3-grammar-160', $$話しているうちに、彼のことが好きになった。$$, $$はなしているうちに、かれのことがすきになった。$$, $$No decorrer das conversas, acabei gostando dele.$$),
    ('n3-grammar-160', $$日本にいるうちに、富士山に登りたい。$$, $$にほんにいるうちに、ふじさんにのぼりたい。$$, $$Enquanto estiver no Japão, quero subir o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$元気な____、旅行に行きたい。$$, $$Quero viajar enquanto ainda tenho saúde.$$),
        (2, $$雨が降らない____、洗濯物を取り込もう。$$, $$Vamos recolher a roupa antes que chova.$$),
        (3, $$本を読んでいる____、寝てしまった。$$, $$Enquanto lia o livro, acabei dormindo.$$),
        (4, $$冷めない____、どうぞ。$$, $$Coma antes que esfrie, por favor.$$),
        (5, $$忘れない____、メモしておこう。$$, $$Vou anotar antes que eu esqueça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うちに$$),
        (2, $$うちに$$),
        (3, $$うちに$$),
        (4, $$うちに$$),
        (5, $$うちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
