-- n5-grammar-43 — 〜なくてはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-43',
    'grammar',
    'N5',
    $$〜なくてはならない$$,
    $$nakute wa naranai$$,
    $$Ter que / Ser obrigatório / Precisar$$,
    $$なくてはならない também significa "ter que" e expressa obrigação ou necessidade, assim como なくてはいけない.

A lógica é a mesma dupla negação: "se não fizer, não dá certo". Por isso, o resultado é uma obrigação.

A diferença está no tom. なくてはならない soa mais formal e objetivo. Ele é muito usado para obrigações gerais, regras sociais, leis e necessidades que não dependem da opinião de quem fala. Também aparece mais na escrita e em discursos.

Já なくてはいけない é mais comum na conversa e costuma refletir uma obrigação sentida pela própria pessoa. Na prática, as duas formas muitas vezes podem ser trocadas.$$,
    $$Na fala casual, なくてはならない pode virar なくちゃならない, mas essa forma é menos comum do que なくちゃいけない.

なくてはならない também pode ser usado como adjetivo antes de um substantivo, com o sentido de "indispensável", como algo sem o qual não se vive.

As formas なければならない e なければなりません têm o mesmo sentido e são muito usadas em textos formais.$$,
    $$Verbo na forma ない sem い + くてはならない
Adjetivo い sem い + くなくてはならない
Substantivo / Adjetivo な + でなくてはならない

Educado: なくてはなりません
Passado: なくてはならなかった / なくてはなりませんでした$$,
    $$なくてはならない$$,
    $$なくてはならない|なくてはなりません|なくてはならなかった$$,
    ARRAY['なくて', 'は', 'ならない']::text[],
    ARRAY['なくてはならない', 'なくてはなりません', 'なくてはならなかった', 'なくてはなりませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-43', $$社員は毎朝九時までに会社に来なくてはなりません。$$, $$しゃいんはまいあさくじまでにかいしゃにこなくてはなりません。$$, $$Os funcionários precisam chegar à empresa até as nove toda manhã.$$),
    ('n5-grammar-43', $$外国に行くとき、パスポートを持っていなくてはならない。$$, $$がいこくにいくとき、パスポートをもっていなくてはならない。$$, $$Quando se vai ao exterior, é preciso ter passaporte.$$),
    ('n5-grammar-43', $$来月、引っ越さなくてはならない。$$, $$らいげつ、ひっこさなくてはならない。$$, $$Mês que vem, vou ter que me mudar.$$),
    ('n5-grammar-43', $$試験では、黒いペンを使わなくてはなりません。$$, $$しけんでは、くろいペンをつかわなくてはなりません。$$, $$Na prova, é obrigatório usar caneta preta.$$),
    ('n5-grammar-43', $$父が病気で、仕事を休まなくてはならなかった。$$, $$ちちがびょうきで、しごとをやすまなくてはならなかった。$$, $$Meu pai ficou doente, e eu tive que faltar ao trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$国民は税金を払わ____。$$, $$Os cidadãos têm que pagar impostos.$$),
        (2, $$会議の前に資料を読ま____。$$, $$É preciso ler os documentos antes da reunião.$$),
        (3, $$留学生はビザを持ってい____。$$, $$Os estudantes estrangeiros precisam ter visto.$$),
        (4, $$先週は毎日残業し____。$$, $$Semana passada, tive que fazer hora extra todo dia.$$),
        (5, $$約束は守ら____。$$, $$Promessas devem ser cumpridas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてはなりません$$),
        (1, $$なくてはならない$$),
        (2, $$なくてはなりません$$),
        (2, $$なくてはならない$$),
        (3, $$なくてはなりません$$),
        (3, $$なくてはならない$$),
        (4, $$なくてはならなかった$$),
        (4, $$なくてはなりませんでした$$),
        (5, $$なくてはならない$$),
        (5, $$なくてはなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
