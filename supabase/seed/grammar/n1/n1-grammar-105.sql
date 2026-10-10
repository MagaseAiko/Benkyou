-- n1-grammar-105 — 〜に値する
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-105',
    'grammar',
    'N1',
    $$〜に値する$$,
    $$ni atai suru$$,
    $$Digno de / Que merece / Que vale a pena$$,
    $$に値する indica que algo tem valor suficiente para merecer uma ação ou avaliação. Equivale a "digno de" ou "que merece".

Costuma vir com palavras como respeito, elogio, atenção, leitura ou confiança. Por exemplo, "um livro que vale a pena ler" ou "uma atitude digna de respeito".

A forma negativa, に値しない, significa "não merece".$$,
    $$Expressões comuns são 尊敬に値する, 称賛に値する, 注目に値する e 読むに値する.

É uma expressão formal, comum na escrita.$$,
    $$Substantivo + に値する
Verbo (forma dicionário) + に値する
Substantivo + に値しない$$,
    $$に値する$$,
    $$に値する|に値しない|にあたいする|に値します$$,
    ARRAY['に', '値する']::text[],
    ARRAY['に値する', 'に値しない', 'に値します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-105', $$彼の勇気は尊敬に値する。$$, $$かれのゆうきはそんけいにあたいする。$$, $$A coragem dele é digna de respeito.$$),
    ('n1-grammar-105', $$この本は一度読むに値する。$$, $$このほんはいちどよむにあたいする。$$, $$Este livro vale a pena ser lido pelo menos uma vez.$$),
    ('n1-grammar-105', $$彼女の努力は称賛に値する。$$, $$かのじょのどりょくはしょうさんにあたいする。$$, $$O esforço dela merece elogios.$$),
    ('n1-grammar-105', $$そんな話は信じるに値しない。$$, $$そんなはなしはしんじるにあたいしない。$$, $$Uma história dessas não merece crédito.$$),
    ('n1-grammar-105', $$この発見は注目に値する。$$, $$このはっけんはちゅうもくにあたいする。$$, $$Esta descoberta merece atenção.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の行動は表彰____。$$, $$A ação dele é digna de homenagem.$$),
        (2, $$この映画は見る____作品だ。$$, $$Este filme é uma obra que vale a pena assistir.$$),
        (3, $$あんな人の意見は聞く____。$$, $$A opinião de uma pessoa daquelas não merece ser ouvida.$$),
        (4, $$彼女の研究は高く評価する____。$$, $$A pesquisa dela merece ser muito bem avaliada.$$),
        (5, $$この結果は検討____。$$, $$Este resultado merece ser analisado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に値する$$),
        (1, $$に値します$$),
        (2, $$に値する$$),
        (3, $$に値しない$$),
        (4, $$に値する$$),
        (4, $$に値します$$),
        (5, $$に値する$$),
        (5, $$に値します$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
