-- n3-grammar-151 — 〜として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-151',
    'grammar',
    'N3',
    $$〜として$$,
    $$to shite$$,
    $$Como / Na condição de / Na qualidade de$$,
    $$として é usado para indicar o papel, a função, a posição ou a qualidade em que alguém ou algo atua. Equivale a "como", "na condição de" ou "na qualidade de".

Por exemplo, "ele trabalha como médico", "vim ao Japão como estudante estrangeiro" ou "aprendo piano como hobby".

Com は, a forma としては indica um ponto de vista: 私としては significa "da minha parte" ou "do meu ponto de vista".

Antes de um substantivo, usa-se としての: リーダーとしての責任 (a responsabilidade como líder).

Com も, としても significa "também como" ou, em outro uso, "mesmo que".$$,
    $$Não confunda com とする (supor), que aparece em としたら e とすれば.

Em apresentações de trabalho, 〜として参加します ("participo como...") é muito comum.

A expressão 人として significa "como ser humano" e aparece em frases sobre ética e comportamento.$$,
    $$Substantivo (papel / função) + として + Verbo
Substantivo + としては + Opinião (do ponto de vista de)
Substantivo + としての + Substantivo
Substantivo + としても + … (também como)$$,
    $$として$$,
    $$として|としては|としても|としての$$,
    ARRAY['と', 'して']::text[],
    ARRAY['として', 'としては', 'としての', 'としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-151', $$彼は医者として病院で働いている。$$, $$かれはいしゃとしてびょういんではたらいている。$$, $$Ele trabalha como médico no hospital.$$),
    ('n3-grammar-151', $$私は留学生として日本に来ました。$$, $$わたしはりゅうがくせいとしてにほんにきました。$$, $$Vim ao Japão como estudante estrangeiro.$$),
    ('n3-grammar-151', $$趣味として、ピアノを習っています。$$, $$しゅみとして、ピアノをならっています。$$, $$Estou aprendendo piano como hobby.$$),
    ('n3-grammar-151', $$私としては、この案に賛成です。$$, $$わたしとしては、このあんにさんせいです。$$, $$Da minha parte, concordo com esta proposta.$$),
    ('n3-grammar-151', $$彼はリーダーとしての責任を感じている。$$, $$かれはリーダーとしてのせきにんをかんじている。$$, $$Ele sente a responsabilidade de ser líder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は通訳____会議に参加した。$$, $$Ela participou da reunião como intérprete.$$),
        (2, $$父は教師____三十年働いた。$$, $$Meu pai trabalhou trinta anos como professor.$$),
        (3, $$このお茶は、お土産____人気がある。$$, $$Este chá é popular como lembrancinha.$$),
        (4, $$私____は、その計画には反対です。$$, $$Da minha parte, sou contra esse plano.$$),
        (5, $$新入社員は、社会人____のマナーを学ぶ。$$, $$Os novos funcionários aprendem as boas maneiras de um profissional.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$として$$),
        (2, $$として$$),
        (3, $$として$$),
        (4, $$として$$),
        (5, $$として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
