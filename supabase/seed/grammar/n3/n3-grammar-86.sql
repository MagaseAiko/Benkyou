-- n3-grammar-86 — 〜について
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-86',
    'grammar',
    'N3',
    $$〜について$$,
    $$ni tsuite$$,
    $$Sobre / A respeito de / Acerca de$$,
    $$について é usado para indicar o assunto ou o tema de uma ação, como falar, pensar, estudar, perguntar ou escrever. Equivale a "sobre", "a respeito de" ou "acerca de".

Ele vem depois de um substantivo e antes de verbos como 話す, 考える, 勉強する, 調べる, 書く e 聞く.

Antes de um substantivo, usa-se についての: 環境についてのレポート (um relatório sobre o meio ambiente).

Com は, については destaca o tema, às vezes com contraste: "quanto a esse assunto, explico depois".

について é a forma mais comum e neutra para "sobre". Em situações mais formais, usa-se に関して.$$,
    $$Na fala, について é muito mais comum que に関して.

Para dizer "um livro sobre X", existem duas opções: Xについての本 e Xに関する本. A segunda soa mais formal.

について também aparece em perguntas de opinião: 〜についてどう思いますか (o que você acha de...?).$$,
    $$Substantivo + について + Verbo (話す / 考える / 調べる / 書く)
Substantivo + についての + Substantivo
Substantivo + については + …

Formal: に関して / に関する$$,
    $$について$$,
    $$について|についての|については$$,
    ARRAY['に', 'ついて']::text[],
    ARRAY['について', 'についての', 'については']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-86', $$大学で日本の文化について勉強しています。$$, $$だいがくでにほんのぶんかについてべんきょうしています。$$, $$Na faculdade, estou estudando sobre a cultura japonesa.$$),
    ('n3-grammar-86', $$この問題について、どう思いますか。$$, $$このもんだいについて、どうおもいますか。$$, $$O que você acha deste problema?$$),
    ('n3-grammar-86', $$将来について、両親と話した。$$, $$しょうらいについて、りょうしんとはなした。$$, $$Conversei com meus pais sobre o futuro.$$),
    ('n3-grammar-86', $$環境についてのレポートを書いた。$$, $$かんきょうについてのレポートをかいた。$$, $$Escrevi um relatório sobre o meio ambiente.$$),
    ('n3-grammar-86', $$その件については、後で説明します。$$, $$そのけんについては、あとでせつめいします。$$, $$Quanto a esse assunto, explico depois.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の歴史____、もっと知りたい。$$, $$Quero saber mais sobre a história do Japão.$$),
        (2, $$旅行の計画____、話し合いましょう。$$, $$Vamos conversar sobre o plano da viagem.$$),
        (3, $$授業で、自分の国____発表した。$$, $$Na aula, fiz uma apresentação sobre o meu país.$$),
        (4, $$彼の意見____、どう思いますか。$$, $$O que você acha da opinião dele?$$),
        (5, $$新しい商品____説明を聞いた。$$, $$Ouvi uma explicação sobre o novo produto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$について$$),
        (2, $$について$$),
        (3, $$について$$),
        (4, $$について$$),
        (5, $$についての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
