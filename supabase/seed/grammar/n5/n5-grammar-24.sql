-- n5-grammar-24 — 〜方
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-24',
    'grammar',
    'N5',
    $$〜方$$,
    $$kata$$,
    $$Jeito de / Modo de / Maneira de$$,
    $$方 (lido かた) é usado depois de um verbo para formar a ideia de "jeito de fazer", "modo de fazer" ou "como fazer".

Para isso, tira-se ます da forma educada do verbo e coloca-se 方. O resultado é um substantivo, então ele pode ser usado com partículas como を, が e は.

Como a nova palavra é um substantivo, o objeto do verbo original não usa mais を: ele passa a usar の. Assim, "o jeito de ler o kanji" fica com の entre o kanji e o verbo.

Com verbos com する, como 勉強する, a forma fica 勉強の仕方, usando し方 (às vezes escrito 仕方).$$,
    $$方 também tem outros sentidos. Lido かた, ele é uma forma educada de dizer "pessoa", como em あの方. Lido ほう, ele aparece em comparações e em ほうがいい.

A expressão 仕方がない significa "não tem jeito" e vem justamente da ideia de "não existe um modo de fazer".

Algumas formas são tão comuns que viraram vocabulário próprio, como 読み方 (leitura), 使い方 (modo de usar) e 行き方 (como chegar).$$,
    $$Verbo na forma ます sem ます + 方
Substantivo + の + Verbo sem ます + 方
Substantivo + の + し方 / 仕方 (verbos com する)

Escrita: 方 / かた$$,
    $$方$$,
    $$方|かた$$,
    ARRAY['方']::text[],
    ARRAY['方', 'かた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-24', $$この漢字の読み方を教えてください。$$, $$このかんじのよみかたをおしえてください。$$, $$Me ensine a leitura deste kanji, por favor.$$),
    ('n5-grammar-24', $$駅までの行き方がわかりません。$$, $$えきまでのいきかたがわかりません。$$, $$Não sei como chegar até a estação.$$),
    ('n5-grammar-24', $$このアプリの使い方は簡単です。$$, $$このアプリのつかいかたはかんたんです。$$, $$O jeito de usar este aplicativo é fácil.$$),
    ('n5-grammar-24', $$母にカレーの作り方を習いました。$$, $$ははにカレーのつくりかたをならいました。$$, $$Aprendi com minha mãe a fazer curry.$$),
    ('n5-grammar-24', $$先生は話し方がとても優しいです。$$, $$せんせいははなしかたがとてもやさしいです。$$, $$O professor tem um jeito de falar muito gentil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お箸の持ち____を教えてください。$$, $$Me ensine a segurar os hashis, por favor.$$),
        (2, $$このパソコンの使い____がわかりません。$$, $$Não sei usar este computador.$$),
        (3, $$日本語の手紙の書き____を勉強しています。$$, $$Estou estudando como escrever cartas em japonês.$$),
        (4, $$切符の買い____を駅員さんに聞きました。$$, $$Perguntei ao funcionário da estação como comprar a passagem.$$),
        (5, $$彼は歩き____がお父さんに似ています。$$, $$O jeito de andar dele parece com o do pai.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$方$$),
        (1, $$かた$$),
        (2, $$方$$),
        (2, $$かた$$),
        (3, $$方$$),
        (3, $$かた$$),
        (4, $$方$$),
        (4, $$かた$$),
        (5, $$方$$),
        (5, $$かた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
