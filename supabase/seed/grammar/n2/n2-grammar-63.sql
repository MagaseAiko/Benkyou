-- n2-grammar-63 — 〜まい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-63',
    'grammar',
    'N2',
    $$〜まい$$,
    $$mai$$,
    $$Não vou / Provavelmente não / Nunca mais$$,
    $$まい é uma forma negativa usada para falar de intenção ou suposição.

O primeiro uso expressa a decisão firme de não fazer algo. Equivale a "não vou mais..." ou "nunca mais...". Por exemplo, "nunca mais vou a esse restaurante".

O segundo uso expressa uma suposição negativa. Equivale a "provavelmente não..." ou "acho que não...". Nesse caso, é como uma versão formal de ないだろう.

É uma forma de estilo escrito ou formal, mas aparece em algumas expressões fixas na fala.$$,
    $$No uso de decisão, o sujeito costuma ser a primeira pessoa. Muitas vezes vem com 二度と ou もう.

No uso de suposição, é comum em textos e opiniões, e equivale a ないだろう ou ないと思う.

A forma まいと思う aparece bastante para expressar decisão.$$,
    $$Verbo do grupo 1 (forma dicionário) + まい
Verbo do grupo 2 (raiz ou forma dicionário) + まい
する → するまい / すまい
来る → 来るまい / 来まい$$,
    $$まい$$,
    $$まい$$,
    ARRAY['まい']::text[],
    ARRAY['まい', 'まいと思う', 'すまい', '来まい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-63', $$あんな店には二度と行くまい。$$, $$あんなみせにはにどといくまい。$$, $$Nunca mais vou a uma loja daquelas.$$),
    ('n2-grammar-63', $$彼はもう来るまい。$$, $$かれはもうくるまい。$$, $$Ele provavelmente não vem mais.$$),
    ('n2-grammar-63', $$もう酒は飲むまいと決めた。$$, $$もうさけはのむまいときめた。$$, $$Decidi que não vou mais beber.$$),
    ('n2-grammar-63', $$この問題は子供には解けまい。$$, $$このもんだいはこどもにはとけまい。$$, $$Uma criança provavelmente não consegue resolver este problema.$$),
    ('n2-grammar-63', $$同じ失敗は繰り返すまいと思う。$$, $$おなじしっぱいはくりかえすまいとおもう。$$, $$Penso em não repetir o mesmo erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう二度と嘘はつく____。$$, $$Nunca mais vou contar mentiras.$$),
        (2, $$こんな天気では、誰も来る____。$$, $$Com um tempo destes, provavelmente ninguém vai vir.$$),
        (3, $$あの人とは二度と会う____と思った。$$, $$Pensei que nunca mais encontraria aquela pessoa.$$),
        (4, $$彼が負けることはある____。$$, $$Provavelmente não há chance de ele perder.$$),
        (5, $$無駄遣いはす____と心に決めた。$$, $$Decidi no meu coração que não vou mais desperdiçar dinheiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まい$$),
        (2, $$まい$$),
        (3, $$まい$$),
        (4, $$まい$$),
        (5, $$まい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
