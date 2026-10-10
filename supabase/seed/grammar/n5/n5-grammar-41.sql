-- n5-grammar-41 — 〜なくちゃ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-41',
    'grammar',
    'N5',
    $$〜なくちゃ$$,
    $$nakucha$$,
    $$Tenho que / Preciso / Devo$$,
    $$なくちゃ é uma forma falada e casual de dizer que algo precisa ser feito. Equivale a "tenho que" ou "preciso".

Ela vem da forma completa なくては, que na fala rápida vira なくちゃ. A frase completa seria なくてはいけない ou なくてはならない, mas, na conversa, o final いけない é muitas vezes omitido, porque o sentido de obrigação já fica claro.

Por ser bem informal, なくちゃ é usada com amigos, família ou quando a pessoa fala consigo mesma, lembrando de algo que precisa fazer.

Existe ainda outra forma curta muito comum, なきゃ, que vem de なければ e tem exatamente o mesmo sentido.$$,
    $$なくちゃ e なきゃ são extremamente comuns na fala do dia a dia, principalmente entre jovens.

Por serem contrações, não são adequadas para situações formais, como falar com um chefe ou escrever um e-mail de trabalho. Nesses casos, usa-se なければなりません ou なくてはいけません.

O mesmo tipo de contração aparece em ちゃいけない, onde ては vira ちゃ.$$,
    $$Verbo na forma ない sem い + くちゃ
Verbo na forma ない sem い + くちゃ + いけない / ならない

Forma completa: なくては + いけない / ならない
Variação: Verbo na forma ない sem い + きゃ (なきゃ)$$,
    $$なくちゃ$$,
    $$なくちゃ|なきゃ$$,
    ARRAY['なくちゃ']::text[],
    ARRAY['なくちゃ', 'なきゃ', 'なくちゃいけない', 'なくちゃならない', 'なきゃいけない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-41', $$あ、もう行かなくちゃ。$$, $$あ、もういかなくちゃ。$$, $$Ah, já tenho que ir.$$),
    ('n5-grammar-41', $$明日は早く起きなくちゃ。$$, $$あしたははやくおきなくちゃ。$$, $$Amanhã tenho que acordar cedo.$$),
    ('n5-grammar-41', $$今日は宿題をしなくちゃいけない。$$, $$きょうはしゅくだいをしなくちゃいけない。$$, $$Hoje tenho que fazer a lição.$$),
    ('n5-grammar-41', $$寝る前に薬を飲まなくちゃ。$$, $$ねるまえにくすりをのまなくちゃ。$$, $$Preciso tomar o remédio antes de dormir.$$),
    ('n5-grammar-41', $$牛乳がない。買いに行かなきゃ。$$, $$ぎゅうにゅうがない。かいにいかなきゃ。$$, $$Acabou o leite. Tenho que ir comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あ、もう八時だ。急が____。$$, $$Ah, já são oito horas. Tenho que me apressar.$$),
        (2, $$来週テストだから、勉強し____。$$, $$Semana que vem tem prova, então tenho que estudar.$$),
        (3, $$部屋が汚いから、掃除し____。$$, $$O quarto está sujo, então preciso limpar.$$),
        (4, $$今晩、母に電話し____いけない。$$, $$Hoje à noite tenho que ligar para minha mãe.$$),
        (5, $$明日は大事な会議だから、早く寝____。$$, $$Amanhã tem uma reunião importante, então tenho que dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくちゃ$$),
        (1, $$なきゃ$$),
        (2, $$なくちゃ$$),
        (2, $$なきゃ$$),
        (3, $$なくちゃ$$),
        (3, $$なきゃ$$),
        (4, $$なくちゃ$$),
        (4, $$なきゃ$$),
        (5, $$なくちゃ$$),
        (5, $$なきゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
