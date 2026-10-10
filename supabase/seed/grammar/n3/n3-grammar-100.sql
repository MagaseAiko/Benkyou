-- n3-grammar-100 — 〜さえ〜ば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-100',
    'grammar',
    'N3',
    $$〜さえ〜ば$$,
    $$sae ~ ba$$,
    $$Basta que / Desde que / Se ao menos$$,
    $$さえ〜ば é usado para dizer que uma única condição é suficiente para que algo aconteça. Equivale a "basta que", "desde que" ou "se ao menos".

A ideia é que, se aquela condição for cumprida, todo o resto se resolve. Por exemplo, "se ao menos eu tivesse tempo, poderia estudar mais" ou "basta tomar este remédio para melhorar".

Com substantivos, さえ vem depois do substantivo, e a condição usa ば: 時間さえあれば.

Com verbos, a estrutura fica Verbo sem ます + さえすれば: 飲みさえすれば (basta tomar). Com a forma て, fica てさえいれば.

Com adjetivos, fica Adjetivo + さえ + condição: 天気さえよければ.$$,
    $$Às vezes, o tom é de crítica a quem acha que uma coisa resolve tudo, como em "achar que basta ter dinheiro".

Em frases com のに no final, さえ〜ば expressa arrependimento: 時間さえあれば、できたのに.

A expressão あなたさえよければ ("se estiver tudo bem para você") é uma forma gentil de fazer um convite.$$,
    $$Substantivo + さえ + Verbo / Adjetivo ば
Verbo na forma ます sem ます + さえすれば
Verbo na forma て + さえいれば
Substantivo / Adjetivo な + さえ + なら / であれば$$,
    $$さえ$$,
    $$さえ$$,
    ARRAY['さえ', 'ば']::text[],
    ARRAY['さえ〜ば', 'さえすれば', 'さえあれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-100', $$時間さえあれば、もっと勉強できるのに。$$, $$じかんさえあれば、もっとべんきょうできるのに。$$, $$Se ao menos eu tivesse tempo, poderia estudar mais.$$),
    ('n3-grammar-100', $$この薬を飲みさえすれば、すぐ治ります。$$, $$このくすりをのみさえすれば、すぐなおります。$$, $$Basta tomar este remédio para melhorar logo.$$),
    ('n3-grammar-100', $$天気さえよければ、ここから富士山が見える。$$, $$てんきさえよければ、ここからふじさんがみえる。$$, $$Desde que o tempo esteja bom, dá para ver o Monte Fuji daqui.$$),
    ('n3-grammar-100', $$お金さえあれば、何でも買えると思うのは間違いだ。$$, $$おかねさえあれば、なんでもかえるとおもうのはまちがいだ。$$, $$É um erro achar que basta ter dinheiro para comprar tudo.$$),
    ('n3-grammar-100', $$あなたさえよければ、一緒に行きましょう。$$, $$あなたさえよければ、いっしょにいきましょう。$$, $$Se estiver tudo bem para você, vamos juntos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$君____いれば、何もいらない。$$, $$Basta você estar comigo, não preciso de mais nada.$$),
        (2, $$地図____あれば、一人で行ける。$$, $$Desde que eu tenha um mapa, consigo ir sozinho.$$),
        (3, $$毎日練習し____すれば、上手になる。$$, $$Basta praticar todo dia para melhorar.$$),
        (4, $$体____丈夫なら、どんな仕事もできる。$$, $$Desde que a saúde esteja boa, dá para fazer qualquer trabalho.$$),
        (5, $$雨____降らなければ、試合はできる。$$, $$Desde que não chova, dá para fazer a partida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さえ$$),
        (2, $$さえ$$),
        (3, $$さえ$$),
        (4, $$さえ$$),
        (5, $$さえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
