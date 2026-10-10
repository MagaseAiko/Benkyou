-- n4-grammar-28 — 〜かい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-28',
    'grammar',
    'N4',
    $$〜かい$$,
    $$kai$$,
    $$Partícula de pergunta (casual)$$,
    $$かい é uma partícula de pergunta usada no final da frase, na fala casual. Ela transforma a frase em uma pergunta de "sim ou não", com um tom amigável.

É associada principalmente à fala masculina e de pessoas mais velhas, como pais, avôs e professores falando com crianças ou jovens. Soa gentil e um pouco paternal.

Ela vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な, sem だ.

Com perguntas que pedem explicação, aparece como のかい.$$,
    $$かい é usado apenas em perguntas de "sim ou não". Em perguntas com palavras interrogativas, como "o que" ou "onde", usa-se だい, como em 何だい.

Na fala de jovens, かい é pouco usado; eles preferem a entonação subindo ou の.

Por ser casual, かい nunca é usado com superiores ou em situações formais.$$,
    $$Verbo / Adjetivo い (forma simples) + かい
Substantivo / Adjetivo な + かい
Frase + のかい$$,
    $$かい$$,
    $$かい$$,
    ARRAY['かい']::text[],
    ARRAY['かい', 'のかい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-28', $$やあ、元気かい？$$, $$やあ、げんきかい？$$, $$E aí, tudo bem?$$),
    ('n4-grammar-28', $$もうご飯を食べたかい？$$, $$もうごはんをたべたかい？$$, $$Já comeu?$$),
    ('n4-grammar-28', $$明日、一緒に行くかい？$$, $$あした、いっしょにいくかい？$$, $$Quer ir junto amanhã?$$),
    ('n4-grammar-28', $$本当にそれでいいのかい？$$, $$ほんとうにそれでいいのかい？$$, $$Tem certeza de que está bom assim?$$),
    ('n4-grammar-28', $$君はここの学生かい？$$, $$きみはここのがくせいかい？$$, $$Você é aluno daqui?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$宿題はもう終わった____？$$, $$Já terminou a lição?$$),
        (2, $$この本、読む____？$$, $$Quer ler este livro?$$),
        (3, $$顔色が悪いね。疲れたの____？$$, $$Você está pálido. Está cansado?$$),
        (4, $$その服で寒くない____？$$, $$Não está com frio com essa roupa?$$),
        (5, $$みんな行くけど、君も行く____？$$, $$Todo mundo vai. Você também vai?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かい$$),
        (2, $$かい$$),
        (3, $$かい$$),
        (4, $$かい$$),
        (5, $$かい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
