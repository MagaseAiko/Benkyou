-- n1-grammar-231 — 〜ってば / 〜ったら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-231',
    'grammar',
    'N1',
    $$〜ってば / 〜ったら$$,
    $$tteba / ttara$$,
    $$Já disse / Ora essa / Puxa$$,
    $$ってば e ったら são partículas coloquiais usadas no fim da frase ou depois de um nome. Têm dois usos principais.

O primeiro, no fim da frase, mostra impaciência porque a pessoa já disse algo e o outro não escuta. Equivale a "já disse!" ou "estou falando!". Por exemplo, "já disse que estou bem!".

O segundo, depois de um nome, mostra irritação, surpresa ou carinho em relação à pessoa. Equivale a "ora essa" ou "puxa". Por exemplo, "puxa, minha mãe esqueceu de novo".$$,
    $$São usados apenas em conversas informais com pessoas próximas.

ったら depois de um nome é parecido com ときたら, mas soa mais leve.$$,
    $$Frase + ってば / ったら
Substantivo (pessoa) + ったら / ってば + Frase$$,
    $$ってば$$,
    $$ってば|ったら$$,
    ARRAY['ってば']::text[],
    ARRAY['ってば', 'ったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-231', $$大丈夫だってば。心配しないで。$$, $$だいじょうぶだってば。しんぱいしないで。$$, $$Já disse que estou bem. Não se preocupe.$$),
    ('n1-grammar-231', $$早くしてってば。$$, $$はやくしてってば。$$, $$Anda logo, estou falando!$$),
    ('n1-grammar-231', $$お母さんったら、また鍵を忘れたの？$$, $$おかあさんったら、またかぎをわすれたの？$$, $$Puxa, mãe, esqueceu a chave de novo?$$),
    ('n1-grammar-231', $$もう、あなたったら。$$, $$もう、あなたったら。$$, $$Ora essa, você hein.$$),
    ('n1-grammar-231', $$行かないってば。何度言ったらわかるの。$$, $$いかないってば。なんどいったらわかるの。$$, $$Já disse que não vou. Quantas vezes vou ter que repetir?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$知らない____。本当だよ。$$, $$Já disse que não sei. É verdade.$$),
        (2, $$もう寝る____。$$, $$Já disse que vou dormir.$$),
        (3, $$うちの犬____、またスリッパをかんでいる。$$, $$Puxa, nosso cachorro está mordendo o chinelo de novo.$$),
        (4, $$ねえ、聞いてる____。$$, $$Ei, está me ouvindo ou não?$$),
        (5, $$お父さん____、また同じ話をしている。$$, $$Ora essa, o papai está contando a mesma história de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-231', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ってば$$),
        (2, $$ってば$$),
        (3, $$ったら$$),
        (3, $$ってば$$),
        (4, $$ってば$$),
        (4, $$ったら$$),
        (5, $$ったら$$),
        (5, $$ってば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
