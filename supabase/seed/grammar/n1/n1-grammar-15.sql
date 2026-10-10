-- n1-grammar-15 — 〜だに / 〜だにしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-15',
    'grammar',
    'N1',
    $$〜だに / 〜だにしない$$,
    $$dani / dani shinai$$,
    $$Só de / Nem sequer / Nem mesmo$$,
    $$だに tem dois usos principais.

O primeiro vem depois de verbos como pensar, imaginar e ouvir, e significa "só de...". Indica que só de pensar em algo já surge um sentimento forte, geralmente de medo. Por exemplo, "só de imaginar, já fico com medo".

O segundo, na forma だにしない, significa "nem sequer" ou "nem mesmo". Por exemplo, "ele nem sequer se mexeu" ou "algo que ninguém sequer imaginava".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 想像するだに恐ろしい, 考えるだに, 微動だにしない e 夢にだに思わない.

É parecido com だけで e さえ, mas é bem mais formal.$$,
    $$Verbo (forma dicionário) + だに + Sentimento
Substantivo + だにしない
Substantivo + だに + Verbo (forma negativa)$$,
    $$だに$$,
    $$だに$$,
    ARRAY['だに']::text[],
    ARRAY['だに', 'だにしない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-15', $$地震のことは、想像するだに恐ろしい。$$, $$じしんのことは、そうぞうするだにおそろしい。$$, $$Só de imaginar um terremoto, já fico com medo.$$),
    ('n1-grammar-15', $$兵士は微動だにしなかった。$$, $$へいしはびどうだにしなかった。$$, $$O soldado nem sequer se mexeu.$$),
    ('n1-grammar-15', $$こんな結果になるとは、予想だにしなかった。$$, $$こんなけっかになるとは、よそうだにしなかった。$$, $$Nem sequer imaginava que daria neste resultado.$$),
    ('n1-grammar-15', $$考えるだにぞっとする。$$, $$かんがえるだにぞっとする。$$, $$Só de pensar, já me dá arrepios.$$),
    ('n1-grammar-15', $$夢にだに思わなかった成功だ。$$, $$ゆめにだにおもわなかったせいこうだ。$$, $$É um sucesso que nem em sonho eu imaginava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の場面は、思い出す____恐ろしい。$$, $$Só de lembrar da cena do acidente, fico com medo.$$),
        (2, $$彼は一顧____しなかった。$$, $$Ele nem sequer deu atenção.$$),
        (3, $$優勝できるとは想像____しなかった。$$, $$Nem sequer imaginava que conseguiria vencer.$$),
        (4, $$聞く____恐ろしい話だ。$$, $$É uma história assustadora só de ouvir.$$),
        (5, $$彼女は一言____話さなかった。$$, $$Ela não disse nem sequer uma palavra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だに$$),
        (2, $$だに$$),
        (3, $$だに$$),
        (4, $$だに$$),
        (5, $$だに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
