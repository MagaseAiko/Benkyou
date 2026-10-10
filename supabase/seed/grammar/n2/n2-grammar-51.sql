-- n2-grammar-51 — 〜からして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-51',
    'grammar',
    'N2',
    $$〜からして$$,
    $$kara shite$$,
    $$A começar por / Já pelo / Só de ver$$,
    $$からして tem dois usos principais.

O primeiro é dar um exemplo inicial, geralmente o mais básico ou óbvio, para mostrar que algo é assim. Equivale a "a começar por" ou "até mesmo". Por exemplo, "o próprio presidente se atrasa, então é natural que os funcionários também se atrasem". O tom costuma ser de crítica.

O segundo é indicar uma base para julgar algo, com o sentido de "já pelo..." ou "só de ver...". A pessoa observa um detalhe, como a aparência, o nome ou o jeito de falar, e chega a uma conclusão. Por exemplo, "só pela fachada, já parece cara".

Ele vem diretamente depois de substantivos.$$,
    $$No primeiro uso, からして costuma apontar alguém que deveria dar o exemplo, como um chefe ou professor.

No segundo uso, é parecido com からすると, mas からして destaca um detalhe inicial ou superficial.

É uma expressão comum em conversas e textos de opinião.$$,
    $$Substantivo (exemplo inicial) + からして + Frase (crítica / avaliação)
Substantivo (detalhe observado) + からして、 + Julgamento$$,
    $$からして$$,
    $$からして$$,
    ARRAY['から', 'して']::text[],
    ARRAY['からして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-51', $$この店は、外観からして高そうだ。$$, $$このみせは、がいかんからしてたかそうだ。$$, $$Só pela fachada, esta loja já parece cara.$$),
    ('n2-grammar-51', $$彼は話し方からして、真面目な人だとわかる。$$, $$かれははなしかたからして、まじめなひとだとわかる。$$, $$Já pelo jeito de falar, dá para ver que ele é uma pessoa séria.$$),
    ('n2-grammar-51', $$この映画は、タイトルからしておもしろそうだ。$$, $$このえいがは、タイトルからしておもしろそうだ。$$, $$Só pelo título, este filme já parece interessante.$$),
    ('n2-grammar-51', $$社長からして遅刻するのだから、社員が遅れるのも当然だ。$$, $$しゃちょうからしてちこくするのだから、しゃいんがおくれるのもとうぜんだ。$$, $$A começar pelo presidente, que se atrasa, é natural que os funcionários também se atrasem.$$),
    ('n2-grammar-51', $$あの態度からして、彼は反省していない。$$, $$あのたいどからして、かれははんせいしていない。$$, $$Só por aquela atitude, dá para ver que ele não está arrependido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この料理は、におい____おいしそうだ。$$, $$Esta comida, só pelo cheiro, já parece gostosa.$$),
        (2, $$彼の服装____、お金持ちのようだ。$$, $$Só pelas roupas, ele parece ser rico.$$),
        (3, $$先生____ルールを守らないのだから、学生が守るはずがない。$$, $$A começar pelo professor, que não segue as regras, é óbvio que os alunos também não vão seguir.$$),
        (4, $$その顔____、何かあったようだね。$$, $$Só pela sua cara, parece que aconteceu alguma coisa, hein.$$),
        (5, $$名前____、強そうな犬だ。$$, $$Só pelo nome, parece ser um cachorro forte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からして$$),
        (2, $$からして$$),
        (3, $$からして$$),
        (4, $$からして$$),
        (5, $$からして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
