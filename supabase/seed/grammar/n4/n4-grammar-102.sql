-- n4-grammar-102 — 〜てすみません
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-102',
    'grammar',
    'N4',
    $$〜てすみません$$,
    $$te sumimasen$$,
    $$Desculpe por / Perdão por$$,
    $$てすみません é usado para pedir desculpas por algo que você fez, ou deixou de fazer. Equivale a "desculpe por..." ou "perdão por...".

Ele junta a forma て do verbo, que aqui indica o motivo, com すみません. Assim, a frase explica exatamente pelo que a pessoa está se desculpando.

Para algo que já aconteceu e terminou, como faltar a uma aula ontem, usa-se すみませんでした.

Na forma negativa, なくてすみません pede desculpas por não ter feito algo.

Entre amigos, usa-se てごめん ou てごめんね, que são mais informais.$$,
    $$Em situações de trabalho, a forma mais formal é 〜て申し訳ありません ou 〜て申し訳ございません.

お待たせしてすみません é uma frase muito comum quando alguém fez outra pessoa esperar.

Os japoneses pedem desculpas com frequência, inclusive por pequenos incômodos, como interromper alguém.$$,
    $$Verbo na forma て + すみません
Verbo na forma て + すみませんでした (fato já concluído)
Verbo na forma ない sem い + くてすみません (por não ter feito)

Informal: 〜てごめん / 〜てごめんね
Mais formal: 〜て申し訳ありません$$,
    $$てすみません$$,
    $$てすみません|んですみません|てごめん|んでごめん$$,
    ARRAY['て', 'すみません']::text[],
    ARRAY['てすみません', 'てすみませんでした', 'てごめん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-102', $$遅れてすみません。$$, $$おくれてすみません。$$, $$Desculpe o atraso.$$),
    ('n4-grammar-102', $$お待たせしてすみません。$$, $$おまたせしてすみません。$$, $$Desculpe por fazê-lo esperar.$$),
    ('n4-grammar-102', $$昨日は授業を休んですみませんでした。$$, $$きのうはじゅぎょうをやすんですみませんでした。$$, $$Desculpe por ter faltado à aula ontem.$$),
    ('n4-grammar-102', $$ご迷惑をかけてすみません。$$, $$ごめいわくをかけてすみません。$$, $$Desculpe pelo incômodo.$$),
    ('n4-grammar-102', $$返事が遅くなってごめんね。$$, $$へんじがおそくなってごめんね。$$, $$Desculpa a demora para responder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜遅くに電話し____。$$, $$Desculpe por ligar tão tarde da noite.$$),
        (2, $$約束を忘れ____でした。$$, $$Desculpe por ter esquecido o compromisso.$$),
        (3, $$お役に立てなく____。$$, $$Desculpe por não ter podido ajudar.$$),
        (4, $$昨日は急に休ん____。$$, $$Desculpe por ter faltado de repente ontem.$$),
        (5, $$たくさん待たせ____ね。$$, $$Desculpa por te fazer esperar tanto, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てすみません$$),
        (2, $$てすみません$$),
        (3, $$てすみません$$),
        (4, $$ですみません$$),
        (5, $$てごめん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
