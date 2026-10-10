-- n2-grammar-68 — 〜もの / 〜もん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-68',
    'grammar',
    'N2',
    $$〜もの / 〜もん$$,
    $$mono / mon$$,
    $$É que / Porque / Afinal$$,
    $$もの ou もん no fim da frase serve para justificar algo de forma pessoal, quase como uma desculpa. Equivale a "é que..." ou "porque...".

A pessoa explica o motivo da sua atitude e espera que o outro entenda. O tom é coloquial e um pouco infantil ou carinhoso. Por exemplo, "não fui porque estava chovendo, ué".

もん é a forma mais informal e é muito usada por crianças, jovens e mulheres. Muitas vezes aparece junto com だって ou だもの.$$,
    $$É comum começar a frase com だって, como em だって、〜もん.

Não se usa em situações formais ou com superiores.

A forma ですもの aparece na fala feminina mais educada.$$,
    $$Verbo (forma simples) + もの / もん
Adjetivo い + もの / もん
Adjetivo な / Substantivo + だ + もの / もん
Frase + んだもん$$,
    $$もの$$,
    $$もの|もん$$,
    ARRAY['もの']::text[],
    ARRAY['もの', 'もん', 'だもの', 'だもん', 'んだもん', 'ですもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-68', $$だって、知らなかったんだもん。$$, $$だって、しらなかったんだもん。$$, $$É que eu não sabia, ué.$$),
    ('n2-grammar-68', $$行きたくない。疲れているもの。$$, $$いきたくない。つかれているもの。$$, $$Não quero ir. É que estou cansado.$$),
    ('n2-grammar-68', $$仕方ないよ、子供だもん。$$, $$しかたないよ、こどもだもん。$$, $$Não tem jeito, afinal é criança.$$),
    ('n2-grammar-68', $$食べないよ。まずいもん。$$, $$たべないよ。まずいもん。$$, $$Não vou comer. É que está ruim.$$),
    ('n2-grammar-68', $$だって、雨が降っていたんですもの。$$, $$だって、あめがふっていたんですもの。$$, $$É que estava chovendo, sabe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅刻したのは仕方ないよ。電車が止まったんだ____。$$, $$Não tive culpa do atraso. É que o trem parou.$$),
        (2, $$だって、怖かったんだ____。$$, $$É que eu estava com medo.$$),
        (3, $$一人で行けないよ。まだ子供だ____。$$, $$Não consigo ir sozinho. Afinal ainda sou criança.$$),
        (4, $$その服は買わない。高い____。$$, $$Não vou comprar essa roupa. É que é cara.$$),
        (5, $$だって、誰も教えてくれなかった____。$$, $$É que ninguém me ensinou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もの$$),
        (1, $$もん$$),
        (2, $$もの$$),
        (2, $$もん$$),
        (3, $$もの$$),
        (3, $$もん$$),
        (4, $$もの$$),
        (4, $$もん$$),
        (5, $$もの$$),
        (5, $$もん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
