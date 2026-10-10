-- n2-grammar-76 — もっとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-76',
    'grammar',
    'N2',
    $$もっとも$$,
    $$mottomo$$,
    $$No entanto / Embora / Se bem que$$,
    $$もっとも, no começo de uma frase, serve para acrescentar uma observação ou uma ressalva ao que foi dito antes. Equivale a "no entanto", "se bem que" ou "embora".

A pessoa primeiro afirma algo e depois limita ou corrige parcialmente essa afirmação. Por exemplo, "ele é um ótimo aluno. Se bem que, em matemática, é fraco".

Também é usado como adjetivo, もっともな, com o sentido de "razoável" ou "justo".$$,
    $$No começo da frase, o sentido é parecido com ただし e ただ.

Como advérbio antes de adjetivos, 最も significa "o mais", mas esse é outro uso, normalmente escrito em kanji.$$,
    $$Frase + もっとも、 + Ressalva / Observação
もっともな + Substantivo (razoável)$$,
    $$もっとも$$,
    $$もっとも$$,
    ARRAY['もっとも']::text[],
    ARRAY['もっとも', 'もっともな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-76', $$このレストランはおいしい。もっとも、値段は少し高いが。$$, $$このレストランはおいしい。もっとも、ねだんはすこしたかいが。$$, $$Este restaurante é gostoso. Se bem que o preço é um pouco alto.$$),
    ('n2-grammar-76', $$明日は休みです。もっとも、急な仕事が入れば出社します。$$, $$あしたはやすみです。もっとも、きゅうなしごとがはいればしゅっしゃします。$$, $$Amanhã é folga. No entanto, se surgir algum trabalho urgente, vou à empresa.$$),
    ('n2-grammar-76', $$彼は優秀な学生だ。もっとも、数学は苦手だが。$$, $$かれはゆうしゅうながくせいだ。もっとも、すうがくはにがてだが。$$, $$Ele é um ótimo aluno. Se bem que é fraco em matemática.$$),
    ('n2-grammar-76', $$彼女の意見はもっともだ。$$, $$かのじょのいけんはもっともだ。$$, $$A opinião dela é razoável.$$),
    ('n2-grammar-76', $$彼が怒るのももっともな話だ。$$, $$かれがおこるのももっともなはなしだ。$$, $$É compreensível que ele fique bravo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$参加は自由です。____、事前の申し込みが必要です。$$, $$A participação é livre. No entanto, é preciso se inscrever antes.$$),
        (2, $$この本は面白い。____、少し長すぎるけど。$$, $$Este livro é interessante. Se bem que é um pouco longo demais.$$),
        (3, $$彼の言うことは____だ。$$, $$O que ele diz é razoável.$$),
        (4, $$この店は毎日開いている。____、正月は休みだが。$$, $$Esta loja abre todos os dias. Se bem que fecha no Ano-Novo.$$),
        (5, $$それは____な意見ですね。$$, $$Essa é uma opinião razoável, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もっとも$$),
        (2, $$もっとも$$),
        (3, $$もっとも$$),
        (4, $$もっとも$$),
        (5, $$もっとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
