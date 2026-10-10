-- n1-grammar-33 — 〜羽目になる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-33',
    'grammar',
    'N1',
    $$〜羽目になる$$,
    $$hame ni naru$$,
    $$Acabar tendo que / Ser obrigado a / Ir parar em$$,
    $$羽目になる indica que alguém acabou numa situação ruim ou difícil, geralmente como consequência de algo. Equivale a "acabar tendo que" ou "ir parar em".

A pessoa não queria aquilo, mas não teve escolha. Por exemplo, "por causa de um erro, acabei tendo que fazer hora extra".

É uma expressão coloquial, com tom de lamento ou reclamação.$$,
    $$Também é escrito はめになる.

Costuma estar no passado, como 羽目になった.

É parecido com ことになる, mas 羽目になる sempre indica algo indesejado.$$,
    $$Verbo (forma dicionário) + 羽目になる
Verbo (forma dicionário) + 羽目に陥る$$,
    $$羽目になる$$,
    $$羽目になる|羽目になった|羽目に|はめになる|はめになった$$,
    ARRAY['羽目', 'に', 'なる']::text[],
    ARRAY['羽目になる', '羽目になった', '羽目に陥る']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-33', $$寝坊したせいで、タクシーで行く羽目になった。$$, $$ねぼうしたせいで、タクシーでいくはめになった。$$, $$Por ter dormido demais, acabei tendo que ir de táxi.$$),
    ('n1-grammar-33', $$友達の保証人になって、借金を払う羽目になった。$$, $$ともだちのほしょうにんになって、しゃっきんをはらうはめになった。$$, $$Fui fiador de um amigo e acabei tendo que pagar a dívida.$$),
    ('n1-grammar-33', $$一人で全部やる羽目になった。$$, $$ひとりでぜんぶやるはめになった。$$, $$Acabei tendo que fazer tudo sozinho.$$),
    ('n1-grammar-33', $$断れなくて、幹事をする羽目になった。$$, $$ことわれなくて、かんじをするはめになった。$$, $$Não consegui recusar e acabei tendo que organizar a festa.$$),
    ('n1-grammar-33', $$財布を忘れて、歩いて帰る羽目になった。$$, $$さいふをわすれて、あるいてかえるはめになった。$$, $$Esqueci a carteira e acabei tendo que voltar a pé.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ミスをして、徹夜で直す____。$$, $$Errei e acabei tendo que corrigir virando a noite.$$),
        (2, $$傘を持っていなかったので、雨の中を走る____。$$, $$Como não tinha guarda-chuva, acabei tendo que correr na chuva.$$),
        (3, $$嘘がばれて、みんなに謝る____。$$, $$A mentira foi descoberta e acabei tendo que pedir desculpas a todos.$$),
        (4, $$終電を逃して、駅で一晩過ごす____。$$, $$Perdi o último trem e acabei tendo que passar a noite na estação.$$),
        (5, $$準備を怠ると、後で苦労する____よ。$$, $$Se descuidar da preparação, vai acabar sofrendo depois.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$羽目になった$$),
        (1, $$はめになった$$),
        (2, $$羽目になった$$),
        (2, $$はめになった$$),
        (3, $$羽目になった$$),
        (3, $$はめになった$$),
        (4, $$羽目になった$$),
        (4, $$はめになった$$),
        (5, $$羽目になる$$),
        (5, $$はめになる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
