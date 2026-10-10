-- n5-grammar-54 — 〜のが上手
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-54',
    'grammar',
    'N5',
    $$〜のが上手$$,
    $$no ga jouzu$$,
    $$Ser bom em (fazer) / Ter jeito para$$,
    $$のが上手 é usado para dizer que alguém é bom em fazer alguma coisa. Equivale a "ser bom em" ou "ter jeito para".

上手 é um adjetivo な que significa "habilidoso". Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo, e depois vem が + 上手.

A ação é marcada com が, porque 上手 descreve a habilidade em relação a ela. A pessoa que tem a habilidade costuma vir com は.

Com substantivos, como esportes, idiomas e instrumentos, não é preciso の: basta usar o substantivo + が + 上手.$$,
    $$Em japonês, não se costuma usar 上手 para falar das próprias habilidades, porque soa como se gabar. Para isso, usa-se 得意, que significa "ser bom em" ou "ser o meu forte".

Elogiar alguém com 上手ですね é muito comum. A resposta educada e humilde costuma ser いいえ、まだまだです.

O oposto de 上手 é 下手.$$,
    $$Verbo na forma de dicionário + のが + 上手 + です / だ
Substantivo + が + 上手 + です / だ
Pessoa + は + Verbo + のが上手

Negativo: のが上手じゃない
Escrita: 上手 / じょうず$$,
    $$のが上手$$,
    $$のが上手|のがじょうず$$,
    ARRAY['の', 'が', '上手']::text[],
    ARRAY['のが上手', 'のがじょうず', 'のが上手です', 'のが上手だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-54', $$姉は歌うのが上手です。$$, $$あねはうたうのがじょうずです。$$, $$Minha irmã mais velha canta bem.$$),
    ('n5-grammar-54', $$田中さんは料理を作るのが上手ですね。$$, $$たなかさんはりょうりをつくるのがじょうずですね。$$, $$O Tanaka cozinha bem, hein.$$),
    ('n5-grammar-54', $$弟は絵を描くのが上手だ。$$, $$おとうとはえをかくのがじょうずだ。$$, $$Meu irmão mais novo desenha bem.$$),
    ('n5-grammar-54', $$山田先生は教えるのが上手です。$$, $$やまだせんせいはおしえるのがじょうずです。$$, $$O professor Yamada ensina bem.$$),
    ('n5-grammar-54', $$彼は人の話を聞くのが上手です。$$, $$かれはひとのはなしをきくのがじょうずです。$$, $$Ele sabe ouvir bem as pessoas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は車を運転する____です。$$, $$Meu pai dirige bem.$$),
        (2, $$妹はピアノを弾く____。$$, $$Minha irmã mais nova toca piano bem.$$),
        (3, $$田中さんは写真を撮る____ですね。$$, $$O Tanaka tira fotos bem, hein.$$),
        (4, $$あの子は友達を作る____です。$$, $$Aquela criança tem jeito para fazer amigos.$$),
        (5, $$母は安くていい物を見つける____です。$$, $$Minha mãe é ótima em achar coisas boas e baratas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが上手$$),
        (1, $$のがじょうず$$),
        (2, $$のが上手です$$),
        (2, $$のがじょうずです$$),
        (2, $$のが上手だ$$),
        (2, $$のがじょうずだ$$),
        (3, $$のが上手$$),
        (3, $$のがじょうず$$),
        (4, $$のが上手$$),
        (4, $$のがじょうず$$),
        (5, $$のが上手$$),
        (5, $$のがじょうず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
