-- n1-grammar-142 — 〜のやら〜のやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-142',
    'grammar',
    'N1',
    $$〜のやら〜のやら$$,
    $$no yara ~ no yara$$,
    $$Se... ou se / Não sei se... ou / Entre... e$$,
    $$のやら〜のやら apresenta duas possibilidades opostas e mostra que não é possível saber qual é a certa. Equivale a "não sei se... ou se...".

Muitas vezes mostra confusão ou dificuldade em entender a atitude de alguém. Por exemplo, "não sei se ele está bravo ou se está feliz".

Costuma terminar com わからない.$$,
    $$É parecido com のか〜のか, mas のやら〜のやら é mais literário e expressa mais confusão.

Os dois elementos costumam ser opostos.$$,
    $$Verbo / Adjetivo (forma simples) + のやら + Verbo / Adjetivo (oposto) + のやら + わからない$$,
    $$のやら〜のやら$$,
    $$のやら$$,
    ARRAY['の', 'やら']::text[],
    ARRAY['のやら〜のやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-142', $$彼は怒っているのやら喜んでいるのやら、わからない。$$, $$かれはおこっているのやらよろこんでいるのやら、わからない。$$, $$Não sei se ele está bravo ou se está feliz.$$),
    ('n1-grammar-142', $$あの子は本当に聞いているのやらいないのやら。$$, $$あのこはほんとうにきいているのやらいないのやら。$$, $$Não sei se essa criança está ouvindo ou não.$$),
    ('n1-grammar-142', $$彼女は来るのやら来ないのやら、はっきりしない。$$, $$かのじょはくるのやらこないのやら、はっきりしない。$$, $$Não está claro se ela vem ou não.$$),
    ('n1-grammar-142', $$この料理はおいしいのやらまずいのやら、よくわからない味だ。$$, $$このりょうりはおいしいのやらまずいのやら、よくわからないあじだ。$$, $$Não sei se este prato é gostoso ou ruim, é um sabor estranho.$$),
    ('n1-grammar-142', $$彼は勉強しているのやら遊んでいるのやら。$$, $$かれはべんきょうしているのやらあそんでいるのやら。$$, $$Não sei se ele está estudando ou brincando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子はやる気があるのやらない____、わからない。$$, $$Não sei se meu filho tem vontade ou não.$$),
        (2, $$彼女は笑っている____泣いているのやら。$$, $$Não sei se ela está rindo ou chorando.$$),
        (3, $$この話は本当なのやら嘘な____。$$, $$Não sei se esta história é verdade ou mentira.$$),
        (4, $$彼は賛成なのやら反対な____、はっきり言わない。$$, $$Ele não diz claramente se é a favor ou contra.$$),
        (5, $$試験はできた____できなかったのやら、自分でもわからない。$$, $$Nem eu sei se fui bem na prova ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のやら$$),
        (2, $$のやら$$),
        (3, $$のやら$$),
        (4, $$のやら$$),
        (5, $$のやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
