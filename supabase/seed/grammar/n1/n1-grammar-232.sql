-- n1-grammar-232 — 〜うちに入らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-232',
    'grammar',
    'N1',
    $$〜うちに入らない$$,
    $$uchi ni hairanai$$,
    $$Não conta como / Nem dá para chamar de / Não chega a ser$$,
    $$うちに入らない indica que algo é tão pequeno ou simples que nem merece ser considerado como aquilo. Equivale a "não conta como" ou "nem dá para chamar de".

A pessoa minimiza algo, muitas vezes por modéstia ou comparação. Por exemplo, "correr cinco minutos nem conta como exercício".

É uma expressão comum na fala.$$,
    $$É parecido com とは言えない.

Muitas vezes vem com expressões como こんなの ou これくらい.$$,
    $$Substantivo + のうちに入らない
Verbo (forma dicionário) + うちに入らない$$,
    $$うちに入らない$$,
    $$うちに入らない|うちにはいらない|うちに入りません$$,
    ARRAY['うち', 'に', '入らない']::text[],
    ARRAY['うちに入らない', 'うちに入りません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-232', $$五分歩くだけでは、運動のうちに入らない。$$, $$ごふんあるくだけでは、うんどうのうちにはいらない。$$, $$Andar só cinco minutos nem conta como exercício.$$),
    ('n1-grammar-232', $$これくらいの雨は、雨のうちに入らない。$$, $$これくらいのあめは、あめのうちにはいらない。$$, $$Uma chuva dessas nem dá para chamar de chuva.$$),
    ('n1-grammar-232', $$一時間の残業なんて、残業のうちに入らないよ。$$, $$いちじかんのざんぎょうなんて、ざんぎょうのうちにはいらないよ。$$, $$Uma hora extra nem conta como hora extra.$$),
    ('n1-grammar-232', $$私の料理は、料理のうちに入りません。$$, $$わたしのりょうりは、りょうりのうちにはいりません。$$, $$O que eu faço nem dá para chamar de culinária.$$),
    ('n1-grammar-232', $$少し話しただけで、知り合いのうちに入らない。$$, $$すこしはなしただけで、しりあいのうちにはいらない。$$, $$Só conversamos um pouco, não chega a ser um conhecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この程度の寒さは、寒さの____。$$, $$Um frio desses nem conta como frio.$$),
        (2, $$十分の勉強なんて、勉強の____。$$, $$Dez minutos de estudo nem dá para chamar de estudo.$$),
        (3, $$こんなけがは、けがの____よ。$$, $$Um machucado desses nem conta como machucado.$$),
        (4, $$一回会っただけでは、友達の____。$$, $$Ter se encontrado uma vez só não chega a ser amizade.$$),
        (5, $$このくらいの量は、食べた____。$$, $$Uma quantidade dessas nem conta como ter comido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-232', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うちに入らない$$),
        (1, $$うちに入りません$$),
        (2, $$うちに入らない$$),
        (2, $$うちに入りません$$),
        (3, $$うちに入らない$$),
        (4, $$うちに入らない$$),
        (4, $$うちに入りません$$),
        (5, $$うちに入らない$$),
        (5, $$うちに入りません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
