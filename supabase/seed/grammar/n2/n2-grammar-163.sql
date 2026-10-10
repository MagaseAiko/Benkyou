-- n2-grammar-163 — 〜てはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-163',
    'grammar',
    'N2',
    $$〜てはならない$$,
    $$te wa naranai$$,
    $$Não se deve / É proibido / Não pode$$,
    $$てはならない indica uma proibição forte, baseada em regras, moral ou bom senso. Equivale a "não se deve" ou "é proibido".

É mais formal que てはいけない e aparece em leis, regras, discursos e textos sérios. Por exemplo, "não se deve esquecer as lições da guerra".

Também é usado para falar de coisas que nunca deveriam acontecer.$$,
    $$É mais forte e formal que てはいけない.

A forma てはならぬ é ainda mais antiga e formal.

Uma expressão comum é あってはならない, "algo que não pode acontecer".$$,
    $$Verbo (forma て) + はならない
Verbo (forma て) + はなりません$$,
    $$てはならない$$,
    $$てはならない|ではならない|てはなりません|ではなりません|てはならぬ$$,
    ARRAY['て', 'は', 'ならない']::text[],
    ARRAY['てはならない', 'ではならない', 'てはなりません', 'てはならぬ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-163', $$戦争の悲劇を忘れてはならない。$$, $$せんそうのひげきをわすれてはならない。$$, $$Não se deve esquecer a tragédia da guerra.$$),
    ('n2-grammar-163', $$ここでたばこを吸ってはなりません。$$, $$ここでたばこをすってはなりません。$$, $$É proibido fumar aqui.$$),
    ('n2-grammar-163', $$このような事故は二度と起こってはならない。$$, $$このようなじこはにどとおこってはならない。$$, $$Um acidente como este não pode acontecer nunca mais.$$),
    ('n2-grammar-163', $$人の心を傷つけてはならない。$$, $$ひとのこころをきずつけてはならない。$$, $$Não se deve magoar o coração das pessoas.$$),
    ('n2-grammar-163', $$この部屋に入ってはならない。$$, $$このへやにはいってはならない。$$, $$É proibido entrar nesta sala.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破っ____。$$, $$Não se deve quebrar promessas.$$),
        (2, $$試験中に話し____。$$, $$É proibido conversar durante a prova.$$),
        (3, $$医者はミスをし____。$$, $$Um médico não pode cometer erros.$$),
        (4, $$このことを誰にも話し____。$$, $$Não se deve contar isto a ninguém.$$),
        (5, $$ここで泳い____。$$, $$É proibido nadar aqui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはならない$$),
        (1, $$てはなりません$$),
        (2, $$てはならない$$),
        (2, $$てはなりません$$),
        (3, $$てはならない$$),
        (3, $$てはなりません$$),
        (4, $$てはならない$$),
        (4, $$てはなりません$$),
        (5, $$ではならない$$),
        (5, $$ではなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
