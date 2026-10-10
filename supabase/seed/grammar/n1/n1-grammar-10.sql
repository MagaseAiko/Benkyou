-- n1-grammar-10 — 〜べくもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-10',
    'grammar',
    'N1',
    $$〜べくもない$$,
    $$beku mo nai$$,
    $$Não há como / É impossível / Nem dá para$$,
    $$べくもない indica que algo é totalmente impossível ou que não há nem possibilidade de acontecer. Equivale a "não há como" ou "é impossível".

Costuma vir com verbos como saber, comparar, esperar e desejar. Por exemplo, "não há como saber a verdade" ou "nem dá para comparar".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 知るべくもない, 望むべくもない e 比べるべくもない.

Na fala, usa-se mais ようがない ou はずがない.$$,
    $$Verbo (forma dicionário) + べくもない
する → するべくもない / すべくもない$$,
    $$べくもない$$,
    $$べくもない|べくもなかった|べくもありません$$,
    ARRAY['べく', 'も', 'ない']::text[],
    ARRAY['べくもない', 'べくもなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-10', $$彼の本当の気持ちは知るべくもない。$$, $$かれのほんとうのきもちはしるべくもない。$$, $$Não há como saber o que ele realmente sente.$$),
    ('n1-grammar-10', $$プロの選手とは比べるべくもない。$$, $$プロのせんしゅとはくらべるべくもない。$$, $$Nem dá para comparar com um atleta profissional.$$),
    ('n1-grammar-10', $$今の給料では、家を買うことなど望むべくもない。$$, $$いまのきゅうりょうでは、いえをかうことなどのぞむべくもない。$$, $$Com o salário atual, comprar uma casa é impossível.$$),
    ('n1-grammar-10', $$その時の私には、彼の苦しみなど知るべくもなかった。$$, $$そのときのわたしには、かれのくるしみなどしるべくもなかった。$$, $$Naquela época, não havia como eu saber do sofrimento dele.$$),
    ('n1-grammar-10', $$これ以上の結果は望むべくもない。$$, $$これいじょうのけっかはのぞむべくもない。$$, $$Não dá para esperar resultado melhor que este.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供の私には、親の苦労など知る____。$$, $$Para mim, criança, não havia como saber do sofrimento dos meus pais.$$),
        (2, $$このチームでは優勝など望む____。$$, $$Com este time, vencer o campeonato é impossível.$$),
        (3, $$本物とは比べる____。$$, $$Nem dá para comparar com o original.$$),
        (4, $$その事実を確かめる____。$$, $$Não há como confirmar esse fato.$$),
        (5, $$彼の才能には、私など及ぶ____。$$, $$Alguém como eu não tem como alcançar o talento dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べくもなかった$$),
        (2, $$べくもない$$),
        (3, $$べくもない$$),
        (4, $$べくもない$$),
        (5, $$べくもない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
