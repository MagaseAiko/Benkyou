-- n2-grammar-87 — 〜にほかならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-87',
    'grammar',
    'N2',
    $$〜にほかならない$$,
    $$ni hoka naranai$$,
    $$Não é nada mais que / É justamente / Nada além de$$,
    $$にほかならない serve para afirmar com muita certeza que algo é exatamente aquilo, e nada mais. Equivale a "não é nada mais que" ou "é justamente".

Muitas vezes é usado para explicar a causa verdadeira de algo. Por exemplo, "o sucesso dele não é nada mais que fruto do esforço".

É uma expressão formal e enfática, comum em textos e discursos.$$,
    $$Costuma aparecer como からにほかならない para explicar uma razão.

É parecido com にすぎない na forma, mas o sentido é diferente. にすぎない diminui a importância, enquanto にほかならない reforça.$$,
    $$Substantivo + にほかならない
Frase + から + にほかならない
Frase + ため + にほかならない$$,
    $$にほかならない$$,
    $$にほかならない|に他ならない|にほかなりません|に他なりません$$,
    ARRAY['に', 'ほか', 'ならない']::text[],
    ARRAY['にほかならない', 'に他ならない', 'にほかなりません', 'からにほかならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-87', $$彼の成功は努力の結果にほかならない。$$, $$かれのせいこうはどりょくのけっかにほかならない。$$, $$O sucesso dele não é nada mais que fruto do esforço.$$),
    ('n2-grammar-87', $$親が厳しいのは、子供を愛しているからにほかならない。$$, $$おやがきびしいのは、こどもをあいしているからにほかならない。$$, $$Os pais são rígidos justamente porque amam os filhos.$$),
    ('n2-grammar-87', $$この事故は不注意にほかならない。$$, $$このじこはふちゅういにほかならない。$$, $$Este acidente não é nada mais que descuido.$$),
    ('n2-grammar-87', $$私がここまで来られたのは、皆さんのおかげにほかなりません。$$, $$わたしがここまでこられたのは、みなさんのおかげにほかなりません。$$, $$Se cheguei até aqui, foi justamente graças a todos vocês.$$),
    ('n2-grammar-87', $$それは言い訳に他ならない。$$, $$それはいいわけにほかならない。$$, $$Isso não é nada além de uma desculpa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼が怒ったのは、あなたを心配したから____。$$, $$Ele ficou bravo justamente porque se preocupou com você.$$),
        (2, $$この結果は、チーム全員の協力____。$$, $$Este resultado não é nada mais que a cooperação de toda a equipe.$$),
        (3, $$戦争は人間の愚かさ____。$$, $$A guerra não é nada além da estupidez humana.$$),
        (4, $$彼が合格できたのは、毎日勉強したから____。$$, $$Ele passou justamente porque estudou todos os dias.$$),
        (5, $$教育とは、未来への投資____。$$, $$A educação não é nada mais que um investimento no futuro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にほかならない$$),
        (1, $$に他ならない$$),
        (1, $$にほかなりません$$),
        (1, $$に他なりません$$),
        (2, $$にほかならない$$),
        (2, $$に他ならない$$),
        (2, $$にほかなりません$$),
        (2, $$に他なりません$$),
        (3, $$にほかならない$$),
        (3, $$に他ならない$$),
        (3, $$にほかなりません$$),
        (3, $$に他なりません$$),
        (4, $$にほかならない$$),
        (4, $$に他ならない$$),
        (4, $$にほかなりません$$),
        (4, $$に他なりません$$),
        (5, $$にほかならない$$),
        (5, $$に他ならない$$),
        (5, $$にほかなりません$$),
        (5, $$に他なりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
