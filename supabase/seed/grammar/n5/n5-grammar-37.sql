-- n5-grammar-37 — 〜なあ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-37',
    'grammar',
    'N5',
    $$〜なあ$$,
    $$naa$$,
    $$Que... / Nossa / Como... (exclamação)$$,
    $$なあ é uma partícula de final de frase que expressa um sentimento forte, como admiração, surpresa, desejo ou desabafo. É como dizer "que...!", "nossa, como...!" ou um suspiro em voz alta.

Normalmente é usada quando a pessoa fala consigo mesma ou comenta algo em voz alta, sem esperar resposta. Por isso, ela soa espontânea e emotiva.

Ela vem depois da forma simples da frase. Com substantivos e adjetivos な, coloca-se だ antes de なあ.

Junto com たい, なあ expressa um desejo, quase como um sonho: "como eu queria...".$$,
    $$なあ é diferente de ね: ね busca a concordância do outro, enquanto なあ é mais um sentimento expresso para si mesmo.

A forma curta な também é usada, principalmente na fala masculina e casual. Não confunda com a proibição な (como em "não faça"), que vem depois do verbo na forma de dicionário e tem tom de ordem.

Por ser informal e emotiva, なあ não é usada em situações formais.$$,
    $$Verbo / Adjetivo い (forma simples) + なあ
Substantivo / Adjetivo な + だ + なあ
Verbo na forma たい + なあ (desejo)

Variações: な / なー$$,
    $$なあ$$,
    $$なあ|なー$$,
    ARRAY['なあ']::text[],
    ARRAY['なあ', 'なー', 'な']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-37', $$きれいだなあ。$$, $$きれいだなあ。$$, $$Que lindo!$$),
    ('n5-grammar-37', $$今日は暑いなあ。$$, $$きょうはあついなあ。$$, $$Que calor hoje!$$),
    ('n5-grammar-37', $$日本に行きたいなあ。$$, $$にほんにいきたいなあ。$$, $$Como eu queria ir ao Japão...$$),
    ('n5-grammar-37', $$この料理、おいしいなあ。$$, $$このりょうり、おいしいなあ。$$, $$Nossa, esta comida é gostosa!$$),
    ('n5-grammar-37', $$田中さん、遅いなあ。$$, $$たなかさん、おそいなあ。$$, $$O Tanaka está demorando, hein...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この景色、すごい____。$$, $$Nossa, esta paisagem é incrível!$$),
        (2, $$もう少し寝たい____。$$, $$Queria dormir mais um pouco...$$),
        (3, $$今日はいい天気だ____。$$, $$Que dia bonito hoje!$$),
        (4, $$あーあ、お腹がすいた____。$$, $$Ai, que fome...$$),
        (5, $$彼は本当に日本語が上手だ____。$$, $$Ele fala japonês muito bem, hein.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なあ$$),
        (1, $$なー$$),
        (2, $$なあ$$),
        (2, $$なー$$),
        (3, $$なあ$$),
        (3, $$なー$$),
        (4, $$なあ$$),
        (4, $$なー$$),
        (5, $$なあ$$),
        (5, $$なー$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
