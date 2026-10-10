-- n1-grammar-49 — 〜からある / 〜からする / 〜からの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-49',
    'grammar',
    'N1',
    $$〜からある / 〜からする / 〜からの$$,
    $$kara aru / kara suru / kara no$$,
    $$Mais de / Nada menos que / Pelo menos$$,
    $$からある, からする e からの vêm depois de números e destacam que a quantidade é muito grande. Equivalem a "mais de" ou "nada menos que".

からある é usado com tamanho, peso ou distância, como "um peixe de mais de dez quilos". からする é usado com preços, como "um relógio de mais de um milhão de ienes". からの é usado com quantidade de pessoas ou coisas, como "mais de mil pessoas".

A pessoa mostra surpresa diante do número.$$,
    $$O número costuma ser redondo e grande, como 百, 千 ou 一万.

É parecido com 以上の, mas expressa mais surpresa.$$,
    $$Número + からある + Substantivo (tamanho / peso / distância)
Número + からする + Substantivo (preço)
Número + からの + Substantivo (quantidade)$$,
    $$からある$$,
    $$からある|からする|からの$$,
    ARRAY['から', 'ある']::text[],
    ARRAY['からある', 'からする', 'からの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-49', $$彼は百キロからある荷物を一人で運んだ。$$, $$かれはひゃっキロからあるにもつをひとりではこんだ。$$, $$Ele carregou sozinho uma bagagem de mais de cem quilos.$$),
    ('n1-grammar-49', $$百万円からする時計を買った。$$, $$ひゃくまんえんからするとけいをかった。$$, $$Comprou um relógio de nada menos que um milhão de ienes.$$),
    ('n1-grammar-49', $$会場には一万人からの観客が集まった。$$, $$かいじょうにはいちまんにんからのかんきゃくがあつまった。$$, $$Mais de dez mil espectadores se reuniram no local.$$),
    ('n1-grammar-49', $$二十キロからある道を歩いて帰った。$$, $$にじゅっキロからあるみちをあるいてかえった。$$, $$Voltou a pé por um caminho de mais de vinte quilômetros.$$),
    ('n1-grammar-49', $$一泊十万円からするホテルに泊まった。$$, $$いっぱくじゅうまんえんからするホテルにとまった。$$, $$Ficou num hotel que custa mais de cem mil ienes por noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三メートル____大きな魚が釣れた。$$, $$Pescaram um peixe enorme de mais de três metros.$$),
        (2, $$一台一千万円____車だ。$$, $$É um carro que custa mais de dez milhões de ienes.$$),
        (3, $$千人____人が、デモに参加した。$$, $$Mais de mil pessoas participaram da manifestação.$$),
        (4, $$彼女は五百ページ____本を一日で読んだ。$$, $$Ela leu num dia um livro de mais de quinhentas páginas.$$),
        (5, $$この絵は一億円____と言われている。$$, $$Dizem que este quadro custa mais de cem milhões de ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からある$$),
        (2, $$からする$$),
        (3, $$からの$$),
        (4, $$からある$$),
        (5, $$からする$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
