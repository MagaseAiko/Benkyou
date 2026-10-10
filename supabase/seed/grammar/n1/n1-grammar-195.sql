-- n1-grammar-195 — 〜と相まって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-195',
    'grammar',
    'N1',
    $$〜と相まって$$,
    $$to aimatte$$,
    $$Somado a / Combinado com / Junto com$$,
    $$と相まって indica que dois fatores se combinam e produzem um efeito maior. Equivale a "somado a" ou "combinado com".

Muitas vezes os dois fatores se reforçam, para o bem ou para o mal. Por exemplo, "o bom tempo, somado ao feriado, trouxe muitos turistas".

É uma expressão formal, comum em textos e notícias.$$,
    $$Também é escrito とあいまって.

A forma も相まって também é muito usada, como 天気も相まって.$$,
    $$Substantivo + と相まって
Substantivo + が + Substantivo + と相まって$$,
    $$と相まって$$,
    $$と相まって|も相まって|が相まって|とあいまって|があいまって$$,
    ARRAY['と', '相まって']::text[],
    ARRAY['と相まって', 'も相まって', 'が相まって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-195', $$好天と連休が相まって、観光地は大変なにぎわいだった。$$, $$こうてんとれんきゅうがあいまって、かんこうちはたいへんなにぎわいだった。$$, $$O bom tempo, somado ao feriado prolongado, deixou os pontos turísticos muito movimentados.$$),
    ('n1-grammar-195', $$彼の才能は努力と相まって、大きく花開いた。$$, $$かれのさいのうはどりょくとあいまって、おおきくはなひらいた。$$, $$O talento dele, combinado com o esforço, floresceu muito.$$),
    ('n1-grammar-195', $$美しい音楽と相まって、映画はさらに感動的になった。$$, $$うつくしいおんがくとあいまって、えいがはさらにかんどうてきになった。$$, $$Junto com a bela música, o filme ficou ainda mais emocionante.$$),
    ('n1-grammar-195', $$円安も相まって、外国人観光客が増えた。$$, $$えんやすもあいまって、がいこくじんかんこうきゃくがふえた。$$, $$Somado ao iene fraco, o número de turistas estrangeiros aumentou.$$),
    ('n1-grammar-195', $$疲れと寝不足が相まって、体調を崩した。$$, $$つかれとねぶそくがあいまって、たいちょうをくずした。$$, $$O cansaço, combinado com a falta de sono, me deixou doente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$景色の美しさ____、旅行は最高だった。$$, $$Somado à beleza da paisagem, a viagem foi excelente.$$),
        (2, $$新鮮な材料と料理人の腕____、絶品の料理ができた。$$, $$Ingredientes frescos, combinados com a habilidade do cozinheiro, resultaram num prato excelente.$$),
        (3, $$値段の安さ____、この商品はよく売れている。$$, $$Somado ao preço baixo, este produto está vendendo bem.$$),
        (4, $$不景気____、失業者が増えている。$$, $$Somado à recessão, o número de desempregados está aumentando.$$),
        (5, $$彼女の歌声は演奏____、観客を魅了した。$$, $$A voz dela, combinada com a música, encantou o público.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-195', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と相まって$$),
        (1, $$も相まって$$),
        (1, $$とあいまって$$),
        (2, $$が相まって$$),
        (3, $$と相まって$$),
        (3, $$も相まって$$),
        (3, $$とあいまって$$),
        (4, $$と相まって$$),
        (4, $$も相まって$$),
        (4, $$とあいまって$$),
        (5, $$と相まって$$),
        (5, $$とあいまって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
