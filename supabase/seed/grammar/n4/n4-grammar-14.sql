-- n4-grammar-14 — 〜がする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-14',
    'grammar',
    'N4',
    $$〜がする$$,
    $$ga suru$$,
    $$Sentir cheiro / Ouvir som / Sentir sabor / Ter a sensação de$$,
    $$がする é usado para falar de algo que percebemos pelos sentidos, como cheiros, sons, sabores e sensações. Equivale a "sentir", "ter cheiro de", "ouvir um som de" ou "ter a sensação de".

O ponto principal é que, nessa estrutura, a percepção vem até a pessoa, sem esforço. O cheiro, o som ou o sabor é marcado com が, e する indica que ele está presente.

As palavras mais comuns com がする são におい (cheiro), 音 (som), 声 (voz), 味 (sabor), 感じ (sensação) e 気 (pressentimento).

Com 気, a expressão 気がする significa "ter a impressão de" ou "sentir que", e é muito usada para expressar intuições.$$,
    $$Diferente de 聞く ou 見る, que são ações conscientes, がする descreve uma percepção espontânea. Por isso, quem percebe não costuma aparecer como sujeito.

Para cheiros desagradáveis, usa-se o kanji 臭い; para cheiros agradáveis, 匂い, embora em hiragana におい serve para os dois.

Não confunda com する no sentido de "fazer". Aqui ele não indica ação, e sim presença de uma percepção.$$,
    $$Substantivo de percepção + が + する
におい / 香り + がする (cheiro)
音 / 声 + がする (som / voz)
味 + がする (sabor)
感じ / 気 + がする (sensação / impressão)
Adjetivo / Substantivo + の + Substantivo de percepção + がする$$,
    $$がする$$,
    $$がする|がします|がした|がしました|がして$$,
    ARRAY['が', 'する']::text[],
    ARRAY['がする', 'がします', 'がした', 'がしました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-14', $$いいにおいがしますね。$$, $$いいにおいがしますね。$$, $$Que cheiro bom, né?$$),
    ('n4-grammar-14', $$隣の部屋から変な音がした。$$, $$となりのへやからへんなおとがした。$$, $$Veio um barulho estranho do quarto ao lado.$$),
    ('n4-grammar-14', $$このスープは不思議な味がする。$$, $$このスープはふしぎなあじがする。$$, $$Esta sopa tem um sabor curioso.$$),
    ('n4-grammar-14', $$今日は何かいいことがある気がします。$$, $$きょうはなにかいいことがあるきがします。$$, $$Tenho a sensação de que hoje vai acontecer algo bom.$$),
    ('n4-grammar-14', $$外で子供の声がしました。$$, $$そとでこどものこえがしました。$$, $$Ouvi uma voz de criança lá fora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$台所からカレーのにおい____。$$, $$Vem cheiro de curry da cozinha.$$),
        (2, $$玄関で誰かの足音____。$$, $$Ouvi passos de alguém na entrada.$$),
        (3, $$この薬は苦い味____。$$, $$Este remédio tem um gosto amargo.$$),
        (4, $$何だか寒気____。$$, $$Estou sentindo um certo calafrio.$$),
        (5, $$彼は来ないような気____。$$, $$Tenho a impressão de que ele não vem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がします$$),
        (1, $$がする$$),
        (2, $$がした$$),
        (2, $$がしました$$),
        (3, $$がする$$),
        (3, $$がします$$),
        (4, $$がする$$),
        (4, $$がします$$),
        (5, $$がする$$),
        (5, $$がします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
