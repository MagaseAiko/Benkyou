-- n4-grammar-29 — 〜かもしれない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-29',
    'grammar',
    'N4',
    $$〜かもしれない$$,
    $$kamo shirenai$$,
    $$Talvez / Pode ser que$$,
    $$かもしれない é usado para dizer que algo é possível, mas sem certeza. Equivale a "talvez" ou "pode ser que".

O grau de certeza é baixo: mais ou menos 50% ou menos. Isso é diferente de だろう e でしょう, que indicam uma suposição mais forte, e de はずだ, que indica uma expectativa baseada em fatos.

Ele vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, o だ desaparece.

Na forma educada, usa-se かもしれません. Na fala informal, é muito comum encurtar para かも.$$,
    $$Para reforçar a dúvida, é comum usar もしかしたら ou もしかすると no começo da frase.

かも sozinho, no final da frase, é muito usado por jovens e soa bem leve.

Com superiores, かもしれません é uma forma educada de não afirmar algo com certeza, o que é bem valorizado na comunicação japonesa.$$,
    $$Verbo (forma simples) + かもしれない
Adjetivo い + かもしれない
Adjetivo な (sem だ) + かもしれない
Substantivo (sem だ) + かもしれない

Educado: かもしれません
Fala informal: かも$$,
    $$かもしれない$$,
    $$かもしれない|かもしれません|かもしれなかった|かも$$,
    ARRAY['かも', 'しれない']::text[],
    ARRAY['かもしれない', 'かもしれません', 'かも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-29', $$午後から雨が降るかもしれません。$$, $$ごごからあめがふるかもしれません。$$, $$Talvez chova a partir da tarde.$$),
    ('n4-grammar-29', $$彼はもう帰ったかもしれない。$$, $$かれはもうかえったかもしれない。$$, $$Pode ser que ele já tenha ido embora.$$),
    ('n4-grammar-29', $$この問題は少し難しいかもしれません。$$, $$このもんだいはすこしむずかしいかもしれません。$$, $$Esta questão talvez seja um pouco difícil.$$),
    ('n4-grammar-29', $$あの人は先生かもしれない。$$, $$あのひとはせんせいかもしれない。$$, $$Aquela pessoa talvez seja professora.$$),
    ('n4-grammar-29', $$明日は忙しいから、行けないかも。$$, $$あしたはいそがしいから、いけないかも。$$, $$Amanhã estou ocupado, então talvez não consiga ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混んでいるから、少し遅れる____。$$, $$O trânsito está ruim, então talvez eu me atrase um pouco.$$),
        (2, $$彼女は今日、来ない____。$$, $$Talvez ela não venha hoje.$$),
        (3, $$その話は本当____。$$, $$Essa história pode ser verdade.$$),
        (4, $$この服は私には少し大きい____。$$, $$Esta roupa talvez seja um pouco grande para mim.$$),
        (5, $$財布はかばんの中にある____と思って、探しました。$$, $$Achei que a carteira talvez estivesse na bolsa e procurei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かもしれません$$),
        (1, $$かもしれない$$),
        (1, $$かも$$),
        (2, $$かもしれません$$),
        (2, $$かもしれない$$),
        (2, $$かも$$),
        (3, $$かもしれません$$),
        (3, $$かもしれない$$),
        (3, $$かも$$),
        (4, $$かもしれません$$),
        (4, $$かもしれない$$),
        (4, $$かも$$),
        (5, $$かもしれない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
