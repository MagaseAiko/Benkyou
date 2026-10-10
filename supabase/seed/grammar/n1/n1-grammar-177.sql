-- n1-grammar-177 — 〜たつもりはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-177',
    'grammar',
    'N1',
    $$〜たつもりはない$$,
    $$ta tsumori wa nai$$,
    $$Não tive a intenção de / Não foi minha intenção / Não acho que$$,
    $$たつもりはない indica que a pessoa não teve a intenção de fazer algo, ou não acha que fez algo, mesmo que os outros pensem o contrário. Equivale a "não tive a intenção de" ou "não acho que fiz".

Muitas vezes é usado para se defender ou explicar um mal-entendido. Por exemplo, "não tive a intenção de magoá-la".

É uma expressão comum na fala.$$,
    $$É diferente de つもりはない com a forma dicionário, que significa "não pretendo fazer".

A forma たつもりだ significa "acho que fiz" ou "fiz de conta que".$$,
    $$Verbo (forma た) + つもりはない
Verbo (forma た) + つもりはありません$$,
    $$たつもりはない$$,
    $$たつもりはない|たつもりはありません|だつもりはない|たつもりはなかった$$,
    ARRAY['た', 'つもり', 'は', 'ない']::text[],
    ARRAY['たつもりはない', 'たつもりはありません', 'たつもりはなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-177', $$彼女を傷つけたつもりはない。$$, $$かのじょをきずつけたつもりはない。$$, $$Não tive a intenção de magoá-la.$$),
    ('n1-grammar-177', $$失礼なことを言ったつもりはありません。$$, $$しつれいなことをいったつもりはありません。$$, $$Não foi minha intenção dizer algo rude.$$),
    ('n1-grammar-177', $$嘘をついたつもりはなかったんです。$$, $$うそをついたつもりはなかったんです。$$, $$Não tive a intenção de mentir.$$),
    ('n1-grammar-177', $$怒ったつもりはないけど、そう見えたかな。$$, $$おこったつもりはないけど、そうみえたかな。$$, $$Não acho que fiquei bravo, mas será que pareceu?$$),
    ('n1-grammar-177', $$彼をだましたつもりはない。$$, $$かれをだましたつもりはない。$$, $$Não tive a intenção de enganá-lo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$悪口を言っ____。$$, $$Não tive a intenção de falar mal.$$),
        (2, $$あなたを責め____。$$, $$Não foi minha intenção culpar você.$$),
        (3, $$命令し____が、そう聞こえたらごめんなさい。$$, $$Não tive a intenção de dar uma ordem, mas me desculpe se soou assim.$$),
        (4, $$ばかにし____んです。$$, $$Não tive a intenção de fazer pouco caso.$$),
        (5, $$約束を破っ____。$$, $$Não acho que quebrei a promessa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たつもりはない$$),
        (1, $$たつもりはありません$$),
        (2, $$たつもりはない$$),
        (2, $$たつもりはありません$$),
        (3, $$たつもりはない$$),
        (4, $$たつもりはなかった$$),
        (5, $$たつもりはない$$),
        (5, $$たつもりはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
