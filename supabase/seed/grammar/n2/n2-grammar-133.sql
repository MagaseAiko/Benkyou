-- n2-grammar-133 — 幸いなことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-133',
    'grammar',
    'N2',
    $$幸いなことに$$,
    $$saiwai na koto ni$$,
    $$Felizmente / Por sorte / Para nossa sorte$$,
    $$幸いなことに expressa que algo aconteceu de forma favorável, geralmente quando poderia ter sido pior. Equivale a "felizmente" ou "por sorte".

A pessoa mostra alívio ou gratidão pela situação. Por exemplo, "houve um acidente, mas felizmente ninguém se feriu".

O padrão 〜ことに também aparece com outras palavras de sentimento, como 残念なことに e 驚いたことに.$$,
    $$A forma 幸い sozinha ou 幸いにも tem o mesmo sentido.

O padrão Adjetivo + ことに expressa o sentimento da pessoa que fala sobre o fato.$$,
    $$幸いなことに、 + Frase
幸いにも、 + Frase$$,
    $$幸いなことに$$,
    $$幸いなことに|幸いにも|さいわいなことに|幸い$$,
    ARRAY['幸い', 'な', 'こと', 'に']::text[],
    ARRAY['幸いなことに', '幸いにも', '幸い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-133', $$幸いなことに、けが人はいなかった。$$, $$さいわいなことに、けがにんはいなかった。$$, $$Felizmente, não houve feridos.$$),
    ('n2-grammar-133', $$幸いなことに、天気に恵まれた。$$, $$さいわいなことに、てんきにめぐまれた。$$, $$Por sorte, fomos agraciados com bom tempo.$$),
    ('n2-grammar-133', $$財布を落としたが、幸いにも見つかった。$$, $$さいふをおとしたが、さいわいにもみつかった。$$, $$Perdi a carteira, mas felizmente foi encontrada.$$),
    ('n2-grammar-133', $$幸いなことに、電車にはまだ間に合った。$$, $$さいわいなことに、でんしゃにはまだまにあった。$$, $$Por sorte, ainda deu tempo de pegar o trem.$$),
    ('n2-grammar-133', $$幸い、病気は軽かった。$$, $$さいわい、びょうきはかるかった。$$, $$Felizmente, a doença era leve.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、火事はすぐに消えた。$$, $$Felizmente, o incêndio foi logo apagado.$$),
        (2, $$____、試験に合格できた。$$, $$Por sorte, consegui passar na prova.$$),
        (3, $$事故に遭ったが、____命は助かった。$$, $$Sofri um acidente, mas felizmente sobrevivi.$$),
        (4, $$____、雨は降らなかった。$$, $$Por sorte, não choveu.$$),
        (5, $$____、近くに病院があった。$$, $$Felizmente, havia um hospital por perto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$幸いなことに$$),
        (1, $$幸いにも$$),
        (1, $$幸い$$),
        (2, $$幸いなことに$$),
        (2, $$幸いにも$$),
        (2, $$幸い$$),
        (3, $$幸いなことに$$),
        (3, $$幸いにも$$),
        (3, $$幸い$$),
        (4, $$幸いなことに$$),
        (4, $$幸いにも$$),
        (4, $$幸い$$),
        (5, $$幸いなことに$$),
        (5, $$幸いにも$$),
        (5, $$幸い$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
