-- n3-grammar-168 — 〜わけがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-168',
    'grammar',
    'N3',
    $$〜わけがない$$,
    $$wake ga nai$$,
    $$Não tem como / É impossível que / De jeito nenhum$$,
    $$わけがない é usado para negar com muita força uma possibilidade, dizendo que algo é impossível ou absurdo. Equivale a "não tem como", "é impossível que" ou "de jeito nenhum".

A ideia literal é "não há motivo para isso acontecer". Quem fala tem certeza de que aquilo não é verdade ou não vai acontecer.

Por exemplo, "uma criança não tem como entender uma questão tão difícil" ou "ele jamais mentiria".

O sentido é parecido com はずがない. わけがない soa um pouco mais emocional e coloquial, e はずがない, um pouco mais lógico.

Na fala, わけがない costuma virar わけない.$$,
    $$わけがないでしょう, com でしょう, reforça a ideia de "é óbvio que não", com tom de indignação.

Não confunda com わけではない (não é que...), que é uma negação parcial e suave.

Por ser forte, わけがない pode soar teimoso se usado sem um bom motivo.$$,
    $$Verbo / Adjetivo い (forma simples) + わけがない
Adjetivo な + な + わけがない
Substantivo + の / である + わけがない

Educado: わけがありません
Fala: わけない$$,
    $$わけがない$$,
    $$わけがない|わけない|わけがありません|訳がない$$,
    ARRAY['わけ', 'が', 'ない']::text[],
    ARRAY['わけがない', 'わけない', 'わけがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-168', $$こんな難しい問題が、子供にわかるわけがない。$$, $$こんなむずかしいもんだいが、こどもにわかるわけがない。$$, $$Não tem como uma criança entender uma questão tão difícil.$$),
    ('n3-grammar-168', $$彼がうそをつくわけがない。$$, $$かれがうそをつくわけがない。$$, $$É impossível que ele minta.$$),
    ('n3-grammar-168', $$一日でこの仕事が終わるわけがない。$$, $$いちにちでこのしごとがおわるわけがない。$$, $$Não tem como este trabalho terminar em um dia.$$),
    ('n3-grammar-168', $$あんなに練習したのだから、負けるわけがない。$$, $$あんなにれんしゅうしたのだから、まけるわけがない。$$, $$Com tanto treino, não tem como perder.$$),
    ('n3-grammar-168', $$そんな高い物、買えるわけがないでしょう。$$, $$そんなたかいもの、かえるわけがないでしょう。$$, $$Uma coisa tão cara dessas, é claro que não dá para comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勉強していないのに、合格する____。$$, $$Sem estudar, não tem como passar.$$),
        (2, $$優しい彼女がそんなひどいことを言う____。$$, $$É impossível que ela, tão gentil, tenha dito algo tão cruel.$$),
        (3, $$こんなにたくさん、一人で全部食べられる____。$$, $$Tanta comida assim, não tem como comer tudo sozinho.$$),
        (4, $$まだ朝の五時だから、店が開いている____。$$, $$Ainda são cinco da manhã, então não tem como a loja estar aberta.$$),
        (5, $$いつも穏やかな彼が怒る____。$$, $$É impossível que ele, sempre tão calmo, fique bravo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけがない$$),
        (1, $$わけない$$),
        (2, $$わけがない$$),
        (2, $$わけない$$),
        (3, $$わけがない$$),
        (3, $$わけない$$),
        (4, $$わけがない$$),
        (4, $$わけない$$),
        (5, $$わけがない$$),
        (5, $$わけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
