-- n2-grammar-94 — 〜に越したことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-94',
    'grammar',
    'N2',
    $$〜に越したことはない$$,
    $$ni koshita koto wa nai$$,
    $$O ideal é / Nada melhor que / O melhor seria$$,
    $$に越したことはない indica que algo é o mais desejável ou o mais seguro, de acordo com o bom senso. Equivale a "o ideal é" ou "nada melhor que".

A pessoa reconhece que aquilo é o melhor, mas muitas vezes sem obrigar. Por exemplo, "o ideal é ter mais dinheiro" ou "o melhor é tomar cuidado".

É uma expressão de conselho geral, usada tanto na fala quanto na escrita.$$,
    $$É comum com palavras como 安い, 早い, 気をつける, 健康 ou 用心.

Muitas vezes aparece com が depois, indicando uma ressalva, como "o ideal seria..., mas...".$$,
    $$Verbo (forma dicionário / forma ない) + に越したことはない
Adjetivo い + に越したことはない
Adjetivo な / Substantivo + に越したことはない$$,
    $$に越したことはない$$,
    $$に越したことはない|にこしたことはない|に越したことはありません$$,
    ARRAY['に', '越した', 'ことはない']::text[],
    ARRAY['に越したことはない', 'にこしたことはない', 'に越したことはありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-94', $$お金はあるに越したことはない。$$, $$おかねはあるにこしたことはない。$$, $$Ter dinheiro nunca é demais.$$),
    ('n2-grammar-94', $$用心するに越したことはない。$$, $$ようじんするにこしたことはない。$$, $$O melhor é tomar cuidado.$$),
    ('n2-grammar-94', $$値段は安いに越したことはないが、質も大切だ。$$, $$ねだんはやすいにこしたことはないが、しつもたいせつだ。$$, $$O ideal é que o preço seja baixo, mas a qualidade também importa.$$),
    ('n2-grammar-94', $$健康に越したことはありません。$$, $$けんこうにこしたことはありません。$$, $$Nada melhor que ter saúde.$$),
    ('n2-grammar-94', $$早く着くに越したことはない。$$, $$はやくつくにこしたことはない。$$, $$O ideal é chegar cedo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$体は丈夫な____。$$, $$O ideal é ter um corpo forte.$$),
        (2, $$準備は早めにする____。$$, $$O melhor é fazer os preparativos com antecedência.$$),
        (3, $$部屋は広い____。$$, $$O ideal é um quarto espaçoso.$$),
        (4, $$けがをしない____。$$, $$O melhor é não se machucar.$$),
        (5, $$仕事は楽な____が、それだけでは選べない。$$, $$O ideal seria um trabalho tranquilo, mas não dá para escolher só por isso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に越したことはない$$),
        (1, $$にこしたことはない$$),
        (1, $$に越したことはありません$$),
        (2, $$に越したことはない$$),
        (2, $$にこしたことはない$$),
        (2, $$に越したことはありません$$),
        (3, $$に越したことはない$$),
        (3, $$にこしたことはない$$),
        (3, $$に越したことはありません$$),
        (4, $$に越したことはない$$),
        (4, $$にこしたことはない$$),
        (4, $$に越したことはありません$$),
        (5, $$に越したことはない$$),
        (5, $$にこしたことはない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
