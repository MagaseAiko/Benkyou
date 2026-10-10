-- n2-grammar-78 — 〜ないではいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-78',
    'grammar',
    'N2',
    $$〜ないではいられない$$,
    $$nai dewa irarenai$$,
    $$Não consigo deixar de / Não dá para não / Não resisto a$$,
    $$ないではいられない indica que a pessoa não consegue se controlar e acaba fazendo algo, mesmo sem querer. Equivale a "não consigo deixar de" ou "não resisto a".

A ação acontece de forma natural ou por um sentimento forte. Por exemplo, "vendo aquela cena, não consegui deixar de chorar".

É uma expressão um pouco formal. A forma ずにはいられない tem o mesmo sentido.$$,
    $$O sujeito costuma ser a primeira pessoa. Para outras pessoas, usa-se ようだ ou らしい no final.

É parecido com ずにはいられない, que é um pouco mais formal.

Costuma vir com verbos de reação, como 笑う, 泣く, 言う ou 心配する.$$,
    $$Verbo (forma ない sem ない) + ないではいられない
する → しないではいられない$$,
    $$ないではいられない$$,
    $$ないではいられない|ないではいられなかった|ないではいられません$$,
    ARRAY['ない', 'では', 'いられない']::text[],
    ARRAY['ないではいられない', 'ないではいられなかった', 'ないではいられません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-78', $$その映画を見て、泣かないではいられなかった。$$, $$そのえいがをみて、なかないではいられなかった。$$, $$Vendo aquele filme, não consegui deixar de chorar.$$),
    ('n2-grammar-78', $$彼の話があまりに面白くて、笑わないではいられない。$$, $$かれのはなしがあまりにおもしろくて、わらわないではいられない。$$, $$A história dele é tão engraçada que não dá para não rir.$$),
    ('n2-grammar-78', $$困っている人を見ると、助けないではいられない。$$, $$こまっているひとをみると、たすけないではいられない。$$, $$Quando vejo alguém em dificuldade, não consigo deixar de ajudar.$$),
    ('n2-grammar-78', $$子供のことを心配しないではいられません。$$, $$こどものことをしんぱいしないではいられません。$$, $$Não consigo deixar de me preocupar com meu filho.$$),
    ('n2-grammar-78', $$甘いものを見ると、食べないではいられない。$$, $$あまいものをみると、たべないではいられない。$$, $$Quando vejo doce, não resisto a comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ひどい話を聞いて、怒ら____。$$, $$Ouvindo uma história horrível, não consegui deixar de ficar com raiva.$$),
        (2, $$この歌を聞くと、踊ら____。$$, $$Quando ouço esta música, não resisto a dançar.$$),
        (3, $$彼の態度には、一言言わ____。$$, $$Com aquela atitude dele, não consigo deixar de dizer alguma coisa.$$),
        (4, $$結果が気になって、確かめ____。$$, $$Estava tão curioso com o resultado que não consegui deixar de conferir.$$),
        (5, $$かわいい猫を見ると、触ら____。$$, $$Quando vejo um gato fofo, não resisto a fazer carinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないではいられなかった$$),
        (2, $$ないではいられない$$),
        (2, $$ないではいられません$$),
        (3, $$ないではいられない$$),
        (3, $$ないではいられません$$),
        (4, $$ないではいられなかった$$),
        (5, $$ないではいられない$$),
        (5, $$ないではいられません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
