-- n4-grammar-113 — 〜と思う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-113',
    'grammar',
    'N4',
    $$〜と思う$$,
    $$to omou$$,
    $$Achar que / Pensar que / Acreditar que$$,
    $$と思う é usado para expressar opinião, suposição ou impressão. Equivale a "achar que", "pensar que" ou "acreditar que".

A opinião vem antes de と, na forma simples. Com substantivos e adjetivos な, é preciso colocar だ antes de と.

と思います é uma forma muito usada pelos japoneses para suavizar afirmações. Em vez de dizer algo de forma categórica, a pessoa apresenta como uma opinião pessoal.

Para falar da opinião de outra pessoa, usa-se と思っている, que indica uma opinião que ela tem há algum tempo.

Na fala casual, と思う pode virar って思う.$$,
    $$Para dizer "acho que não", o japonês costuma negar dentro da frase: 来ないと思う ("acho que não vem"), e não 来ると思わない.

と思う é uma ótima forma de soar educado ao dar opiniões, mesmo sobre coisas que você tem bastante certeza.

Com a forma volitiva, ようと思う expressa uma intenção, como "estou pensando em fazer...".$$,
    $$Verbo / Adjetivo い (forma simples) + と思う
Substantivo / Adjetivo な + だ + と思う

Educado: と思います
Opinião de outra pessoa: と思っている
Fala casual: って思う$$,
    $$と思う$$,
    $$と思|とおも|って思$$,
    ARRAY['と', '思う']::text[],
    ARRAY['と思う', 'と思います', 'と思っている', 'って思う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-113', $$明日は雨が降ると思います。$$, $$あしたはあめがふるとおもいます。$$, $$Acho que vai chover amanhã.$$),
    ('n4-grammar-113', $$この本はおもしろいと思う。$$, $$このほんはおもしろいとおもう。$$, $$Acho este livro interessante.$$),
    ('n4-grammar-113', $$彼は来ないと思います。$$, $$かれはこないとおもいます。$$, $$Acho que ele não vem.$$),
    ('n4-grammar-113', $$日本語は難しいけど、楽しいと思っています。$$, $$にほんごはむずかしいけど、たのしいとおもっています。$$, $$Japonês é difícil, mas acho divertido.$$),
    ('n4-grammar-113', $$あの人は先生だと思う。$$, $$あのひとはせんせいだとおもう。$$, $$Acho que aquela pessoa é professora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この計画はいい____。$$, $$Acho que este plano é bom.$$),
        (2, $$田中さんはもう帰った____。$$, $$Acho que o Tanaka já foi embora.$$),
        (3, $$明日は晴れる____。$$, $$Acho que amanhã vai fazer sol.$$),
        (4, $$東京は便利な町だ____。$$, $$Acho que Tóquio é uma cidade prática.$$),
        (5, $$彼はたぶん来ない____。$$, $$Acho que ele provavelmente não vem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と思います$$),
        (1, $$と思う$$),
        (2, $$と思います$$),
        (2, $$と思う$$),
        (3, $$と思います$$),
        (3, $$と思う$$),
        (4, $$と思います$$),
        (4, $$と思う$$),
        (5, $$と思います$$),
        (5, $$と思う$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
