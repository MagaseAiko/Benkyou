-- n1-grammar-80 — 〜もので
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-80',
    'grammar',
    'N1',
    $$〜もので$$,
    $$mono de$$,
    $$É que / Porque / Como$$,
    $$もので serve para explicar um motivo, geralmente como desculpa ou justificativa educada. Equivale a "é que" ou "porque".

A pessoa explica por que fez ou não fez algo, pedindo compreensão. Por exemplo, "desculpe o atraso, é que o trem parou".

É parecido com ものだから, mas soa um pouco mais suave e educado. Na fala, aparece como もんで.$$,
    $$Depois de もので não se usam ordens nem pedidos diretos.

É muito usado para pedir desculpas, como 〜もので、すみません.$$,
    $$Verbo (forma simples) + もので
Adjetivo い + もので
Adjetivo な / Substantivo + な + もので$$,
    $$もので$$,
    $$もので|もんで$$,
    ARRAY['もの', 'で']::text[],
    ARRAY['もので', 'もんで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-80', $$電車が遅れたもので、遅刻してしまいました。$$, $$でんしゃがおくれたもので、ちこくしてしまいました。$$, $$É que o trem atrasou, então acabei chegando atrasado.$$),
    ('n1-grammar-80', $$初めてなもので、よくわかりません。$$, $$はじめてなもので、よくわかりません。$$, $$É que é a primeira vez, então não entendo bem.$$),
    ('n1-grammar-80', $$急いでいたもので、挨拶もせずにすみません。$$, $$いそいでいたもので、あいさつもせずにすみません。$$, $$Desculpe não ter cumprimentado, é que eu estava com pressa.$$),
    ('n1-grammar-80', $$子供が熱を出したもので、今日は休ませてください。$$, $$こどもがねつをだしたもので、きょうはやすませてください。$$, $$É que meu filho está com febre, então me deixe faltar hoje.$$),
    ('n1-grammar-80', $$田舎者なもんで、都会のことはよく知らないんです。$$, $$いなかものなもんで、とかいのことはよくしらないんです。$$, $$É que sou do interior, então não conheço bem a cidade grande.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道に迷った____、遅くなりました。$$, $$É que me perdi, então me atrasei.$$),
        (2, $$あまりに安かった____、つい買ってしまいました。$$, $$É que estava tão barato que acabei comprando.$$),
        (3, $$不慣れな____、ご迷惑をおかけしました。$$, $$É que não estou acostumado, desculpe o transtorno.$$),
        (4, $$知らなかった____、失礼しました。$$, $$É que eu não sabia, me desculpe.$$),
        (5, $$携帯の電池が切れた____、連絡できませんでした。$$, $$É que a bateria do celular acabou, então não consegui avisar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もので$$),
        (1, $$もんで$$),
        (2, $$もので$$),
        (2, $$もんで$$),
        (3, $$もので$$),
        (3, $$もんで$$),
        (4, $$もので$$),
        (4, $$もんで$$),
        (5, $$もので$$),
        (5, $$もんで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
