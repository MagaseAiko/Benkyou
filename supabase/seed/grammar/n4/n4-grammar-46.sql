-- n4-grammar-46 — 〜みたいに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-46',
    'grammar',
    'N4',
    $$〜みたいに$$,
    $$mitai ni$$,
    $$Como / Igual a / Do jeito de$$,
    $$みたいに é usado antes de verbos e adjetivos para dizer que algo é feito ou acontece de um jeito parecido com outra coisa. Equivale a "como", "igual a" ou "do jeito de".

Como みたい funciona como um adjetivo な, ele recebe に para virar advérbio e modificar uma ação ou uma característica. Assim: "falar como um japonês", "quente como no verão".

Ele pode expressar uma comparação, mostrando que algo se parece com outra coisa sem ser, ou um modelo a seguir, como "quero cantar bem como minha irmã".

É casual e muito comum na conversa. Em textos formais, o equivalente é のように.$$,
    $$Para reforçar a comparação, é comum colocar まるで antes, como em "como se fosse...".

A versão formal é のように: 鳥のように飛ぶ.

Cuidado com elogios usando みたいに. Dizer que alguém fala "como um japonês" é um elogio comum, mas em alguns contextos pode soar como surpresa exagerada.$$,
    $$Substantivo + みたいに + Verbo / Adjetivo
Verbo / Adjetivo (forma simples) + みたいに + Verbo / Adjetivo$$,
    $$みたいに$$,
    $$みたいに$$,
    ARRAY['みたい', 'に']::text[],
    ARRAY['みたいに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-46', $$彼は日本人みたいに日本語を話します。$$, $$かれはにほんじんみたいににほんごをはなします。$$, $$Ele fala japonês como um japonês.$$),
    ('n4-grammar-46', $$子供みたいに泣かないでよ。$$, $$こどもみたいになかないでよ。$$, $$Não chore como uma criança.$$),
    ('n4-grammar-46', $$今日は夏みたいに暑い。$$, $$きょうはなつみたいにあつい。$$, $$Hoje está quente como no verão.$$),
    ('n4-grammar-46', $$私も姉みたいに上手に歌いたい。$$, $$わたしもあねみたいにじょうずにうたいたい。$$, $$Também quero cantar bem como minha irmã mais velha.$$),
    ('n4-grammar-46', $$魚みたいに速く泳げたらいいな。$$, $$さかなみたいにはやくおよげたらいいな。$$, $$Seria bom se eu pudesse nadar rápido como um peixe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はモデル____きれいだ。$$, $$Ela é bonita como uma modelo.$$),
        (2, $$鳥____空を飛びたい。$$, $$Quero voar pelo céu como um pássaro.$$),
        (3, $$今日は春____暖かいですね。$$, $$Hoje está quentinho como na primavera, né?$$),
        (4, $$うちの猫は、犬____私についてくる。$$, $$Nosso gato me segue como se fosse um cachorro.$$),
        (5, $$プロ____上手に料理ができたらいいなあ。$$, $$Seria ótimo saber cozinhar bem como um profissional.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいに$$),
        (2, $$みたいに$$),
        (3, $$みたいに$$),
        (4, $$みたいに$$),
        (5, $$みたいに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
