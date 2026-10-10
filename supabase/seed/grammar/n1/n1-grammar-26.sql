-- n1-grammar-26 — どうにも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-26',
    'grammar',
    'N1',
    $$どうにも〜ない$$,
    $$dou nimo ~ nai$$,
    $$De jeito nenhum / Não tem como / Simplesmente não$$,
    $$どうにも junto com uma forma negativa indica que a pessoa tentou de várias formas, mas não consegue resolver ou mudar algo. Equivale a "de jeito nenhum" ou "não tem como".

Muitas vezes vem com verbos como ならない, できない ou 仕方がない. Por exemplo, "não tem como resolver isso sozinho".

Também aparece em frases afirmativas para expressar um sentimento forte, como "simplesmente não suporto".$$,
    $$A expressão どうにもならない significa "não há nada que se possa fazer".

É parecido com どうしても〜ない, mas どうにも destaca a impotência diante da situação.$$,
    $$どうにも + Verbo (forma potencial negativa)
どうにも + ならない / しようがない$$,
    $$どうにも〜ない$$,
    $$どうにも$$,
    ARRAY['どうにも', 'ない']::text[],
    ARRAY['どうにも〜ない', 'どうにもならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-26', $$この問題は私一人ではどうにもならない。$$, $$このもんだいはわたしひとりではどうにもならない。$$, $$Não tem como eu resolver este problema sozinho.$$),
    ('n1-grammar-26', $$どうにも眠くて仕方がない。$$, $$どうにもねむくてしかたがない。$$, $$Simplesmente não consigo parar de ter sono.$$),
    ('n1-grammar-26', $$壊れた機械は、どうにも直せなかった。$$, $$こわれたきかいは、どうにもなおせなかった。$$, $$Não teve jeito de consertar a máquina quebrada.$$),
    ('n1-grammar-26', $$今さら言っても、どうにもならないよ。$$, $$いまさらいっても、どうにもならないよ。$$, $$Dizer isso agora não adianta nada.$$),
    ('n1-grammar-26', $$彼の態度はどうにも理解できない。$$, $$かれのたいどはどうにもりかいできない。$$, $$Simplesmente não consigo entender a atitude dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金がなくて、____ならない。$$, $$Sem dinheiro, não tem jeito.$$),
        (2, $$この痛みは____我慢できない。$$, $$Não consigo aguentar esta dor de jeito nenhum.$$),
        (3, $$過ぎたことは、もう____ならない。$$, $$O que passou, não tem mais como mudar.$$),
        (4, $$この漢字が____覚えられない。$$, $$Simplesmente não consigo decorar este kanji.$$),
        (5, $$天気だけは____しようがない。$$, $$Com o tempo não há nada que se possa fazer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうにも$$),
        (2, $$どうにも$$),
        (3, $$どうにも$$),
        (4, $$どうにも$$),
        (5, $$どうにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
