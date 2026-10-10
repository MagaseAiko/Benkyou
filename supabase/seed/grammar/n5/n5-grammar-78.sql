-- n5-grammar-78 — や
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-78',
    'grammar',
    'N5',
    $$や$$,
    $$ya$$,
    $$E (entre outros) / Como... e...$$,
    $$や é usado para listar substantivos como exemplos, deixando claro que existem outras coisas além das mencionadas. Equivale a "e" com a ideia de "entre outros".

Essa é a grande diferença em relação a と. Com と, a lista é completa. Com や, a lista é parcial: são só alguns exemplos.

や costuma aparecer junto com など no final da lista, que reforça a ideia de "e outras coisas", "etc.".

Assim como と, や liga apenas substantivos. Para listar ações como exemplos, usa-se たり〜たりする.$$,
    $$Na fala, também é comum usar とか no lugar de や, com um tom mais casual.

Quando se usa や, o ouvinte entende automaticamente que há mais coisas. Por isso, ele é ótimo para descrições gerais, como o que tem em um lugar ou o que se costuma fazer.

や liga substantivos, mas não verbos nem adjetivos.$$,
    $$Substantivo A + や + Substantivo B
Substantivo A + や + Substantivo B + など
Substantivo A + や + Substantivo B + など + partícula$$,
    $$や$$,
    $$や$$,
    ARRAY['や']::text[],
    ARRAY['や']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-78', $$かばんの中に本やノートがあります。$$, $$かばんのなかにほんやノートがあります。$$, $$Na bolsa tem livros, cadernos e outras coisas.$$),
    ('n5-grammar-78', $$週末は掃除や洗濯をします。$$, $$しゅうまつはそうじやせんたくをします。$$, $$No fim de semana, faço coisas como limpar a casa e lavar roupa.$$),
    ('n5-grammar-78', $$机の上にペンや鉛筆などがあります。$$, $$つくえのうえにペンやえんぴつなどがあります。$$, $$Em cima da mesa tem canetas, lápis e outras coisas.$$),
    ('n5-grammar-78', $$旅行で京都や奈良に行きました。$$, $$りょこうできょうとやならにいきました。$$, $$Na viagem, fui a lugares como Kyoto e Nara.$$),
    ('n5-grammar-78', $$私はりんごやみかんなど、果物が好きです。$$, $$わたしはりんごやみかんなど、くだものがすきです。$$, $$Eu gosto de frutas, como maçã e mexerica.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に肉____野菜などがあります。$$, $$Na geladeira tem carne, verduras e outras coisas.$$),
        (2, $$公園に子供____犬などがいました。$$, $$No parque tinha crianças, cachorros e outros.$$),
        (3, $$パーティーで、すし____てんぷらなどを食べました。$$, $$Na festa, comemos sushi, tempurá e outras coisas.$$),
        (4, $$机の上に本____雑誌などが置いてあります。$$, $$Em cima da mesa há livros, revistas e outras coisas.$$),
        (5, $$夏休みに、北海道____沖縄などへ行きたいです。$$, $$Nas férias de verão, quero ir a lugares como Hokkaido e Okinawa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$や$$),
        (2, $$や$$),
        (3, $$や$$),
        (4, $$や$$),
        (5, $$や$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
