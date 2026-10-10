-- n1-grammar-228 — 〜とは打って変わって / 〜とは打って変わり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-228',
    'grammar',
    'N1',
    $$〜とは打って変わって / 〜とは打って変わり$$,
    $$to wa utte kawatte / to wa utte kawari$$,
    $$Completamente diferente de / Ao contrário de / Mudou totalmente$$,
    $$とは打って変わって indica que uma situação mudou de forma total e repentina, ficando oposta ao que era antes. Equivale a "completamente diferente de" ou "ao contrário de".

Por exemplo, "ao contrário de ontem, hoje está um dia lindo" ou "ele está completamente diferente de antes, muito animado".

É uma expressão um pouco formal.$$,
    $$Expressões comuns são 昨日とは打って変わって e 以前とは打って変わって.

Também é escrito とはうって変わって.$$,
    $$Substantivo + とは打って変わって / とは打って変わり$$,
    $$とは打って変わって$$,
    $$とは打って変わって|とは打って変わり|とはうって変わって|とはうってかわって|打って変わって$$,
    ARRAY['と', 'は', '打って', '変わって']::text[],
    ARRAY['とは打って変わって', 'とは打って変わり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-228', $$昨日の雨とは打って変わって、今日はいい天気だ。$$, $$きのうのあめとはうってかわって、きょうはいいてんきだ。$$, $$Ao contrário da chuva de ontem, hoje está um tempo ótimo.$$),
    ('n1-grammar-228', $$以前とは打って変わって、彼は明るくなった。$$, $$いぜんとはうってかわって、かれはあかるくなった。$$, $$Ele ficou animado, completamente diferente de antes.$$),
    ('n1-grammar-228', $$前半とは打って変わり、後半はいい試合になった。$$, $$ぜんはんとはうってかわり、こうはんはいいしあいになった。$$, $$Ao contrário do primeiro tempo, o segundo tempo foi um bom jogo.$$),
    ('n1-grammar-228', $$にぎやかな昼間とは打って変わって、夜の町は静かだ。$$, $$にぎやかなひるまとはうってかわって、よるのまちはしずかだ。$$, $$Ao contrário do dia movimentado, a cidade à noite é silenciosa.$$),
    ('n1-grammar-228', $$彼女は結婚してから、以前とは打って変わって家庭的になった。$$, $$かのじょはけっこんしてから、いぜんとはうってかわってかていてきになった。$$, $$Depois de casar, ela mudou totalmente e ficou caseira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先週の暑さ____、今週は涼しい。$$, $$Ao contrário do calor da semana passada, esta semana está fresca.$$),
        (2, $$去年の不調____、今年は好成績を残した。$$, $$Completamente diferente do mau momento do ano passado, este ano teve ótimos resultados.$$),
        (3, $$試験前の不安な顔____、彼は笑顔だった。$$, $$Ao contrário da cara preocupada antes da prova, ele estava sorrindo.$$),
        (4, $$昔____、この町は観光客でにぎわっている。$$, $$Completamente diferente de antigamente, esta cidade está cheia de turistas.$$),
        (5, $$朝の静けさ____、昼の駅は人でいっぱいだ。$$, $$Ao contrário do silêncio da manhã, a estação ao meio-dia está lotada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-228', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは打って変わって$$),
        (1, $$とは打って変わり$$),
        (2, $$とは打って変わって$$),
        (2, $$とは打って変わり$$),
        (3, $$とは打って変わって$$),
        (3, $$とは打って変わり$$),
        (4, $$とは打って変わって$$),
        (4, $$とは打って変わり$$),
        (5, $$とは打って変わって$$),
        (5, $$とは打って変わり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
