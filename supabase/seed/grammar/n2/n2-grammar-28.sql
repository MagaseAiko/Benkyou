-- n2-grammar-28 — 果たして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-28',
    'grammar',
    'N2',
    $$果たして$$,
    $$hatashite$$,
    $$Será mesmo que / Afinal / Realmente / Como esperado$$,
    $$果たして é um advérbio com dois usos principais.

O primeiro, em perguntas e frases de dúvida, expressa incerteza ou ceticismo: "será mesmo que...?" ou "afinal...?". Ele costuma aparecer com だろうか, のか ou かどうか. Por exemplo, "será mesmo que ele vem?" ou "será que este plano vai mesmo dar certo?".

O segundo, em frases afirmativas, significa "como esperado" ou "de fato": algo aconteceu exatamente como se previa. Por exemplo, "como eu temia, choveu".

O primeiro uso é o mais comum e soa formal e um pouco dramático, típico de textos, notícias e narrativas.$$,
    $$果たして também é a forma て do verbo 果たす (cumprir), como em 約束を果たして (cumprindo a promessa). O contexto mostra qual é o sentido.

Em títulos de notícias, 果たして aparece para criar suspense: 果たして結果は?

Na conversa casual, os japoneses preferem 本当に〜かな.$$,
    $$果たして + … + だろうか / のか / かどうか (será mesmo que...?)
果たして + … + Verbo no passado (como esperado)

Escrita: 果たして / はたして$$,
    $$果たして$$,
    $$果たして|はたして$$,
    ARRAY['果たして']::text[],
    ARRAY['果たして', 'はたして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-28', $$果たして彼は来るだろうか。$$, $$はたしてかれはくるだろうか。$$, $$Será mesmo que ele vem?$$),
    ('n2-grammar-28', $$この計画は果たして成功するのだろうか。$$, $$このけいかくははたしてせいこうするのだろうか。$$, $$Será que este plano vai mesmo dar certo?$$),
    ('n2-grammar-28', $$心配していたが、果たして予想どおりの結果になった。$$, $$しんぱいしていたが、はたしてよそうどおりのけっかになった。$$, $$Eu estava preocupado e, como esperado, o resultado foi o previsto.$$),
    ('n2-grammar-28', $$果たしてそれは本当なのか。$$, $$はたしてそれはほんとうなのか。$$, $$Afinal, isso é verdade?$$),
    ('n2-grammar-28', $$果たして、彼の言ったとおりだった。$$, $$はたして、かれのいったとおりだった。$$, $$De fato, foi exatamente como ele disse.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____明日は晴れるだろうか。$$, $$Será mesmo que amanhã vai fazer sol?$$),
        (2, $$____この答えは正しいのか。$$, $$Afinal, esta resposta está correta?$$),
        (3, $$雨が心配だったが、____雨が降った。$$, $$Eu temia a chuva e, como esperado, choveu.$$),
        (4, $$____私に、そんなことができるだろうか。$$, $$Será mesmo que eu consigo fazer uma coisa dessas?$$),
        (5, $$____彼女は真実を話しているのだろうか。$$, $$Será mesmo que ela está dizendo a verdade?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$果たして$$),
        (1, $$はたして$$),
        (2, $$果たして$$),
        (2, $$はたして$$),
        (3, $$果たして$$),
        (3, $$はたして$$),
        (4, $$果たして$$),
        (4, $$はたして$$),
        (5, $$果たして$$),
        (5, $$はたして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
