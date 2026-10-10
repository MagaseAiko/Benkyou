-- n4-grammar-61 — 〜の中で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-61',
    'grammar',
    'N4',
    $$〜の中で$$,
    $$no naka de$$,
    $$Dentro de / Entre / Em meio a$$,
    $$の中で significa literalmente "dentro de". No N4, ele aparece com dois usos principais.

O primeiro é físico: indica o lugar fechado ou o ambiente onde uma ação acontece, como dentro de uma caixa, dentro do carro ou no meio da chuva.

O segundo é delimitar um grupo ou um conjunto, com o sentido de "entre". Ele mostra o grupo dentro do qual se faz uma comparação ou uma observação, como "entre os livros que já li" ou "na minha família".

No segundo uso, ele aparece muito com 一番 e だけ, para destacar um elemento do grupo.

Também pode indicar uma situação ou circunstância ampla, como "em meio a um dia a dia corrido".$$,
    $$Para indicar apenas que algo está dentro de um lugar, sem ação, usa-se の中に com ある ou いる. の中で é para ações.

Com adjetivos de situação, como em 寒い中, não se usa の: a palavra 中 vem direto depois do adjetivo.

Lido ちゅう ou じゅう, o mesmo kanji 中 forma outras expressões, como 授業中 (durante a aula) e 一日中 (o dia inteiro).$$,
    $$Substantivo (lugar / espaço) + の中で + Verbo
Substantivo (grupo) + の中で + [A] + が + 一番 / だけ
Frase + Substantivo + の中で (entre os... que...)

Escrita: の中で / のなかで$$,
    $$の中で$$,
    $$の中で|のなかで$$,
    ARRAY['の', '中', 'で']::text[],
    ARRAY['の中で', 'のなかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-61', $$箱の中で猫が寝ています。$$, $$はこのなかでねこがねています。$$, $$O gato está dormindo dentro da caixa.$$),
    ('n4-grammar-61', $$家族の中で、私だけが眼鏡をかけています。$$, $$かぞくのなかで、わたしだけがめがねをかけています。$$, $$Na minha família, só eu uso óculos.$$),
    ('n4-grammar-61', $$忙しい毎日の中で、音楽が私の楽しみです。$$, $$いそがしいまいにちのなかで、おんがくがわたしのたのしみです。$$, $$Em meio ao dia a dia corrido, a música é a minha alegria.$$),
    ('n4-grammar-61', $$雨の中で、子供たちが遊んでいる。$$, $$あめのなかで、こどもたちがあそんでいる。$$, $$As crianças estão brincando debaixo da chuva.$$),
    ('n4-grammar-61', $$今まで読んだ本の中で、これが一番おもしろかった。$$, $$いままでよんだほんのなかで、これがいちばんおもしろかった。$$, $$De todos os livros que já li, este foi o mais interessante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車____音楽を聞きました。$$, $$Ouvi música dentro do carro.$$),
        (2, $$クラス____、彼だけが日本へ行ったことがある。$$, $$Na turma, só ele já foi ao Japão.$$),
        (3, $$雪____、二時間も待ちました。$$, $$Esperei duas horas inteiras debaixo da neve.$$),
        (4, $$私が知っている人____、一番優しいのは祖母です。$$, $$Entre as pessoas que conheço, a mais gentil é minha avó.$$),
        (5, $$森____、珍しい鳥を見つけました。$$, $$Encontrei um pássaro raro dentro da floresta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の中で$$),
        (1, $$のなかで$$),
        (2, $$の中で$$),
        (2, $$のなかで$$),
        (3, $$の中で$$),
        (3, $$のなかで$$),
        (4, $$の中で$$),
        (4, $$のなかで$$),
        (5, $$の中で$$),
        (5, $$のなかで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
