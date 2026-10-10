-- n2-grammar-36 — いわゆる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-36',
    'grammar',
    'N2',
    $$いわゆる$$,
    $$iwayuru$$,
    $$O chamado / O que se chama de / Como se diz$$,
    $$いわゆる é usado antes de uma palavra ou expressão para indicar que ela é um termo conhecido, popular ou comumente usado. Equivale a "o chamado", "o que se chama de" ou "como se diz".

Ele mostra que quem fala está usando uma palavra que todo mundo conhece, às vezes uma gíria, um rótulo ou um conceito popular. Por exemplo, "ele é o que se chama de gênio" ou "trabalhei numa chamada 'empresa abusiva'".

Muitas vezes, a palavra que vem depois aparece entre aspas japonesas 「」, reforçando que é um termo específico.

いわゆる vem antes de substantivos e funciona como um adjetivo.$$,
    $$O kanji 所謂 é raro no dia a dia; o mais comum é escrever em hiragana.

いわゆる também é útil para explicar termos culturais japoneses a estrangeiros, como おもてなし e 帰国子女.

Às vezes, いわゆる tem um tom levemente distante ou crítico, como se quem fala não concordasse totalmente com o rótulo.$$,
    $$いわゆる + Substantivo
いわゆる + 「Termo」

Escrita: いわゆる / 所謂$$,
    $$いわゆる$$,
    $$いわゆる|所謂$$,
    ARRAY['いわゆる']::text[],
    ARRAY['いわゆる', '所謂']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-36', $$彼はいわゆる天才だ。$$, $$かれはいわゆるてんさいだ。$$, $$Ele é o que se chama de gênio.$$),
    ('n2-grammar-36', $$これがいわゆる日本の「おもてなし」です。$$, $$これがいわゆるにほんの「おもてなし」です。$$, $$Isto é o chamado "omotenashi", a hospitalidade japonesa.$$),
    ('n2-grammar-36', $$彼女はいわゆるお嬢様だ。$$, $$かのじょはいわゆるおじょうさまだ。$$, $$Ela é o que se chama de moça de família rica.$$),
    ('n2-grammar-36', $$以前、いわゆる「ブラック企業」で働いていた。$$, $$いぜん、いわゆる「ブラックきぎょう」ではたらいていた。$$, $$Antes, eu trabalhava numa chamada "empresa abusiva".$$),
    ('n2-grammar-36', $$彼はいわゆるオタクと呼ばれる人だ。$$, $$かれはいわゆるオタクとよばれるひとだ。$$, $$Ele é o que se costuma chamar de otaku.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は有名大学を出た、____エリートだ。$$, $$Ele se formou numa universidade famosa, é o que se chama de elite.$$),
        (2, $$これが____「和食」です。$$, $$Isto é o chamado "washoku", a culinária japonesa.$$),
        (3, $$海外で育った彼女は、____帰国子女だ。$$, $$Ela, que cresceu no exterior, é o que se chama de "kikoku shijo".$$),
        (4, $$最近、____「草食系男子」が増えている。$$, $$Ultimamente, estão aumentando os chamados "homens herbívoros".$$),
        (5, $$一日中ゲームをしている彼は、____ゲームオタクだ。$$, $$Ele joga videogame o dia inteiro: é o que se chama de viciado em games.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いわゆる$$),
        (2, $$いわゆる$$),
        (3, $$いわゆる$$),
        (4, $$いわゆる$$),
        (5, $$いわゆる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
