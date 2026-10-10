-- n3-grammar-73 — 〜に違いない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-73',
    'grammar',
    'N3',
    $$〜に違いない$$,
    $$ni chigai nai$$,
    $$Com certeza / Deve ser / Não há dúvida de que$$,
    $$に違いない é usado para expressar uma suposição forte, quase uma certeza, baseada em evidências ou em intuição. Equivale a "com certeza", "deve ser" ou "não há dúvida de que".

A ideia literal é "não há diferença", ou seja, "não pode ser outra coisa".

O grau de certeza é alto, maior que だろう e かもしれない. Mas ainda é uma suposição pessoal, e não um fato comprovado.

Ele vem depois da forma simples de verbos e adjetivos い. Com substantivos e adjetivos な, não se usa だ antes: 本当に違いない.

É um pouco formal e aparece muito na escrita, em romances e em deduções.$$,
    $$Na conversa casual, os japoneses costumam preferir きっと〜と思う ou はずだ.

Comparando: はずだ se baseia mais em lógica e fatos; に違いない expressa uma convicção pessoal forte, às vezes baseada em intuição.

É muito usado em histórias de detetive, quando alguém deduz algo.$$,
    $$Verbo / Adjetivo い (forma simples) + に違いない
Adjetivo な (sem だ) + に違いない
Substantivo (sem だ) + に違いない

Educado: に違いありません
Escrita: に違いない / にちがいない$$,
    $$に違いない$$,
    $$に違いない|に違いありません|にちがいない$$,
    ARRAY['に', '違い', 'ない']::text[],
    ARRAY['に違いない', 'に違いありません', 'にちがいない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-73', $$彼はもう家に帰ったに違いない。$$, $$かれはもういえにかえったにちがいない。$$, $$Ele com certeza já foi para casa.$$),
    ('n3-grammar-73', $$この絵は有名な画家が描いたに違いない。$$, $$このえはゆうめいながかがかいたにちがいない。$$, $$Este quadro deve ter sido pintado por um pintor famoso.$$),
    ('n3-grammar-73', $$あんなに練習したのだから、合格するに違いない。$$, $$あんなにれんしゅうしたのだから、ごうかくするにちがいない。$$, $$Com tanto treino, com certeza vai passar.$$),
    ('n3-grammar-73', $$電気がついているから、誰かいるに違いない。$$, $$でんきがついているから、だれかいるにちがいない。$$, $$A luz está acesa, então com certeza tem alguém.$$),
    ('n3-grammar-73', $$彼女の話は本当に違いありません。$$, $$かのじょのはなしはほんとうにちがいありません。$$, $$A história dela com certeza é verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の顔色を見ると、病気____。$$, $$Pela cor do rosto dele, com certeza está doente.$$),
        (2, $$このブランドのかばんだから、高い____。$$, $$É uma bolsa dessa marca, então com certeza é cara.$$),
        (3, $$証拠から考えると、犯人はあの男____。$$, $$Pelas provas, o culpado com certeza é aquele homem.$$),
        (4, $$このプレゼントを見たら、彼女はきっと喜ぶ____。$$, $$Quando ela vir este presente, com certeza vai ficar feliz.$$),
        (5, $$窓が開いている。泥棒が入った____。$$, $$A janela está aberta. Com certeza um ladrão entrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に違いない$$),
        (1, $$に違いありません$$),
        (2, $$に違いない$$),
        (2, $$に違いありません$$),
        (3, $$に違いない$$),
        (3, $$に違いありません$$),
        (4, $$に違いない$$),
        (4, $$に違いありません$$),
        (5, $$に違いない$$),
        (5, $$に違いありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
