-- n1-grammar-213 — 〜となると / 〜となれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-213',
    'grammar',
    'N1',
    $$〜となると / 〜となれば$$,
    $$to naru to / to nareba$$,
    $$Quando se trata de / Se for para / Nesse caso$$,
    $$となると e となれば indicam que, se uma situação se tornar realidade, algo muda ou se torna necessário. Equivalem a "quando se trata de" ou "se for para".

Muitas vezes a pessoa mostra que a situação é especial e exige outra atitude. Por exemplo, "conversar é uma coisa, mas quando se trata de discursar em público, fico nervoso".

Também indicam uma conclusão, como "se for assim, temos que mudar o plano".$$,
    $$É parecido com なら e と, mas となると destaca que a situação é especial ou importante.

A forma となったら também é usada.$$,
    $$Substantivo + となると / となれば
Verbo (forma simples) + となると / となれば$$,
    $$となると$$,
    $$となると|となれば|となったら$$,
    ARRAY['と', 'なる', 'と']::text[],
    ARRAY['となると', 'となれば', 'となったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-213', $$話すのは平気だが、人前でスピーチとなると緊張する。$$, $$はなすのはへいきだが、ひとまえでスピーチとなるときんちょうする。$$, $$Conversar não me incomoda, mas quando se trata de discursar em público, fico nervoso.$$),
    ('n1-grammar-213', $$留学するとなれば、お金がたくさん必要だ。$$, $$りゅうがくするとなれば、おかねがたくさんひつようだ。$$, $$Se for para fazer intercâmbio, vai precisar de muito dinheiro.$$),
    ('n1-grammar-213', $$彼が来ないとなると、計画を変えなければならない。$$, $$かれがこないとなると、けいかくをかえなければならない。$$, $$Se ele não vier, vamos ter que mudar o plano.$$),
    ('n1-grammar-213', $$いざ結婚となると、決めることがたくさんある。$$, $$いざけっこんとなると、きめることがたくさんある。$$, $$Quando chega a hora de casar, há muita coisa para decidir.$$),
    ('n1-grammar-213', $$一人で行くとなったら、少し不安だ。$$, $$ひとりでいくとなったら、すこしふあんだ。$$, $$Se for para ir sozinho, fico um pouco inseguro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理は好きだが、毎日作る____大変だ。$$, $$Gosto de cozinhar, mas quando se trata de fazer todo dia, é difícil.$$),
        (2, $$家を買う____、よく考えなければならない。$$, $$Se for para comprar uma casa, é preciso pensar bem.$$),
        (3, $$会議が中止____、資料は必要ない。$$, $$Se a reunião for cancelada, os materiais não serão necessários.$$),
        (4, $$社長が出席する____、準備をしっかりしないと。$$, $$Se o presidente for participar, temos que nos preparar bem.$$),
        (5, $$いざ本番____、手が震えてしまう。$$, $$Quando chega a hora da apresentação, minhas mãos tremem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-213', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$となると$$),
        (1, $$となれば$$),
        (1, $$となったら$$),
        (2, $$となると$$),
        (2, $$となれば$$),
        (2, $$となったら$$),
        (3, $$となると$$),
        (3, $$となれば$$),
        (3, $$となったら$$),
        (4, $$となると$$),
        (4, $$となれば$$),
        (4, $$となったら$$),
        (5, $$となると$$),
        (5, $$となれば$$),
        (5, $$となったら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
