-- n1-grammar-89 — 〜ないまでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-89',
    'grammar',
    'N1',
    $$〜ないまでも$$,
    $$nai made mo$$,
    $$Mesmo que não / Se não... pelo menos / Ainda que não$$,
    $$ないまでも indica que, mesmo que não se alcance um nível alto, pelo menos se espera um nível menor. Equivale a "mesmo que não..., pelo menos".

A primeira parte mostra o ideal, que talvez não seja possível, e a segunda mostra o mínimo desejado. Por exemplo, "mesmo que não seja todo dia, pelo menos três vezes por semana quero me exercitar".

A segunda parte costuma ter せめて, くらいは ou expressões de desejo.$$,
    $$É parecido com ないにしても.

A segunda parte costuma ter たい, べきだ, てほしい ou ほうがいい.$$,
    $$Verbo (forma ない) + までも + Mínimo desejado$$,
    $$ないまでも$$,
    $$ないまでも$$,
    ARRAY['ない', 'まで', 'も']::text[],
    ARRAY['ないまでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-89', $$毎日とは言わないまでも、週に三回は運動したい。$$, $$まいにちとはいわないまでも、しゅうにさんかいはうんどうしたい。$$, $$Mesmo que não seja todo dia, quero me exercitar pelo menos três vezes por semana.$$),
    ('n1-grammar-89', $$優勝できないまでも、三位以内には入りたい。$$, $$ゆうしょうできないまでも、さんいいないにははいりたい。$$, $$Mesmo que não vença, quero pelo menos ficar entre os três primeiros.$$),
    ('n1-grammar-89', $$手伝わないまでも、邪魔はしないでほしい。$$, $$てつだわないまでも、じゃまはしないでほしい。$$, $$Se não vai ajudar, pelo menos não atrapalhe.$$),
    ('n1-grammar-89', $$完璧ではないまでも、かなりいい出来だ。$$, $$かんぺきではないまでも、かなりいいできだ。$$, $$Mesmo que não seja perfeito, ficou bem bom.$$),
    ('n1-grammar-89', $$会いに行かないまでも、電話くらいはするべきだ。$$, $$あいにいかないまでも、でんわくらいはするべきだ。$$, $$Mesmo que não vá visitá-lo, deveria pelo menos ligar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$満点は取れ____、合格点は取りたい。$$, $$Mesmo que não tire nota máxima, quero pelo menos a nota de aprovação.$$),
        (2, $$お礼を言わ____、挨拶くらいはしなさい。$$, $$Se não vai agradecer, pelo menos cumprimente.$$),
        (3, $$プロにはなれ____、趣味として続けたい。$$, $$Mesmo que não vire profissional, quero continuar como hobby.$$),
        (4, $$毎日料理をし____、週末くらいは作ろう。$$, $$Mesmo que não cozinhe todo dia, vamos pelo menos cozinhar no fim de semana.$$),
        (5, $$全部は覚えられ____、半分は覚えたい。$$, $$Mesmo que não consiga decorar tudo, quero decorar pelo menos a metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないまでも$$),
        (2, $$ないまでも$$),
        (3, $$ないまでも$$),
        (4, $$ないまでも$$),
        (5, $$ないまでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
