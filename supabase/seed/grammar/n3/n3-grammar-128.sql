-- n3-grammar-128 — 〜てしょうがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-128',
    'grammar',
    'N3',
    $$〜てしょうがない$$,
    $$te shou ga nai$$,
    $$Muito / Demais / Não aguentar de tanto$$,
    $$てしょうがない é usado para expressar um sentimento ou uma sensação física tão forte que a pessoa não consegue controlar. Equivale a "muito", "demais" ou "não aguentar de tanto...".

A ideia literal é "não há jeito", ou seja, o sentimento é tão intenso que não tem como evitar.

Ele vem depois da forma て de adjetivos e de verbos de sentimento. Com adjetivos い, usa-se くてしょうがない; com adjetivos な, でしょうがない.

É muito usado para calor, frio, sono, fome, dor, preocupação, saudade e desejo. Por exemplo, "estou morrendo de calor" ou "não paro de pensar no resultado da prova".

A forma てしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.$$,
    $$O sujeito costuma ser quem fala. Para falar de outra pessoa, acrescenta-se らしい ou ようだ.

Comparado a てたまらない (N2), que é ainda mais emocional, てしょうがない é muito comum na conversa.

A expressão sozinha しょうがない significa "não tem jeito", "fazer o quê".$$,
    $$Adjetivo い sem い + くてしょうがない
Adjetivo な + でしょうがない
Verbo de sentimento na forma て + しょうがない (気になる / 心配する)
Verbo たい sem い + くてしょうがない

Variação: てしかたがない / てしようがない$$,
    $$てしょうがない$$,
    $$てしょうがない|てしょうがありません|てしかたがない|でしょうがない$$,
    ARRAY['て', 'しょうがない']::text[],
    ARRAY['てしょうがない', 'てしかたがない', 'でしょうがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-128', $$今日は暑くてしょうがない。$$, $$きょうはあつくてしょうがない。$$, $$Hoje está um calor insuportável.$$),
    ('n3-grammar-128', $$試験の結果が気になってしょうがない。$$, $$しけんのけっかがきになってしょうがない。$$, $$Não paro de pensar no resultado da prova.$$),
    ('n3-grammar-128', $$眠くてしょうがないので、コーヒーを飲んだ。$$, $$ねむくてしょうがないので、コーヒーをのんだ。$$, $$Estava morrendo de sono, então tomei um café.$$),
    ('n3-grammar-128', $$遠くに住んでいる彼に会いたくてしょうがない。$$, $$とおくにすんでいるかれにあいたくてしょうがない。$$, $$Estou louca para ver ele, que mora longe.$$),
    ('n3-grammar-128', $$子供がかわいくてしかたがない。$$, $$こどもがかわいくてしかたがない。$$, $$Acho meu filho fofo demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝ご飯を食べなかったので、お腹がすい____。$$, $$Não tomei café da manhã, então estou morrendo de fome.$$),
        (2, $$明日の旅行が楽しみ____。$$, $$Estou ansioso demais pela viagem de amanhã.$$),
        (3, $$昨日から歯が痛く____。$$, $$Desde ontem estou com uma dor de dente insuportável.$$),
        (4, $$何もすることがなくて、退屈____。$$, $$Não tenho nada para fazer e estou morrendo de tédio.$$),
        (5, $$疲れたので、早く家に帰りたく____。$$, $$Estou cansado e louco para ir para casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしょうがない$$),
        (1, $$てしかたがない$$),
        (2, $$でしょうがない$$),
        (3, $$てしょうがない$$),
        (3, $$てしかたがない$$),
        (4, $$でしょうがない$$),
        (5, $$てしょうがない$$),
        (5, $$てしかたがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
