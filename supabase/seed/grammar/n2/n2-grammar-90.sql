-- n2-grammar-90 — 〜に限って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-90',
    'grammar',
    'N2',
    $$〜に限って$$,
    $$ni kagitte$$,
    $$Justo quando / Logo / Não é possível que$$,
    $$に限って tem dois usos principais.

O primeiro indica que algo ruim acontece justamente numa ocasião especial ou inoportuna. Equivale a "justo quando" ou "logo". Por exemplo, "justo no dia em que esqueci o guarda-chuva, choveu". O tom é de frustração.

O segundo expressa confiança total em alguém, com o sentido de "não é possível que essa pessoa...". Por exemplo, "meu filho não faria uma coisa dessas".$$,
    $$No primeiro uso, a frase costuma descrever algo inesperado e ruim.

No segundo uso, aparece muito como うちの子に限って, quando os pais defendem os filhos.

Não se confunde com に限らず, que significa "não só".$$,
    $$Substantivo + に限って
Verbo (forma simples) + 時 / 日 + に限って
Pessoa + に限って + Frase negativa (confiança)$$,
    $$に限って$$,
    $$に限って|にかぎって$$,
    ARRAY['に', '限って']::text[],
    ARRAY['に限って', 'にかぎって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-90', $$傘を持っていない日に限って、雨が降る。$$, $$かさをもっていないひにかぎって、あめがふる。$$, $$Justo no dia em que não estou com guarda-chuva, chove.$$),
    ('n2-grammar-90', $$急いでいる時に限って、電車が遅れる。$$, $$いそいでいるときにかぎって、でんしゃがおくれる。$$, $$Justo quando estou com pressa, o trem atrasa.$$),
    ('n2-grammar-90', $$うちの子に限って、そんなことはしません。$$, $$うちのこにかぎって、そんなことはしません。$$, $$Não é possível que meu filho faça uma coisa dessas.$$),
    ('n2-grammar-90', $$大事な試験の日に限って、熱が出た。$$, $$だいじなしけんのひにかぎって、ねつがでた。$$, $$Logo no dia da prova importante, tive febre.$$),
    ('n2-grammar-90', $$彼に限って、嘘をつくはずがない。$$, $$かれにかぎって、うそをつくはずがない。$$, $$Ele, de todas as pessoas, não mentiria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$出かけようとする時____、電話がかかってくる。$$, $$Justo quando vou sair, o telefone toca.$$),
        (2, $$休みの日____、早く目が覚める。$$, $$Logo nos dias de folga, acordo cedo.$$),
        (3, $$真面目な彼____、遅刻するはずがない。$$, $$Não é possível que ele, tão sério, se atrase.$$),
        (4, $$デートの日____、寝坊してしまった。$$, $$Justo no dia do encontro, acabei dormindo demais.$$),
        (5, $$洗車した日____、雨が降る。$$, $$Justo no dia em que lavo o carro, chove.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限って$$),
        (1, $$にかぎって$$),
        (2, $$に限って$$),
        (2, $$にかぎって$$),
        (3, $$に限って$$),
        (3, $$にかぎって$$),
        (4, $$に限って$$),
        (4, $$にかぎって$$),
        (5, $$に限って$$),
        (5, $$にかぎって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
