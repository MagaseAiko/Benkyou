-- n3-grammar-159 — 〜つもりで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-159',
    'grammar',
    'N3',
    $$〜つもりで$$,
    $$tsumori de$$,
    $$Como se / Com a ideia de / Fazendo de conta que$$,
    $$つもりで é usado para dizer que alguém faz algo imaginando estar em certa situação, ou com uma certa disposição mental. Equivale a "como se", "com a ideia de" ou "fazendo de conta que".

Com o verbo na forma た, a ideia é imaginar que algo já aconteceu. Por exemplo, "fazendo de conta que viajei, guardei o dinheiro" ou "explique como se você fosse o professor".

Com substantivos e の, a ideia é encarar algo com certa atitude: "faça este exercício como se fosse uma prova de verdade".

Com o verbo na forma de dicionário, indica uma disposição forte: "esforçando-se como se fosse morrer" (ou seja, dando tudo de si).

É muito usado em conselhos e incentivos.$$,
    $$A expressão 自分の家にいるつもりで ("como se estivesse em casa") é uma forma gentil de deixar a visita à vontade.

本番のつもりで ("como se fosse pra valer") é comum em treinos e ensaios.

Não confunda com つもりだった, que indica uma intenção passada que não se realizou.$$,
    $$Verbo na forma た + つもりで + Verbo (imaginando que já...)
Verbo na forma de dicionário + つもりで + Verbo (com a disposição de...)
Substantivo + の + つもりで + Verbo (encarando como...)$$,
    $$つもりで$$,
    $$つもりで$$,
    ARRAY['つもり', 'で']::text[],
    ARRAY['つもりで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-159', $$旅行に行ったつもりで、そのお金を貯金した。$$, $$りょこうにいったつもりで、そのおかねをちょきんした。$$, $$Fazendo de conta que tinha viajado, guardei esse dinheiro.$$),
    ('n3-grammar-159', $$死ぬつもりで頑張れば、何でもできる。$$, $$しぬつもりでがんばれば、なんでもできる。$$, $$Se você se esforçar dando tudo de si, consegue qualquer coisa.$$),
    ('n3-grammar-159', $$先生になったつもりで、説明してみてください。$$, $$せんせいになったつもりで、せつめいしてみてください。$$, $$Tente explicar como se você fosse o professor.$$),
    ('n3-grammar-159', $$遊びに行くつもりで、気軽に来てください。$$, $$あそびにいくつもりで、きがるにきてください。$$, $$Venha à vontade, como se fosse um passeio.$$),
    ('n3-grammar-159', $$試験のつもりで、この問題を解いてください。$$, $$しけんのつもりで、このもんだいをといてください。$$, $$Resolva estas questões como se fosse uma prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$本番の____、練習しましょう。$$, $$Vamos treinar como se fosse pra valer.$$),
        (2, $$外国人と話す____、日本語で話してみよう。$$, $$Vamos tentar falar em japonês como se estivéssemos conversando com um estrangeiro.$$),
        (3, $$その服を買ったつもり____、そのお金を貯金した。$$, $$Fazendo de conta que tinha comprado a roupa, guardei o dinheiro.$$),
        (4, $$自分の家にいる____、ゆっくりしてください。$$, $$Fique à vontade, como se estivesse em casa.$$),
        (5, $$社長になった____、この問題を考えてみてください。$$, $$Tente pensar neste problema como se você fosse o presidente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもりで$$),
        (2, $$つもりで$$),
        (3, $$で$$),
        (4, $$つもりで$$),
        (5, $$つもりで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
