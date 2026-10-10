-- n2-grammar-93 — 〜に決まっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-93',
    'grammar',
    'N2',
    $$〜に決まっている$$,
    $$ni kimatte iru$$,
    $$Com certeza / É claro que / Só pode ser$$,
    $$に決まっている expressa uma certeza forte, baseada na opinião da pessoa que fala. Equivale a "com certeza" ou "é claro que".

A pessoa está tão convencida que não admite outra possibilidade. Por exemplo, "se ele não estudou, é claro que vai reprovar".

É uma expressão de conversa e transmite emoção. Na fala, aparece muito como に決まってる.$$,
    $$É mais subjetivo e emocional que に違いない.

Na fala informal, aparece como に決まってる ou に決まってるじゃん.$$,
    $$Verbo (forma simples) + に決まっている
Adjetivo い + に決まっている
Adjetivo な / Substantivo + に決まっている$$,
    $$に決まっている$$,
    $$に決まって|にきまって$$,
    ARRAY['に', '決まって', 'いる']::text[],
    ARRAY['に決まっている', 'に決まってる', 'に決まっています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-93', $$そんなに食べたら、太るに決まっている。$$, $$そんなにたべたら、ふとるにきまっている。$$, $$Se comer tanto assim, é claro que vai engordar.$$),
    ('n2-grammar-93', $$勉強しなかったんだから、落ちるに決まってるよ。$$, $$べんきょうしなかったんだから、おちるにきまってるよ。$$, $$Você não estudou, então com certeza vai reprovar.$$),
    ('n2-grammar-93', $$あんな高い店、おいしいに決まっている。$$, $$あんなたかいみせ、おいしいにきまっている。$$, $$Uma loja cara daquelas, é claro que é gostosa.$$),
    ('n2-grammar-93', $$犯人はあの男に決まっている。$$, $$はんにんはあのおとこにきまっている。$$, $$O culpado só pode ser aquele homem.$$),
    ('n2-grammar-93', $$みんなに言ったら、反対されるに決まっています。$$, $$みんなにいったら、はんたいされるにきまっています。$$, $$Se contar para todos, com certeza vão ser contra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人で行くなんて、危ない____。$$, $$Ir sozinho? É claro que é perigoso.$$),
        (2, $$彼が勝つ____。$$, $$Com certeza ele vai ganhar.$$),
        (3, $$こんな時間に電話したら、迷惑____。$$, $$Ligar a esta hora, é claro que vai incomodar.$$),
        (4, $$そんな話、嘘____。$$, $$Uma história dessas só pode ser mentira.$$),
        (5, $$毎日練習すれば、上手になる____。$$, $$Se praticar todo dia, com certeza vai melhorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に決まっている$$),
        (1, $$に決まってる$$),
        (1, $$に決まっています$$),
        (2, $$に決まっている$$),
        (2, $$に決まってる$$),
        (2, $$に決まっています$$),
        (3, $$に決まっている$$),
        (3, $$に決まってる$$),
        (3, $$に決まっています$$),
        (4, $$に決まっている$$),
        (4, $$に決まってる$$),
        (4, $$に決まっています$$),
        (5, $$に決まっている$$),
        (5, $$に決まってる$$),
        (5, $$に決まっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
