-- n1-grammar-154 — 〜をもって / 〜をもちまして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-154',
    'grammar',
    'N1',
    $$〜をもって / 〜をもちまして$$,
    $$wo motte / wo mochimashite$$,
    $$Com / Por meio de / A partir de$$,
    $$をもって tem dois usos principais.

O primeiro indica o meio ou o método usado para fazer algo. Equivale a "com" ou "por meio de". Por exemplo, "informaremos o resultado por escrito".

O segundo indica o momento em que algo começa ou termina. Equivale a "com" ou "a partir de". Por exemplo, "com o dia de hoje, encerramos as inscrições".

をもちまして é a forma ainda mais educada, usada em anúncios e cerimônias.$$,
    $$Expressões comuns são 本日をもって, 書面をもって, 身をもって e 以上をもちまして.

É bem mais formal que で.$$,
    $$Substantivo (meio) + をもって + Verbo
Substantivo (tempo) + をもって / をもちまして + 終了する / 締め切る$$,
    $$をもって$$,
    $$をもって|をもちまして|を以て$$,
    ARRAY['を', 'もって']::text[],
    ARRAY['をもって', 'をもちまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-154', $$本日をもって、受付を終了いたします。$$, $$ほんじつをもって、うけつけをしゅうりょういたします。$$, $$Com o dia de hoje, encerramos as inscrições.$$),
    ('n1-grammar-154', $$結果は書面をもってお知らせします。$$, $$けっかはしょめんをもっておしらせします。$$, $$Informaremos o resultado por escrito.$$),
    ('n1-grammar-154', $$以上をもちまして、本日の会議を終わります。$$, $$いじょうをもちまして、ほんじつのかいぎをおわります。$$, $$Com isso, encerramos a reunião de hoje.$$),
    ('n1-grammar-154', $$彼は身をもって、平和の大切さを示した。$$, $$かれはみをもって、へいわのたいせつさをしめした。$$, $$Ele mostrou na própria pele a importância da paz.$$),
    ('n1-grammar-154', $$三月末をもって、退職することになりました。$$, $$さんがつまつをもって、たいしょくすることになりました。$$, $$Vou me aposentar a partir do fim de março.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$これ____、式を終了いたします。$$, $$Com isto, encerramos a cerimônia.$$),
        (2, $$誠意____対応いたします。$$, $$Atenderemos com sinceridade.$$),
        (3, $$今月末____、この店は閉店します。$$, $$Esta loja fechará com o fim deste mês.$$),
        (4, $$身____経験したことは忘れない。$$, $$O que se viveu na própria pele não se esquece.$$),
        (5, $$以上____、私の発表を終わります。$$, $$Com isso, encerro a minha apresentação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をもって$$),
        (1, $$をもちまして$$),
        (2, $$をもって$$),
        (3, $$をもって$$),
        (3, $$をもちまして$$),
        (4, $$をもって$$),
        (5, $$をもって$$),
        (5, $$をもちまして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
