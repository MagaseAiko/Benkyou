-- n1-grammar-234 — 〜はどうであれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-234',
    'grammar',
    'N1',
    $$〜はどうであれ$$,
    $$wa dou de are$$,
    $$Seja como for / Independentemente de / Não importa como$$,
    $$はどうであれ indica que, não importa como algo seja, a conclusão não muda. Equivale a "seja como for" ou "independentemente de".

A pessoa deixa de lado um aspecto para destacar outro mais importante. Por exemplo, "independentemente do resultado, você se esforçou muito".

É uma expressão formal.$$,
    $$É parecido com はともかく e に関わらず.

Expressões comuns são 結果はどうであれ, 理由はどうであれ e 事情はどうであれ.$$,
    $$Substantivo + はどうであれ
Substantivo + がどうであれ$$,
    $$はどうであれ$$,
    $$はどうであれ|がどうであれ|はどうあれ$$,
    ARRAY['は', 'どう', 'で', 'あれ']::text[],
    ARRAY['はどうであれ', 'がどうであれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-234', $$結果はどうであれ、よく頑張った。$$, $$けっかはどうであれ、よくがんばった。$$, $$Seja qual for o resultado, você se esforçou muito.$$),
    ('n1-grammar-234', $$理由はどうであれ、暴力は許されない。$$, $$りゆうはどうであれ、ぼうりょくはゆるされない。$$, $$Independentemente do motivo, a violência não é perdoável.$$),
    ('n1-grammar-234', $$他人がどうであれ、自分は自分の道を行く。$$, $$たにんがどうであれ、じぶんはじぶんのみちをいく。$$, $$Não importa como os outros sejam, eu sigo o meu caminho.$$),
    ('n1-grammar-234', $$事情はどうであれ、約束は守るべきだ。$$, $$じじょうはどうであれ、やくそくはまもるべきだ。$$, $$Sejam quais forem as circunstâncias, deve-se cumprir a promessa.$$),
    ('n1-grammar-234', $$見た目はどうであれ、味はいい。$$, $$みためはどうであれ、あじはいい。$$, $$Não importa a aparência, o sabor é bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$動機____、彼のしたことは正しい。$$, $$Seja qual for a motivação, o que ele fez está certo.$$),
        (2, $$周りの意見____、私は自分で決める。$$, $$Não importa a opinião dos outros, eu decido sozinho.$$),
        (3, $$過去____、大切なのは今だ。$$, $$Seja como for o passado, o importante é o agora.$$),
        (4, $$形____、気持ちが大切だ。$$, $$Independentemente da forma, o que importa é a intenção.$$),
        (5, $$やり方____、結果を出すことが大事だ。$$, $$Não importa o método, o importante é ter resultados.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-234', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はどうであれ$$),
        (2, $$はどうであれ$$),
        (3, $$はどうであれ$$),
        (4, $$はどうであれ$$),
        (5, $$はどうであれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
