-- n2-grammar-96 — 〜に加えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-96',
    'grammar',
    'N2',
    $$〜に加えて$$,
    $$ni kuwaete$$,
    $$Além de / Somado a / Junto com$$,
    $$に加えて indica que algo é acrescentado a outra coisa. Equivale a "além de" ou "somado a".

Muitas vezes é usado para juntar dois fatores do mesmo tipo, como duas qualidades ou dois problemas. Por exemplo, "além da chuva, o vento também estava forte".

É uma expressão formal, comum em textos, notícias e explicações.$$,
    $$É parecido com だけでなく e の上に, mas に加えて é mais formal.

A forma それに加えて aparece no começo de frase com o sentido de "além disso".$$,
    $$Substantivo + に加えて
Substantivo + に加え$$,
    $$に加えて$$,
    $$に加えて|に加え|にくわえて$$,
    ARRAY['に', '加えて']::text[],
    ARRAY['に加えて', 'に加え', 'それに加えて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-96', $$雨に加えて、風も強くなってきた。$$, $$あめにくわえて、かぜもつよくなってきた。$$, $$Além da chuva, o vento também ficou forte.$$),
    ('n2-grammar-96', $$彼は英語に加えて、中国語も話せる。$$, $$かれはえいごにくわえて、ちゅうごくごもはなせる。$$, $$Além de inglês, ele também fala chinês.$$),
    ('n2-grammar-96', $$給料に加え、ボーナスも出る。$$, $$きゅうりょうにくわえ、ボーナスもでる。$$, $$Além do salário, também há bônus.$$),
    ('n2-grammar-96', $$物価の上昇に加えて、税金も上がった。$$, $$ぶっかのじょうしょうにくわえて、ぜいきんもあがった。$$, $$Somado ao aumento dos preços, os impostos também subiram.$$),
    ('n2-grammar-96', $$この店は味に加えて、サービスもいい。$$, $$このみせはあじにくわえて、サービスもいい。$$, $$Além do sabor, o atendimento desta loja também é bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭痛____、熱も出てきた。$$, $$Além da dor de cabeça, também comecei a ter febre.$$),
        (2, $$彼女は美しさ____、知性も持っている。$$, $$Além da beleza, ela também tem inteligência.$$),
        (3, $$仕事____、家事もしなければならない。$$, $$Além do trabalho, também tenho que fazer as tarefas de casa.$$),
        (4, $$交通費____、宿泊費も会社が払う。$$, $$Além do transporte, a empresa também paga a hospedagem.$$),
        (5, $$人手不足____、資金も足りない。$$, $$Somado à falta de pessoal, também falta verba.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に加えて$$),
        (1, $$に加え$$),
        (1, $$にくわえて$$),
        (2, $$に加えて$$),
        (2, $$に加え$$),
        (2, $$にくわえて$$),
        (3, $$に加えて$$),
        (3, $$に加え$$),
        (3, $$にくわえて$$),
        (4, $$に加えて$$),
        (4, $$に加え$$),
        (4, $$にくわえて$$),
        (5, $$に加えて$$),
        (5, $$に加え$$),
        (5, $$にくわえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
