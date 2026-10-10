-- n4-grammar-64 — 〜のは〜だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-64',
    'grammar',
    'N4',
    $$〜のは〜だ$$,
    $$no wa ~ da$$,
    $$O que... é / Quem... é / Foi... que$$,
    $$のは〜だ é usado para destacar a informação mais importante da frase. Equivale a estruturas como "o que eu gosto é...", "quem veio foi..." ou "foi por isso que...".

A primeira parte, terminada em のは, apresenta uma situação já conhecida ou fácil de entender. O の transforma essa parte em substantivo, e は a marca como tema.

A segunda parte, antes de だ ou です, traz a informação nova e importante: a pessoa, a coisa, o lugar, o tempo ou o motivo.

Essa estrutura é muito útil para corrigir alguém, responder perguntas com precisão ou dar ênfase a uma parte específica da frase.

Para explicar o motivo, é comum terminar com からです: "o motivo de... é que...".$$,
    $$Nessa estrutura, o sujeito dentro da primeira parte costuma ser marcado com が, e não com は, porque a frase inteira já tem um tema.

É uma forma muito natural de dar ênfase sem mudar a ordem das palavras, algo que o japonês faz com frequência.

Em respostas a perguntas como "quem fez isso?", essa estrutura deixa a resposta clara e enfática.$$,
    $$Verbo / Adjetivo (forma simples) + のは + Informação + だ / です
Adjetivo な + な + のは + Informação + だ / です
… + のは + Motivo + からです$$,
    $$のは$$,
    $$のは$$,
    ARRAY['の', 'は', 'だ']::text[],
    ARRAY['のは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-64', $$私が好きなのは、日本の歌です。$$, $$わたしがすきなのは、にほんのうたです。$$, $$O que eu gosto é de músicas japonesas.$$),
    ('n4-grammar-64', $$昨日来たのは田中さんです。$$, $$きのうきたのはたなかさんです。$$, $$Quem veio ontem foi o Tanaka.$$),
    ('n4-grammar-64', $$一番大切なのは、健康だ。$$, $$いちばんたいせつなのは、けんこうだ。$$, $$O mais importante é a saúde.$$),
    ('n4-grammar-64', $$私が生まれたのは、小さな村です。$$, $$わたしがうまれたのは、ちいさなむらです。$$, $$O lugar onde nasci é um vilarejo pequeno.$$),
    ('n4-grammar-64', $$彼が会社を休んだのは、病気だったからです。$$, $$かれがかいしゃをやすんだのは、びょうきだったからです。$$, $$Ele faltou ao trabalho porque estava doente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵をかいた____、私の妹です。$$, $$Quem pintou este quadro foi minha irmã mais nova.$$),
        (2, $$一番難しかった____、漢字の試験だった。$$, $$O mais difícil foi a prova de kanji.$$),
        (3, $$私が毎朝飲む____、コーヒーです。$$, $$O que eu bebo toda manhã é café.$$),
        (4, $$彼女に初めて会った____、去年の夏です。$$, $$A primeira vez que a encontrei foi no verão passado.$$),
        (5, $$今朝遅れた____、電車が止まったからです。$$, $$Hoje de manhã me atrasei porque o trem parou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のは$$),
        (2, $$のは$$),
        (3, $$のは$$),
        (4, $$のは$$),
        (5, $$のは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
