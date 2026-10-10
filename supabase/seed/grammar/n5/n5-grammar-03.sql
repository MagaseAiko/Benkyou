-- n5-grammar-03 — 〜だけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-03',
    'grammar',
    'N5',
    $$〜だけ$$,
    $$dake$$,
    $$Só / Somente / Apenas$$,
    $$だけ é usado para limitar algo, mostrando que é só aquilo e nada mais. Equivale a "só", "somente" ou "apenas".

Ele vem logo depois da palavra que está sendo limitada. Pode limitar uma coisa, uma pessoa, uma quantidade, um lugar ou até uma ação.

A frase com だけ pode ser afirmativa ou negativa, e o tom costuma ser neutro: ele apenas informa o limite. Isso é diferente de しか〜ない, que também significa "só", mas exige um verbo negativo e passa a ideia de que aquilo é pouco.

Quando だけ aparece junto com partículas, ele normalmente fica antes de partículas como で, に e と, e pode substituir を e が ou ficar antes delas.$$,
    $$A expressão 好きなだけ significa "o quanto quiser", e 一つだけ, "só um". São usos muito frequentes no dia a dia.

だけ não carrega a ideia de "pouco demais". Se a intenção for reclamar ou destacar que algo é insuficiente, しか〜ない é mais adequado.

Em lojas, a expressão 見るだけ é a forma natural de dizer que você só está olhando.$$,
    $$Substantivo + だけ
Substantivo + だけ + partícula (だけで / だけに / だけと / だけが)
Quantidade + だけ
Verbo na forma de dicionário + だけ
Adjetivo い + だけ
Adjetivo な + な + だけ$$,
    $$だけ$$,
    $$だけ$$,
    ARRAY['だけ']::text[],
    ARRAY['だけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-03', $$水だけ飲みました。$$, $$みずだけのみました。$$, $$Só bebi água.$$),
    ('n5-grammar-03', $$日曜日だけ休みです。$$, $$にちようびだけやすみです。$$, $$Só tenho folga aos domingos.$$),
    ('n5-grammar-03', $$一つだけください。$$, $$ひとつだけください。$$, $$Me dê só um, por favor.$$),
    ('n5-grammar-03', $$見るだけです。$$, $$みるだけです。$$, $$Só estou olhando.$$),
    ('n5-grammar-03', $$日本語は少しだけわかります。$$, $$にほんごはすこしだけわかります。$$, $$Entendo só um pouquinho de japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝はコーヒー____飲みます。$$, $$De manhã, só bebo café.$$),
        (2, $$このことは私____が知っています。$$, $$Só eu sei disso.$$),
        (3, $$財布の中に千円____あります。$$, $$Tenho só mil ienes na carteira.$$),
        (4, $$見る____です。買いません。$$, $$Só vou olhar. Não vou comprar.$$),
        (5, $$好きな____食べてください。$$, $$Coma o quanto quiser.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけ$$),
        (2, $$だけ$$),
        (3, $$だけ$$),
        (4, $$だけ$$),
        (5, $$だけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
