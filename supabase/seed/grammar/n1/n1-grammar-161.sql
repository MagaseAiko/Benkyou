-- n1-grammar-161 — 〜思いをする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-161',
    'grammar',
    'N1',
    $$〜思いをする$$,
    $$omoi wo suru$$,
    $$Passar por / Sentir / Experimentar$$,
    $$思いをする indica que a pessoa viveu uma experiência emocional marcante, boa ou ruim. Equivale a "passar por" ou "sentir".

Costuma vir com adjetivos de sentimento, como triste, vergonhoso, solitário ou feliz. Por exemplo, "passei muita vergonha" ou "nunca mais quero passar por algo tão triste".

É uma expressão muito comum para falar de sentimentos vividos.$$,
    $$Expressões comuns são 恥ずかしい思いをする, 寂しい思いをする, 怖い思いをする e つらい思いをする.

No passado, 思いをした é muito usado para relatar experiências.$$,
    $$Adjetivo い + 思いをする
Adjetivo な + な + 思いをする
Substantivo + の + 思いをする$$,
    $$思いをする$$,
    $$思いをする|思いをした|思いをして|思いをさせ|おもいをした$$,
    ARRAY['思い', 'を', 'する']::text[],
    ARRAY['思いをする', '思いをした', '思いをさせる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-161', $$人前で転んで、恥ずかしい思いをした。$$, $$ひとまえでころんで、はずかしいおもいをした。$$, $$Caí na frente dos outros e passei muita vergonha.$$),
    ('n1-grammar-161', $$子供に寂しい思いをさせたくない。$$, $$こどもにさびしいおもいをさせたくない。$$, $$Não quero fazer meu filho se sentir sozinho.$$),
    ('n1-grammar-161', $$あんな怖い思いをしたのは初めてだ。$$, $$あんなこわいおもいをしたのははじめてだ。$$, $$Foi a primeira vez que senti um medo assim.$$),
    ('n1-grammar-161', $$留学中は、つらい思いをすることも多かった。$$, $$りゅうがくちゅうは、つらいおもいをすることもおおかった。$$, $$Durante o intercâmbio, muitas vezes passei por momentos difíceis.$$),
    ('n1-grammar-161', $$二度とこんな悔しい思いをしたくない。$$, $$にどとこんなくやしいおもいをしたくない。$$, $$Nunca mais quero sentir uma frustração dessas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道に迷って、心細い____。$$, $$Me perdi e me senti muito desamparado.$$),
        (2, $$友達に裏切られて、悲しい____。$$, $$Fui traído por um amigo e fiquei muito triste.$$),
        (3, $$家族に心配な____させてしまった。$$, $$Acabei fazendo minha família passar por preocupação.$$),
        (4, $$彼女は子供のころ、貧しくてつらい____そうだ。$$, $$Dizem que ela passou por dificuldades na infância por ser pobre.$$),
        (5, $$優勝して、夢のような____。$$, $$Vencemos o campeonato e foi como viver um sonho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$思いをした$$),
        (2, $$思いをした$$),
        (3, $$思いを$$),
        (4, $$思いをした$$),
        (5, $$思いをした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
