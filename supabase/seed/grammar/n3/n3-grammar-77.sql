-- n3-grammar-77 — 〜に代わって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-77',
    'grammar',
    'N3',
    $$〜に代わって$$,
    $$ni kawatte$$,
    $$No lugar de / Em nome de / Substituindo$$,
    $$に代わって é usado para dizer que alguém ou algo faz um papel no lugar de outra pessoa ou coisa. Equivale a "no lugar de", "em nome de" ou "substituindo".

Ele tem dois usos principais. O primeiro é substituição de pessoa: alguém faz algo no lugar de outra pessoa, como um funcionário que cumprimenta os convidados em nome do presidente.

O segundo é substituição ao longo do tempo: algo novo toma o lugar de algo antigo, como o e-mail substituindo as cartas ou robôs fazendo o trabalho de pessoas.

É mais formal que の代わりに e aparece muito em discursos, cerimônias e textos escritos.$$,
    $$Em cerimônias e discursos, 〜に代わりまして、ご挨拶申し上げます é uma frase muito comum.

に代わる + substantivo, como 石油に代わるエネルギー, significa "uma energia que substitua o petróleo".

Compare com の代わりに: os dois têm sentido parecido, mas に代わって soa mais formal.$$,
    $$Substantivo + に代わって + Verbo
Substantivo + に代わり + Verbo (mais formal)
Substantivo + に代わる + Substantivo (que substitui)

Escrita: に代わって / にかわって$$,
    $$に代わって$$,
    $$に代わって|にかわって|に代わり|に代わる$$,
    ARRAY['に', '代わって']::text[],
    ARRAY['に代わって', 'に代わり', 'に代わる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-77', $$社長に代わって、私がご挨拶します。$$, $$しゃちょうにかわって、わたしがごあいさつします。$$, $$Em nome do presidente, eu farei a saudação.$$),
    ('n3-grammar-77', $$病気の母に代わって、姉が料理を作った。$$, $$びょうきのははにかわって、あねがりょうりをつくった。$$, $$No lugar da minha mãe doente, minha irmã mais velha cozinhou.$$),
    ('n3-grammar-77', $$最近は手紙に代わって、メールが使われている。$$, $$さいきんはてがみにかわって、メールがつかわれている。$$, $$Ultimamente, o e-mail está sendo usado no lugar das cartas.$$),
    ('n3-grammar-77', $$人間に代わって、ロボットが働く時代だ。$$, $$にんげんにかわって、ロボットがはたらくじだいだ。$$, $$É uma época em que robôs trabalham no lugar das pessoas.$$),
    ('n3-grammar-77', $$先生に代わって、私が説明します。$$, $$せんせいにかわって、わたしがせつめいします。$$, $$No lugar do professor, eu vou explicar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長____、課長が会議に出た。$$, $$No lugar do gerente, o chefe de seção participou da reunião.$$),
        (2, $$最近は現金____、カードで払う人が増えた。$$, $$Ultimamente, aumentou o número de pessoas que pagam com cartão no lugar do dinheiro.$$),
        (3, $$家族____、心からお礼を申し上げます。$$, $$Em nome da família, agradeço de coração.$$),
        (4, $$出張中の父____、兄が家のことをした。$$, $$No lugar do meu pai, que estava viajando a trabalho, meu irmão cuidou da casa.$$),
        (5, $$これからは石油____、新しいエネルギーが必要だ。$$, $$Daqui em diante, é necessária uma nova energia para substituir o petróleo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に代わって$$),
        (1, $$にかわって$$),
        (2, $$に代わって$$),
        (2, $$にかわって$$),
        (3, $$に代わって$$),
        (3, $$にかわって$$),
        (4, $$に代わって$$),
        (4, $$にかわって$$),
        (5, $$に代わって$$),
        (5, $$にかわって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
