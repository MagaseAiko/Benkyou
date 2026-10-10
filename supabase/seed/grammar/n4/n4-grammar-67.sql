-- n4-grammar-67 — 〜おきに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-67',
    'grammar',
    'N4',
    $$〜おきに$$,
    $$oki ni$$,
    $$A cada / De... em...$$,
    $$おきに é usado para indicar intervalos regulares. Equivale a "a cada" ou "de... em...".

Ele vem depois de uma quantidade de tempo ou de distância. Por exemplo, um ônibus que passa a cada dez minutos, ou árvores plantadas a cada cinco metros.

Há um detalhe importante com unidades como dias e linhas: 一日おきに significa "dia sim, dia não", ou seja, pula-se um dia entre cada ocorrência. Com horas e minutos, a interpretação costuma ser simplesmente "a cada X tempo".

A palavra vem do verbo 置く, que aqui tem a ideia de "deixar um espaço" entre uma coisa e outra.$$,
    $$ごとに é parecido e também significa "a cada". Com dias, porém, 一日ごとに significa "todo dia", enquanto 一日おきに significa "dia sim, dia não".

Em horários de transporte e em instruções médicas, おきに aparece com muita frequência.

Para dizer que algo acontece a intervalos de forma geral, sem número, usa-se 定期的に (regularmente).$$,
    $$Quantidade de tempo / distância + おきに + Verbo

Escrita: おきに / 置きに$$,
    $$おきに$$,
    $$おきに|置きに$$,
    ARRAY['おき', 'に']::text[],
    ARRAY['おきに', '置きに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-67', $$この駅では、バスは十分おきに来ます。$$, $$このえきでは、バスはじゅっぷんおきにきます。$$, $$Nesta estação, o ônibus passa a cada dez minutos.$$),
    ('n4-grammar-67', $$一日おきに運動しています。$$, $$いちにちおきにうんどうしています。$$, $$Faço exercício dia sim, dia não.$$),
    ('n4-grammar-67', $$この薬は六時間おきに飲んでください。$$, $$このくすりはろくじかんおきにのんでください。$$, $$Tome este remédio a cada seis horas.$$),
    ('n4-grammar-67', $$道には五メートルおきに木が植えてある。$$, $$みちにはごメートルおきにきがうえてある。$$, $$Há árvores plantadas a cada cinco metros na rua.$$),
    ('n4-grammar-67', $$ノートには一行おきに書いてください。$$, $$ノートにはいちぎょうおきにかいてください。$$, $$No caderno, escreva pulando uma linha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車は五分____来ます。$$, $$O trem passa a cada cinco minutos.$$),
        (2, $$一週間____病院に通っています。$$, $$Vou ao hospital semana sim, semana não.$$),
        (3, $$この花には二日____水をやってください。$$, $$Regue esta flor a cada dois dias.$$),
        (4, $$机を一つ____並べてください。$$, $$Arrume as mesas deixando uma de espaço entre elas.$$),
        (5, $$この大会は四年____開かれる。$$, $$Este campeonato é realizado a cada quatro anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おきに$$),
        (2, $$おきに$$),
        (3, $$おきに$$),
        (4, $$おきに$$),
        (5, $$おきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
