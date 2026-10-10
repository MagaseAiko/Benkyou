-- n1-grammar-200 — 〜と言えなくもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-200',
    'grammar',
    'N1',
    $$〜と言えなくもない$$,
    $$to ienaku mo nai$$,
    $$Pode-se dizer que / Não deixa de ser / Até que dá para dizer$$,
    $$と言えなくもない é uma dupla negação que expressa uma opinião com cautela. Equivale a "pode-se dizer que" ou "não deixa de ser".

A pessoa admite uma ideia, mas sem muita certeza ou entusiasmo. Por exemplo, "pode-se dizer que este resultado é um sucesso" ou "não deixa de ser verdade".

É uma forma indireta e um pouco formal.$$,
    $$É parecido com と言えないこともない, que tem o mesmo sentido.

É usado quando a pessoa não quer afirmar algo com força.$$,
    $$Frase (forma simples) + と言えなくもない
Substantivo / Adjetivo な + だ + と言えなくもない$$,
    $$と言えなくもない$$,
    $$と言えなくもない|といえなくもない|と言えないこともない|と言えなくもありません$$,
    ARRAY['と', '言えなく', 'も', 'ない']::text[],
    ARRAY['と言えなくもない', 'と言えないこともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-200', $$この結果は、成功だと言えなくもない。$$, $$このけっかは、せいこうだといえなくもない。$$, $$Pode-se dizer que este resultado é um sucesso.$$),
    ('n1-grammar-200', $$彼の意見も、正しいと言えなくもない。$$, $$かれのいけんも、ただしいといえなくもない。$$, $$A opinião dele também não deixa de estar correta.$$),
    ('n1-grammar-200', $$この料理は、おいしいと言えなくもない。$$, $$このりょうりは、おいしいといえなくもない。$$, $$Até que dá para dizer que esta comida é gostosa.$$),
    ('n1-grammar-200', $$彼女の態度は、少し失礼だと言えないこともない。$$, $$かのじょのたいどは、すこししつれいだといえないこともない。$$, $$A atitude dela não deixa de ser um pouco rude.$$),
    ('n1-grammar-200', $$これも一つの方法だと言えなくもない。$$, $$これもひとつのほうほうだといえなくもない。$$, $$Pode-se dizer que este também é um método.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵は、上手だ____。$$, $$Até que dá para dizer que este quadro é bem feito.$$),
        (2, $$彼の行動は、勇気がある____。$$, $$Pode-se dizer que a atitude dele foi corajosa.$$),
        (3, $$この値段なら、安い____。$$, $$Com este preço, não deixa de ser barato.$$),
        (4, $$今回の失敗は、いい経験だった____。$$, $$Pode-se dizer que este fracasso foi uma boa experiência.$$),
        (5, $$彼は天才だ____。$$, $$Até que dá para dizer que ele é um gênio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-200', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言えなくもない$$),
        (1, $$と言えないこともない$$),
        (2, $$と言えなくもない$$),
        (2, $$と言えないこともない$$),
        (3, $$と言えなくもない$$),
        (3, $$と言えないこともない$$),
        (4, $$と言えなくもない$$),
        (4, $$と言えないこともない$$),
        (5, $$と言えなくもない$$),
        (5, $$と言えないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
