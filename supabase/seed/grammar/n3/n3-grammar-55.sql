-- n3-grammar-55 — まるで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-55',
    'grammar',
    'N3',
    $$まるで$$,
    $$marude$$,
    $$Como se / Parecia até / Igualzinho a$$,
    $$まるで é um advérbio usado em comparações para dizer que algo se parece muito com outra coisa, mesmo não sendo. Equivale a "como se", "parecia até" ou "igualzinho a".

Ele quase sempre aparece junto com ようだ, ような, ように, みたいだ ou みたいに, reforçando a comparação.

Por exemplo, "ela parece até uma boneca", "este quadro parece uma foto" ou "parece que estou sonhando".

A ideia é de uma semelhança muito forte, quase total. Por isso, まるで é usado para descrições vivas, exageros e impressões marcantes.

Com a forma negativa, まるで〜ない significa "nem um pouco", "de jeito nenhum", com sentido parecido a 全然〜ない.$$,
    $$まるで reforça comparações; sozinho, sem ようだ ou みたいだ, ele soa incompleto no uso de "como se".

No uso negativo, まるで〜ない é um pouco mais expressivo que 全然〜ない: まるでわからない (não entendo absolutamente nada).

É muito comum em descrições de histórias, filmes e paisagens.$$,
    $$まるで + Substantivo + の + ようだ / ような / ように
まるで + Substantivo + みたいだ / みたいな / みたいに
まるで + Frase (forma simples) + ようだ / みたいだ
まるで + Frase negativa (nem um pouco)$$,
    $$まるで$$,
    $$まるで$$,
    ARRAY['まるで']::text[],
    ARRAY['まるで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-55', $$彼女はまるで人形のようだ。$$, $$かのじょはまるでにんぎょうのようだ。$$, $$Ela parece até uma boneca.$$),
    ('n3-grammar-55', $$今日はまるで夏みたいに暑い。$$, $$きょうはまるでなつみたいにあつい。$$, $$Hoje está quente como se fosse verão.$$),
    ('n3-grammar-55', $$彼はまるで何も知らないような顔をした。$$, $$かれはまるでなにもしらないようなかおをした。$$, $$Ele fez uma cara como se não soubesse de nada.$$),
    ('n3-grammar-55', $$この絵はまるで写真のようだ。$$, $$このえはまるでしゃしんのようだ。$$, $$Este quadro parece até uma foto.$$),
    ('n3-grammar-55', $$こんなにうれしいことがあるなんて、まるで夢を見ているみたいだ。$$, $$こんなにうれしいことがあるなんて、まるでゆめをみているみたいだ。$$, $$Algo tão bom assim acontecer parece até que estou sonhando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の日本語は____日本人のようだ。$$, $$O japonês dele é igualzinho ao de um japonês.$$),
        (2, $$この部屋は____ホテルみたいにきれいだ。$$, $$Este quarto está limpo como se fosse um hotel.$$),
        (3, $$彼は____王様のように振る舞う。$$, $$Ele se comporta como se fosse um rei.$$),
        (4, $$彼女は____雪のように白い肌をしている。$$, $$Ela tem a pele branca como a neve.$$),
        (5, $$二人は____本当の兄弟のように仲がいい。$$, $$Os dois se dão tão bem que parecem irmãos de verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まるで$$),
        (2, $$まるで$$),
        (3, $$まるで$$),
        (4, $$まるで$$),
        (5, $$まるで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
