-- n1-grammar-41 — いかにも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-41',
    'grammar',
    'N1',
    $$いかにも$$,
    $$ikanimo$$,
    $$Realmente / Bem típico de / Com toda a cara de$$,
    $$いかにも indica que algo parece muito ser aquilo, ou que combina perfeitamente com uma imagem. Equivale a "realmente", "bem típico de" ou "com toda a cara de".

Muitas vezes vem junto com らしい ou そうだ. Por exemplo, "é uma atitude bem típica dele" ou "parece muito gostoso".

Também pode ser usado como resposta para concordar, com o sentido de "exatamente", mas esse uso é antiquado.$$,
    $$Às vezes tem um tom de crítica, quando algo parece falso ou exagerado, como いかにも嘘っぽい.

É parecido com 本当に e まさに.$$,
    $$いかにも + Substantivo + らしい
いかにも + Adjetivo / Verbo + そうだ
いかにも + Adjetivo$$,
    $$いかにも$$,
    $$いかにも$$,
    ARRAY['いかにも']::text[],
    ARRAY['いかにも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-41', $$それはいかにも彼らしい考えだ。$$, $$それはいかにもかれらしいかんがえだ。$$, $$Essa é uma ideia bem típica dele.$$),
    ('n1-grammar-41', $$このケーキはいかにもおいしそうだ。$$, $$このケーキはいかにもおいしそうだ。$$, $$Este bolo tem toda a cara de ser gostoso.$$),
    ('n1-grammar-41', $$彼はいかにも困ったという顔をした。$$, $$かれはいかにもこまったというかおをした。$$, $$Ele fez uma cara de quem estava realmente em apuros.$$),
    ('n1-grammar-41', $$いかにも日本らしい景色だ。$$, $$いかにもにほんらしいけしきだ。$$, $$É uma paisagem bem típica do Japão.$$),
    ('n1-grammar-41', $$その話はいかにも嘘っぽい。$$, $$そのはなしはいかにもうそっぽい。$$, $$Essa história tem toda a cara de mentira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____京都らしい町並みだ。$$, $$É uma paisagem urbana bem típica de Kyoto.$$),
        (2, $$彼女は____楽しそうに笑った。$$, $$Ela riu com toda a cara de quem estava se divertindo.$$),
        (3, $$____高そうな車が止まっている。$$, $$Tem um carro estacionado com toda a cara de ser caro.$$),
        (4, $$それは____子供らしい質問だ。$$, $$Essa é uma pergunta bem típica de criança.$$),
        (5, $$彼は____知っているような顔をした。$$, $$Ele fez cara de quem realmente sabia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかにも$$),
        (2, $$いかにも$$),
        (3, $$いかにも$$),
        (4, $$いかにも$$),
        (5, $$いかにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
