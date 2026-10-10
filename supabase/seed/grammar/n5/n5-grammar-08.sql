-- n5-grammar-08 — どんな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-08',
    'grammar',
    'N5',
    $$どんな$$,
    $$donna$$,
    $$Que tipo de / Como / Qual$$,
    $$どんな é usado para perguntar sobre o tipo, a natureza ou as características de alguma coisa. Equivale a "que tipo de" ou, dependendo da frase, a "como é".

Ele sempre vem antes de um substantivo, funcionando como um adjetivo de pergunta. Você nunca usa どんな sozinho: ele precisa estar ligado à coisa sobre a qual você quer saber mais.

A resposta normalmente descreve a coisa com adjetivos ou explicações, e não apenas escolhe uma opção. Isso é diferente de どの, que pede para escolher uma entre opções concretas, e de 何, que pergunta "o quê".

Quando aparece junto com でも, どんな ganha o sentido de "qualquer", indicando que não importa o tipo.$$,
    $$どんな faz parte da família こんな, そんな, あんな e どんな, que significam "deste tipo", "desse tipo", "daquele tipo" e "que tipo".

Para perguntar como alguém está ou como foi algo, como uma viagem, os japoneses costumam usar どうですか ou どうでしたか, e não どんな.

A pergunta どんな人ですか pede uma descrição da personalidade ou das características da pessoa, não o nome dela.$$,
    $$どんな + Substantivo
どんな + Substantivo + ですか
どんな + Substantivo + でも (qualquer)$$,
    $$どんな$$,
    $$どんな$$,
    ARRAY['どんな']::text[],
    ARRAY['どんな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-08', $$どんな音楽が好きですか。$$, $$どんなおんがくがすきですか。$$, $$Que tipo de música você gosta?$$),
    ('n5-grammar-08', $$田中さんはどんな人ですか。$$, $$たなかさんはどんなひとですか。$$, $$Como é o Tanaka?$$),
    ('n5-grammar-08', $$昨日、どんな映画を見ましたか。$$, $$きのう、どんなえいがをみましたか。$$, $$Que tipo de filme você viu ontem?$$),
    ('n5-grammar-08', $$日本はどんな国ですか。$$, $$にほんはどんなくにですか。$$, $$Como é o Japão?$$),
    ('n5-grammar-08', $$どんな色でもいいです。$$, $$どんないろでもいいです。$$, $$Qualquer cor serve.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____料理が得意ですか。$$, $$Que tipo de comida você cozinha bem?$$),
        (2, $$新しい先生は____先生ですか。$$, $$Como é o novo professor?$$),
        (3, $$____本を読みたいですか。$$, $$Que tipo de livro você quer ler?$$),
        (4, $$北海道は____ところですか。$$, $$Como é Hokkaido?$$),
        (5, $$____仕事でも頑張ります。$$, $$Vou me esforçar em qualquer trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どんな$$),
        (2, $$どんな$$),
        (3, $$どんな$$),
        (4, $$どんな$$),
        (5, $$どんな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
