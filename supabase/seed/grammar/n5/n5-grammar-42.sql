-- n5-grammar-42 — 〜なくてはいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-42',
    'grammar',
    'N5',
    $$〜なくてはいけない$$,
    $$nakute wa ikenai$$,
    $$Ter que / Precisar / Dever$$,
    $$なくてはいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

A lógica da estrutura é uma dupla negação: "se não fizer, não está bem". Ou seja, não fazer é proibido, então é preciso fazer.

Ela é formada pela forma ない do verbo, trocando o い final por くては, seguida de いけない. Na forma educada, fica なくてはいけません.

なくてはいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como regras do dia a dia, compromissos e coisas que a pessoa sente que precisa fazer. É mais comum na conversa que なくてはならない, que soa mais formal.$$,
    $$Na fala, なくては costuma virar なくちゃ, formando なくちゃいけない. Essa é a versão casual da mesma ideia.

As formas なければいけない e なければならない também expressam obrigação e são muito comuns. Elas aparecem no N4.

Para dizer que algo não é necessário, o oposto é なくてもいい.$$,
    $$Verbo na forma ない sem い + くてはいけない
Adjetivo い sem い + くなくてはいけない
Substantivo / Adjetivo な + でなくてはいけない

Educado: なくてはいけません
Passado: なくてはいけなかった / なくてはいけませんでした$$,
    $$なくてはいけない$$,
    $$なくてはいけない|なくてはいけません|なくてはいけなかった$$,
    ARRAY['なくて', 'は', 'いけない']::text[],
    ARRAY['なくてはいけない', 'なくてはいけません', 'なくてはいけなかった', 'なくてはいけませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-42', $$毎日薬を飲まなくてはいけません。$$, $$まいにちくすりをのまなくてはいけません。$$, $$Tenho que tomar remédio todo dia.$$),
    ('n5-grammar-42', $$明日までにレポートを出さなくてはいけない。$$, $$あしたまでにレポートをださなくてはいけない。$$, $$Tenho que entregar o relatório até amanhã.$$),
    ('n5-grammar-42', $$この学校では制服を着なくてはいけません。$$, $$このがっこうではせいふくをきなくてはいけません。$$, $$Nesta escola, é preciso usar uniforme.$$),
    ('n5-grammar-42', $$昨日は遅くまで働かなくてはいけなかった。$$, $$きのうはおそくまではたらかなくてはいけなかった。$$, $$Ontem tive que trabalhar até tarde.$$),
    ('n5-grammar-42', $$日本では車は左側を走らなくてはいけません。$$, $$にほんではくるまはひだりがわをはしらなくてはいけません。$$, $$No Japão, os carros precisam andar pela esquerda.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝六時に起き____。$$, $$Tenho que acordar às seis toda manhã.$$),
        (2, $$今日中に宿題をし____。$$, $$Tenho que fazer a lição ainda hoje.$$),
        (3, $$図書館の本は今週返さ____。$$, $$Tenho que devolver os livros da biblioteca esta semana.$$),
        (4, $$昨日は病院に行か____。$$, $$Ontem tive que ir ao hospital.$$),
        (5, $$車を運転するときは、免許を持ってい____。$$, $$Quando dirige, você precisa estar com a carteira de motorista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてはいけません$$),
        (1, $$なくてはいけない$$),
        (2, $$なくてはいけません$$),
        (2, $$なくてはいけない$$),
        (3, $$なくてはいけません$$),
        (3, $$なくてはいけない$$),
        (4, $$なくてはいけなかった$$),
        (4, $$なくてはいけませんでした$$),
        (5, $$なくてはいけません$$),
        (5, $$なくてはいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
