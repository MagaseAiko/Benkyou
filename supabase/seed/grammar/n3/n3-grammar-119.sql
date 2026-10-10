-- n3-grammar-119 — 確かに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-119',
    'grammar',
    'N3',
    $$確かに$$,
    $$tashika ni$$,
    $$Realmente / De fato / Com certeza / É verdade$$,
    $$確かに é um advérbio com dois usos principais.

O primeiro é concordar com algo: "realmente", "de fato", "é verdade". Muitas vezes, a pessoa concorda em parte e depois apresenta uma ressalva, com けど ou が: "realmente é caro, mas a qualidade é boa".

O segundo é afirmar com certeza que algo aconteceu: "com certeza", "sem dúvida". Por exemplo, "coloquei a chave na bolsa, com certeza" ou "recebi os documentos, sim".

Sozinho, como resposta, 確かに significa "é verdade" ou "tem razão", e é muito usado na conversa para mostrar que você concorda com o que o outro disse.$$,
    $$O adjetivo 確か também é usado sozinho, no começo da frase, com o sentido de "se não me engano": 確か、明日は休みだった.

Em discussões, 確かにそうですが ("de fato é assim, mas...") é uma forma educada de discordar.

Em recibos e documentos, 確かに受け取りました significa "recebido com confirmação".$$,
    $$確かに + Frase (concordância)
確かに + … + けど / が + Ressalva
確かに + Verbo no passado (certeza de que aconteceu)
確かに (resposta sozinha: é verdade)

Escrita: 確かに / たしかに$$,
    $$確かに$$,
    $$確かに|たしかに$$,
    ARRAY['確かに']::text[],
    ARRAY['確かに', 'たしかに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-119', $$確かに、この料理はおいしい。$$, $$たしかに、このりょうりはおいしい。$$, $$Realmente, esta comida é gostosa.$$),
    ('n3-grammar-119', $$確かに彼の言う通りだ。$$, $$たしかにかれのいうとおりだ。$$, $$De fato, é exatamente como ele diz.$$),
    ('n3-grammar-119', $$確かに高いけど、品質はいい。$$, $$たしかにたかいけど、ひんしつはいい。$$, $$Realmente é caro, mas a qualidade é boa.$$),
    ('n3-grammar-119', $$鍵は確かにかばんに入れました。$$, $$かぎはたしかにかばんにいれました。$$, $$Eu coloquei a chave na bolsa, com certeza.$$),
    ('n3-grammar-119', $$「この問題、難しいね。」「確かに。」$$, $$「このもんだい、むずかしいね。」「たしかに。」$$, $$"Esta questão é difícil, né?" "É verdade."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、あなたの意見は正しい。$$, $$De fato, a sua opinião está correta.$$),
        (2, $$書類は____受け取りました。$$, $$Recebi os documentos, com certeza.$$),
        (3, $$この店は____便利だけど、少し高い。$$, $$Esta loja é realmente prática, mas um pouco cara.$$),
        (4, $$「今日は寒いね。」「____。」$$, $$"Hoje está frio, né?" "É verdade."$$),
        (5, $$彼は昨日、____そう言いました。$$, $$Ele disse isso ontem, com certeza.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$確かに$$),
        (1, $$たしかに$$),
        (2, $$確かに$$),
        (2, $$たしかに$$),
        (3, $$確かに$$),
        (3, $$たしかに$$),
        (4, $$確かに$$),
        (4, $$たしかに$$),
        (5, $$確かに$$),
        (5, $$たしかに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
