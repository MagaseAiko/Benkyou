-- n5-grammar-76 — 〜は〜より〜です
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-76',
    'grammar',
    'N5',
    $$〜は〜より〜です$$,
    $$wa ~ yori ~ desu$$,
    $$A é mais... do que B$$,
    $$Essa estrutura é usada para comparar duas coisas, dizendo que uma tem mais de certa característica do que a outra. Equivale a "A é mais... do que B".

O primeiro elemento, marcado com は, é o tema: aquilo sobre o que se fala. O segundo, marcado com より, é o ponto de comparação, ou seja, o "do que".

Um detalhe importante: o japonês não precisa de uma palavra para "mais". O próprio より já indica a comparação. Basta colocar o adjetivo depois.

Para reforçar a diferença, usa-se ずっと (muito mais) ou もっと (ainda mais) antes do adjetivo.$$,
    $$Diferente do português, o adjetivo não muda: o mesmo adjetivo que significa "grande" serve para "maior", porque a comparação fica a cargo de より.

A ordem pode parecer estranha no começo, porque "do que B" vem antes do adjetivo. Pensar em "A, comparado a B, é grande" ajuda a acostumar.

Quando a pergunta é "qual é mais...?", a resposta natural usa ほうが, e não esta estrutura.$$,
    $$A + は + B + より + Adjetivo + です
A + は + B + より + Advérbio + Verbo
A + は + B + より + ずっと / もっと + Adjetivo + です$$,
    $$より$$,
    $$より$$,
    ARRAY['は', 'より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-76', $$東京は大阪より大きいです。$$, $$とうきょうはおおさかよりおおきいです。$$, $$Tóquio é maior do que Osaka.$$),
    ('n5-grammar-76', $$今日は昨日より暖かいです。$$, $$きょうはきのうよりあたたかいです。$$, $$Hoje está mais quente do que ontem.$$),
    ('n5-grammar-76', $$電車はバスより速いです。$$, $$でんしゃはバスよりはやいです。$$, $$O trem é mais rápido do que o ônibus.$$),
    ('n5-grammar-76', $$兄は私よりずっと背が高いです。$$, $$あにはわたしよりずっとせがたかいです。$$, $$Meu irmão mais velho é muito mais alto do que eu.$$),
    ('n5-grammar-76', $$妹は私より上手に料理を作ります。$$, $$いもうとはわたしよりじょうずにりょうりをつくります。$$, $$Minha irmã mais nova cozinha melhor do que eu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏は冬____暑いです。$$, $$O verão é mais quente do que o inverno.$$),
        (2, $$この本はあの本____おもしろいです。$$, $$Este livro é mais interessante do que aquele.$$),
        (3, $$飛行機は新幹線____速いです。$$, $$O avião é mais rápido do que o trem-bala.$$),
        (4, $$田中さんは山田さん____若いです。$$, $$O Tanaka é mais novo do que o Yamada.$$),
        (5, $$この犬はあの猫____ずっと大きいです。$$, $$Este cachorro é muito maior do que aquele gato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
