-- n1-grammar-144 — 〜を経て
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-144',
    'grammar',
    'N1',
    $$〜を経て$$,
    $$wo hete$$,
    $$Depois de passar por / Através de / Após$$,
    $$を経て indica que algo chegou a um resultado depois de passar por uma etapa, um lugar ou um período. Equivale a "depois de passar por" ou "após".

Pode se referir a um caminho físico, como "chegar a Paris passando por Londres", ou a um processo, como "depois de várias provas, foi contratado".

É uma expressão formal.$$,
    $$É parecido com を通って e の後で, mas を経て destaca o processo ou a etapa necessária.

Costuma vir com palavras como 審査, 試験, 議論, 年月 e 段階.$$,
    $$Substantivo (lugar / etapa / período) + を経て$$,
    $$を経て$$,
    $$を経て|をへて|を経た$$,
    ARRAY['を', '経て']::text[],
    ARRAY['を経て', 'を経た']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-144', $$この飛行機はソウルを経て、東京に向かう。$$, $$このひこうきはソウルをへて、とうきょうにむかう。$$, $$Este avião vai para Tóquio passando por Seul.$$),
    ('n1-grammar-144', $$三回の面接を経て、採用が決まった。$$, $$さんかいのめんせつをへて、さいようがきまった。$$, $$Depois de passar por três entrevistas, fui contratado.$$),
    ('n1-grammar-144', $$十年の歳月を経て、橋が完成した。$$, $$じゅうねんのさいげつをへて、はしがかんせいした。$$, $$Após dez anos, a ponte ficou pronta.$$),
    ('n1-grammar-144', $$長い議論を経て、法律が成立した。$$, $$ながいぎろんをへて、ほうりつがせいりつした。$$, $$Depois de uma longa discussão, a lei foi aprovada.$$),
    ('n1-grammar-144', $$厳しい審査を経た商品だけが販売される。$$, $$きびしいしんさをへたしょうひんだけがはんばいされる。$$, $$Só são vendidos os produtos que passaram por uma avaliação rigorosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大阪____、福岡に行く。$$, $$Vou a Fukuoka passando por Osaka.$$),
        (2, $$多くの困難____、夢を実現した。$$, $$Depois de passar por muitas dificuldades, realizou o sonho.$$),
        (3, $$試験と面接____、入学が許可された。$$, $$Após prova e entrevista, a matrícula foi aprovada.$$),
        (4, $$数年の研究____、新しい薬が開発された。$$, $$Após anos de pesquisa, foi desenvolvido um novo remédio.$$),
        (5, $$会議での承認____、計画が実行される。$$, $$Depois da aprovação na reunião, o plano será executado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を経て$$),
        (1, $$をへて$$),
        (2, $$を経て$$),
        (2, $$をへて$$),
        (3, $$を経て$$),
        (3, $$をへて$$),
        (4, $$を経て$$),
        (4, $$をへて$$),
        (5, $$を経て$$),
        (5, $$をへて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
