-- n1-grammar-150 — 〜を皮切りに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-150',
    'grammar',
    'N1',
    $$〜を皮切りに$$,
    $$wo kawakiri ni$$,
    $$Começando por / A partir de / Tendo como ponto de partida$$,
    $$を皮切りに indica que algo começou em um ponto e depois se espalhou ou continuou em sequência. Equivale a "começando por" ou "a partir de".

É muito usado para turnês, campanhas, eventos e séries de acontecimentos. Por exemplo, "começando por Tóquio, a banda fará shows em todo o país".

É uma expressão formal.$$,
    $$Expressões comuns são 東京公演を皮切りに e この発言を皮切りに.

É parecido com をはじめとして e から始まって.$$,
    $$Substantivo + を皮切りに / を皮切りとして
Verbo (forma simples) + の + を皮切りに$$,
    $$を皮切りに$$,
    $$を皮切りに|を皮切りとして|をかわきりに$$,
    ARRAY['を', '皮切り', 'に']::text[],
    ARRAY['を皮切りに', 'を皮切りとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-150', $$東京公演を皮切りに、全国ツアーが始まった。$$, $$とうきょうこうえんをかわきりに、ぜんこくツアーがはじまった。$$, $$Começando pelo show em Tóquio, teve início a turnê nacional.$$),
    ('n1-grammar-150', $$彼の発言を皮切りに、次々と反対意見が出た。$$, $$かれのはつげんをかわきりに、つぎつぎとはんたいいけんがでた。$$, $$A partir da declaração dele, surgiram opiniões contrárias uma atrás da outra.$$),
    ('n1-grammar-150', $$この店を皮切りとして、全国に店を増やしていく。$$, $$このみせをかわきりとして、ぜんこくにみせをふやしていく。$$, $$Tendo esta loja como ponto de partida, vamos abrir lojas no país todo.$$),
    ('n1-grammar-150', $$新商品の発売を皮切りに、キャンペーンが始まる。$$, $$しんしょうひんのはつばいをかわきりに、キャンペーンがはじまる。$$, $$A campanha começa a partir do lançamento do novo produto.$$),
    ('n1-grammar-150', $$一人が笑ったのを皮切りに、みんなが笑い出した。$$, $$ひとりがわらったのをかわきりに、みんながわらいだした。$$, $$Começando por uma pessoa que riu, todos começaram a rir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大阪____、各地で講演会を行う。$$, $$Começando por Osaka, faremos palestras em vários lugares.$$),
        (2, $$今日の会議____、話し合いが続けられる。$$, $$A partir da reunião de hoje, as conversas vão continuar.$$),
        (3, $$第一話____、シリーズ全作が放送される。$$, $$Começando pelo primeiro episódio, toda a série será transmitida.$$),
        (4, $$彼女が手を挙げたの____、多くの人が質問した。$$, $$A partir de quando ela levantou a mão, muitas pessoas fizeram perguntas.$$),
        (5, $$ニューヨーク____、世界各地で展示会が開かれる。$$, $$Começando por Nova York, haverá exposições em várias partes do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を皮切りに$$),
        (1, $$を皮切りとして$$),
        (1, $$をかわきりに$$),
        (2, $$を皮切りに$$),
        (2, $$を皮切りとして$$),
        (2, $$をかわきりに$$),
        (3, $$を皮切りに$$),
        (3, $$を皮切りとして$$),
        (3, $$をかわきりに$$),
        (4, $$を皮切りに$$),
        (4, $$を皮切りとして$$),
        (4, $$をかわきりに$$),
        (5, $$を皮切りに$$),
        (5, $$を皮切りとして$$),
        (5, $$をかわきりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
