-- n3-grammar-121 — たとえ〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-121',
    'grammar',
    'N3',
    $$たとえ〜ても$$,
    $$tatoe ~ te mo$$,
    $$Mesmo que / Ainda que / Nem que$$,
    $$たとえ〜ても é usado para dizer que, mesmo que uma situação hipotética aconteça, o resultado ou a decisão não muda. Equivale a "mesmo que", "ainda que" ou "nem que".

たとえ vem no começo e reforça a ideia de hipótese. O verbo ou adjetivo vai para a forma ても.

A segunda parte geralmente expressa uma decisão firme, uma regra ou uma convicção. Por exemplo, "mesmo que chova, a partida será realizada" ou "mesmo que todos sejam contra, eu vou".

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A forma たとえ〜としても, um pouco mais formal, também é usada com o mesmo sentido.$$,
    $$たとえ não é obrigatório, mas deixa claro desde o começo que a frase é uma hipótese.

Não confunda com 例えば (por exemplo), que tem a mesma origem, mas outro sentido.

É muito comum em frases de determinação e promessas fortes.$$,
    $$たとえ + Verbo na forma て + も
たとえ + Adjetivo い sem い + くても
たとえ + Substantivo / Adjetivo な + でも
たとえ + … + としても (mais formal)

Escrita: たとえ / 例え$$,
    $$たとえ$$,
    $$たとえ|例え$$,
    ARRAY['たとえ', 'ても']::text[],
    ARRAY['たとえ〜ても', 'たとえ〜でも', 'たとえ〜としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-121', $$たとえ雨が降っても、試合は行います。$$, $$たとえあめがふっても、しあいはおこないます。$$, $$Mesmo que chova, a partida será realizada.$$),
    ('n3-grammar-121', $$たとえ反対されても、私は留学する。$$, $$たとえはんたいされても、わたしはりゅうがくする。$$, $$Mesmo que sejam contra, eu vou fazer intercâmbio.$$),
    ('n3-grammar-121', $$たとえ高くても、いい物を買いたい。$$, $$たとえたかくても、いいものをかいたい。$$, $$Mesmo que seja caro, quero comprar algo bom.$$),
    ('n3-grammar-121', $$たとえ子供でも、ルールは守らなければならない。$$, $$たとえこどもでも、ルールはまもらなければならない。$$, $$Mesmo sendo criança, é preciso seguir as regras.$$),
    ('n3-grammar-121', $$たとえ失敗しても、後悔はしない。$$, $$たとえしっぱいしても、こうかいはしない。$$, $$Mesmo que eu fracasse, não vou me arrepender.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____忙しくても、毎日運動する。$$, $$Mesmo que esteja ocupado, faço exercício todo dia.$$),
        (2, $$____冗談でも、そんなことを言ってはいけない。$$, $$Mesmo que seja brincadeira, não se deve dizer uma coisa dessas.$$),
        (3, $$____みんなが反対しても、私は行く。$$, $$Mesmo que todos sejam contra, eu vou.$$),
        (4, $$____お金がなくても、幸せに暮らせる。$$, $$Mesmo sem dinheiro, dá para viver feliz.$$),
        (5, $$____遠くても、会いに行きます。$$, $$Mesmo que seja longe, vou te ver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たとえ$$),
        (2, $$たとえ$$),
        (3, $$たとえ$$),
        (4, $$たとえ$$),
        (5, $$たとえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
