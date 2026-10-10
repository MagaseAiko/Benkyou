-- n4-grammar-78 — そんなに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-78',
    'grammar',
    'N4',
    $$そんなに$$,
    $$sonna ni$$,
    $$Tanto / Tão / Não tão$$,
    $$そんなに significa "tanto" ou "tão". Ele indica um grau ou uma quantidade relacionada ao que foi dito ou ao que se vê na situação.

Em frases afirmativas, そんなに expressa surpresa ou preocupação com algo exagerado, como "por que você está tão bravo?" ou "se comer tanto, vai passar mal".

Em frases negativas, そんなに〜ない significa "não tão..." ou "não muito". É uma forma suave de dizer que algo não é tão grande, difícil ou caro quanto se poderia imaginar.

そんなに faz parte da família こんなに, そんなに, あんなに e どんなに, que seguem a lógica de distância de こ・そ・あ・ど.$$,
    $$そんなに〜ない é parecido com あまり〜ない, mas compara com uma expectativa: "não é tão... quanto você pensa".

こんなに é usado para algo que está perto de quem fala ("tanto assim"), e あんなに para algo distante ou lembrado ("tanto daquele jeito").

そんなに também combina com なくてもいい para tranquilizar alguém, como "não precisa se apressar tanto".$$,
    $$そんなに + Adjetivo / Verbo (tão / tanto)
そんなに + Adjetivo / Verbo negativo (não tão / não muito)

Família: こんなに / そんなに / あんなに / どんなに$$,
    $$そんなに$$,
    $$そんなに$$,
    ARRAY['そんなに']::text[],
    ARRAY['そんなに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-78', $$そんなに急がなくてもいいですよ。$$, $$そんなにいそがなくてもいいですよ。$$, $$Não precisa ter tanta pressa.$$),
    ('n4-grammar-78', $$この料理はそんなに辛くない。$$, $$このりょうりはそんなにからくない。$$, $$Esta comida não é tão apimentada.$$),
    ('n4-grammar-78', $$そんなに食べたら、お腹をこわすよ。$$, $$そんなにたべたら、おなかをこわすよ。$$, $$Se comer tanto, vai passar mal da barriga.$$),
    ('n4-grammar-78', $$試験はそんなに難しくなかった。$$, $$しけんはそんなにむずかしくなかった。$$, $$A prova não foi tão difícil.$$),
    ('n4-grammar-78', $$どうしてそんなに怒っているの？$$, $$どうしてそんなにおこっているの？$$, $$Por que você está tão bravo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____心配しないでください。$$, $$Não se preocupe tanto.$$),
        (2, $$この映画は____おもしろくなかった。$$, $$Este filme não foi tão interessante.$$),
        (3, $$どうして____たくさん買ったの？$$, $$Por que você comprou tanto?$$),
        (4, $$駅は____遠くないですよ。$$, $$A estação não é tão longe.$$),
        (5, $$毎日____働いたら、病気になりますよ。$$, $$Se trabalhar tanto todo dia, vai ficar doente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そんなに$$),
        (2, $$そんなに$$),
        (3, $$そんなに$$),
        (4, $$そんなに$$),
        (5, $$そんなに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
