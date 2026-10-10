-- n2-grammar-83 — 何も〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-83',
    'grammar',
    'N2',
    $$何も〜ない$$,
    $$nani mo ~ nai$$,
    $$Nada / Coisa nenhuma / Nenhum$$,
    $$何も junto com uma forma negativa indica negação total, com o sentido de "nada" ou "coisa nenhuma". Por exemplo, "não comi nada hoje".

Também aparece em expressões como 何も〜ことはない, que significa "não há necessidade nenhuma de...". Por exemplo, "não precisa chorar tanto".

É uma expressão básica, mas muito usada para reforçar a negação.$$,
    $$Com partículas como で ou に, a forma muda: 何でも não é negativa, e 何にも significa "em nada".

No uso 何も〜ことはない, a expressão tem um tom de conselho ou consolo.$$,
    $$何も + Verbo (forma ない)
何も + Verbo (forma dicionário) + ことはない (não há necessidade)$$,
    $$何も〜ない$$,
    $$何も|なにも$$,
    ARRAY['何', 'も', 'ない']::text[],
    ARRAY['何も〜ない', '何も〜ません', '何も〜ことはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-83', $$今日は朝から何も食べていない。$$, $$きょうはあさからなにもたべていない。$$, $$Hoje não comi nada desde a manhã.$$),
    ('n2-grammar-83', $$その件については何も知りません。$$, $$そのけんについてはなにもしりません。$$, $$Não sei nada sobre esse assunto.$$),
    ('n2-grammar-83', $$何も心配することはないよ。$$, $$なにもしんぱいすることはないよ。$$, $$Não há nada com que se preocupar.$$),
    ('n2-grammar-83', $$部屋には何もなかった。$$, $$へやにはなにもなかった。$$, $$Não havia nada no quarto.$$),
    ('n2-grammar-83', $$何もそんなに怒ることはない。$$, $$なにもそんなにおこることはない。$$, $$Não precisa ficar tão bravo assim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____言わずに帰ってしまった。$$, $$Ele foi embora sem dizer nada.$$),
        (2, $$昨日のことは____覚えていない。$$, $$Não me lembro de nada de ontem.$$),
        (3, $$冷蔵庫の中には____ない。$$, $$Não tem nada na geladeira.$$),
        (4, $$____泣くことはないじゃないか。$$, $$Não precisa chorar, não é?$$),
        (5, $$週末は____予定がない。$$, $$Não tenho nenhum compromisso no fim de semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何も$$),
        (1, $$なにも$$),
        (2, $$何も$$),
        (2, $$なにも$$),
        (3, $$何も$$),
        (3, $$なにも$$),
        (4, $$何も$$),
        (4, $$なにも$$),
        (5, $$何も$$),
        (5, $$なにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
