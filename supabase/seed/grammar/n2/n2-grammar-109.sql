-- n2-grammar-109 — 〜に伴って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-109',
    'grammar',
    'N2',
    $$〜に伴って$$,
    $$ni tomonatte$$,
    $$Junto com / À medida que / Com$$,
    $$に伴って indica que uma mudança acontece junto com outra. Equivale a "junto com", "à medida que" ou "com".

A primeira parte mostra uma mudança ou um acontecimento, e a segunda mostra o que muda por causa disso. Por exemplo, "com o aumento da população, o trânsito também piorou".

É uma expressão formal, muito usada em notícias, relatórios e textos sobre mudanças sociais.$$,
    $$É parecido com につれて e とともに.

Costuma vir com palavras que indicam mudança, como 増加, 発展, 変化 e 高齢化.

A forma に伴う vem antes de substantivos, como 台風に伴う被害.$$,
    $$Substantivo + に伴って / に伴い
Verbo (forma dicionário) + の + に伴って / に伴い
Substantivo + に伴う + Substantivo$$,
    $$に伴って$$,
    $$に伴って|に伴い|に伴う|にともなって|にともない$$,
    ARRAY['に', '伴って']::text[],
    ARRAY['に伴って', 'に伴い', 'に伴う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-109', $$人口の増加に伴って、交通渋滞がひどくなった。$$, $$じんこうのぞうかにともなって、こうつうじゅうたいがひどくなった。$$, $$Com o aumento da população, o trânsito piorou.$$),
    ('n2-grammar-109', $$経済の発展に伴い、生活が豊かになった。$$, $$けいざいのはってんにともない、せいかつがゆたかになった。$$, $$Junto com o desenvolvimento econômico, a vida ficou mais próspera.$$),
    ('n2-grammar-109', $$台風に伴う大雨で、川が増水した。$$, $$たいふうにともなうおおあめで、かわがぞうすいした。$$, $$Com a chuva forte trazida pelo tufão, o rio encheu.$$),
    ('n2-grammar-109', $$年をとるのに伴って、体力が落ちてきた。$$, $$としをとるのにともなって、たいりょくがおちてきた。$$, $$À medida que envelheço, a minha resistência física vem caindo.$$),
    ('n2-grammar-109', $$会社の移転に伴い、住所が変わります。$$, $$かいしゃのいてんにともない、じゅうしょがかわります。$$, $$Com a mudança da empresa, o endereço vai mudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$高齢化____、医療費が増えている。$$, $$Com o envelhecimento da população, os gastos com saúde estão aumentando.$$),
        (2, $$技術の進歩____、仕事のやり方も変わった。$$, $$Junto com o avanço da tecnologia, a forma de trabalhar também mudou.$$),
        (3, $$気温の上昇____、海の水位も上がっている。$$, $$À medida que a temperatura sobe, o nível do mar também está subindo.$$),
        (4, $$工事____、この道は通行止めになります。$$, $$Por causa da obra, esta rua ficará interditada.$$),
        (5, $$店の拡大____、従業員を増やした。$$, $$Com a ampliação da loja, aumentamos o número de funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に伴って$$),
        (1, $$に伴い$$),
        (1, $$にともなって$$),
        (1, $$にともない$$),
        (2, $$に伴って$$),
        (2, $$に伴い$$),
        (2, $$にともなって$$),
        (2, $$にともない$$),
        (3, $$に伴って$$),
        (3, $$に伴い$$),
        (3, $$にともなって$$),
        (3, $$にともない$$),
        (4, $$に伴って$$),
        (4, $$に伴い$$),
        (4, $$にともなって$$),
        (4, $$にともない$$),
        (5, $$に伴って$$),
        (5, $$に伴い$$),
        (5, $$にともなって$$),
        (5, $$にともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
