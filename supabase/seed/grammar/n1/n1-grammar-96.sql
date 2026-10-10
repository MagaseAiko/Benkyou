-- n1-grammar-96 — 何しろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-96',
    'grammar',
    'N1',
    $$何しろ$$,
    $$nanishiro$$,
    $$Afinal / De qualquer forma / O fato é que$$,
    $$何しろ serve para destacar o motivo principal de algo, de forma enfática. Equivale a "afinal" ou "o fato é que".

A pessoa explica uma situação apresentando o fator mais importante. Por exemplo, "estou exausto, afinal trabalhei doze horas".

Também pode significar "de qualquer forma", como em "de qualquer forma, vamos tentar".$$,
    $$É parecido com なにせ e とにかく.

Muitas vezes vem junto com から ou ので no fim da frase.$$,
    $$何しろ + Frase (motivo principal)
何しろ + Frase + から / ので$$,
    $$何しろ$$,
    $$何しろ|なにしろ$$,
    ARRAY['何', 'しろ']::text[],
    ARRAY['何しろ', 'なにしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-96', $$疲れた。何しろ十二時間も働いたからね。$$, $$つかれた。なにしろじゅうにじかんもはたらいたからね。$$, $$Estou cansado. Afinal, trabalhei doze horas.$$),
    ('n1-grammar-96', $$何しろ急いでいたので、財布を忘れてしまった。$$, $$なにしろいそいでいたので、さいふをわすれてしまった。$$, $$O fato é que eu estava com pressa, então esqueci a carteira.$$),
    ('n1-grammar-96', $$何しろやってみよう。$$, $$なにしろやってみよう。$$, $$De qualquer forma, vamos tentar.$$),
    ('n1-grammar-96', $$あの店はいつも混んでいる。何しろ安くておいしいから。$$, $$あのみせはいつもこんでいる。なにしろやすくておいしいから。$$, $$Aquela loja vive cheia. Afinal, é barata e gostosa.$$),
    ('n1-grammar-96', $$何しろ初めてのことなので、わからないことばかりだ。$$, $$なにしろはじめてのことなので、わからないことばかりだ。$$, $$O fato é que é a primeira vez, então não entendo quase nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____暑くて、何もする気にならない。$$, $$O fato é que está tão quente que não tenho vontade de fazer nada.$$),
        (2, $$彼は人気者だ。____話が面白いからね。$$, $$Ele é popular. Afinal, conversa de um jeito divertido.$$),
        (3, $$____時間がないので、急いでください。$$, $$O fato é que não há tempo, então se apresse.$$),
        (4, $$____一度会ってみてください。$$, $$De qualquer forma, encontre-o uma vez.$$),
        (5, $$この仕事は大変だ。____一人でやらなければならない。$$, $$Este trabalho é pesado. Afinal, tenho que fazer sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何しろ$$),
        (1, $$なにしろ$$),
        (2, $$何しろ$$),
        (2, $$なにしろ$$),
        (3, $$何しろ$$),
        (3, $$なにしろ$$),
        (4, $$何しろ$$),
        (4, $$なにしろ$$),
        (5, $$何しろ$$),
        (5, $$なにしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
