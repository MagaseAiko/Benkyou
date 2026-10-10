-- n2-grammar-108 — 〜に過ぎない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-108',
    'grammar',
    'N2',
    $$〜に過ぎない$$,
    $$ni suginai$$,
    $$Não passa de / É apenas / Não é mais que$$,
    $$に過ぎない indica que algo não é tão importante ou não vai além de um certo nível. Equivale a "não passa de" ou "é apenas".

A pessoa diminui a importância de algo, seja por modéstia, seja para mostrar que é pouco. Por exemplo, "isso não passa de um boato" ou "sou apenas um estudante".

É uma expressão um pouco formal, usada tanto na fala quanto na escrita.$$,
    $$É parecido com だけだ, mas に過ぎない é mais formal e tem um tom mais forte de "pouco".

Não se confunde com にほかならない, que reforça em vez de diminuir.$$,
    $$Substantivo + に過ぎない
Verbo (forma simples) + に過ぎない
Número / Quantidade + に過ぎない$$,
    $$に過ぎない$$,
    $$に過ぎない|にすぎない|に過ぎません|にすぎません|に過ぎなかった|にすぎなかった$$,
    ARRAY['に', '過ぎない']::text[],
    ARRAY['に過ぎない', 'にすぎない', 'に過ぎません', 'に過ぎなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-108', $$それはただのうわさに過ぎない。$$, $$それはただのうわさにすぎない。$$, $$Isso não passa de um boato.$$),
    ('n2-grammar-108', $$私はただの学生に過ぎません。$$, $$わたしはただのがくせいにすぎません。$$, $$Sou apenas um estudante.$$),
    ('n2-grammar-108', $$参加者はわずか十人にすぎなかった。$$, $$さんかしゃはわずかじゅうにんにすぎなかった。$$, $$Os participantes não passaram de dez pessoas.$$),
    ('n2-grammar-108', $$彼の言うことは言い訳に過ぎない。$$, $$かれのいうことはいいわけにすぎない。$$, $$O que ele diz não passa de desculpa.$$),
    ('n2-grammar-108', $$これは問題の一部にすぎない。$$, $$これはもんだいのいちぶにすぎない。$$, $$Isto é apenas uma parte do problema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$それはあなたの想像____。$$, $$Isso não passa da sua imaginação.$$),
        (2, $$私は自分の仕事をした____。$$, $$Eu apenas fiz o meu trabalho.$$),
        (3, $$合格したのは全体の一割____。$$, $$Os aprovados não passaram de dez por cento do total.$$),
        (4, $$この案はまだ計画の段階____。$$, $$Esta proposta ainda é apenas uma fase de planejamento.$$),
        (5, $$彼の優しさは見せかけ____。$$, $$A gentileza dele não passa de fachada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に過ぎない$$),
        (1, $$にすぎない$$),
        (1, $$に過ぎません$$),
        (1, $$にすぎません$$),
        (2, $$に過ぎない$$),
        (2, $$にすぎない$$),
        (2, $$に過ぎません$$),
        (2, $$にすぎません$$),
        (3, $$に過ぎない$$),
        (3, $$にすぎない$$),
        (3, $$に過ぎなかった$$),
        (3, $$にすぎなかった$$),
        (4, $$に過ぎない$$),
        (4, $$にすぎない$$),
        (4, $$に過ぎません$$),
        (4, $$にすぎません$$),
        (5, $$に過ぎない$$),
        (5, $$にすぎない$$),
        (5, $$に過ぎません$$),
        (5, $$にすぎません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
