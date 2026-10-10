-- n1-grammar-86 — 〜んばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-86',
    'grammar',
    'N1',
    $$〜んばかりに$$,
    $$n bakari ni$$,
    $$Como se fosse / Quase a ponto de / Como quem$$,
    $$んばかりに indica que algo está quase acontecendo, ou que alguém age como se fosse fazer algo. Equivale a "como se fosse..." ou "quase a ponto de".

Muitas vezes descreve gestos ou expressões intensas. Por exemplo, "ele me olhou como quem dizia 'saia daqui'" ou "chorou como se fosse se desmanchar".

É uma expressão literária, mais comum na escrita.$$,
    $$Atenção à forma de する, que vira せんばかり.

Expressões comuns são 泣かんばかりに, 言わんばかりに e あふれんばかりの.

O sujeito costuma ser outra pessoa, não a primeira pessoa.$$,
    $$Verbo (forma ない sem ない) + んばかりに
Verbo (forma ない sem ない) + んばかりの + Substantivo
Verbo (forma ない sem ない) + んばかりだ
する → せんばかりに$$,
    $$んばかりに$$,
    $$んばかりに|んばかりの|んばかりだ|んばかり$$,
    ARRAY['ん', 'ばかり', 'に']::text[],
    ARRAY['んばかりに', 'んばかりの', 'んばかりだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-86', $$彼は早く帰れと言わんばかりに、時計を見た。$$, $$かれははやくかえれといわんばかりに、とけいをみた。$$, $$Ele olhou o relógio como quem dizia: vá embora logo.$$),
    ('n1-grammar-86', $$彼女は泣かんばかりに頼んできた。$$, $$かのじょはなかんばかりにたのんできた。$$, $$Ela me pediu quase chorando.$$),
    ('n1-grammar-86', $$会場はあふれんばかりの人だった。$$, $$かいじょうはあふれんばかりのひとだった。$$, $$O local estava a ponto de transbordar de tanta gente.$$),
    ('n1-grammar-86', $$子供は飛び上がらんばかりに喜んだ。$$, $$こどもはとびあがらんばかりによろこんだ。$$, $$A criança ficou tão feliz que quase pulou.$$),
    ('n1-grammar-86', $$彼は今にも怒り出さんばかりの顔をしていた。$$, $$かれはいまにもおこりださんばかりのかおをしていた。$$, $$Ele estava com uma cara de quem ia explodir de raiva a qualquer momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はお前が悪いと言わ____、私をにらんだ。$$, $$Ele me encarou como quem dizia: a culpa é sua.$$),
        (2, $$母は泣か____、私の合格を喜んだ。$$, $$Minha mãe comemorou a minha aprovação quase chorando.$$),
        (3, $$あふれ____笑顔で、彼女は迎えてくれた。$$, $$Ela me recebeu com um sorriso radiante.$$),
        (4, $$彼は土下座せ____謝った。$$, $$Ele pediu desculpas quase se ajoelhando.$$),
        (5, $$割れ____拍手が起こった。$$, $$Houve aplausos a ponto de fazer o teto vir abaixo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んばかりに$$),
        (2, $$んばかりに$$),
        (3, $$んばかりの$$),
        (4, $$んばかりに$$),
        (5, $$んばかりの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
