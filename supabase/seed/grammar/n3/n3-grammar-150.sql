-- n3-grammar-150 — 〜通す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-150',
    'grammar',
    'N3',
    $$〜通す$$,
    $$toosu$$,
    $$Fazer até o fim / Continuar sem parar / Manter até o fim$$,
    $$通す, ligado a outro verbo, indica que uma ação foi feita do começo ao fim, sem interrupção, mesmo com dificuldades. Equivale a "fazer até o fim", "continuar sem parar" ou "manter até o fim".

A estrutura junta o verbo na forma ます sem ます com 通す. O resultado funciona como um verbo do grupo 1.

A ideia é de persistência: correr a prova inteira, trabalhar a noite toda, manter a própria opinião até o fim, ler um livro longo do início ao fim.

Comparado a 切る, que indica conclusão total, 通す destaca a continuidade e o esforço para não parar no meio.

Também pode ter sentido negativo, como 嘘をつき通す (manter a mentira até o fim).$$,
    $$やり通す (levar até o fim) é muito usado em frases de determinação e incentivo.

守り通す significa "proteger até o fim" ou "cumprir até o fim", como uma promessa.

Sozinho, 通す significa "deixar passar" ou "fazer passar", como em 人を通す (deixar alguém passar).$$,
    $$Verbo na forma ます sem ます + 通す

Passado: 通した / 通しました
Desejo: 通したい

Combinações comuns: やり通す / 走り通す / 働き通す / 言い通す / 守り通す / 読み通す$$,
    $$通す$$,
    $$通し|通す|とおし|とおす$$,
    ARRAY['通す']::text[],
    ARRAY['通す', '通した', '通しました', '通したい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-150', $$彼は最後まで走り通した。$$, $$かれはさいごまではしりとおした。$$, $$Ele correu até o fim sem parar.$$),
    ('n3-grammar-150', $$昨日は一晩中働き通した。$$, $$きのうはひとばんじゅうはたらきとおした。$$, $$Ontem trabalhei a noite inteira sem parar.$$),
    ('n3-grammar-150', $$彼女は自分の意見を最後まで言い通した。$$, $$かのじょはじぶんのいけんをさいごまでいいとおした。$$, $$Ela manteve a própria opinião até o fim.$$),
    ('n3-grammar-150', $$この長い小説を一日で読み通した。$$, $$このながいしょうせつをいちにちでよみとおした。$$, $$Li este romance longo inteiro em um dia.$$),
    ('n3-grammar-150', $$一度決めたことは、最後までやり通したい。$$, $$いちどきめたことは、さいごまでやりとおしたい。$$, $$O que eu decidi fazer, quero levar até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大変だったが、最後までやり____。$$, $$Foi difícil, mas levei até o fim.$$),
        (2, $$彼はそのことについて、最後までうそをつき____。$$, $$Ele manteve a mentira sobre isso até o fim.$$),
        (3, $$十キロを休まずに歩き____。$$, $$Andei dez quilômetros sem parar até o fim.$$),
        (4, $$三日間、寝ないで働き____。$$, $$Trabalhei três dias seguidos sem dormir.$$),
        (5, $$一度始めたことは、やり____べきだ。$$, $$O que se começa deve ser levado até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$通した$$),
        (1, $$通しました$$),
        (2, $$通した$$),
        (2, $$通しました$$),
        (3, $$通した$$),
        (3, $$通しました$$),
        (4, $$通した$$),
        (4, $$通しました$$),
        (5, $$通す$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
