-- n1-grammar-70 — 〜までもない / 〜までもなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-70',
    'grammar',
    'N1',
    $$〜までもない / 〜までもなく$$,
    $$made mo nai / made mo naku$$,
    $$Nem é preciso / Não há necessidade de / Obviamente$$,
    $$までもない indica que algo é tão óbvio ou simples que não é necessário fazer aquela ação. Equivale a "nem é preciso" ou "não há necessidade de".

Por exemplo, "é tão simples que nem é preciso explicar". A forma までもなく vem no meio da frase e significa "obviamente" ou "nem é preciso dizer", como em 言うまでもなく.

É uma expressão um pouco formal.$$,
    $$Expressões muito comuns são 言うまでもない e 言うまでもなく, "nem é preciso dizer".

É parecido com 必要はない, mas までもない destaca que algo é óbvio.$$,
    $$Verbo (forma dicionário) + までもない
Verbo (forma dicionário) + までもなく、 + Frase$$,
    $$までもない$$,
    $$までもない|までもなく|までもありません$$,
    ARRAY['まで', 'も', 'ない']::text[],
    ARRAY['までもない', 'までもなく', 'までもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-70', $$健康が大切なのは言うまでもない。$$, $$けんこうがたいせつなのはいうまでもない。$$, $$Nem é preciso dizer que a saúde é importante.$$),
    ('n1-grammar-70', $$こんな簡単なことは、説明するまでもない。$$, $$こんなかんたんなことは、せつめいするまでもない。$$, $$Uma coisa simples dessas nem precisa ser explicada.$$),
    ('n1-grammar-70', $$言うまでもなく、彼は優秀な選手だ。$$, $$いうまでもなく、かれはゆうしゅうなせんしゅだ。$$, $$Obviamente, ele é um ótimo atleta.$$),
    ('n1-grammar-70', $$軽いけがなので、病院に行くまでもない。$$, $$かるいけがなので、びょういんにいくまでもない。$$, $$É um machucado leve, não há necessidade de ir ao hospital.$$),
    ('n1-grammar-70', $$わざわざ来ていただくまでもありません。$$, $$わざわざきていただくまでもありません。$$, $$Não há necessidade de o senhor vir até aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$結果は見る____。彼の勝ちだ。$$, $$Nem é preciso ver o resultado. Ele venceu.$$),
        (2, $$言う____、約束は守らなければならない。$$, $$Nem é preciso dizer que promessas devem ser cumpridas.$$),
        (3, $$そのくらいのことは、聞く____わかる。$$, $$Uma coisa dessas a gente sabe sem nem precisar perguntar.$$),
        (4, $$この程度の雨なら、傘をさす____。$$, $$Com uma chuva dessas, nem é preciso abrir o guarda-chuva.$$),
        (5, $$電話する____、メールで十分だ。$$, $$Nem é preciso ligar, um e-mail basta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までもない$$),
        (1, $$までもありません$$),
        (2, $$までもなく$$),
        (3, $$までもなく$$),
        (4, $$までもない$$),
        (4, $$までもありません$$),
        (5, $$までもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
