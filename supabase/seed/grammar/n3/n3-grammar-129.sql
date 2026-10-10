-- n3-grammar-129 — 〜て済む・〜で済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-129',
    'grammar',
    'N3',
    $$〜て済む・〜で済む$$,
    $$te sumu / de sumu$$,
    $$Bastar / Resolver-se com / Ficar só em$$,
    $$済む significa "resolver-se" ou "terminar". Com て ou で, a estrutura indica que algo se resolve com pouco, ou que uma situação ficou menos grave do que poderia.

Com substantivos + で, significa "basta..." ou "resolve-se com...": "se der para resolver por telefone, não precisa ir".

Também é usado para dizer que um problema ficou limitado a algo pequeno, com alívio: "por sorte, ficou só num machucado leve".

Com a forma て do verbo, aparece em expressões como 謝って済む問題ではない, que significa "não é um problema que se resolve só pedindo desculpas", com tom de crítica.

Na forma ないで済む ou なくて済む, indica que se conseguiu evitar algo: "ainda bem que não precisei...".$$,
    $$すみません vem do mesmo verbo 済む. A ideia original é "não se resolve", ou seja, "não tenho como retribuir".

Na forma passada, 済んだ costuma expressar alívio: algo ruim não ficou pior.

ずに済む (N2) tem o mesmo sentido de ないで済む e soa mais formal.$$,
    $$Substantivo + で + 済む (resolve-se com...)
Verbo na forma て + 済む
Verbo na forma ない + で + 済む / なくて済む (conseguir evitar)
… + で済んでよかった (alívio)

Escrita: 済む / すむ$$,
    $$済む$$,
    $$て済|で済|てすむ|ですむ$$,
    ARRAY['て', '済む']::text[],
    ARRAY['で済む', 'て済む', 'ないで済む', 'なくて済む']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-129', $$電話で済むなら、わざわざ行かなくてもいい。$$, $$でんわですむなら、わざわざいかなくてもいい。$$, $$Se der para resolver por telefone, não precisa ir até lá.$$),
    ('n3-grammar-129', $$これは謝って済む問題ではない。$$, $$これはあやまってすむもんだいではない。$$, $$Isto não é um problema que se resolve só pedindo desculpas.$$),
    ('n3-grammar-129', $$早く病院に行ったので、軽いけがで済んだ。$$, $$はやくびょういんにいったので、かるいけがですんだ。$$, $$Fui logo ao hospital, então ficou só num machucado leve.$$),
    ('n3-grammar-129', $$友達が手伝ってくれたので、一時間で済んだ。$$, $$ともだちがてつだってくれたので、いちじかんですんだ。$$, $$Meu amigo me ajudou, então resolvi tudo em uma hora.$$),
    ('n3-grammar-129', $$安い修理で済んでよかった。$$, $$やすいしゅうりですんでよかった。$$, $$Que bom que ficou só num conserto barato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$メールで____ことなら、会わなくてもいい。$$, $$Se for algo que se resolve por e-mail, não precisamos nos encontrar.$$),
        (2, $$大きな事故だったが、小さなけがで____。$$, $$Foi um acidente grave, mas ficou só em ferimentos leves.$$),
        (3, $$「すみません」で____問題じゃない。$$, $$Não é um problema que se resolve com um simples "desculpe".$$),
        (4, $$予定より少ないお金で____。$$, $$Consegui resolver com menos dinheiro do que o previsto.$$),
        (5, $$早く気づいたので、大きな問題にならないで____。$$, $$Percebi cedo, então consegui evitar que virasse um grande problema.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$済む$$),
        (2, $$済んだ$$),
        (2, $$済みました$$),
        (3, $$済む$$),
        (4, $$済んだ$$),
        (4, $$済みました$$),
        (5, $$済んだ$$),
        (5, $$済みました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
