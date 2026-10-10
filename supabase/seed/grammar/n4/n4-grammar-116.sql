-- n4-grammar-116 — 〜続ける
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-116',
    'grammar',
    'N4',
    $$〜続ける$$,
    $$tsuzukeru$$,
    $$Continuar a / Continuar fazendo / Seguir$$,
    $$続ける, ligado a outro verbo, indica que uma ação continua por um tempo, sem parar. Equivale a "continuar a" ou "continuar fazendo".

A estrutura junta o verbo na forma ます sem ます com 続ける. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 続けます, 続けた, 続けている.

É usado para ações que duram e se repetem, como falar, andar, chover, trabalhar ou estudar.

É muito comum junto com expressões de tempo, como "três horas", "o dia inteiro" ou "dez anos", destacando a duração.

Sozinho, 続ける significa "continuar algo", como continuar os estudos. Já 続く é intransitivo: "algo continua".$$,
    $$Com ações de um instante, como chegar ou acordar, 続ける normalmente não é usado, porque elas não podem "durar".

Para fenômenos naturais, como a chuva, tanto 降り続ける quanto 降り続く são usados. 降り続く soa mais natural em descrições do tempo.

続ける também aparece em frases de incentivo, como "o importante é continuar".$$,
    $$Verbo na forma ます sem ます + 続ける

Educado: 続けます
Passado: 続けた / 続けました
Em andamento: 続けている

Escrita: 続ける / つづける$$,
    $$続ける$$,
    $$続け|つづけ$$,
    ARRAY['続ける']::text[],
    ARRAY['続ける', '続けます', '続けた', '続けている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-116', $$彼は三時間も話し続けた。$$, $$かれはさんじかんもはなしつづけた。$$, $$Ele continuou falando por três horas inteiras.$$),
    ('n4-grammar-116', $$雨が一日中降り続けています。$$, $$あめがいちにちじゅうふりつづけています。$$, $$A chuva continua caindo o dia inteiro.$$),
    ('n4-grammar-116', $$日本語の勉強を続けることが大切です。$$, $$にほんごのべんきょうをつづけることがたいせつです。$$, $$O importante é continuar estudando japonês.$$),
    ('n4-grammar-116', $$父は十年間この会社で働き続けている。$$, $$ちちはじゅうねんかんこのかいしゃではたらきつづけている。$$, $$Meu pai trabalha nesta empresa há dez anos sem parar.$$),
    ('n4-grammar-116', $$赤ちゃんが朝まで泣き続けた。$$, $$あかちゃんがあさまでなきつづけた。$$, $$O bebê continuou chorando até de manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は二時間も歩き____。$$, $$Ela continuou andando por duas horas inteiras.$$),
        (2, $$子供のころから、ピアノを習い____います。$$, $$Continuo aprendendo piano desde criança.$$),
        (3, $$昨日の夜は、ずっと雪が降り____。$$, $$Ontem à noite, a neve continuou caindo sem parar.$$),
        (4, $$毎日、日記を書き____ことは難しい。$$, $$Continuar escrevendo um diário todo dia é difícil.$$),
        (5, $$彼は何も言わずに、走り____。$$, $$Ele continuou correndo sem dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$続けました$$),
        (1, $$続けた$$),
        (2, $$続けて$$),
        (3, $$続けた$$),
        (3, $$続けました$$),
        (4, $$続ける$$),
        (5, $$続けた$$),
        (5, $$続けました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
