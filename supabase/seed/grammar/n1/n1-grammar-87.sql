-- n1-grammar-87 — 〜んがために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-87',
    'grammar',
    'N1',
    $$〜んがために$$,
    $$n ga tame ni$$,
    $$Com o único propósito de / Só para / A fim de$$,
    $$んがために indica um objetivo forte e determinado. Equivale a "com o único propósito de" ou "a fim de".

A pessoa mostra que fez algo, muitas vezes difícil ou extremo, apenas para alcançar aquele objetivo. Por exemplo, "mentiu só para vencer".

É uma forma antiga e muito formal de ために, usada na escrita.$$,
    $$Atenção à forma de する, que vira せんがために.

Expressões comuns são 勝たんがために, 生きんがために e 知らんがために.$$,
    $$Verbo (forma ない sem ない) + んがために
Verbo (forma ない sem ない) + んがための + Substantivo
する → せんがために$$,
    $$んがために$$,
    $$んがために|んがための|んがため$$,
    ARRAY['ん', 'が', 'ために']::text[],
    ARRAY['んがために', 'んがための', 'んがため']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-87', $$勝たんがために、彼はうそをついた。$$, $$かたんがために、かれはうそをついた。$$, $$Ele mentiu só para vencer.$$),
    ('n1-grammar-87', $$生きんがために、必死で働いた。$$, $$いきんがために、ひっしではたらいた。$$, $$Trabalhou desesperadamente só para sobreviver.$$),
    ('n1-grammar-87', $$真実を知らんがために、彼は調査を続けた。$$, $$しんじつをしらんがために、かれはちょうさをつづけた。$$, $$Ele continuou a investigação com o único propósito de saber a verdade.$$),
    ('n1-grammar-87', $$夢を実現せんがために、海外へ渡った。$$, $$ゆめをじつげんせんがために、かいがいへわたった。$$, $$Foi para o exterior com o único propósito de realizar seu sonho.$$),
    ('n1-grammar-87', $$合格せんがための努力は、決して無駄ではない。$$, $$ごうかくせんがためのどりょくは、けっしてむだではない。$$, $$O esforço feito com o objetivo de passar nunca é em vão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族を守ら____、彼はすべてを捨てた。$$, $$Ele abandonou tudo só para proteger a família.$$),
        (2, $$目的を達成せ____、手段を選ばなかった。$$, $$Para alcançar o objetivo, não mediu meios.$$),
        (3, $$注目を集め____、彼は派手な服を着た。$$, $$Ele usou roupas chamativas só para chamar a atenção.$$),
        (4, $$記録を破ら____、毎日練習した。$$, $$Treinou todos os dias com o único propósito de quebrar o recorde.$$),
        (5, $$売ら____宣伝ばかりで、中身がない。$$, $$É só propaganda para vender, sem conteúdo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んがために$$),
        (1, $$んがため$$),
        (2, $$んがために$$),
        (2, $$んがため$$),
        (3, $$んがために$$),
        (3, $$んがため$$),
        (4, $$んがために$$),
        (4, $$んがため$$),
        (5, $$んがための$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
