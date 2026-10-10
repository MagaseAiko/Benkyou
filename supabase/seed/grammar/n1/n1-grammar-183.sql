-- n1-grammar-183 — 〜たりとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-183',
    'grammar',
    'N1',
    $$〜たりとも$$,
    $$tari tomo$$,
    $$Nem um único / Nem mesmo um / Nem sequer$$,
    $$たりとも indica que nem a menor quantidade é permitida ou aceita. Equivale a "nem um único" ou "nem mesmo um".

Vem depois de expressões com "um", como um dia, uma pessoa, um iene ou um minuto, e a frase é negativa. Por exemplo, "não se pode perder nem um minuto".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 一日たりとも, 一人たりとも, 一円たりとも e 一瞬たりとも.

É parecido com も, como em 一日も, mas たりとも é muito mais enfático.$$,
    $$一 + Contador + たりとも + Frase negativa$$,
    $$たりとも$$,
    $$たりとも$$,
    ARRAY['たり', 'とも']::text[],
    ARRAY['たりとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-183', $$一日たりとも練習を休んだことはない。$$, $$いちにちたりともれんしゅうをやすんだことはない。$$, $$Nunca faltei ao treino nem um único dia.$$),
    ('n1-grammar-183', $$一円たりとも無駄にしてはいけない。$$, $$いちえんたりともむだにしてはいけない。$$, $$Não se deve desperdiçar nem um único iene.$$),
    ('n1-grammar-183', $$一瞬たりとも油断できない。$$, $$いっしゅんたりともゆだんできない。$$, $$Não dá para se descuidar nem por um instante.$$),
    ('n1-grammar-183', $$一人たりとも犠牲者を出してはならない。$$, $$ひとりたりともぎせいしゃをだしてはならない。$$, $$Não se pode deixar haver nem uma única vítima.$$),
    ('n1-grammar-183', $$彼女のことは一時たりとも忘れたことがない。$$, $$かのじょのことはいちじたりともわすれたことがない。$$, $$Nunca a esqueci nem por um momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験中は、一分____無駄にできない。$$, $$Durante a prova, não dá para desperdiçar nem um minuto.$$),
        (2, $$この部屋には、一人____入ってはいけない。$$, $$Ninguém pode entrar nesta sala, nem uma única pessoa.$$),
        (3, $$一秒____目を離すな。$$, $$Não tire os olhos nem por um segundo.$$),
        (4, $$借りたお金は一円____返していない。$$, $$Não devolvi nem um iene do dinheiro emprestado.$$),
        (5, $$一日____家族のことを忘れたことはない。$$, $$Nunca esqueci da minha família nem um único dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たりとも$$),
        (2, $$たりとも$$),
        (3, $$たりとも$$),
        (4, $$たりとも$$),
        (5, $$たりとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
