-- n2-grammar-161 — 〜ては / 〜では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-161',
    'grammar',
    'N2',
    $$〜ては / 〜では$$,
    $$te wa / de wa$$,
    $$Se for assim / Se continuar / Desse jeito$$,
    $$ては ou では, no meio da frase, indica uma condição que leva a um resultado ruim ou indesejado. Equivale a "se for assim..." ou "desse jeito...".

A primeira parte mostra uma situação, e a segunda mostra que, nessa condição, algo fica difícil, impossível ou problemático. Por exemplo, "com tanto barulho, não dá para estudar".

A segunda parte costuma ser negativa, como できない, 困る ou だめだ.$$,
    $$Na fala, ては vira ちゃ e では vira じゃ.

É parecido com たら e ば, mas ては quase sempre leva a um resultado negativo.

Também é a base de expressões como てはいけない e てはならない.$$,
    $$Verbo (forma て) + は + Resultado negativo
Adjetivo い (sem い) + くては + Resultado negativo
Adjetivo な / Substantivo + では + Resultado negativo$$,
    $$ては$$,
    $$ては|では|くては$$,
    ARRAY['て', 'は']::text[],
    ARRAY['ては', 'では', 'くては', 'ちゃ', 'じゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-161', $$こんなにうるさくては、勉強できない。$$, $$こんなにうるさくては、べんきょうできない。$$, $$Com tanto barulho, não dá para estudar.$$),
    ('n2-grammar-161', $$毎日雨では、洗濯物が乾かない。$$, $$まいにちあめでは、せんたくものがかわかない。$$, $$Chovendo todo dia, a roupa não seca.$$),
    ('n2-grammar-161', $$そんなに急がされては、いい仕事ができない。$$, $$そんなにいそがされては、いいしごとができない。$$, $$Se me apressarem tanto, não consigo fazer um bom trabalho.$$),
    ('n2-grammar-161', $$こんな成績では、大学に入れない。$$, $$こんなせいせきでは、だいがくにはいれない。$$, $$Com notas assim, não vou entrar na universidade.$$),
    ('n2-grammar-161', $$今やめられては困ります。$$, $$いまやめられてはこまります。$$, $$Se você desistir agora, vou ficar em apuros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなに暑く____、眠れない。$$, $$Com este calor, não dá para dormir.$$),
        (2, $$その服装____、会社に行けないよ。$$, $$Com essa roupa, não dá para ir à empresa.$$),
        (3, $$君に来られなく____、困る。$$, $$Se você não puder vir, fico em apuros.$$),
        (4, $$この給料____、生活できない。$$, $$Com este salário, não dá para viver.$$),
        (5, $$そんなに泣かれ____、何も言えない。$$, $$Se você chorar tanto, não consigo dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ては$$),
        (2, $$では$$),
        (3, $$ては$$),
        (4, $$では$$),
        (5, $$ては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
