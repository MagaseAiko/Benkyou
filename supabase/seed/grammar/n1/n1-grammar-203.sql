-- n1-grammar-203 — 〜という
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-203',
    'grammar',
    'N1',
    $$〜という$$,
    $$to iu$$,
    $$Nada menos que / Cerca de / Todos os$$,
    $$という, entre um número e um substantivo, destaca que a quantidade é muito grande. Equivale a "nada menos que" ou "cerca de".

Por exemplo, "nada menos que mil pessoas vieram" ou "milhares de estrelas".

Também aparece na estrutura 〜という〜, repetindo a palavra, para indicar "todos os", como "todas as janelas foram quebradas".$$,
    $$Expressões comuns são 何千という人, 何万という星 e 窓という窓.

É uma forma de dar ênfase, não de citar algo.$$,
    $$Número + という + Substantivo
Substantivo + という + Mesmo substantivo$$,
    $$という$$,
    $$という$$,
    ARRAY['と', 'いう']::text[],
    ARRAY['という']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-203', $$コンサートには何万という人が集まった。$$, $$コンサートにはなんまんというひとがあつまった。$$, $$Dezenas de milhares de pessoas se reuniram no show.$$),
    ('n1-grammar-203', $$空には何千という星が輝いていた。$$, $$そらにはなんぜんというほしがかがやいていた。$$, $$Milhares de estrelas brilhavam no céu.$$),
    ('n1-grammar-203', $$台風で、窓という窓が割れた。$$, $$たいふうで、まどというまどがわれた。$$, $$Com o tufão, todas as janelas se quebraram.$$),
    ('n1-grammar-203', $$百年という長い歴史がある店だ。$$, $$ひゃくねんというながいれきしがあるみせだ。$$, $$É uma loja com nada menos que cem anos de história.$$),
    ('n1-grammar-203', $$彼は三十年という長い間、この会社で働いた。$$, $$かれはさんじゅうねんというながいあいだ、このかいしゃではたらいた。$$, $$Ele trabalhou nesta empresa por nada menos que trinta anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この寺には、何百____人が毎日訪れる。$$, $$Centenas de pessoas visitam este templo todos os dias.$$),
        (2, $$店の前には、何十メートル____行列ができていた。$$, $$Havia uma fila de dezenas de metros em frente à loja.$$),
        (3, $$部屋の本____本が床に落ちた。$$, $$Todos os livros do quarto caíram no chão.$$),
        (4, $$千年____歴史を持つ町だ。$$, $$É uma cidade com nada menos que mil anos de história.$$),
        (5, $$何百万____人がその番組を見た。$$, $$Milhões de pessoas assistiram a esse programa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-203', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$という$$),
        (2, $$という$$),
        (3, $$という$$),
        (4, $$という$$),
        (5, $$という$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
