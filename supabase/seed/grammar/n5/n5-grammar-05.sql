-- n5-grammar-05 — で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-05',
    'grammar',
    'N5',
    $$で$$,
    $$de$$,
    $$Em / Com / De / Por / Por causa de$$,
    $$で é uma partícula com vários usos, mas todos giram em torno de uma ideia: ela mostra o "contexto" ou o "meio" em que uma ação acontece.

Os usos mais importantes são:
• Lugar onde uma ação acontece: o lugar em que você estuda, come, trabalha.
• Meio ou ferramenta: o transporte que você usa, o objeto com que faz algo, o idioma em que fala ou escreve.
• Causa: o motivo de algo ter acontecido, como uma doença ou um acidente.
• Total ou limite: a quantidade ou o tempo que forma um conjunto, como um preço total.

Um ponto importante é a diferença entre で e に para lugares. で marca onde uma ação acontece. に marca onde algo existe ou para onde algo vai. Por isso, com verbos de existência como ある e いる, usa-se に, e não で.$$,
    $$Para ir a pé, não se usa で: o japonês usa 歩いて.

Quando で indica causa, ele costuma aparecer com coisas que acontecem naturalmente ou fogem do controle, como doença, chuva, acidente ou terremoto.

Não confunda a partícula で com a forma て de verbos terminados em で, nem com a forma で de です, que liga frases. São elementos diferentes que apenas têm o mesmo som.$$,
    $$Substantivo de lugar + で + verbo de ação
Substantivo (meio, ferramenta, transporte) + で
Substantivo (idioma) + で
Substantivo (causa) + で
Quantidade / tempo + で (total ou limite)$$,
    $$で$$,
    $$で$$,
    ARRAY['で']::text[],
    ARRAY['で']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-05', $$図書館で勉強します。$$, $$としょかんでべんきょうします。$$, $$Estudo na biblioteca.$$),
    ('n5-grammar-05', $$毎日バスで学校に行きます。$$, $$まいにちバスでがっこうにいきます。$$, $$Vou para a escola de ônibus todo dia.$$),
    ('n5-grammar-05', $$日本語で手紙を書きました。$$, $$にほんごでてがみをかきました。$$, $$Escrevi uma carta em japonês.$$),
    ('n5-grammar-05', $$風邪で会社を休みました。$$, $$かぜでかいしゃをやすみました。$$, $$Faltei no trabalho por causa de um resfriado.$$),
    ('n5-grammar-05', $$このりんごは三つで二百円です。$$, $$このりんごはみっつでにひゃくえんです。$$, $$Estas maçãs custam duzentos ienes as três.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$箸____ご飯を食べます。$$, $$Como arroz com hashi.$$),
        (2, $$公園____サッカーをしました。$$, $$Joguei futebol no parque.$$),
        (3, $$電車____来ました。$$, $$Vim de trem.$$),
        (4, $$事故____電車が遅れました。$$, $$O trem atrasou por causa de um acidente.$$),
        (5, $$全部____千円です。$$, $$Tudo dá mil ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で$$),
        (2, $$で$$),
        (3, $$で$$),
        (4, $$で$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
