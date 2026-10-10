-- n1-grammar-40 — いかに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-40',
    'grammar',
    'N1',
    $$いかに$$,
    $$ikani$$,
    $$Como / Quão / Por mais que$$,
    $$いかに é uma forma formal de どのように e どんなに. Tem alguns usos.

O primeiro é perguntar ou pensar sobre o modo de fazer algo, com o sentido de "como". Por exemplo, "o importante é como viver".

O segundo é destacar o grau de algo, com o sentido de "quão". Por exemplo, "percebi quão importante é a saúde".

O terceiro, com ても ou とも, significa "por mais que", como "por mais que seja difícil, não vou desistir".$$,
    $$É bem mais formal que どう e どんなに.

É comum em textos, discursos e títulos de livros, como いかに生きるか.$$,
    $$いかに + Verbo (modo)
いかに + Adjetivo + か (grau)
いかに + Verbo / Adjetivo + ても / とも (por mais que)$$,
    $$いかに$$,
    $$いかに$$,
    ARRAY['いかに']::text[],
    ARRAY['いかに', 'いかに〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-40', $$大切なのは、いかに生きるかだ。$$, $$たいせつなのは、いかにいきるかだ。$$, $$O importante é como viver.$$),
    ('n1-grammar-40', $$病気になって、健康がいかに大切かわかった。$$, $$びょうきになって、けんこうがいかにたいせつかわかった。$$, $$Ao ficar doente, percebi quão importante é a saúde.$$),
    ('n1-grammar-40', $$いかに忙しくても、食事はきちんととるべきだ。$$, $$いかにいそがしくても、しょくじはきちんととるべきだ。$$, $$Por mais ocupado que esteja, deve comer direito.$$),
    ('n1-grammar-40', $$いかに説明しても、彼は理解しなかった。$$, $$いかにせつめいしても、かれはりかいしなかった。$$, $$Por mais que eu explicasse, ele não entendeu.$$),
    ('n1-grammar-40', $$いかにして問題を解決するか考えよう。$$, $$いかにしてもんだいをかいけつするかかんがえよう。$$, $$Vamos pensar em como resolver o problema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は、時間を____使うかについて書かれている。$$, $$Este livro fala sobre como usar o tempo.$$),
        (2, $$____努力しても、才能には勝てないこともある。$$, $$Por mais que se esforce, às vezes não dá para vencer o talento.$$),
        (3, $$親になって、親が____大変かわかった。$$, $$Ao me tornar pai, entendi quão difícil é ser pai.$$),
        (4, $$____高くても、必要なものは買う。$$, $$Por mais caro que seja, compro o que é necessário.$$),
        (5, $$____すれば売り上げが伸びるか考えている。$$, $$Estou pensando em como aumentar as vendas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかに$$),
        (2, $$いかに$$),
        (3, $$いかに$$),
        (4, $$いかに$$),
        (5, $$いかに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
