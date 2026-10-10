-- n1-grammar-13 — 〜ぶり / 〜っぷり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-13',
    'grammar',
    'N1',
    $$〜ぶり / 〜っぷり$$,
    $$buri / ppuri$$,
    $$Jeito de / Modo de / Depois de tanto tempo$$,
    $$ぶり tem dois usos principais.

O primeiro, depois de substantivos ou da raiz de verbos, indica o modo ou a maneira como alguém faz algo. Equivale a "jeito de" ou "modo de". Por exemplo, "o jeito de trabalhar dele" ou "o jeito de comer". A forma っぷり é mais coloquial e enfática, como em 食べっぷり.

O segundo, depois de expressões de tempo, indica que algo acontece de novo depois de um certo tempo. Equivale a "depois de tanto tempo". Por exemplo, "nos vimos depois de cinco anos".$$,
    $$Expressões comuns são 仕事ぶり, 話しぶり, 食べっぷり, 飲みっぷり e 久しぶり.

A forma っぷり costuma elogiar algo feito com vontade.$$,
    $$Substantivo / Verbo (forma ます sem ます) + ぶり / っぷり
Período de tempo + ぶり (depois de tanto tempo)$$,
    $$ぶり$$,
    $$ぶり|っぷり$$,
    ARRAY['ぶり']::text[],
    ARRAY['ぶり', 'っぷり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-13', $$彼の仕事ぶりは素晴らしい。$$, $$かれのしごとぶりはすばらしい。$$, $$O jeito de trabalhar dele é excelente.$$),
    ('n1-grammar-13', $$五年ぶりに友達に会った。$$, $$ごねんぶりにともだちにあった。$$, $$Encontrei um amigo depois de cinco anos.$$),
    ('n1-grammar-13', $$彼の食べっぷりを見ていると、気持ちがいい。$$, $$かれのたべっぷりをみていると、きもちがいい。$$, $$Dá gosto ver o jeito como ele come.$$),
    ('n1-grammar-13', $$あの話しぶりからすると、彼は何か知っている。$$, $$あのはなしぶりからすると、かれはなにかしっている。$$, $$Pelo jeito como ele fala, sabe de alguma coisa.$$),
    ('n1-grammar-13', $$久しぶりに映画を見た。$$, $$ひさしぶりにえいがをみた。$$, $$Vi um filme depois de muito tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$十年____に故郷に帰った。$$, $$Voltei à minha terra natal depois de dez anos.$$),
        (2, $$彼女の生活____は質素だ。$$, $$O modo de vida dela é simples.$$),
        (3, $$気持ちのいい飲み____だね。$$, $$Que jeito animado de beber, hein.$$),
        (4, $$社長は新人の働き____を褒めた。$$, $$O presidente elogiou o jeito de trabalhar do novato.$$),
        (5, $$三日____に雨がやんだ。$$, $$A chuva parou depois de três dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶり$$),
        (2, $$ぶり$$),
        (3, $$っぷり$$),
        (4, $$ぶり$$),
        (5, $$ぶり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
