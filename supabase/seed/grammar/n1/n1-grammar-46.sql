-- n1-grammar-46 — 〜限りだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-46',
    'grammar',
    'N1',
    $$〜限りだ$$,
    $$kagiri da$$,
    $$Extremamente / Muitíssimo / Não poderia estar mais$$,
    $$限りだ expressa um sentimento muito forte da pessoa que fala. Equivale a "extremamente" ou "não poderia estar mais...".

Costuma vir com adjetivos de emoção, como feliz, triste, solitário, invejoso ou envergonhado. Por exemplo, "estou extremamente feliz em reencontrar todos".

É uma expressão formal, comum em cartas, discursos e cerimônias.$$,
    $$É usado apenas com sentimentos da primeira pessoa.

Expressões comuns são うれしい限りだ, 寂しい限りだ, うらやましい限りだ e 残念な限りだ.$$,
    $$Adjetivo い + 限りだ
Adjetivo な + な + 限りだ
Substantivo + の + 限りだ$$,
    $$限りだ$$,
    $$限りだ|限りです|かぎりだ$$,
    ARRAY['限り', 'だ']::text[],
    ARRAY['限りだ', '限りです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-46', $$皆さんにまた会えて、うれしい限りです。$$, $$みなさんにまたあえて、うれしいかぎりです。$$, $$Estou extremamente feliz por reencontrar todos vocês.$$),
    ('n1-grammar-46', $$友達がみんな引っ越してしまって、寂しい限りだ。$$, $$ともだちがみんなひっこしてしまって、さびしいかぎりだ。$$, $$Todos os meus amigos se mudaram, estou muito solitário.$$),
    ('n1-grammar-46', $$毎年海外旅行に行けるなんて、うらやましい限りだ。$$, $$まいとしかいがいりょこうにいけるなんて、うらやましいかぎりだ。$$, $$Poder viajar para o exterior todo ano, que inveja enorme.$$),
    ('n1-grammar-46', $$こんな結果になって、残念な限りです。$$, $$こんなけっかになって、ざんねんなかぎりです。$$, $$É uma enorme pena que tenha dado neste resultado.$$),
    ('n1-grammar-46', $$子供の成長は頼もしい限りだ。$$, $$こどものせいちょうはたのもしいかぎりだ。$$, $$O crescimento dos filhos me dá extrema confiança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝できて、うれしい____。$$, $$Estou extremamente feliz por ter vencido.$$),
        (2, $$恩師が亡くなって、悲しい____。$$, $$Meu antigo professor faleceu, estou muitíssimo triste.$$),
        (3, $$あんな失敗をして、恥ずかしい____。$$, $$Cometi um erro daqueles, estou extremamente envergonhado.$$),
        (4, $$一人で夕食を食べるのは、心細い____。$$, $$Jantar sozinho me deixa muito desamparado.$$),
        (5, $$若い人が頑張っている姿は、心強い____。$$, $$Ver os jovens se esforçando me dá muita confiança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$限りだ$$),
        (1, $$限りです$$),
        (2, $$限りだ$$),
        (2, $$限りです$$),
        (3, $$限りだ$$),
        (3, $$限りです$$),
        (4, $$限りだ$$),
        (4, $$限りです$$),
        (5, $$限りだ$$),
        (5, $$限りです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
