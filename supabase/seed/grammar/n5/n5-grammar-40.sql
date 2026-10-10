-- n5-grammar-40 — 〜なくてもいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-40',
    'grammar',
    'N5',
    $$〜なくてもいい$$,
    $$nakute mo ii$$,
    $$Não precisa / Não é necessário$$,
    $$なくてもいい é usado para dizer que algo não é necessário. Equivale a "não precisa" ou "não é preciso".

Literalmente, a estrutura quer dizer "mesmo não fazendo, está tudo bem". Ou seja, a pessoa tem liberdade para não fazer aquilo.

Ela é formada pela forma ない do verbo, trocando o い final por くても, e depois いい. Em perguntas, なくてもいいですか serve para pedir permissão para não fazer algo.

Com adjetivos い, usa-se くなくてもいい ("não precisa ser..."). Com substantivos e adjetivos な, usa-se じゃなくてもいい.

É o oposto de なければならない e なくてはいけない, que indicam obrigação.$$,
    $$Na conversa, なくても大丈夫 é tão comum quanto なくてもいい e soa um pouco mais leve e simpático.

なくてもかまわない tem o mesmo sentido, mas soa mais formal.

Quando alguém pergunta なければなりませんか ("tenho que...?"), a resposta negativa natural é いいえ、〜なくてもいいです.$$,
    $$Verbo na forma ない sem い + くてもいい
Adjetivo い sem い + くなくてもいい
Substantivo / Adjetivo な + じゃなくてもいい

Educado: なくてもいいです
Pergunta: なくてもいいですか
Variações: なくても大丈夫 / なくてもかまわない$$,
    $$なくてもいい$$,
    $$なくてもいい|なくても大丈夫|なくてもかまわない$$,
    ARRAY['なくて', 'も', 'いい']::text[],
    ARRAY['なくてもいい', 'なくてもいいです', 'なくても大丈夫', 'なくてもかまわない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-40', $$明日は来なくてもいいです。$$, $$あしたはこなくてもいいです。$$, $$Amanhã você não precisa vir.$$),
    ('n5-grammar-40', $$全部食べなくてもいいよ。$$, $$ぜんぶたべなくてもいいよ。$$, $$Não precisa comer tudo.$$),
    ('n5-grammar-40', $$ここでは靴を脱がなくてもいいですか。$$, $$ここではくつをぬがなくてもいいですか。$$, $$Aqui eu não preciso tirar os sapatos?$$),
    ('n5-grammar-40', $$急がなくても大丈夫ですよ。$$, $$いそがなくてもだいじょうぶですよ。$$, $$Não precisa ter pressa.$$),
    ('n5-grammar-40', $$高くなくてもいいから、丈夫なかばんがほしいです。$$, $$たかくなくてもいいから、じょうぶなかばんがほしいです。$$, $$Não precisa ser cara, só quero uma bolsa resistente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は宿題をし____です。$$, $$Hoje não precisa fazer a lição.$$),
        (2, $$ここに名前は書か____ですよ。$$, $$Aqui não precisa escrever o nome.$$),
        (3, $$「お金を払わなくてもいいですか。」「はい、払わ____。」$$, $$"Não preciso pagar?" "Isso, não precisa pagar."$$),
        (4, $$明日は休みだから、早く起き____。$$, $$Amanhã é folga, então não precisa acordar cedo.$$),
        (5, $$この仕事は日本語が上手____いいです。$$, $$Para este trabalho, não precisa ser bom em japonês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてもいい$$),
        (2, $$なくてもいい$$),
        (3, $$なくてもいいです$$),
        (3, $$なくてもいい$$),
        (3, $$なくても大丈夫です$$),
        (3, $$なくても大丈夫$$),
        (4, $$なくてもいい$$),
        (4, $$なくてもいいです$$),
        (4, $$なくても大丈夫$$),
        (4, $$なくても大丈夫です$$),
        (5, $$じゃなくても$$),
        (5, $$でなくても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
