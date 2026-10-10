-- n4-grammar-52 — 〜なければいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-52',
    'grammar',
    'N4',
    $$〜なければいけない$$,
    $$nakereba ikenai$$,
    $$Ter que / Precisar / Dever$$,
    $$なければいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

Ela vem da condicional なければ ("se não fizer") + いけない ("não está bem"). A ideia literal é "se não fizer, não está bem", ou seja, é preciso fazer.

なければいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como compromissos, tarefas e coisas que a pessoa sente que precisa fazer. Por isso, é muito comum na conversa.

Para formar, tira-se o い da forma ない e acrescenta-se ければいけない. Na fala casual, なければ costuma virar なきゃ.$$,
    $$なければいけない e なくてはいけない têm o mesmo sentido. A primeira aparece um pouco mais na conversa do dia a dia.

Na fala muito informal, a frase pode terminar só com なきゃ, omitindo いけない.

Para dizer que algo não é necessário, o oposto é なくてもいい.$$,
    $$Verbo na forma ない sem い + ければいけない
Adjetivo い sem い + くなければいけない
Substantivo / Adjetivo な + でなければいけない

Educado: なければいけません
Passado: なければいけなかった / なければいけませんでした
Fala casual: なきゃいけない / なきゃ$$,
    $$なければいけない$$,
    $$なければいけない|なければいけません|なければいけなかった|なきゃいけない$$,
    ARRAY['なければ', 'いけない']::text[],
    ARRAY['なければいけない', 'なければいけません', 'なければいけなかった', 'なきゃいけない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-52', $$明日は早く起きなければいけません。$$, $$あしたははやくおきなければいけません。$$, $$Amanhã tenho que acordar cedo.$$),
    ('n4-grammar-52', $$今日は宿題をしなければいけない。$$, $$きょうはしゅくだいをしなければいけない。$$, $$Hoje tenho que fazer a lição.$$),
    ('n4-grammar-52', $$毎日薬を飲まなければいけません。$$, $$まいにちくすりをのまなければいけません。$$, $$Tenho que tomar remédio todo dia.$$),
    ('n4-grammar-52', $$昨日は残業しなければいけなかった。$$, $$きのうはざんぎょうしなければいけなかった。$$, $$Ontem tive que fazer hora extra.$$),
    ('n4-grammar-52', $$あ、もう帰らなきゃいけない。$$, $$あ、もうかえらなきゃいけない。$$, $$Ah, já tenho que ir embora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日中にこの本を返さ____。$$, $$Tenho que devolver este livro ainda hoje.$$),
        (2, $$来週までに、引っ越しの準備をし____。$$, $$Tenho que preparar a mudança até a semana que vem.$$),
        (3, $$試験の前に、もっと勉強し____。$$, $$Antes da prova, tenho que estudar mais.$$),
        (4, $$昨日は病院に行か____。$$, $$Ontem tive que ir ao hospital.$$),
        (5, $$明日は六時に起き____から、早く寝ます。$$, $$Amanhã tenho que acordar às seis, então vou dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なければいけません$$),
        (1, $$なければいけない$$),
        (2, $$なければいけません$$),
        (2, $$なければいけない$$),
        (3, $$なければいけません$$),
        (3, $$なければいけない$$),
        (4, $$なければいけなかった$$),
        (4, $$なければいけませんでした$$),
        (5, $$なければいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
