-- n1-grammar-09 — 〜べく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-09',
    'grammar',
    'N1',
    $$〜べく$$,
    $$beku$$,
    $$Para / A fim de / Com o objetivo de$$,
    $$べく indica o objetivo de uma ação. Equivale a "para", "a fim de" ou "com o objetivo de".

É uma forma formal e escrita, parecida com ために. Por exemplo, "para passar na prova, estudou todos os dias".

Aparece principalmente em textos, notícias e discursos.$$,
    $$A segunda parte não pode ser um pedido ou uma ordem.

A forma すべく é a mais formal para する.

É mais formal que ために e ように.$$,
    $$Verbo (forma dicionário) + べく
する → するべく / すべく$$,
    $$べく$$,
    $$べく$$,
    ARRAY['べく']::text[],
    ARRAY['べく', 'すべく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-09', $$試験に合格すべく、毎日勉強している。$$, $$しけんにごうかくすべく、まいにちべんきょうしている。$$, $$Estudo todos os dias para passar na prova.$$),
    ('n1-grammar-09', $$夢を実現するべく、彼は東京へ行った。$$, $$ゆめをじつげんするべく、かれはとうきょうへいった。$$, $$A fim de realizar seu sonho, ele foi para Tóquio.$$),
    ('n1-grammar-09', $$問題を解決すべく、会議が開かれた。$$, $$もんだいをかいけつすべく、かいぎがひらかれた。$$, $$Uma reunião foi realizada com o objetivo de resolver o problema.$$),
    ('n1-grammar-09', $$家族を守るべく、彼は必死で働いた。$$, $$かぞくをまもるべく、かれはひっしではたらいた。$$, $$Para proteger a família, ele trabalhou desesperadamente.$$),
    ('n1-grammar-09', $$新しい市場を開拓すべく、海外に支社を作った。$$, $$あたらしいしじょうをかいたくすべく、かいがいにししゃをつくった。$$, $$Para abrir um novo mercado, criaram uma filial no exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝す____、選手たちは厳しい練習を続けた。$$, $$Para vencer o campeonato, os atletas continuaram com treinos duros.$$),
        (2, $$真実を知る____、彼は調査を始めた。$$, $$A fim de saber a verdade, ele começou a investigar.$$),
        (3, $$事故の原因を明らかにす____、専門家が集まった。$$, $$Especialistas se reuniram com o objetivo de esclarecer a causa do acidente.$$),
        (4, $$期待に応える____、全力を尽くします。$$, $$Para corresponder às expectativas, darei o meu melhor.$$),
        (5, $$早く帰る____、急いで仕事を終わらせた。$$, $$Para voltar cedo, terminei o trabalho às pressas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べく$$),
        (2, $$べく$$),
        (3, $$べく$$),
        (4, $$べく$$),
        (5, $$べく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
