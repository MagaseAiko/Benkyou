-- n3-grammar-29 — 〜ほど〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-29',
    'grammar',
    'N3',
    $$〜ほど〜ない$$,
    $$hodo ~ nai$$,
    $$Não tão... quanto / Nada é tão... quanto$$,
    $$ほど〜ない é usado para comparações negativas. Equivale a "não é tão... quanto".

A estrutura coloca o ponto de comparação antes de ほど, e o adjetivo ou verbo na forma negativa depois. Por exemplo, "este verão não está tão quente quanto o do ano passado".

Com 思った ou 心配した antes de ほど, mostra que a realidade foi menos intensa do que se esperava: "não foi tão difícil quanto eu pensava".

Uma forma muito usada é 〜ほど〜ものはない (ou 〜はない), que significa "não há nada tão... quanto...". Ela é uma forma enfática de dizer que algo é o mais importante, o melhor ou o mais extremo.$$,
    $$ほど〜ない é diferente de より. より compara de forma positiva ("A é mais... que B"); ほど〜ない compara de forma negativa ("A não é tão... quanto B").

A frase 健康ほど大切なものはない ("nada é tão importante quanto a saúde") é um exemplo clássico.

Na fala, くらい〜ない também é usado com o mesmo sentido.$$,
    $$A + は + B + ほど + Adjetivo / Verbo negativo (A não é tão... quanto B)
思った / 心配した + ほど + Adjetivo negativo
Substantivo + ほど + Adjetivo + Substantivo + は + ない (não há... tão... quanto)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ほど', 'ない']::text[],
    ARRAY['ほど〜ない', 'ほど〜はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-29', $$今年の夏は去年ほど暑くない。$$, $$ことしのなつはきょねんほどあつくない。$$, $$Este verão não está tão quente quanto o do ano passado.$$),
    ('n3-grammar-29', $$私は兄ほど背が高くない。$$, $$わたしはあにほどせがたかくない。$$, $$Eu não sou tão alto quanto meu irmão mais velho.$$),
    ('n3-grammar-29', $$この問題は思ったほど難しくなかった。$$, $$このもんだいはおもったほどむずかしくなかった。$$, $$Esta questão não foi tão difícil quanto eu pensava.$$),
    ('n3-grammar-29', $$東京ほど人が多い町はない。$$, $$とうきょうほどひとがおおいまちはない。$$, $$Não há cidade com tanta gente quanto Tóquio.$$),
    ('n3-grammar-29', $$健康ほど大切なものはない。$$, $$けんこうほどたいせつなものはない。$$, $$Nada é tão importante quanto a saúde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は私____勉強しない。$$, $$Meu irmão mais novo não estuda tanto quanto eu.$$),
        (2, $$今日は昨日____寒くないですね。$$, $$Hoje não está tão frio quanto ontem, né?$$),
        (3, $$試験は心配した____難しくなかった。$$, $$A prova não foi tão difícil quanto eu temia.$$),
        (4, $$母の料理____おいしいものはない。$$, $$Não há nada tão gostoso quanto a comida da minha mãe.$$),
        (5, $$この町は東京____便利ではない。$$, $$Esta cidade não é tão prática quanto Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
