-- n3-grammar-37 — 〜から〜にかけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-37',
    'grammar',
    'N3',
    $$〜から〜にかけて$$,
    $$kara ~ ni kakete$$,
    $$De... até... (aproximadamente) / Entre... e...$$,
    $$から〜にかけて é usado para indicar um intervalo de tempo ou de espaço de forma aproximada. Equivale a "de... até..." ou "entre... e...".

A diferença em relação a から〜まで é a precisão. から〜まで marca um começo e um fim exatos. から〜にかけて indica uma faixa mais ampla e aproximada, sem limites rígidos.

Por isso, ele é muito usado em previsões do tempo ("de hoje à noite até amanhã"), estações do ano ("de março a abril"), regiões geográficas ("da região de Kanto até Tohoku") e partes do corpo ("do pescoço aos ombros").

O que acontece nesse intervalo é descrito de forma geral, como algo que se espalha por toda aquela faixa.$$,
    $$Em previsões do tempo, essa estrutura aparece praticamente todos os dias.

Também existe a forma にかけて sozinha, com um único ponto, como 週末にかけて ("até o fim de semana").

Não confunda com にかけては, do N2, que significa "quando se trata de" (habilidade).$$,
    $$Tempo A + から + Tempo B + にかけて
Lugar A + から + Lugar B + にかけて
Parte do corpo A + から + Parte do corpo B + にかけて$$,
    $$にかけて$$,
    $$にかけて$$,
    ARRAY['から', 'に', 'かけて']::text[],
    ARRAY['にかけて', 'から〜にかけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-37', $$今夜から明日にかけて、雨が降るでしょう。$$, $$こんやからあしたにかけて、あめがふるでしょう。$$, $$De hoje à noite até amanhã, deve chover.$$),
    ('n3-grammar-37', $$三月から四月にかけて、桜が咲きます。$$, $$さんがつからしがつにかけて、さくらがさきます。$$, $$As cerejeiras florescem entre março e abril.$$),
    ('n3-grammar-37', $$関東から東北にかけて、大雪になった。$$, $$かんとうからとうほくにかけて、おおゆきになった。$$, $$Nevou muito da região de Kanto até Tohoku.$$),
    ('n3-grammar-37', $$この店は昼から夕方にかけて、とても混む。$$, $$このみせはひるからゆうがたにかけて、とてもこむ。$$, $$Esta loja fica muito cheia entre o meio-dia e o fim da tarde.$$),
    ('n3-grammar-37', $$首から肩にかけて痛い。$$, $$くびからかたにかけていたい。$$, $$Estou com dor do pescoço até os ombros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$十二月から二月____、寒い日が続く。$$, $$Entre dezembro e fevereiro, os dias frios continuam.$$),
        (2, $$九州から四国____、台風が通過した。$$, $$O tufão passou de Kyushu até Shikoku.$$),
        (3, $$夜から朝____、強い風が吹いた。$$, $$Da noite até a manhã, soprou um vento forte.$$),
        (4, $$日本では、六月から七月____梅雨の季節です。$$, $$No Japão, de junho a julho é a estação das chuvas.$$),
        (5, $$背中から腰____痛みがある。$$, $$Tenho dor das costas até a cintura.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけて$$),
        (2, $$にかけて$$),
        (3, $$にかけて$$),
        (4, $$にかけて$$),
        (5, $$にかけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
