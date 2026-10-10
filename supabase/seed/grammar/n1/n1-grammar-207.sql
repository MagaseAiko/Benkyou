-- n1-grammar-207 — 〜というわけだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-207',
    'grammar',
    'N1',
    $$〜というわけだ$$,
    $$to iu wake da$$,
    $$Ou seja / Isso quer dizer que / É por isso que$$,
    $$というわけだ serve para tirar uma conclusão ou dar uma explicação a partir de informações anteriores. Equivale a "ou seja" ou "é por isso que".

A pessoa junta os fatos e chega a um resultado lógico. Por exemplo, "o trem parou, por isso ele se atrasou" ou "ou seja, vamos ter que começar de novo".

É uma expressão muito comum na fala e na escrita.$$,
    $$É parecido com わけだ, mas というわけだ destaca mais a explicação ou o resumo.

Na fala, aparece como ってわけだ.$$,
    $$Frase (forma simples) + というわけだ
Substantivo / Adjetivo な + だ + というわけだ$$,
    $$というわけだ$$,
    $$というわけだ|というわけです|ってわけだ|というわけか$$,
    ARRAY['という', 'わけ', 'だ']::text[],
    ARRAY['というわけだ', 'というわけです', 'ってわけだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-207', $$電車が止まった。それで遅刻したというわけだ。$$, $$でんしゃがとまった。それでちこくしたというわけだ。$$, $$O trem parou. Foi por isso que ele se atrasou.$$),
    ('n1-grammar-207', $$つまり、最初からやり直しというわけです。$$, $$つまり、さいしょからやりなおしというわけです。$$, $$Ou seja, vamos ter que começar de novo.$$),
    ('n1-grammar-207', $$彼は留学していたから、英語が上手というわけだ。$$, $$かれはりゅうがくしていたから、えいごがじょうずというわけだ。$$, $$Ele fez intercâmbio, é por isso que fala bem inglês.$$),
    ('n1-grammar-207', $$毎日練習した結果、優勝できたというわけです。$$, $$まいにちれんしゅうしたけっか、ゆうしょうできたというわけです。$$, $$Treinamos todo dia e, como resultado, vencemos.$$),
    ('n1-grammar-207', $$なるほど、それで彼女は怒っていたってわけだ。$$, $$なるほど、それでかのじょはおこっていたってわけだ。$$, $$Entendi, é por isso que ela estava brava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅から近いので、家賃が高い____。$$, $$Fica perto da estação, é por isso que o aluguel é caro.$$),
        (2, $$彼女は医者の娘だから、病気に詳しい____。$$, $$Ela é filha de médico, é por isso que entende de doenças.$$),
        (3, $$要するに、計画は中止____。$$, $$Ou seja, o plano foi cancelado.$$),
        (4, $$雪が降ったので、試合が延期された____。$$, $$Nevou, por isso a partida foi adiada.$$),
        (5, $$それで、君が代わりに来た____。$$, $$Então é por isso que você veio no lugar dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-207', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というわけだ$$),
        (1, $$というわけです$$),
        (2, $$というわけだ$$),
        (2, $$というわけです$$),
        (3, $$というわけだ$$),
        (3, $$というわけです$$),
        (4, $$というわけだ$$),
        (4, $$というわけです$$),
        (5, $$というわけだ$$),
        (5, $$というわけか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
