-- n4-grammar-44 — 〜みたいだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-44',
    'grammar',
    'N4',
    $$〜みたいだ$$,
    $$mitai da$$,
    $$Parece que / Parece / Como se fosse$$,
    $$みたいだ tem dois usos principais e é a forma falada e casual de ようだ.

O primeiro é fazer uma suposição baseada no que você vê, ouve ou percebe. Equivale a "parece que". Por exemplo, ver o chão molhado e concluir que choveu.

O segundo é fazer uma comparação, dizendo que algo se parece com outra coisa, mesmo não sendo. Equivale a "parece" ou "como se fosse". Por exemplo, dizer que uma situação parece um sonho.

みたい funciona como um adjetivo な. Ele vem diretamente depois de substantivos (sem の) e depois da forma simples de verbos e adjetivos.

Na fala, é muito comum usar só みたい no final da frase, sem だ.$$,
    $$みたいだ é casual. Em textos e situações formais, prefere-se ようだ, que tem o mesmo sentido.

Diferente de ようだ, みたい se liga diretamente ao substantivo, sem の: 夢みたい, e não 夢のみたい.

Para reforçar a comparação, usa-se まるで antes, como em "parece até...".$$,
    $$Verbo (forma simples) + みたいだ
Adjetivo い + みたいだ
Adjetivo な (sem な) + みたいだ
Substantivo + みたいだ

Educado: みたいです
Fala casual: みたい$$,
    $$みたいだ$$,
    $$みたいだ|みたいです|みたい$$,
    ARRAY['みたい', 'だ']::text[],
    ARRAY['みたいだ', 'みたいです', 'みたい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-44', $$道が濡れている。外は雨みたいだ。$$, $$みちがぬれている。そとはあめみたいだ。$$, $$A rua está molhada. Parece que está chovendo lá fora.$$),
    ('n4-grammar-44', $$田中さんは今日休みみたいです。$$, $$たなかさんはきょうやすみみたいです。$$, $$Parece que o Tanaka está de folga hoje.$$),
    ('n4-grammar-44', $$彼女はもう帰ったみたい。$$, $$かのじょはもうかえったみたい。$$, $$Parece que ela já foi embora.$$),
    ('n4-grammar-44', $$この部屋、誰もいないみたいだね。$$, $$このへや、だれもいないみたいだね。$$, $$Parece que não tem ninguém neste quarto, né?$$),
    ('n4-grammar-44', $$こんなにいい天気、夢みたいだ。$$, $$こんなにいいてんき、ゆめみたいだ。$$, $$Um tempo tão bom assim parece um sonho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が濡れている。昨日の夜、雨が降った____。$$, $$A rua está molhada. Parece que choveu ontem à noite.$$),
        (2, $$彼は風邪をひいている____です。$$, $$Parece que ele está resfriado.$$),
        (3, $$山田さんはお酒が好き____。$$, $$Parece que o Yamada gosta de bebida.$$),
        (4, $$この店、今日は休み____ですね。$$, $$Parece que esta loja está fechada hoje, né?$$),
        (5, $$そんなことで泣くなんて、まるで子供____。$$, $$Chorar por uma coisa dessas? Parece até uma criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいだ$$),
        (1, $$みたいです$$),
        (2, $$みたい$$),
        (3, $$みたいだ$$),
        (3, $$みたいです$$),
        (3, $$みたい$$),
        (4, $$みたい$$),
        (5, $$みたいだ$$),
        (5, $$みたい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
