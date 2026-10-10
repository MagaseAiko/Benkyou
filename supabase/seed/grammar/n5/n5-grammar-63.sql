-- n5-grammar-63 — 〜たい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-63',
    'grammar',
    'N5',
    $$〜たい$$,
    $$tai$$,
    $$Querer (fazer)$$,
    $$たい é usado para dizer que você quer fazer alguma coisa. Equivale a "querer" + verbo.

Ele é formado tirando ます do verbo e acrescentando たい. O resultado funciona como um adjetivo い, então se conjuga como tal: たくない (não quero), たかった (queria) e たくなかった (não queria).

O objeto do verbo pode ser marcado com を ou com が. Usar が dá um pouco mais de destaque ao objeto desejado.

たい expressa o desejo interno de quem fala. Por isso, em afirmações, é usado para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, usa-se たがっている, ou cita-se o que ela disse.

Para querer uma coisa (substantivo), e não uma ação, usa-se ほしい.$$,
    $$Perguntar a um superior o que ele quer fazer com たいですか pode soar direto demais. Em situações formais, prefere-se uma pergunta mais indireta.

たい é diferente de つもり: たい expressa vontade, enquanto つもり expressa plano ou intenção.

Como たい é um adjetivo い, não se usa だ depois dele.$$,
    $$Verbo na forma ます sem ます + たい
Verbo sem ます + たいです (educado)

Negativo: たくない / たくないです / たくありません
Passado: たかった / たかったです
Passado negativo: たくなかった

Objeto: Substantivo + を / が + Verbo たい$$,
    $$たい$$,
    $$たい|たくない|たかった|たくなかった|たくありません$$,
    ARRAY['たい']::text[],
    ARRAY['たい', 'たいです', 'たくない', 'たくありません', 'たかった', 'たくなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-63', $$いつか日本へ行きたいです。$$, $$いつかにほんへいきたいです。$$, $$Algum dia quero ir ao Japão.$$),
    ('n5-grammar-63', $$冷たい水が飲みたい。$$, $$つめたいみずがのみたい。$$, $$Quero beber água gelada.$$),
    ('n5-grammar-63', $$今日は何もしたくない。$$, $$きょうはなにもしたくない。$$, $$Hoje não quero fazer nada.$$),
    ('n5-grammar-63', $$子供のころ、パイロットになりたかったです。$$, $$こどものころ、パイロットになりたかったです。$$, $$Quando eu era criança, queria ser piloto.$$),
    ('n5-grammar-63', $$将来、何をしたいですか。$$, $$しょうらい、なにをしたいですか。$$, $$O que você quer fazer no futuro?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しい車を買い____です。$$, $$Quero comprar um carro novo.$$),
        (2, $$疲れたから、早く寝____。$$, $$Estou cansado, então quero dormir cedo.$$),
        (3, $$今日は雨だから、出かけ____。$$, $$Hoje está chovendo, então não quero sair.$$),
        (4, $$子供のころは医者になり____。$$, $$Quando eu era criança, queria ser médico.$$),
        (5, $$夏休みに何をし____ですか。$$, $$O que você quer fazer nas férias de verão?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たい$$),
        (2, $$たい$$),
        (2, $$たいです$$),
        (3, $$たくない$$),
        (3, $$たくないです$$),
        (3, $$たくありません$$),
        (4, $$たかった$$),
        (4, $$たかったです$$),
        (5, $$たい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
