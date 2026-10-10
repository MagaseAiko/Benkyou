-- n3-grammar-142 — 〜というより
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-142',
    'grammar',
    'N3',
    $$〜というより$$,
    $$to iu yori$$,
    $$Mais do que / Mais propriamente / Não tanto... mas sim$$,
    $$というより é usado para corrigir ou ajustar uma descrição, dizendo que outra palavra é mais adequada. Equivale a "mais do que...", "mais propriamente" ou "não tanto... mas sim...".

A primeira parte apresenta uma descrição possível, e a segunda, uma descrição mais precisa. Por exemplo, "hoje não está tanto quente, está é calor" ou "ele é menos um professor e mais um amigo".

É muito útil para expressar nuances e ser mais exato ao descrever pessoas, sentimentos e situações.

Com むしろ, a estrutura というより、むしろ reforça a correção.

Ele vem depois de substantivos, adjetivos (sem だ para な) e da forma simples de verbos.$$,
    $$というより é diferente de より (comparação simples). Aqui, a ideia não é "mais que", e sim "uma descrição mais correta seria".

É muito comum em conversas para expressar sentimentos com precisão: 怒っているというより悲しい.

Com adjetivos な, não se usa だ antes: 静かというより.$$,
    $$A + というより + B (mais B do que A)
A + というより、むしろ + B
Verbo / Adjetivo (forma simples) + というより

Variações: と言うより / っていうより$$,
    $$というより$$,
    $$というより|と言うより|っていうより$$,
    ARRAY['と', 'いう', 'より']::text[],
    ARRAY['というより', 'と言うより', 'っていうより']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-142', $$今日は暖かいというより、暑い。$$, $$きょうはあたたかいというより、あつい。$$, $$Hoje não está tanto quentinho, está é calor.$$),
    ('n3-grammar-142', $$彼は先生というより、友達のような存在だ。$$, $$かれはせんせいというより、ともだちのようなそんざいだ。$$, $$Ele é menos um professor e mais um amigo.$$),
    ('n3-grammar-142', $$この料理は、料理というより芸術だ。$$, $$このりょうりは、りょうりというよりげいじゅつだ。$$, $$Esta comida é mais arte do que comida.$$),
    ('n3-grammar-142', $$彼女はきれいというより、かわいいタイプだ。$$, $$かのじょはきれいというより、かわいいタイプだ。$$, $$Ela é mais fofa do que bonita.$$),
    ('n3-grammar-142', $$彼は怒っているというより、悲しんでいるようだった。$$, $$かれはおこっているというより、かなしんでいるようだった。$$, $$Ele parecia mais triste do que bravo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は狭い____、使いにくい。$$, $$Este quarto não é tanto pequeno, é mais difícil de usar.$$),
        (2, $$彼は話し上手____、聞き上手だ。$$, $$Ele é mais um bom ouvinte do que um bom falante.$$),
        (3, $$それは忘れた____、最初から知らなかったんだ。$$, $$Não é que eu tenha esquecido; na verdade, eu nem sabia.$$),
        (4, $$昨日の雨は雨____、嵐だった。$$, $$A chuva de ontem foi mais uma tempestade do que uma chuva.$$),
        (5, $$彼のことは好き____、尊敬している。$$, $$Mais do que gostar dele, eu o admiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というより$$),
        (2, $$というより$$),
        (3, $$というより$$),
        (4, $$というより$$),
        (5, $$というより$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
