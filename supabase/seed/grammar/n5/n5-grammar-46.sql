-- n5-grammar-46 — ね
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-46',
    'grammar',
    'N5',
    $$ね$$,
    $$ne$$,
    $$Né / Não é? / Hein / Certo?$$,
    $$ね é uma partícula de final de frase usada para buscar a concordância ou a confirmação de quem está ouvindo. Equivale ao nosso "né?", "não é?" ou "certo?".

Ela é usada quando quem fala acredita que o ouvinte também sabe ou sente o mesmo. Por isso, aparece muito em comentários sobre o tempo, sobre comida e sobre coisas que as duas pessoas estão vendo juntas.

ね também serve para confirmar uma informação, como um horário ou um combinado, e para deixar a frase mais suave e simpática.

Ela funciona depois de frases formais e informais. Com substantivos e adjetivos な, na forma simples, usa-se だね.$$,
    $$ね é diferente de よ: ね busca concordância sobre algo compartilhado, enquanto よ passa uma informação nova que o outro talvez não saiba.

A combinação よね mistura as duas ideias: quem fala tem quase certeza, mas quer confirmar.

Usar ね com frequência deixa a conversa mais calorosa. Uma frase sem ね pode soar mais seca em certas situações.

Prolongar para ねえ pode expressar emoção ou chamar a atenção de alguém.$$,
    $$Frase (forma educada) + ね
Frase (forma simples) + ね
Substantivo / Adjetivo な + ですね / だね$$,
    $$ね$$,
    $$ね$$,
    ARRAY['ね']::text[],
    ARRAY['ね', 'ねえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-46', $$今日は暑いですね。$$, $$きょうはあついですね。$$, $$Hoje está quente, né?$$),
    ('n5-grammar-46', $$このケーキ、おいしいね。$$, $$このケーキ、おいしいね。$$, $$Este bolo é gostoso, né?$$),
    ('n5-grammar-46', $$明日の会議は十時からですね。$$, $$あしたのかいぎはじゅうじからですね。$$, $$A reunião de amanhã é a partir das dez, certo?$$),
    ('n5-grammar-46', $$じゃ、また明日ね。$$, $$じゃ、またあしたね。$$, $$Então, até amanhã, tá?$$),
    ('n5-grammar-46', $$日本語が上手ですね。$$, $$にほんごがじょうずですね。$$, $$Você fala bem japonês, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「いい天気ですね。」「そうです____。」$$, $$"Que dia bonito, né?" "É mesmo."$$),
        (2, $$会議は三時からです____。$$, $$A reunião é a partir das três, certo?$$),
        (3, $$この花、きれいだ____。$$, $$Esta flor é bonita, né?$$),
        (4, $$じゃ、駅の前で待ってる____。$$, $$Então vou te esperar em frente à estação, tá?$$),
        (5, $$田中さんはまだ来ていません____。$$, $$O Tanaka ainda não chegou, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ね$$),
        (2, $$ね$$),
        (3, $$ね$$),
        (4, $$ね$$),
        (5, $$ね$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
