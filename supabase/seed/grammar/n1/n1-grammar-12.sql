-- n1-grammar-12 — 〜びる / 〜びて / 〜びた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-12',
    'grammar',
    'N1',
    $$〜びる / 〜びて / 〜びた$$,
    $$biru / bite / bita$$,
    $$Parecer / Ter ar de / Com jeito de$$,
    $$びる é um sufixo que transforma substantivos ou adjetivos em verbos, indicando que algo tem a aparência ou o comportamento de algo. Equivale a "parecer" ou "ter ar de".

Por exemplo, 大人びる significa "ter jeito de adulto", e 古びる significa "parecer velho".

Na prática, aparece principalmente nas formas びた, antes de substantivos, e びて, no meio da frase.$$,
    $$Só funciona com algumas palavras fixas, como 大人びる, 古びる, 田舎びる e 鄙びる.

É parecido com らしい e めく, mas びる indica que a aparência mudou com o tempo ou que é natural.$$,
    $$Substantivo / Adjetivo (raiz) + びる
Substantivo / Adjetivo (raiz) + びた + Substantivo
Substantivo / Adjetivo (raiz) + びて$$,
    $$びる$$,
    $$びる|びた|びて$$,
    ARRAY['びる']::text[],
    ARRAY['びる', 'びた', 'びて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-12', $$彼女は年の割に大人びている。$$, $$かのじょはとしのわりにおとなびている。$$, $$Ela tem jeito de adulta para a idade que tem.$$),
    ('n1-grammar-12', $$古びた家に一人で住んでいる。$$, $$ふるびたいえにひとりですんでいる。$$, $$Mora sozinho numa casa com ar de velha.$$),
    ('n1-grammar-12', $$大人びた口調で話す子供だ。$$, $$おとなびたくちょうではなすこどもだ。$$, $$É uma criança que fala num tom de adulto.$$),
    ('n1-grammar-12', $$その建物はすっかり古びてしまった。$$, $$そのたてものはすっかりふるびてしまった。$$, $$Aquele prédio ficou completamente envelhecido.$$),
    ('n1-grammar-12', $$ひなびた温泉町でゆっくり休んだ。$$, $$ひなびたおんせんまちでゆっくりやすんだ。$$, $$Descansei com calma numa cidade termal com ar rústico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$中学生なのに、大人____顔をしている。$$, $$Apesar de ser do ensino fundamental, tem cara de adulto.$$),
        (2, $$古____本棚に、たくさんの本が並んでいた。$$, $$Numa estante com ar de velha, havia muitos livros enfileirados.$$),
        (3, $$娘は最近ずいぶん大人____きた。$$, $$Minha filha tem ficado com muito mais jeito de adulta ultimamente.$$),
        (4, $$ひな____村に旅行した。$$, $$Viajei para uma vila com ar rústico.$$),
        (5, $$その写真はすっかり古____いた。$$, $$Aquela foto estava completamente envelhecida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$びた$$),
        (2, $$びた$$),
        (3, $$びて$$),
        (4, $$びた$$),
        (5, $$びて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
