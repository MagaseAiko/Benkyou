-- n3-grammar-120 — 〜たて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-120',
    'grammar',
    'N3',
    $$〜たて$$,
    $$tate$$,
    $$Recém- / Acabado de / Fresquinho$$,
    $$たて é um sufixo que indica que algo acabou de ser feito ou de acontecer. Equivale a "recém-", "acabado de" ou "fresquinho".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 焼きたて (recém-assado), 塗りたて (pintado agora mesmo), 生まれたて (recém-nascido).

Antes de um substantivo, usa-se たての: 焼きたてのパン (pão recém-assado).

É muito usado para comida, com um tom positivo de frescor e qualidade, como pão saído do forno, arroz recém-cozido e verduras recém-colhidas. Também aparece em avisos, como 塗りたて (tinta fresca), e para pessoas que acabaram de começar algo, como um funcionário recém-formado.

たて só é usado com alguns verbos, principalmente ligados a produção, preparação e começo.$$,
    $$Diferente de たばかり, que pode ser usado com quase qualquer verbo, たて é limitado a algumas combinações fixas.

Em padarias e restaurantes, placas com 焼きたて e できたて atraem muitos clientes.

塗りたて, em placas, significa "cuidado, tinta fresca".$$,
    $$Verbo na forma ます sem ます + たて + の + Substantivo
Verbo sem ます + たて + だ / です

Combinações comuns: 焼きたて / 炊きたて / できたて / 取れたて / 搾りたて / 生まれたて / 塗りたて / 洗いたて$$,
    $$たて$$,
    $$たて|立て$$,
    ARRAY['たて']::text[],
    ARRAY['たて', 'たての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-120', $$焼きたてのパンはおいしい。$$, $$やきたてのパンはおいしい。$$, $$Pão recém-assado é gostoso.$$),
    ('n3-grammar-120', $$このペンキは塗りたてなので、触らないでください。$$, $$このペンキはぬりたてなので、さわらないでください。$$, $$A tinta foi passada agora, então não toque, por favor.$$),
    ('n3-grammar-120', $$彼は大学を出たての新人だ。$$, $$かれはだいがくをでたてのしんじんだ。$$, $$Ele é um funcionário novo, recém-formado na faculdade.$$),
    ('n3-grammar-120', $$生まれたての赤ちゃんはとても小さい。$$, $$うまれたてのあかちゃんはとてもちいさい。$$, $$Um bebê recém-nascido é muito pequeno.$$),
    ('n3-grammar-120', $$これは取れたての野菜を使った料理です。$$, $$これはとれたてのやさいをつかったりょうりです。$$, $$Este é um prato feito com verduras recém-colhidas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$炊き____のご飯はおいしい。$$, $$Arroz recém-cozido é gostoso.$$),
        (2, $$洗い____のシャツはいいにおいがする。$$, $$Camisa recém-lavada tem um cheiro bom.$$),
        (3, $$作り____の料理を食べてください。$$, $$Coma a comida que acabou de ser feita.$$),
        (4, $$覚え____の日本語で話してみた。$$, $$Tentei falar com o japonês que tinha acabado de aprender.$$),
        (5, $$搾り____のジュースを飲んだ。$$, $$Tomei um suco feito na hora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たて$$),
        (2, $$たて$$),
        (3, $$たて$$),
        (4, $$たて$$),
        (5, $$たて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
