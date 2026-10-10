-- n1-grammar-60 — 〜こそ〜が / 〜こそ〜けれど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-60',
    'grammar',
    'N1',
    $$〜こそ〜が / 〜こそ〜けれど$$,
    $$koso ~ ga / koso ~ keredo$$,
    $$Pode até... mas / É verdade que... porém / Embora seja$$,
    $$こそ〜が e こそ〜けれど reconhecem um fato de forma enfática e depois apresentam algo contrário. Equivalem a "pode até..., mas" ou "é verdade que..., porém".

A primeira parte admite um aspecto, e a segunda mostra outro aspecto mais importante. Por exemplo, "pode até ser pequeno, mas é confortável" ou "o salário é bom, porém o trabalho é pesado".

É uma expressão um pouco formal.$$,
    $$Expressões comuns são 小さくこそあるが, 時間こそかかるが e 古くこそあれ.

É parecido com 〜ことは〜が, que também reconhece algo antes de contrastar.$$,
    $$Substantivo + こそ + Verbo / Adjetivo + が / けれど + Frase contrária
Verbo (forma ます sem ます) + こそ + する + が / けれど$$,
    $$こそ〜が$$,
    $$こそ$$,
    ARRAY['こそ', 'が']::text[],
    ARRAY['こそ〜が', 'こそ〜けれど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-60', $$この部屋は狭くこそあるが、とても居心地がいい。$$, $$このへやはせまくこそあるが、とてもいごこちがいい。$$, $$Este quarto pode até ser pequeno, mas é muito aconchegante.$$),
    ('n1-grammar-60', $$時間こそかかったが、いい作品ができた。$$, $$じかんこそかかったが、いいさくひんができた。$$, $$Pode até ter levado tempo, mas saiu uma boa obra.$$),
    ('n1-grammar-60', $$給料こそ高いけれど、仕事はきつい。$$, $$きゅうりょうこそたかいけれど、しごとはきつい。$$, $$É verdade que o salário é alto, porém o trabalho é pesado.$$),
    ('n1-grammar-60', $$彼は口こそ悪いが、本当は優しい人だ。$$, $$かれはくちこそわるいが、ほんとうはやさしいひとだ。$$, $$Ele pode até ser boca suja, mas na verdade é uma pessoa gentil.$$),
    ('n1-grammar-60', $$見た目こそ地味だが、味は最高だ。$$, $$みためこそじみだが、あじはさいこうだ。$$, $$A aparência pode até ser simples, mas o sabor é excelente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は古く____あるが、まだよく走る。$$, $$Este carro pode até ser velho, mas ainda anda bem.$$),
        (2, $$値段____高いが、品質は確かだ。$$, $$O preço pode até ser alto, mas a qualidade é garantida.$$),
        (3, $$彼女は口数____少ないが、よく考えている。$$, $$Ela pode até falar pouco, mas pensa bastante.$$),
        (4, $$体____小さいけれど、力は強い。$$, $$O corpo pode até ser pequeno, mas a força é grande.$$),
        (5, $$距離____遠いが、毎週会いに行っている。$$, $$É verdade que a distância é grande, porém vou visitá-lo toda semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそ$$),
        (2, $$こそ$$),
        (3, $$こそ$$),
        (4, $$こそ$$),
        (5, $$こそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
