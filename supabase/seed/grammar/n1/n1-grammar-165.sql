-- n1-grammar-165 — さも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-165',
    'grammar',
    'N1',
    $$さも$$,
    $$samo$$,
    $$Como se / Toda a aparência de / Bem como se$$,
    $$さも indica que alguém age ou fala como se algo fosse verdade, muitas vezes de forma exagerada ou falsa. Equivale a "como se" ou "com toda a aparência de".

Costuma vir junto com ように, そうに ou かのように. Por exemplo, "falou como se soubesse tudo".

O tom pode ser de crítica, quando a atitude parece falsa.$$,
    $$É parecido com いかにも, mas さも costuma ter um tom mais crítico, indicando fingimento.

Expressões comuns são さも知っているかのように e さもうれしそうに.$$,
    $$さも + Verbo / Adjetivo + ように / そうに
さも + Frase + かのように$$,
    $$さも$$,
    $$さも$$,
    ARRAY['さも']::text[],
    ARRAY['さも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-165', $$彼はさも知っているかのように話した。$$, $$かれはさもしっているかのようにはなした。$$, $$Ele falou como se soubesse de tudo.$$),
    ('n1-grammar-165', $$子供はさもうれしそうに笑った。$$, $$こどもはさもうれしそうにわらった。$$, $$A criança riu com toda a cara de quem estava feliz.$$),
    ('n1-grammar-165', $$彼女はさも自分がやったように言った。$$, $$かのじょはさもじぶんがやったようにいった。$$, $$Ela falou como se tivesse sido ela quem fez.$$),
    ('n1-grammar-165', $$さも困ったという顔をしている。$$, $$さもこまったというかおをしている。$$, $$Está com uma cara de quem está realmente em apuros.$$),
    ('n1-grammar-165', $$彼はさもおいしそうに食べている。$$, $$かれはさもおいしそうにたべている。$$, $$Ele está comendo com toda a cara de que está gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____自分が正しいかのように主張した。$$, $$Ele insistiu como se estivesse certo.$$),
        (2, $$犬は____眠そうにあくびをした。$$, $$O cachorro bocejou com toda a cara de sono.$$),
        (3, $$彼女は____何も知らないように振る舞った。$$, $$Ela agiu como se não soubesse de nada.$$),
        (4, $$彼は____面倒くさそうに返事をした。$$, $$Ele respondeu com toda a cara de quem estava com preguiça.$$),
        (5, $$____本当のことのように嘘をつく。$$, $$Conta mentiras como se fossem verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さも$$),
        (2, $$さも$$),
        (3, $$さも$$),
        (4, $$さも$$),
        (5, $$さも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
