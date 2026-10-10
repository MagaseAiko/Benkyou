-- n3-grammar-170 — 〜割に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-170',
    'grammar',
    'N3',
    $$〜割に$$,
    $$wari ni$$,
    $$Para (alguém que...) / Considerando que / Em proporção a$$,
    $$割に é usado para dizer que algo é diferente do que se esperaria, considerando certa condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa, e a segunda mostra que o resultado não está de acordo com ela. Por exemplo, "para o preço, é gostoso" ou "considerando que estudei, a nota foi ruim".

O resultado pode ser positivo ou negativo. O importante é o desequilíbrio entre a condição e o resultado.

Com は, 割には reforça o contraste.

O sentido é parecido com にしては, mas 割に é usado para graus ou características que podem variar (preço, idade, esforço), enquanto にしては costuma vir com substantivos mais específicos (estrangeiro, primeira vez).$$,
    $$Sozinho, わりに também é um advérbio que significa "relativamente": この店はわりに安い (esta loja é relativamente barata).

年の割に ("para a idade") é uma das combinações mais comuns.

Comparado a のに, 割に destaca mais a proporção entre a condição e o resultado.$$,
    $$Verbo / Adjetivo (forma simples) + 割に / 割には
Adjetivo な + な + 割に
Substantivo + の + 割に

Escrita: 割に / わりに$$,
    $$割に$$,
    $$割に|わりに|割には|わりには$$,
    ARRAY['割', 'に']::text[],
    ARRAY['割に', '割には', 'わりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-170', $$この店は値段の割においしい。$$, $$このみせはねだんのわりにおいしい。$$, $$Para o preço, a comida desta loja é gostosa.$$),
    ('n3-grammar-170', $$彼は年の割に若く見える。$$, $$かれはとしのわりにわかくみえる。$$, $$Para a idade, ele parece jovem.$$),
    ('n3-grammar-170', $$勉強した割には、点数が悪かった。$$, $$べんきょうしたわりには、てんすうがわるかった。$$, $$Considerando que estudei, a nota foi ruim.$$),
    ('n3-grammar-170', $$この部屋は狭い割に、家賃が高い。$$, $$このへやはせまいわりに、やちんがたかい。$$, $$Para um apartamento tão pequeno, o aluguel é caro.$$),
    ('n3-grammar-170', $$彼女はたくさん食べる割に太らない。$$, $$かのじょはたくさんたべるわりにふとらない。$$, $$Para quem come tanto, ela não engorda.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんは安い____、丈夫だ。$$, $$Para uma bolsa barata, ela é resistente.$$),
        (2, $$彼は体が大きい____、力が弱い。$$, $$Para alguém tão grande, ele tem pouca força.$$),
        (3, $$毎日練習した____、上手にならなかった。$$, $$Considerando que pratiquei todo dia, não melhorei muito.$$),
        (4, $$この映画は評判の____、おもしろくなかった。$$, $$Para a fama que tinha, este filme não foi interessante.$$),
        (5, $$父は年の____、元気だ。$$, $$Para a idade, meu pai é bem disposto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-170', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$割に$$),
        (1, $$わりに$$),
        (2, $$割に$$),
        (2, $$わりに$$),
        (3, $$割に$$),
        (3, $$わりに$$),
        (4, $$割に$$),
        (4, $$わりに$$),
        (5, $$割に$$),
        (5, $$わりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
