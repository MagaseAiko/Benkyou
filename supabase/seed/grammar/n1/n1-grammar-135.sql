-- n1-grammar-135 — 〜にも増して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-135',
    'grammar',
    'N1',
    $$〜にも増して$$,
    $$ni mo mashite$$,
    $$Mais do que / Ainda mais que / Acima de$$,
    $$にも増して indica que algo está num grau maior do que outra coisa que já era alta. Equivale a "mais do que" ou "ainda mais que".

Por exemplo, "este ano está ainda mais quente que no ano passado". Com palavras interrogativas, como 何にも増して, significa "acima de tudo".

É uma expressão formal.$$,
    $$Expressões comuns são 以前にも増して, 去年にも増して e 何にも増して.

É parecido com よりもっと, mas にも増して destaca que o primeiro termo já era alto.$$,
    $$Substantivo + にも増して
Palavra interrogativa + にも増して (acima de tudo)$$,
    $$にも増して$$,
    $$にも増して|にもまして$$,
    ARRAY['に', 'も', '増して']::text[],
    ARRAY['にも増して', 'にもまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-135', $$今年の夏は去年にも増して暑い。$$, $$ことしのなつはきょねんにもましてあつい。$$, $$O verão deste ano está ainda mais quente que o do ano passado.$$),
    ('n1-grammar-135', $$彼は以前にも増して、仕事に熱心になった。$$, $$かれはいぜんにもまして、しごとにねっしんになった。$$, $$Ele ficou ainda mais dedicado ao trabalho do que antes.$$),
    ('n1-grammar-135', $$何にも増して、健康が大切だ。$$, $$なににもまして、けんこうがたいせつだ。$$, $$Acima de tudo, a saúde é importante.$$),
    ('n1-grammar-135', $$今回の試験は前回にも増して難しかった。$$, $$こんかいのしけんはぜんかいにもましてむずかしかった。$$, $$A prova desta vez foi ainda mais difícil que a anterior.$$),
    ('n1-grammar-135', $$彼女は誰にも増して努力している。$$, $$かのじょはだれにもましてどりょくしている。$$, $$Ela se esforça mais do que qualquer um.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今年は例年____雪が多い。$$, $$Este ano está nevando ainda mais que nos anos anteriores.$$),
        (2, $$彼は前____元気になった。$$, $$Ele ficou ainda mais animado que antes.$$),
        (3, $$何____、家族が一番大事だ。$$, $$Acima de tudo, a família é o mais importante.$$),
        (4, $$この店は以前____人気がある。$$, $$Esta loja está ainda mais popular do que antes.$$),
        (5, $$母は誰____私のことを心配してくれる。$$, $$Minha mãe se preocupa comigo mais do que qualquer pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも増して$$),
        (1, $$にもまして$$),
        (2, $$にも増して$$),
        (2, $$にもまして$$),
        (3, $$にも増して$$),
        (3, $$にもまして$$),
        (4, $$にも増して$$),
        (4, $$にもまして$$),
        (5, $$にも増して$$),
        (5, $$にもまして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
