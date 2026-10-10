-- n1-grammar-193 — 〜ても差し支えない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-193',
    'grammar',
    'N1',
    $$〜ても差し支えない$$,
    $$te mo sashitsukae nai$$,
    $$Não há problema em / Pode / Não tem inconveniente$$,
    $$ても差し支えない indica que algo é permitido ou não causa problema. Equivale a "não há problema em" ou "pode".

É uma forma mais formal e educada de てもいい e てもかまわない, usada em situações de trabalho, documentos e conversas formais. Por exemplo, "não há problema em preencher com lápis".

A forma ても差し支えありません é ainda mais educada.$$,
    $$É muito usado para pedir permissão de forma educada, como 〜ても差し支えないでしょうか.

Também é escrito ても差しつかえない.$$,
    $$Verbo (forma て) + も差し支えない
Adjetivo い (sem い) + くても差し支えない
Adjetivo な / Substantivo + でも差し支えない$$,
    $$ても差し支えない$$,
    $$ても差し支え|でも差し支え|ても差しつかえ|でも差しつかえ$$,
    ARRAY['て', 'も', '差し支え', 'ない']::text[],
    ARRAY['ても差し支えない', 'ても差し支えありません', 'でも差し支えない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-193', $$鉛筆で書いても差し支えありません。$$, $$えんぴつでかいてもさしつかえありません。$$, $$Não há problema em escrever a lápis.$$),
    ('n1-grammar-193', $$明日の会議に遅れても差し支えないでしょうか。$$, $$あしたのかいぎにおくれてもさしつかえないでしょうか。$$, $$Haveria algum problema se eu me atrasasse para a reunião de amanhã?$$),
    ('n1-grammar-193', $$少しくらい遅れても差し支えない。$$, $$すこしくらいおくれてもさしつかえない。$$, $$Não tem problema atrasar um pouco.$$),
    ('n1-grammar-193', $$名前は書かなくても差し支えありません。$$, $$なまえはかかなくてもさしつかえありません。$$, $$Não há problema em não escrever o nome.$$),
    ('n1-grammar-193', $$日にちは来週でも差し支えない。$$, $$ひにちはらいしゅうでもさしつかえない。$$, $$Não tem inconveniente que a data seja na semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は自由に使っ____。$$, $$Pode usar esta sala à vontade.$$),
        (2, $$お支払いはカード____。$$, $$Não há problema em pagar com cartão.$$),
        (3, $$今日中でなく____。$$, $$Não tem problema não ser hoje.$$),
        (4, $$お電話し____でしょうか。$$, $$Haveria algum problema se eu ligasse?$$),
        (5, $$写真を撮っ____。$$, $$Não há problema em tirar fotos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-193', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても差し支えない$$),
        (1, $$ても差し支えありません$$),
        (2, $$でも差し支えない$$),
        (2, $$でも差し支えありません$$),
        (3, $$ても差し支えない$$),
        (3, $$ても差し支えありません$$),
        (4, $$ても差し支えない$$),
        (5, $$ても差し支えない$$),
        (5, $$ても差し支えありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
