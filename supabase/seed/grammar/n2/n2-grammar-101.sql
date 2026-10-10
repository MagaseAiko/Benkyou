-- n2-grammar-101 — 〜に先立ち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-101',
    'grammar',
    'N2',
    $$〜に先立ち$$,
    $$ni sakidachi$$,
    $$Antes de / Previamente a / Em preparação para$$,
    $$に先立ち indica que algo é feito antes de um acontecimento importante, como preparação. Equivale a "antes de" ou "previamente a".

É usado em situações formais, como eventos, lançamentos, cerimônias ou reuniões. Por exemplo, "antes do lançamento, foi feita uma apresentação para a imprensa".

A forma に先立って tem o mesmo sentido.$$,
    $$É mais formal que の前に e aparece muito em notícias e anúncios.

A forma に先立つ vem antes de substantivos, como 試合に先立つ練習.$$,
    $$Substantivo + に先立ち / に先立って
Verbo (forma dicionário) + に先立ち / に先立って
Substantivo + に先立つ + Substantivo$$,
    $$に先立ち$$,
    $$に先立ち|に先立って|に先立つ|にさきだち|にさきだって$$,
    ARRAY['に', '先立ち']::text[],
    ARRAY['に先立ち', 'に先立って', 'に先立つ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-101', $$新商品の発売に先立ち、記者会見が行われた。$$, $$しんしょうひんのはつばいにさきだち、きしゃかいけんがおこなわれた。$$, $$Antes do lançamento do novo produto, foi realizada uma coletiva de imprensa.$$),
    ('n2-grammar-101', $$試合に先立って、開会式が行われた。$$, $$しあいにさきだって、かいかいしきがおこなわれた。$$, $$Antes da partida, foi realizada a cerimônia de abertura.$$),
    ('n2-grammar-101', $$工事を始めるに先立ち、住民への説明会を開いた。$$, $$こうじをはじめるにさきだち、じゅうみんへのせつめいかいをひらいた。$$, $$Antes de começar a obra, fizemos uma reunião de esclarecimento para os moradores.$$),
    ('n2-grammar-101', $$出発に先立って、全員の荷物を確認した。$$, $$しゅっぱつにさきだって、ぜんいんのにもつをかくにんした。$$, $$Antes da partida, conferimos a bagagem de todos.$$),
    ('n2-grammar-101', $$映画の公開に先立ち、試写会が開かれた。$$, $$えいがのこうかいにさきだち、ししゃかいがひらかれた。$$, $$Antes da estreia do filme, houve uma sessão de pré-estreia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議____、資料を配った。$$, $$Antes da reunião, distribuímos os materiais.$$),
        (2, $$留学する____、ビザを取った。$$, $$Antes de estudar no exterior, tirei o visto.$$),
        (3, $$新店舗のオープン____、記念イベントを行う。$$, $$Antes da inauguração da nova loja, faremos um evento comemorativo.$$),
        (4, $$手術____、医師から説明を受けた。$$, $$Antes da cirurgia, recebi explicações do médico.$$),
        (5, $$選挙____、候補者の討論会が開かれた。$$, $$Antes da eleição, foi realizado um debate entre os candidatos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に先立ち$$),
        (1, $$に先立って$$),
        (1, $$にさきだち$$),
        (1, $$にさきだって$$),
        (2, $$に先立ち$$),
        (2, $$に先立って$$),
        (2, $$にさきだち$$),
        (2, $$にさきだって$$),
        (3, $$に先立ち$$),
        (3, $$に先立って$$),
        (3, $$にさきだち$$),
        (3, $$にさきだって$$),
        (4, $$に先立ち$$),
        (4, $$に先立って$$),
        (4, $$にさきだち$$),
        (4, $$にさきだって$$),
        (5, $$に先立ち$$),
        (5, $$に先立って$$),
        (5, $$にさきだち$$),
        (5, $$にさきだって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
