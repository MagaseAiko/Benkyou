-- n2-grammar-119 — 〜ぬ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-119',
    'grammar',
    'N2',
    $$〜ぬ$$,
    $$nu$$,
    $$Não / Sem$$,
    $$ぬ é uma forma antiga da negação ない. Equivale a "não".

Hoje é usada principalmente na escrita formal, em provérbios, em expressões fixas e em textos literários. Por exemplo, "o que não se vê" ou "sem saber".

Antes de substantivos, ぬ funciona como adjetivo, como em "pessoa desconhecida".$$,
    $$A forma ず também é uma negação antiga, usada no meio da frase.

Expressões comuns são 知らぬ間に, 見知らぬ人, 思わぬ e 言わぬが花.

A forma ねばならない vem da mesma origem.$$,
    $$Verbo (forma ない sem ない) + ぬ
する → せぬ
Verbo (forma ない sem ない) + ぬ + Substantivo$$,
    $$ぬ$$,
    $$ぬ$$,
    ARRAY['ぬ']::text[],
    ARRAY['ぬ', 'せぬ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-119', $$見知らぬ人に声をかけられた。$$, $$みしらぬひとにこえをかけられた。$$, $$Uma pessoa desconhecida falou comigo.$$),
    ('n2-grammar-119', $$知らぬ間に、雨が降り出していた。$$, $$しらぬまに、あめがふりだしていた。$$, $$Sem eu perceber, começou a chover.$$),
    ('n2-grammar-119', $$思わぬところで友達に会った。$$, $$おもわぬところでともだちにあった。$$, $$Encontrei um amigo num lugar inesperado.$$),
    ('n2-grammar-119', $$彼は何も言わぬまま、部屋を出ていった。$$, $$かれはなにもいわぬまま、へやをでていった。$$, $$Ele saiu do quarto sem dizer nada.$$),
    ('n2-grammar-119', $$ここで負けるわけにはいかぬ。$$, $$ここでまけるわけにはいかぬ。$$, $$Não posso perder aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は帰ら____人となった。$$, $$Ele se tornou alguém que não voltaria mais.$$),
        (2, $$見知ら____町を一人で歩いた。$$, $$Andei sozinho por uma cidade desconhecida.$$),
        (3, $$思わ____事故で、けがをした。$$, $$Me machuquei num acidente inesperado.$$),
        (4, $$知ら____間に、時間が過ぎていた。$$, $$Sem eu perceber, o tempo tinha passado.$$),
        (5, $$言わ____が花だ。$$, $$O melhor é não dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぬ$$),
        (2, $$ぬ$$),
        (3, $$ぬ$$),
        (4, $$ぬ$$),
        (5, $$ぬ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
