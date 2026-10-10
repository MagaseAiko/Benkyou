-- n5-grammar-10 — どうやって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-10',
    'grammar',
    'N5',
    $$どうやって$$,
    $$douyatte$$,
    $$Como / De que jeito / De que maneira$$,
    $$どうやって é usado para perguntar o método ou o modo de fazer alguma coisa. Equivale a "como" ou "de que jeito".

Ele sempre se refere a uma ação, então vem antes de um verbo. A pergunta é sobre o processo: qual caminho seguir, que passos fazer, que meio usar.

Literalmente, どうやって vem de どう, que significa "como", e やって, a forma て de やる, que significa "fazer". A ideia é "fazendo de que maneira".

É diferente de どう sozinho, que pergunta a opinião ou o estado de algo, como "o que você acha?" ou "como foi?". どうやって é para "como fazer".$$,
    $$Para perguntar como chegar a algum lugar, どうやって行きますか é a forma mais natural.

Em situações educadas, também se usa どのように, que tem o mesmo sentido, mas soa mais formal.

A resposta costuma usar a forma て ou で para indicar o meio, como ir de trem ou fazer usando uma ferramenta.$$,
    $$どうやって + Verbo
どうやって + Verbo + か / の / んですか
どうやって + Verbo + か + frase (pergunta indireta)$$,
    $$どうやって$$,
    $$どうやって$$,
    ARRAY['どう', 'やって']::text[],
    ARRAY['どうやって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-10', $$駅までどうやって行きますか。$$, $$えきまでどうやっていきますか。$$, $$Como eu chego até a estação?$$),
    ('n5-grammar-10', $$この漢字はどうやって読みますか。$$, $$このかんじはどうやってよみますか。$$, $$Como se lê este kanji?$$),
    ('n5-grammar-10', $$これ、どうやって作ったの？$$, $$これ、どうやってつくったの？$$, $$Como você fez isso?$$),
    ('n5-grammar-10', $$このカメラはどうやって使うんですか。$$, $$このカメラはどうやってつかうんですか。$$, $$Como se usa esta câmera?$$),
    ('n5-grammar-10', $$どうやって日本語が上手になったか教えてください。$$, $$どうやってにほんごがじょうずになったかおしえてください。$$, $$Me conte como você ficou bom em japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$空港まで____行きますか。$$, $$Como eu vou até o aeroporto?$$),
        (2, $$このゲームは____遊びますか。$$, $$Como se joga este jogo?$$),
        (3, $$____この問題を解いたの？$$, $$Como você resolveu esta questão?$$),
        (4, $$「すしは____食べますか。」「手で食べてもいいですよ。」$$, $$"Como se come sushi?" "Pode comer com as mãos."$$),
        (5, $$____ここに来たか覚えていません。$$, $$Não lembro como cheguei aqui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうやって$$),
        (2, $$どうやって$$),
        (3, $$どうやって$$),
        (4, $$どうやって$$),
        (5, $$どうやって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
