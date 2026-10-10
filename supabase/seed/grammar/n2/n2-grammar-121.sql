-- n2-grammar-121 — 〜抜く
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-121',
    'grammar',
    'N2',
    $$〜抜く$$,
    $$nuku$$,
    $$Até o fim / Completamente / Com todas as forças$$,
    $$抜く, quando vem depois de outro verbo, indica que a ação é feita até o fim, de forma completa, mesmo sendo difícil. Equivale a "até o fim" ou "completamente".

Muitas vezes mostra esforço e persistência. Por exemplo, "corri a maratona até o fim" ou "pensei muito, até o limite".

Também pode indicar intensidade extrema, como em "estar completamente exausto".$$,
    $$Combinações comuns são 走り抜く, やり抜く, 考え抜く, 守り抜く e 困り抜く.

É parecido com 切る, como em 使い切る, mas 抜く destaca o esforço para superar dificuldades.$$,
    $$Verbo (forma ます sem ます) + 抜く$$,
    $$抜く$$,
    $$抜く|抜いた|抜いて|抜き|抜こう|抜け$$,
    ARRAY['抜く']::text[],
    ARRAY['抜く', '抜いた', '抜いて', '抜きます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-121', $$彼はマラソンを最後まで走り抜いた。$$, $$かれはマラソンをさいごまではしりぬいた。$$, $$Ele correu a maratona até o fim.$$),
    ('n2-grammar-121', $$何があっても、この仕事をやり抜くつもりだ。$$, $$なにがあっても、このしごとをやりぬくつもりだ。$$, $$Aconteça o que acontecer, pretendo levar este trabalho até o fim.$$),
    ('n2-grammar-121', $$考え抜いた結果、会社を辞めることにした。$$, $$かんがえぬいたけっか、かいしゃをやめることにした。$$, $$Depois de pensar muito bem, decidi sair da empresa.$$),
    ('n2-grammar-121', $$母は家族を守り抜いた。$$, $$はははかぞくをまもりぬいた。$$, $$Minha mãe protegeu a família com todas as forças.$$),
    ('n2-grammar-121', $$苦しい練習に耐え抜いて、優勝した。$$, $$くるしいれんしゅうにたえぬいて、ゆうしょうした。$$, $$Aguentou os treinos duros até o fim e venceu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一度始めたことは、最後までやり____。$$, $$O que se começa, deve-se levar até o fim.$$),
        (2, $$悩み____末、彼女は留学を決めた。$$, $$Depois de se angustiar muito, ela decidiu estudar no exterior.$$),
        (3, $$選手たちは四十二キロを走り____。$$, $$Os atletas correram os quarenta e dois quilômetros até o fim.$$),
        (4, $$この秘密は最後まで守り____つもりだ。$$, $$Pretendo guardar este segredo até o fim.$$),
        (5, $$彼は厳しい時代を生き____。$$, $$Ele sobreviveu a uma época difícil até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$抜く$$),
        (1, $$抜こう$$),
        (2, $$抜いた$$),
        (3, $$抜いた$$),
        (4, $$抜く$$),
        (5, $$抜いた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
