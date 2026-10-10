-- n4-grammar-53 — 〜なければならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-53',
    'grammar',
    'N4',
    $$〜なければならない$$,
    $$nakereba naranai$$,
    $$Ter que / Ser obrigatório / Dever$$,
    $$なければならない também expressa obrigação, como なければいけない. Equivale a "ter que", "ser obrigatório" ou "dever".

A ideia literal é "se não fizer, não dá". O tom, porém, é mais formal e objetivo. Por isso, ela é muito usada para obrigações gerais, regras, leis, deveres sociais e necessidades que não dependem da vontade de quem fala.

Também é a forma mais comum em textos escritos, notícias, regulamentos e discursos.

A formação é igual à de なければいけない: tira-se o い da forma ない e acrescenta-se ければならない.$$,
    $$Na prática, なければならない e なければいけない muitas vezes podem ser trocadas. A diferença é o tom: ならない é mais formal e objetivo; いけない é mais pessoal.

Em leis e regulamentos, é muito comum ver a forma escrita ねばならない, mais literária.

Na fala, a forma longa pode soar rígida. Entre amigos, prefere-se なきゃ.$$,
    $$Verbo na forma ない sem い + ければならない
Adjetivo い sem い + くなければならない
Substantivo / Adjetivo な + でなければならない

Educado: なければなりません
Passado: なければならなかった / なければなりませんでした$$,
    $$なければならない$$,
    $$なければならない|なければなりません|なければならなかった$$,
    ARRAY['なければ', 'ならない']::text[],
    ARRAY['なければならない', 'なければなりません', 'なければならなかった', 'なければなりませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-53', $$学生は学校の規則を守らなければならない。$$, $$がくせいはがっこうのきそくをまもらなければならない。$$, $$Os alunos devem seguir as regras da escola.$$),
    ('n4-grammar-53', $$外国人は在留カードを持っていなければなりません。$$, $$がいこくじんはざいりゅうカードをもっていなければなりません。$$, $$Os estrangeiros devem portar o cartão de residência.$$),
    ('n4-grammar-53', $$車に乗るときは、シートベルトをしなければならない。$$, $$くるまにのるときは、シートベルトをしなければならない。$$, $$Quando se anda de carro, é obrigatório usar o cinto de segurança.$$),
    ('n4-grammar-53', $$来月までにビザを更新しなければなりません。$$, $$らいげつまでにビザをこうしんしなければなりません。$$, $$Tenho que renovar o visto até o mês que vem.$$),
    ('n4-grammar-53', $$昨日は雨の中を歩いて帰らなければならなかった。$$, $$きのうはあめのなかをあるいてかえらなければならなかった。$$, $$Ontem tive que voltar para casa a pé debaixo de chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$税金は必ず払わ____。$$, $$Os impostos têm que ser pagos sem falta.$$),
        (2, $$選手は毎日練習し____。$$, $$Os atletas têm que treinar todos os dias.$$),
        (3, $$国民は法律を守ら____。$$, $$Os cidadãos devem cumprir a lei.$$),
        (4, $$先週は毎日早く出勤し____。$$, $$Semana passada, tive que chegar cedo ao trabalho todo dia.$$),
        (5, $$この書類は、黒いペンで書か____。$$, $$Este documento deve ser preenchido com caneta preta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なければならない$$),
        (1, $$なければなりません$$),
        (2, $$なければならない$$),
        (2, $$なければなりません$$),
        (3, $$なければならない$$),
        (3, $$なければなりません$$),
        (4, $$なければならなかった$$),
        (4, $$なければなりませんでした$$),
        (5, $$なければならない$$),
        (5, $$なければなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
