-- n1-grammar-236 — 〜はさておき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-236',
    'grammar',
    'N1',
    $$〜はさておき$$,
    $$wa sateoki$$,
    $$Deixando de lado / Seja como for / Por enquanto não falemos de$$,
    $$はさておき indica que um assunto é deixado de lado por enquanto, para falar de algo mais importante. Equivale a "deixando de lado" ou "por enquanto não falemos de".

Por exemplo, "deixando o preço de lado, vamos ver primeiro a qualidade".

Também aparece como 冗談はさておき, "brincadeiras à parte", para mudar para um assunto sério.$$,
    $$É parecido com はともかく e は別として.

Expressões comuns são 冗談はさておき, それはさておき e 何はさておき.

何はさておき significa "antes de mais nada".$$,
    $$Substantivo + はさておき
Frase + かどうか + はさておき$$,
    $$はさておき$$,
    $$はさておき|はさて置き$$,
    ARRAY['は', 'さておき']::text[],
    ARRAY['はさておき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-236', $$値段はさておき、まず品質を確認しよう。$$, $$ねだんはさておき、まずひんしつをかくにんしよう。$$, $$Deixando o preço de lado, vamos primeiro verificar a qualidade.$$),
    ('n1-grammar-236', $$冗談はさておき、本題に入りましょう。$$, $$じょうだんはさておき、ほんだいにはいりましょう。$$, $$Brincadeiras à parte, vamos ao assunto principal.$$),
    ('n1-grammar-236', $$何はさておき、無事でよかった。$$, $$なにはさておき、ぶじでよかった。$$, $$Antes de mais nada, que bom que está tudo bem.$$),
    ('n1-grammar-236', $$できるかどうかはさておき、やってみよう。$$, $$できるかどうかはさておき、やってみよう。$$, $$Deixando de lado se dá ou não, vamos tentar.$$),
    ('n1-grammar-236', $$それはさておき、明日の予定はどうなっている？$$, $$それはさておき、あしたのよていはどうなっている？$$, $$Deixando isso de lado, como estão os planos para amanhã?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$細かいこと____、全体の計画を立てよう。$$, $$Deixando os detalhes de lado, vamos fazer o plano geral.$$),
        (2, $$勝ち負け____、楽しむことが大切だ。$$, $$Deixando de lado ganhar ou perder, o importante é se divertir.$$),
        (3, $$何____、まず休みたい。$$, $$Antes de mais nada, quero descansar.$$),
        (4, $$費用の問題____、場所を決めましょう。$$, $$Deixando a questão dos custos de lado, vamos decidir o local.$$),
        (5, $$それ____、最近元気？$$, $$Deixando isso de lado, como você está?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-236', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はさておき$$),
        (2, $$はさておき$$),
        (3, $$はさておき$$),
        (4, $$はさておき$$),
        (5, $$はさておき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
