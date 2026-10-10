-- n2-grammar-27 — 〜反面
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-27',
    'grammar',
    'N2',
    $$〜反面$$,
    $$hanmen$$,
    $$Por outro lado / Ao mesmo tempo / Mas em compensação$$,
    $$反面 é usado para mostrar que uma mesma coisa tem dois lados opostos: um positivo e um negativo. Equivale a "por outro lado", "ao mesmo tempo" ou "mas, em compensação".

A primeira parte apresenta uma característica, e a segunda mostra o lado oposto, da mesma coisa ou pessoa. Por exemplo, "este trabalho é pesado, mas, por outro lado, é gratificante" ou "a internet é prática, mas, ao mesmo tempo, tem riscos".

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な ou である, e de substantivos com である.

É uma expressão um pouco formal, muito comum em textos argumentativos, comparações e análises.$$,
    $$Comparado a 一方で, 反面 foca nos dois lados de uma mesma coisa. 一方で pode comparar coisas diferentes.

Em redações sobre prós e contras, 反面 aparece com muita frequência.

A palavra 反面教師 significa "um mau exemplo, com o qual se aprende o que não fazer".$$,
    $$Verbo / Adjetivo い (forma simples) + 反面、 + Lado oposto
Adjetivo な + な / である + 反面
Substantivo + である + 反面

Escrita: 反面 / 半面$$,
    $$反面$$,
    $$反面|はんめん|半面$$,
    ARRAY['反面']::text[],
    ARRAY['反面', '半面']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-27', $$この仕事は大変な反面、やりがいがある。$$, $$このしごとはたいへんなはんめん、やりがいがある。$$, $$Este trabalho é pesado, mas, por outro lado, é gratificante.$$),
    ('n2-grammar-27', $$都会の生活は便利な反面、ストレスも多い。$$, $$とかいのせいかつはべんりなはんめん、ストレスもおおい。$$, $$A vida na cidade grande é prática, mas, ao mesmo tempo, estressante.$$),
    ('n2-grammar-27', $$彼は優しい反面、厳しいところもある。$$, $$かれはやさしいはんめん、きびしいところもある。$$, $$Ele é gentil, mas, por outro lado, também tem um lado rigoroso.$$),
    ('n2-grammar-27', $$インターネットは便利な反面、危険もある。$$, $$インターネットはべんりなはんめん、きけんもある。$$, $$A internet é prática, mas, ao mesmo tempo, tem riscos.$$),
    ('n2-grammar-27', $$一人暮らしは自由な反面、寂しいこともある。$$, $$ひとりぐらしはじゆうなはんめん、さびしいこともある。$$, $$Morar sozinho dá liberdade, mas, em compensação, às vezes é solitário.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この薬はよく効く____、副作用もある。$$, $$Este remédio funciona bem, mas, por outro lado, tem efeitos colaterais.$$),
        (2, $$彼女はいつも明るい____、寂しがりやだ。$$, $$Ela é sempre alegre, mas, ao mesmo tempo, não gosta de ficar sozinha.$$),
        (3, $$この会社は給料が高い____、休みが少ない。$$, $$Esta empresa paga bem, mas, em compensação, tem poucas folgas.$$),
        (4, $$車は便利な____、事故の危険がある。$$, $$O carro é prático, mas, por outro lado, há o risco de acidentes.$$),
        (5, $$有名になると、うれしい____、自由がなくなる。$$, $$Ficar famoso é bom, mas, ao mesmo tempo, você perde a liberdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$反面$$),
        (2, $$反面$$),
        (3, $$反面$$),
        (4, $$反面$$),
        (5, $$反面$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
