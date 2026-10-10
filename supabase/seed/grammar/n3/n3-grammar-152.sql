-- n3-grammar-152 — とても〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-152',
    'grammar',
    'N3',
    $$とても〜ない$$,
    $$totemo ~ nai$$,
    $$De jeito nenhum / Impossível / Não dá para$$,
    $$Quando とても aparece com uma forma negativa, especialmente com verbos potenciais, ele não significa "muito", e sim "de jeito nenhum" ou "é impossível". Equivale a "não dá para... de jeito nenhum".

A ideia é que algo está tão além da capacidade ou da realidade que não há a menor chance. Por exemplo, "tanto trabalho assim não dá para terminar em um dia, de jeito nenhum" ou "não consigo acreditar na história dele de jeito nenhum".

O verbo costuma estar na forma potencial negativa, como 終わらない, 解けない, 信じられない e 買えない. Também é comum com 無理だ (impossível).

Esse uso é diferente de とても no N5, que intensifica adjetivos em frases afirmativas.$$,
    $$O contexto é importante: とても大きい significa "muito grande", mas とても食べられない significa "não dá para comer de jeito nenhum".

Esse uso soa um pouco mais formal e expressivo que 全然〜ない.

É comum para recusar algo com educação, mostrando que é realmente impossível: そんな大役はとても務まりません.$$,
    $$とても + Verbo potencial negativo (できない / 買えない / 信じられない)
とても + 無理だ
とても + Verbo negativo (終わらない)$$,
    $$とても$$,
    $$とても$$,
    ARRAY['とても', 'ない']::text[],
    ARRAY['とても〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-152', $$こんなにたくさんの仕事は、一日ではとても終わらない。$$, $$こんなにたくさんのしごとは、いちにちではとてもおわらない。$$, $$Tanto trabalho assim não dá para terminar em um dia, de jeito nenhum.$$),
    ('n3-grammar-152', $$この問題は難しくて、とても解けない。$$, $$このもんだいはむずかしくて、とてもとけない。$$, $$Esta questão é difícil demais, não consigo resolver de jeito nenhum.$$),
    ('n3-grammar-152', $$彼の話はとても信じられない。$$, $$かれのはなしはとてもしんじられない。$$, $$Não consigo acreditar na história dele de jeito nenhum.$$),
    ('n3-grammar-152', $$この値段では、とても買えません。$$, $$このねだんでは、とてもかえません。$$, $$Com esse preço, é impossível comprar.$$),
    ('n3-grammar-152', $$一人でこの荷物を運ぶのは、とても無理だ。$$, $$ひとりでこのにもつをはこぶのは、とてもむりだ。$$, $$Carregar esta bagagem sozinho é totalmente impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなに高い車は、____買えない。$$, $$Um carro tão caro assim, não dá para comprar de jeito nenhum.$$),
        (2, $$この量は一人では____食べられない。$$, $$Esta quantidade, sozinho, é impossível de comer.$$),
        (3, $$あの正直な彼がうそをついたなんて、____思えない。$$, $$Não consigo imaginar de jeito nenhum que ele, tão honesto, tenha mentido.$$),
        (4, $$勉強していないから、こんな難しい試験には____合格できない。$$, $$Não estudei, então não tem como passar numa prova tão difícil.$$),
        (5, $$今日中に全部終わらせるのは____無理です。$$, $$Terminar tudo ainda hoje é totalmente impossível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とても$$),
        (2, $$とても$$),
        (3, $$とても$$),
        (4, $$とても$$),
        (5, $$とても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
