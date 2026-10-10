-- n2-grammar-129 — 恐らく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-129',
    'grammar',
    'N2',
    $$恐らく$$,
    $$osoraku$$,
    $$Provavelmente / Talvez / Possivelmente$$,
    $$恐らく expressa uma suposição com bastante probabilidade. Equivale a "provavelmente".

A frase costuma terminar com だろう, でしょう ou と思う. Por exemplo, "provavelmente ele não vem".

É um pouco mais formal que たぶん e aparece muito em notícias, textos e falas sérias.$$,
    $$É parecido com たぶん, mas 恐らく é mais formal.

Também é escrito em hiragana, おそらく.

Às vezes tem um tom de preocupação, mas nem sempre o sentido é negativo.$$,
    $$恐らく + Frase + だろう / でしょう / と思う$$,
    $$恐らく$$,
    $$恐らく|おそらく$$,
    ARRAY['恐らく']::text[],
    ARRAY['恐らく', 'おそらく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-129', $$彼は恐らく来ないだろう。$$, $$かれはおそらくこないだろう。$$, $$Provavelmente ele não vem.$$),
    ('n2-grammar-129', $$明日は恐らく雨でしょう。$$, $$あしたはおそらくあめでしょう。$$, $$Amanhã provavelmente vai chover.$$),
    ('n2-grammar-129', $$この計画は恐らく失敗するだろう。$$, $$このけいかくはおそらくしっぱいするだろう。$$, $$Este plano provavelmente vai fracassar.$$),
    ('n2-grammar-129', $$おそらく彼女はもう知っていると思う。$$, $$おそらくかのじょはもうしっているとおもう。$$, $$Acho que provavelmente ela já sabe.$$),
    ('n2-grammar-129', $$犯人は恐らく近所の人だろう。$$, $$はんにんはおそらくきんじょのひとだろう。$$, $$O culpado provavelmente é alguém da vizinhança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____試合は中止になるでしょう。$$, $$Provavelmente a partida vai ser cancelada.$$),
        (2, $$彼は____この事実を知らないだろう。$$, $$Ele provavelmente não sabe deste fato.$$),
        (3, $$この絵は____有名な画家のものだろう。$$, $$Este quadro provavelmente é de um pintor famoso.$$),
        (4, $$____明日までには終わると思う。$$, $$Acho que provavelmente termina até amanhã.$$),
        (5, $$____彼は道に迷ったのだろう。$$, $$Provavelmente ele se perdeu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$恐らく$$),
        (1, $$おそらく$$),
        (2, $$恐らく$$),
        (2, $$おそらく$$),
        (3, $$恐らく$$),
        (3, $$おそらく$$),
        (4, $$恐らく$$),
        (4, $$おそらく$$),
        (5, $$恐らく$$),
        (5, $$おそらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
