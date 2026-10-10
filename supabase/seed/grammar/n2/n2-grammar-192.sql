-- n2-grammar-192 — 〜ようか〜まいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-192',
    'grammar',
    'N2',
    $$〜ようか〜まいか$$,
    $$you ka ~ mai ka$$,
    $$Se faço ou não / Fazer ou não fazer / Se devo ou não$$,
    $$ようか〜まいか expressa a dúvida de uma pessoa entre fazer ou não fazer algo. Equivale a "se faço ou não" ou "fazer ou não fazer".

Muitas vezes vem com verbos como 迷う, 悩む ou 考える. Por exemplo, "estou em dúvida se vou ou não à festa".

É uma expressão formal e um pouco literária.$$,
    $$まい é uma negação de intenção, então まいか significa "se não faço".

Na fala do dia a dia, usa-se mais ようかどうか.

Para verbos do grupo 2, também se usa a raiz + まい, como 食べまい.$$,
    $$Verbo (forma volitiva) + か + Verbo (forma dicionário) + まいか + 迷う / 悩む$$,
    $$ようか〜まいか$$,
    $$まいか$$,
    ARRAY['よう', 'か', 'まい', 'か']::text[],
    ARRAY['ようか〜まいか', 'うか〜まいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-192', $$パーティーに行こうか行くまいか迷っている。$$, $$パーティーにいこうかいくまいかまよっている。$$, $$Estou em dúvida se vou ou não à festa.$$),
    ('n2-grammar-192', $$本当のことを言おうか言うまいか悩んだ。$$, $$ほんとうのことをいおうかいうまいかなやんだ。$$, $$Fiquei na dúvida se contava ou não a verdade.$$),
    ('n2-grammar-192', $$この服を買おうか買うまいか考えている。$$, $$このふくをかおうかかうまいかかんがえている。$$, $$Estou pensando se compro ou não esta roupa.$$),
    ('n2-grammar-192', $$彼に電話しようかするまいか、一晩中迷った。$$, $$かれにでんわしようかするまいか、ひとばんじゅうまよった。$$, $$Passei a noite toda em dúvida se ligava ou não para ele.$$),
    ('n2-grammar-192', $$留学しようかするまいか、まだ決めていない。$$, $$りゅうがくしようかするまいか、まだきめていない。$$, $$Ainda não decidi se faço ou não intercâmbio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会社を辞めようか辞める____、悩んでいる。$$, $$Estou em dúvida se saio ou não da empresa.$$),
        (2, $$ケーキを食べようか食べる____迷った。$$, $$Fiquei em dúvida se comia ou não o bolo.$$),
        (3, $$彼女に告白しようかする____、ずっと考えている。$$, $$Estou pensando há tempos se me declaro ou não para ela.$$),
        (4, $$試験を受けようか受ける____、まだ決められない。$$, $$Ainda não consigo decidir se faço ou não a prova.$$),
        (5, $$引っ越そうか引っ越す____、家族と相談した。$$, $$Conversei com a família se mudávamos ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-192', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まいか$$),
        (2, $$まいか$$),
        (3, $$まいか$$),
        (4, $$まいか$$),
        (5, $$まいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
