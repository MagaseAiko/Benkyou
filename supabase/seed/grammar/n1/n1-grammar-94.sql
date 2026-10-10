-- n1-grammar-94 — 〜並み
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-94',
    'grammar',
    'N1',
    $$〜並み$$,
    $$nami$$,
    $$Ao nível de / Igual a / Comparável a$$,
    $$並み indica que algo está no mesmo nível ou grau de outra coisa. Equivale a "ao nível de" ou "comparável a".

Por exemplo, "um calor de verão" ou "uma habilidade de profissional".

Também aparece com palavras de tempo, como 例年並み, que significa "igual aos anos anteriores".$$,
    $$Expressões comuns são プロ並み, 例年並み, 人並み, 世間並み e 平年並み.

A palavra 人並み significa "como a maioria das pessoas" ou "normal".$$,
    $$Substantivo + 並み
Substantivo + 並みの + Substantivo
Substantivo + 並みに + Verbo / Adjetivo$$,
    $$並み$$,
    $$並み|なみ$$,
    ARRAY['並み']::text[],
    ARRAY['並み', '並みの', '並みに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-94', $$彼の料理の腕はプロ並みだ。$$, $$かれのりょうりのうではプロなみだ。$$, $$A habilidade dele na cozinha é de nível profissional.$$),
    ('n1-grammar-94', $$今日は真夏並みの暑さだ。$$, $$きょうはまなつなみのあつさだ。$$, $$Hoje está um calor de pleno verão.$$),
    ('n1-grammar-94', $$今年の桜は例年並みに咲いた。$$, $$ことしのさくらはれいねんなみにさいた。$$, $$As cerejeiras deste ano floresceram como nos anos anteriores.$$),
    ('n1-grammar-94', $$人並みの生活ができれば十分だ。$$, $$ひとなみのせいかつができればじゅうぶんだ。$$, $$Basta poder levar uma vida normal como a de todos.$$),
    ('n1-grammar-94', $$この子は大人並みに漢字が読める。$$, $$このこはおとななみにかんじがよめる。$$, $$Esta criança lê kanji como um adulto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の英語はネイティブ____だ。$$, $$O inglês dela é de nível nativo.$$),
        (2, $$今年の冬は平年____の寒さだそうだ。$$, $$Dizem que o frio deste inverno será igual ao de anos normais.$$),
        (3, $$彼はプロ____の技術を持っている。$$, $$Ele tem uma técnica de nível profissional.$$),
        (4, $$人____に結婚して、子供がほしい。$$, $$Quero me casar e ter filhos, como a maioria das pessoas.$$),
        (5, $$このホテルは一流ホテル____のサービスだ。$$, $$Este hotel tem um atendimento comparável ao de hotéis de primeira linha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$並み$$),
        (2, $$並み$$),
        (3, $$並み$$),
        (4, $$並み$$),
        (5, $$並み$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
