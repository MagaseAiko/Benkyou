-- n2-grammar-82 — 〜なくて済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-82',
    'grammar',
    'N2',
    $$〜なくて済む$$,
    $$nakute sumu$$,
    $$Não precisar / Dispensar / Livrar-se de$$,
    $$なくて済む indica que não foi preciso fazer algo que normalmente seria necessário. Equivale a "não precisar" ou "se livrar de fazer".

Muitas vezes mostra alívio, porque a pessoa evitou um trabalho, um gasto ou um problema. Por exemplo, "como ele me deu carona, não precisei pegar táxi".

A forma ないで済む tem o mesmo sentido.$$,
    $$É parecido com ずに済む, que é mais formal.

No passado, なくて済んだ mostra alívio por não ter precisado fazer algo.$$,
    $$Verbo (forma ない sem ない) + なくて済む
Verbo (forma ない) + で済む$$,
    $$なくて済む$$,
    $$なくて済|なくてすむ|なくてすん|ないで済|ないですむ|ないですん$$,
    ARRAY['なくて', '済む']::text[],
    ARRAY['なくて済む', 'なくて済んだ', 'ないで済む', 'ないで済んだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-82', $$友達が車で送ってくれたので、タクシーに乗らなくて済んだ。$$, $$ともだちがくるまでおくってくれたので、タクシーにのらなくてすんだ。$$, $$Como um amigo me deu carona, não precisei pegar táxi.$$),
    ('n2-grammar-82', $$早く気づいたので、大きな問題にならなくて済んだ。$$, $$はやくきづいたので、おおきなもんだいにならなくてすんだ。$$, $$Como percebemos cedo, não virou um grande problema.$$),
    ('n2-grammar-82', $$近くに住めば、毎朝早く起きなくて済む。$$, $$ちかくにすめば、まいあさはやくおきなくてすむ。$$, $$Se morar perto, não vai precisar acordar cedo toda manhã.$$),
    ('n2-grammar-82', $$ネットで買えば、店まで行かないで済む。$$, $$ネットでかえば、みせまでいかないですむ。$$, $$Comprando pela internet, você não precisa ir até a loja.$$),
    ('n2-grammar-82', $$雨がやんだので、傘を買わなくて済んだ。$$, $$あめがやんだので、かさをかわなくてすんだ。$$, $$Como a chuva parou, não precisei comprar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母が手伝ってくれたので、徹夜し____。$$, $$Como minha mãe me ajudou, não precisei virar a noite.$$),
        (2, $$予約しておけば、並ば____。$$, $$Se fizer reserva, não vai precisar esperar na fila.$$),
        (3, $$けががひどくなかったので、入院し____。$$, $$Como o ferimento não foi grave, não precisei ser internado.$$),
        (4, $$自炊すれば、外食にお金を使わ____。$$, $$Se cozinhar em casa, não precisa gastar dinheiro comendo fora.$$),
        (5, $$先に連絡したので、謝ら____。$$, $$Como avisei antes, não precisei pedir desculpas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくて済んだ$$),
        (1, $$ないで済んだ$$),
        (2, $$なくて済む$$),
        (2, $$ないで済む$$),
        (3, $$なくて済んだ$$),
        (3, $$ないで済んだ$$),
        (4, $$なくて済む$$),
        (4, $$ないで済む$$),
        (5, $$なくて済んだ$$),
        (5, $$ないで済んだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
