-- n5-grammar-09 — どうして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-09',
    'grammar',
    'N5',
    $$どうして$$,
    $$doushite$$,
    $$Por quê / Por que motivo$$,
    $$どうして é usado para perguntar o motivo ou a razão de alguma coisa. Equivale a "por quê".

Ele normalmente aparece no começo da pergunta, e a frase termina com か, の ou んですか. Também pode ser usado sozinho, como resposta curta, na forma どうしてですか ou só どうして.

A resposta a uma pergunta com どうして costuma terminar com から ou ので, que explicam a causa.

Existem outras palavras com o mesmo sentido: なんで é mais informal e muito usado entre amigos, e なぜ é mais formal e comum em textos escritos. どうして fica no meio, servindo para a maioria das situações.$$,
    $$Quando a pergunta é feita com んですか ou の, ela soa mais natural e mostra interesse real em entender a situação.

Dependendo do tom, どうして pode soar como cobrança ou reclamação, principalmente em frases negativas, como perguntar por que alguém não fez algo.

A expressão どうしてか significa "por algum motivo" ou "não sei por quê", e não é uma pergunta.$$,
    $$どうして + frase + か / の / んですか
どうしてですか (sozinho)
どうしてか + frase (por algum motivo)

Resposta: 〜から / 〜ので$$,
    $$どうして$$,
    $$どうして$$,
    ARRAY['どうして']::text[],
    ARRAY['どうして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-09', $$どうして日本語を勉強していますか。$$, $$どうしてにほんごをべんきょうしていますか。$$, $$Por que você está estudando japonês?$$),
    ('n5-grammar-09', $$どうして昨日来なかったの？$$, $$どうしてきのうこなかったの？$$, $$Por que você não veio ontem?$$),
    ('n5-grammar-09', $$「明日は行きません。」「どうしてですか。」$$, $$「あしたはいきません。」「どうしてですか。」$$, $$"Amanhã não vou." "Por quê?"$$),
    ('n5-grammar-09', $$どうしてそんなに急いでいるんですか。$$, $$どうしてそんなにいそいでいるんですか。$$, $$Por que você está com tanta pressa?$$),
    ('n5-grammar-09', $$どうしてかわからないけど、今日はとても眠い。$$, $$どうしてかわからないけど、きょうはとてもねむい。$$, $$Não sei por quê, mas hoje estou com muito sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____泣いているの？$$, $$Por que você está chorando?$$),
        (2, $$____遅れたんですか。$$, $$Por que você se atrasou?$$),
        (3, $$「パーティーに行かない。」「____？」$$, $$"Não vou à festa." "Por quê?"$$),
        (4, $$____この窓は開かないんだろう。$$, $$Por que será que esta janela não abre?$$),
        (5, $$____かわからないけど、彼は怒っている。$$, $$Não sei por quê, mas ele está bravo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうして$$),
        (2, $$どうして$$),
        (3, $$どうして$$),
        (4, $$どうして$$),
        (5, $$どうして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
