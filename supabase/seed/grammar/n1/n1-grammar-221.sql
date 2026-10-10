-- n1-grammar-221 — とりわけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-221',
    'grammar',
    'N1',
    $$とりわけ$$,
    $$toriwake$$,
    $$Especialmente / Sobretudo / Principalmente$$,
    $$とりわけ destaca algo que se sobressai dentro de um grupo. Equivale a "especialmente" ou "sobretudo".

A pessoa fala de várias coisas e depois aponta a mais importante ou marcante. Por exemplo, "gosto de frutas, especialmente de morango".

É uma palavra um pouco formal, parecida com 特に.$$,
    $$É parecido com 特に e 中でも, mas とりわけ é um pouco mais formal.

Também é escrito 取り分け, mas a forma em hiragana é mais comum.$$,
    $$とりわけ + Substantivo / Frase$$,
    $$とりわけ$$,
    $$とりわけ|取り分け$$,
    ARRAY['とりわけ']::text[],
    ARRAY['とりわけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-221', $$果物は何でも好きだが、とりわけいちごが好きだ。$$, $$くだものはなんでもすきだが、とりわけいちごがすきだ。$$, $$Gosto de todas as frutas, mas especialmente de morango.$$),
    ('n1-grammar-221', $$今年の夏は、とりわけ暑かった。$$, $$ことしのなつは、とりわけあつかった。$$, $$O verão deste ano foi especialmente quente.$$),
    ('n1-grammar-221', $$この町は、とりわけ秋の景色が美しい。$$, $$このまちは、とりわけあきのけしきがうつくしい。$$, $$Esta cidade é bonita, sobretudo no outono.$$),
    ('n1-grammar-221', $$彼はスポーツが得意で、とりわけ水泳が上手だ。$$, $$かれはスポーツがとくいで、とりわけすいえいがじょうずだ。$$, $$Ele é bom em esportes, principalmente em natação.$$),
    ('n1-grammar-221', $$日本の文化の中でも、とりわけ茶道に興味がある。$$, $$にほんのぶんかのなかでも、とりわけさどうにきょうみがある。$$, $$Dentro da cultura japonesa, me interesso especialmente pela cerimônia do chá.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の作品はどれもいいが、____この絵が素晴らしい。$$, $$Todas as obras dela são boas, mas especialmente este quadro é excelente.$$),
        (2, $$今日は____寒いので、暖かくしてください。$$, $$Hoje está especialmente frio, então se agasalhe.$$),
        (3, $$この料理は、____スープがおいしい。$$, $$Neste prato, a sopa é especialmente gostosa.$$),
        (4, $$子供たちは、____動物園が好きだ。$$, $$As crianças gostam sobretudo do zoológico.$$),
        (5, $$このクラスの学生は優秀だが、____彼は目立つ。$$, $$Os alunos desta turma são ótimos, mas ele se destaca especialmente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-221', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とりわけ$$),
        (2, $$とりわけ$$),
        (3, $$とりわけ$$),
        (4, $$とりわけ$$),
        (5, $$とりわけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
