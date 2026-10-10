-- n1-grammar-66 — 〜こととて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-66',
    'grammar',
    'N1',
    $$〜こととて$$,
    $$koto tote$$,
    $$Por ser / Como / Já que$$,
    $$こととて indica um motivo, geralmente usado para pedir desculpas ou justificar algo. Equivale a "por ser", "como" ou "já que".

É uma expressão muito formal e antiquada, usada em cartas, desculpas formais e textos literários. Por exemplo, "por ser uma criança, peço que a perdoe" ou "como era inexperiente, cometi um erro".

Muitas vezes a segunda parte é um pedido de desculpas ou de compreensão.$$,
    $$Expressões comuns são 子供のこととて, 慣れぬこととて e 知らぬこととて.

A forma こととはいえ significa "apesar de ser" e tem um sentido diferente.$$,
    $$Verbo (forma simples) + こととて
Adjetivo な + な + こととて
Substantivo + の + こととて$$,
    $$こととて$$,
    $$こととて$$,
    ARRAY['こと', 'とて']::text[],
    ARRAY['こととて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-66', $$子供のしたこととて、どうかお許しください。$$, $$こどものしたこととて、どうかおゆるしください。$$, $$Como foi coisa de criança, peço que perdoe.$$),
    ('n1-grammar-66', $$慣れぬこととて、ご迷惑をおかけしました。$$, $$なれぬこととて、ごめいわくをおかけしました。$$, $$Por não estar acostumado, causei transtornos.$$),
    ('n1-grammar-66', $$知らぬこととて、失礼いたしました。$$, $$しらぬこととて、しつれいいたしました。$$, $$Como eu não sabia, peço desculpas.$$),
    ('n1-grammar-66', $$休日のこととて、店はどこも混んでいた。$$, $$きゅうじつのこととて、みせはどこもこんでいた。$$, $$Por ser feriado, todas as lojas estavam cheias.$$),
    ('n1-grammar-66', $$新人のこととて、至らない点もあると思います。$$, $$しんじんのこととて、いたらないてんもあるとおもいます。$$, $$Por ser novato, acredito que haja falhas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$急な____、十分な準備ができませんでした。$$, $$Como foi de repente, não consegui me preparar bem.$$),
        (2, $$初めての____、うまくできなくて申し訳ありません。$$, $$Por ser a primeira vez, peço desculpas por não ter feito bem.$$),
        (3, $$年末の____、道路はひどく渋滞していた。$$, $$Por ser fim de ano, as estradas estavam terrivelmente congestionadas.$$),
        (4, $$何分にも子供の____、大目に見てやってください。$$, $$Afinal, sendo criança, peço que releve.$$),
        (5, $$夜中の____、誰も気づかなかった。$$, $$Como era madrugada, ninguém percebeu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こととて$$),
        (2, $$こととて$$),
        (3, $$こととて$$),
        (4, $$こととて$$),
        (5, $$こととて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
