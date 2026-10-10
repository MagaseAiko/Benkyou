-- n2-grammar-66 — 〜もかまわず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-66',
    'grammar',
    'N2',
    $$〜もかまわず$$,
    $$mo kamawazu$$,
    $$Sem se importar com / Sem ligar para / Apesar de$$,
    $$もかまわず indica que alguém faz algo sem se importar com uma situação que normalmente faria a pessoa hesitar. Equivale a "sem se importar com" ou "sem ligar para".

Muitas vezes se refere ao olhar dos outros, à chuva, ao horário ou à presença de pessoas. Por exemplo, "chorou alto sem se importar com as pessoas em volta".

O tom costuma mostrar surpresa ou crítica diante da atitude.$$,
    $$A expressão 人目もかまわず (sem se importar com o olhar dos outros) é muito comum.

É parecido com を気にせず, mas もかまわず é mais formal e mais expressivo.

A forma かまわず sozinha também significa "sem se importar".$$,
    $$Substantivo + もかまわず
Verbo (forma simples) + の + もかまわず
Adjetivo い + の + もかまわず$$,
    $$もかまわず$$,
    $$もかまわず|も構わず$$,
    ARRAY['も', 'かまわず']::text[],
    ARRAY['もかまわず', 'も構わず', 'のもかまわず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-66', $$彼女は人目もかまわず泣き出した。$$, $$かのじょはひとめもかまわずなきだした。$$, $$Ela começou a chorar sem se importar com o olhar dos outros.$$),
    ('n2-grammar-66', $$服が汚れるのもかまわず、子供たちは遊んでいる。$$, $$ふくがよごれるのもかまわず、こどもたちはあそんでいる。$$, $$As crianças estão brincando sem ligar para as roupas sujando.$$),
    ('n2-grammar-66', $$雨もかまわず、彼は走り続けた。$$, $$あめもかまわず、かれははしりつづけた。$$, $$Ele continuou correndo sem se importar com a chuva.$$),
    ('n2-grammar-66', $$夜中なのもかまわず、隣の人が大声で歌っている。$$, $$よなかなのもかまわず、となりのひとがおおごえでうたっている。$$, $$Mesmo sendo meia-noite, o vizinho está cantando alto sem se importar.$$),
    ('n2-grammar-66', $$周りの迷惑もかまわず、電話で話している人がいる。$$, $$まわりのめいわくもかまわず、でんわではなしているひとがいる。$$, $$Tem gente falando ao telefone sem se importar com o incômodo aos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は値段____、高い料理を注文した。$$, $$Ele pediu pratos caros sem se importar com o preço.$$),
        (2, $$母が止めるの____、彼は家を出た。$$, $$Ele saiu de casa sem ligar para a mãe tentando impedir.$$),
        (3, $$寒さ____、彼らは海で泳いだ。$$, $$Eles nadaram no mar sem se importar com o frio.$$),
        (4, $$足が痛いの____、最後まで走った。$$, $$Corri até o fim sem ligar para a dor no pé.$$),
        (5, $$彼は人目____、大声で笑った。$$, $$Ele riu alto sem se importar com o olhar dos outros.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もかまわず$$),
        (1, $$も構わず$$),
        (2, $$もかまわず$$),
        (2, $$も構わず$$),
        (3, $$もかまわず$$),
        (3, $$も構わず$$),
        (4, $$もかまわず$$),
        (4, $$も構わず$$),
        (5, $$もかまわず$$),
        (5, $$も構わず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
