-- n2-grammar-19 — どうせ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-19',
    'grammar',
    'N2',
    $$どうせ$$,
    $$douse$$,
    $$De qualquer jeito / Já que vai / De todo modo$$,
    $$どうせ é um advérbio que expressa a ideia de que o resultado já está decidido e não vai mudar. Ele tem dois tons principais.

O primeiro é de resignação ou pessimismo: "de qualquer jeito, não vai dar tempo", "de todo modo, eu não consigo", "ele não vem mesmo". Muitas vezes, mostra desânimo ou falta de esperança.

O segundo é mais positivo, com なら: どうせ〜なら significa "já que vai... de qualquer jeito, então...". Por exemplo, "já que vou comprar, quero algo bom" ou "já que vamos fazer, vamos fazer com alegria".

Por isso, どうせ pode soar negativo ou motivador, dependendo da frase.$$,
    $$Usar どうせ demais, principalmente sobre si mesmo, pode soar autodepreciativo, como どうせ私なんか.

どうせ〜なら é uma expressão muito comum para tirar o melhor proveito de algo inevitável.

Comparado a どちらにしても (de qualquer forma), どうせ é mais emocional.$$,
    $$どうせ + Frase (resignação / pessimismo)
どうせ + Verbo + なら、 + Decisão (já que vai...)
どうせ + … + から、 + …$$,
    $$どうせ$$,
    $$どうせ$$,
    ARRAY['どうせ']::text[],
    ARRAY['どうせ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-19', $$どうせ間に合わないから、ゆっくり行こう。$$, $$どうせまにあわないから、ゆっくりいこう。$$, $$De qualquer jeito não vai dar tempo, então vamos com calma.$$),
    ('n2-grammar-19', $$どうせ私には無理だ。$$, $$どうせわたしにはむりだ。$$, $$De todo modo, isso é impossível para mim.$$),
    ('n2-grammar-19', $$どうせ買うなら、いい物を買いたい。$$, $$どうせかうなら、いいものをかいたい。$$, $$Já que vou comprar mesmo, quero algo bom.$$),
    ('n2-grammar-19', $$待っても無駄だよ。どうせ彼は来ないよ。$$, $$まってもむだだよ。どうせかれはこないよ。$$, $$Não adianta esperar. Ele não vem mesmo.$$),
    ('n2-grammar-19', $$どうせやるなら、楽しくやろう。$$, $$どうせやるなら、たのしくやろう。$$, $$Já que vamos fazer, vamos fazer com alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____失敗するなら、挑戦してみよう。$$, $$Se é para fracassar de qualquer jeito, vamos pelo menos tentar.$$),
        (2, $$____言っても、彼は聞かない。$$, $$De qualquer jeito, mesmo que eu fale, ele não escuta.$$),
        (3, $$____行くなら、早く行こう。$$, $$Já que vamos mesmo, vamos logo.$$),
        (4, $$____私なんか、誰も気にしない。$$, $$De qualquer jeito, ninguém liga para mim.$$),
        (5, $$____雨で出かけられないから、家で映画を見よう。$$, $$Já que não dá para sair com essa chuva, vamos ver um filme em casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうせ$$),
        (2, $$どうせ$$),
        (3, $$どうせ$$),
        (4, $$どうせ$$),
        (5, $$どうせ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
