-- n3-grammar-136 — 〜と言えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-136',
    'grammar',
    'N3',
    $$〜と言えば$$,
    $$to ieba$$,
    $$Falando de / Por falar em / Quando se pensa em$$,
    $$と言えば tem dois usos principais.

O primeiro é associar uma palavra à coisa mais típica ou famosa ligada a ela. Equivale a "falando de..." ou "quando se pensa em...". Por exemplo, "falando de Japão, a primeira coisa é o Monte Fuji" ou "quando se pensa em inverno, é comida de panela".

O segundo é retomar algo que alguém disse e mudar um pouco o assunto. Equivale a "por falar em...". Por exemplo, alguém menciona o Tanaka, e você responde "por falar no Tanaka, dizem que ele vai se casar".

A forma と言ったら tem sentido parecido e é um pouco mais enfática.$$,
    $$そう言えば (por falar nisso) é uma expressão muito comum para lembrar de algo de repente.

と言えば aparece muito em perguntas como 日本と言えば何ですか ("o que vem à mente quando se fala de Japão?").

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: といえば.$$,
    $$Substantivo + と言えば、 + Associação típica
(Retomando a fala do outro) Substantivo + と言えば、 + Novo assunto

Variações: といえば / と言ったら / といったら$$,
    $$と言えば$$,
    $$と言えば|といえば|と言ったら|といったら$$,
    ARRAY['と', '言えば']::text[],
    ARRAY['と言えば', 'といえば', 'と言ったら', 'といったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-136', $$日本と言えば、富士山ですね。$$, $$にほんといえば、ふじさんですね。$$, $$Falando de Japão, o Monte Fuji é o que vem à mente, né?$$),
    ('n3-grammar-136', $$夏と言えば、海に行きたくなる。$$, $$なつといえば、うみにいきたくなる。$$, $$Quando se pensa em verão, dá vontade de ir à praia.$$),
    ('n3-grammar-136', $$京都と言えば、お寺が有名だ。$$, $$きょうとといえば、おてらがゆうめいだ。$$, $$Falando de Kyoto, os templos são famosos.$$),
    ('n3-grammar-136', $$田中さんと言えば、来月結婚するそうですよ。$$, $$たなかさんといえば、らいげつけっこんするそうですよ。$$, $$Por falar no Tanaka, dizem que ele vai se casar no mês que vem.$$),
    ('n3-grammar-136', $$冬と言えば、やっぱり鍋料理だ。$$, $$ふゆといえば、やっぱりなべりょうりだ。$$, $$Quando se pensa em inverno, é comida de panela, claro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$北海道____、雪とラーメンだ。$$, $$Falando de Hokkaido, é neve e ramen.$$),
        (2, $$ブラジル____、サッカーとサンバが有名だ。$$, $$Falando de Brasil, futebol e samba são famosos.$$),
        (3, $$「旅行の話をしよう。」「旅行____、来月どこに行くの？」$$, $$"Vamos falar de viagem." "Por falar em viagem, aonde você vai no mês que vem?"$$),
        (4, $$春____、桜ですね。$$, $$Falando de primavera, são as cerejeiras, né?$$),
        (5, $$日本の食べ物____、すしでしょう。$$, $$Falando de comida japonesa, deve ser sushi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言えば$$),
        (1, $$といえば$$),
        (2, $$と言えば$$),
        (2, $$といえば$$),
        (3, $$と言えば$$),
        (3, $$といえば$$),
        (4, $$と言えば$$),
        (4, $$といえば$$),
        (5, $$と言えば$$),
        (5, $$といえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
