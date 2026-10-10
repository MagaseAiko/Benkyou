-- n4-grammar-63 — 〜のに（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-63',
    'grammar',
    'N4',
    $$〜のに（目的）$$,
    $$noni (mokuteki)$$,
    $$Para / Para fazer$$,
    $$のに também pode indicar finalidade ou uso. Nesse caso, equivale a "para" ou "para fazer".

A estrutura junta o verbo na forma de dicionário com のに. O の transforma a ação em substantivo, e に indica o objetivo.

Esse uso aparece principalmente com algumas palavras específicas: 使う (usar), かかる (levar tempo ou custar), 必要 (necessário), 便利 (prático) e いい (bom).

Por exemplo, "uma tesoura usada para cortar papel", "leva trinta minutos para ir até a estação", "é preciso dinheiro para comprar uma casa".

A diferença em relação a ために é o alcance: のに é mais restrito e aparece com esse grupo de expressões. ために expressa um objetivo de forma mais ampla.$$,
    $$Com substantivos, a mesma ideia é expressa com に: 料理に使う (usar na cozinha).

A melhor forma de distinguir as duas のに é olhar o que vem depois. Se for かかる, 使う, 必要 ou 便利, é finalidade. Se vier um resultado inesperado, é contraste.

Em perguntas como "quanto tempo leva para...", のに é a escolha mais natural.$$,
    $$Verbo na forma de dicionário + のに + 使う
Verbo na forma de dicionário + のに + Tempo / Dinheiro + かかる
Verbo na forma de dicionário + のに + 必要だ / 便利だ / いい$$,
    $$のに$$,
    $$のに$$,
    ARRAY['の', 'に']::text[],
    ARRAY['のに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-63', $$このはさみは紙を切るのに使います。$$, $$このはさみはかみをきるのにつかいます。$$, $$Esta tesoura é usada para cortar papel.$$),
    ('n4-grammar-63', $$家から駅まで行くのに三十分かかります。$$, $$いえからえきまでいくのにさんじゅっぷんかかります。$$, $$Leva trinta minutos para ir de casa até a estação.$$),
    ('n4-grammar-63', $$家を買うのにたくさんお金が必要だ。$$, $$いえをかうのにたくさんおかねがひつようだ。$$, $$É preciso muito dinheiro para comprar uma casa.$$),
    ('n4-grammar-63', $$この箱は本を入れるのにちょうどいい。$$, $$このはこはほんをいれるのにちょうどいい。$$, $$Esta caixa é perfeita para guardar livros.$$),
    ('n4-grammar-63', $$このレポートを書くのに一週間かかりました。$$, $$このレポートをかくのにいっしゅうかんかかりました。$$, $$Levei uma semana para escrever este relatório.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋を掃除する____二時間かかった。$$, $$Levei duas horas para limpar este quarto.$$),
        (2, $$このかばんは旅行する____便利です。$$, $$Esta bolsa é prática para viajar.$$),
        (3, $$漢字を覚える____、このアプリを使っています。$$, $$Estou usando este aplicativo para decorar kanji.$$),
        (4, $$おいしい料理を作る____、この包丁が必要です。$$, $$Para fazer uma comida gostosa, esta faca é necessária.$$),
        (5, $$日本語が話せるようになる____何年かかりますか。$$, $$Quantos anos leva para conseguir falar japonês?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のに$$),
        (2, $$のに$$),
        (3, $$のに$$),
        (4, $$のに$$),
        (5, $$のに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
