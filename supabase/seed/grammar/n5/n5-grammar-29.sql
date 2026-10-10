-- n5-grammar-29 — まで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-29',
    'grammar',
    'N5',
    $$まで$$,
    $$made$$,
    $$Até / Até que$$,
    $$まで indica o limite final de algo, seja de lugar, de tempo ou de ação. Equivale a "até".

Depois de um lugar, mostra até onde se vai. Depois de um horário ou data, mostra até quando algo continua.

Depois de um verbo na forma de dicionário, まで significa "até que": a primeira ação continua acontecendo até o momento em que a segunda acontece.

É muito comum usar まで junto com から, formando a ideia de "de... até...", tanto para lugares quanto para horários.

Um ponto importante: まで indica que a ação continua o tempo todo até aquele limite. Para dizer "até tal hora" no sentido de prazo, ou seja, fazer algo antes daquele momento, usa-se までに, que é outra gramática.$$,
    $$A diferença entre まで e までに é um erro clássico. まで fala de algo contínuo até o limite; までに fala de um prazo final.

まで também pode significar "até mesmo" depois de substantivos, mostrando que algo vai além do esperado. Esse uso aparece mais em níveis seguintes.

Em horários de funcionamento, a forma 〜までです é uma maneira natural de dizer até quando algo fica aberto ou acontece.$$,
    $$Substantivo (lugar) + まで
Substantivo (tempo) + まで
Verbo na forma de dicionário + まで (até que)
Substantivo + から + Substantivo + まで$$,
    $$まで$$,
    $$まで$$,
    ARRAY['まで']::text[],
    ARRAY['まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-29', $$駅まで歩きます。$$, $$えきまであるきます。$$, $$Vou a pé até a estação.$$),
    ('n5-grammar-29', $$この店は夜十時までです。$$, $$このみせはよるじゅうじまでです。$$, $$Esta loja funciona até as dez da noite.$$),
    ('n5-grammar-29', $$昨日は夜遅くまで勉強しました。$$, $$きのうはよるおそくまでべんきょうしました。$$, $$Ontem estudei até tarde da noite.$$),
    ('n5-grammar-29', $$東京から大阪まで新幹線で行きました。$$, $$とうきょうからおおさかまでしんかんせんでいきました。$$, $$Fui de Tóquio até Osaka de trem-bala.$$),
    ('n5-grammar-29', $$バスが来るまで、ここで待ちましょう。$$, $$バスがくるまで、ここでまちましょう。$$, $$Vamos esperar aqui até o ônibus chegar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日、五時____働きます。$$, $$Todo dia, trabalho até as cinco.$$),
        (2, $$空港____タクシーで行きました。$$, $$Fui de táxi até o aeroporto.$$),
        (3, $$夏休みは八月三十一日____です。$$, $$As férias de verão vão até 31 de agosto.$$),
        (4, $$雨がやむ____、ここにいましょう。$$, $$Vamos ficar aqui até a chuva parar.$$),
        (5, $$この本を最後____読んでください。$$, $$Leia este livro até o final, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まで$$),
        (2, $$まで$$),
        (3, $$まで$$),
        (4, $$まで$$),
        (5, $$まで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
