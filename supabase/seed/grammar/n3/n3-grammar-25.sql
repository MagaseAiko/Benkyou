-- n3-grammar-25 — 〜がたい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-25',
    'grammar',
    'N3',
    $$〜がたい$$,
    $$gatai$$,
    $$Difícil de / Quase impossível de$$,
    $$がたい é usado para dizer que algo é muito difícil ou quase impossível de fazer, por motivos emocionais ou psicológicos. Equivale a "difícil de" ou "quase impossível de".

Ele vem depois do verbo na forma ます sem ます. O resultado funciona como um adjetivo い.

A diferença em relação a にくい e づらい é o tipo de dificuldade. がたい não fala de dificuldade física, mas de algo que a pessoa não consegue aceitar, entender ou fazer por questões internas, como acreditar em algo inacreditável, perdoar algo grave ou esquecer algo marcante.

É usado principalmente com verbos de pensamento e sentimento, como 信じる, 理解する, 許す, 忘れる, 認める e 表す. Por isso, soa formal e aparece muito na escrita.$$,
    $$がたい não é usado para ações físicas simples. Dizer "difícil de andar" com がたい soa errado; para isso, usa-se にくい.

Também existe o adjetivo ありがたい (grato), que vem da mesma origem: algo "raro de existir", e por isso precioso.

Em textos formais, 〜がたいものがある reforça a ideia de que algo é difícil de aceitar.$$,
    $$Verbo na forma ます sem ます + がたい

Combinações comuns: 信じがたい / 理解しがたい / 許しがたい / 忘れがたい / 耐えがたい / 言い表しがたい

Escrita: がたい / 難い$$,
    $$がたい$$,
    $$がたい|難い|がたく$$,
    ARRAY['がたい']::text[],
    ARRAY['がたい', '難い', 'がたく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-25', $$彼がうそをついたなんて、信じがたい。$$, $$かれがうそをついたなんて、しんじがたい。$$, $$É difícil acreditar que ele mentiu.$$),
    ('n3-grammar-25', $$この絵の美しさは、言葉では表しがたい。$$, $$このえのうつくしさは、ことばではあらわしがたい。$$, $$A beleza deste quadro é difícil de expressar em palavras.$$),
    ('n3-grammar-25', $$彼の行動は理解しがたい。$$, $$かれのこうどうはりかいしがたい。$$, $$O comportamento dele é difícil de entender.$$),
    ('n3-grammar-25', $$それは忘れがたい思い出です。$$, $$それはわすれがたいおもいでです。$$, $$Essa é uma lembrança inesquecível.$$),
    ('n3-grammar-25', $$今回の失敗は、許しがたいことだ。$$, $$こんかいのしっぱいは、ゆるしがたいことだ。$$, $$O erro desta vez é imperdoável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの優しい人が犯人だなんて、信じ____。$$, $$É difícil acreditar que aquela pessoa tão gentil é a culpada.$$),
        (2, $$留学の経験は、忘れ____ものになった。$$, $$A experiência do intercâmbio se tornou algo inesquecível.$$),
        (3, $$彼の意見には賛成し____。$$, $$É difícil concordar com a opinião dele.$$),
        (4, $$その時の気持ちは、言葉では言い表し____。$$, $$O sentimento daquele momento é difícil de expressar em palavras.$$),
        (5, $$このような失礼な態度は許し____。$$, $$Uma atitude tão mal-educada como essa é imperdoável.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がたい$$),
        (2, $$がたい$$),
        (3, $$がたい$$),
        (4, $$がたい$$),
        (5, $$がたい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
