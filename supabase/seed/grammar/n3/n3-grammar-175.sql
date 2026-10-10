-- n3-grammar-175 — 〜ような気がする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-175',
    'grammar',
    'N3',
    $$〜ような気がする$$,
    $$you na ki ga suru$$,
    $$Ter a impressão de que / Ter a sensação de que / Parece que$$,
    $$ような気がする é usado para expressar uma impressão, uma intuição ou uma sensação vaga, sem certeza. Equivale a "ter a impressão de que", "ter a sensação de que" ou "parece que".

A ideia é que a pessoa sente algo, mas não tem provas. Por exemplo, "tenho a sensação de que alguém está me olhando" ou "tenho a impressão de que já vim aqui antes".

É uma forma suave e cautelosa de dar uma opinião ou de falar de uma lembrança incerta. Por isso, é muito usada para não soar categórico.

Ele vem depois da forma simples de verbos e adjetivos. Com substantivos, usa-se のような気がする.

Às vezes, ような é omitido, ficando só 気がする, com o mesmo sentido.$$,
    $$気がする também aparece em がする, aprendido no N4, como em 寒気がする.

É muito comum na fala para suavizar opiniões, mesmo quando a pessoa tem certa certeza.

そうな気がする indica um pressentimento sobre algo que vai acontecer: いいことがありそうな気がする.$$,
    $$Verbo / Adjetivo い (forma simples) + ような気がする
Adjetivo な + な + ような気がする
Substantivo + の + ような気がする
Verbo + そうな + 気がする (pressentimento)

Educado: ような気がします
Passado: ような気がした$$,
    $$ような気がする$$,
    $$ような気がする|ような気がします|ような気がした|気がする|気がします|気がした$$,
    ARRAY['ような', '気', 'が', 'する']::text[],
    ARRAY['ような気がする', 'ような気がします', 'ような気がした', '気がする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-175', $$誰かに見られているような気がする。$$, $$だれかにみられているようなきがする。$$, $$Tenho a sensação de que alguém está me olhando.$$),
    ('n3-grammar-175', $$前にもここに来たことがあるような気がします。$$, $$まえにもここにきたことがあるようなきがします。$$, $$Tenho a impressão de que já vim aqui antes.$$),
    ('n3-grammar-175', $$今日は何かいいことがありそうな気がする。$$, $$きょうはなにかいいことがありそうなきがする。$$, $$Tenho o pressentimento de que hoje vai acontecer algo bom.$$),
    ('n3-grammar-175', $$彼は怒っているような気がした。$$, $$かれはおこっているようなきがした。$$, $$Tive a impressão de que ele estava bravo.$$),
    ('n3-grammar-175', $$この歌は聞いたことがあるような気がする。$$, $$このうたはきいたことがあるようなきがする。$$, $$Tenho a impressão de que já ouvi esta música.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家の鍵をかけ忘れた____。$$, $$Tenho a sensação de que esqueci de trancar a casa.$$),
        (2, $$彼女とはどこかで会ったことがある____。$$, $$Tenho a impressão de que já encontrei ela em algum lugar.$$),
        (3, $$天気予報は暖かいと言っていたが、今日は寒い____。$$, $$A previsão disse que ia fazer calor, mas tenho a sensação de que hoje está frio.$$),
        (4, $$さっき、誰かに名前を呼ばれた____。$$, $$Agora há pouco, tive a impressão de que alguém chamou meu nome.$$),
        (5, $$体がだるくて、少し熱がある____。$$, $$Estou com o corpo mole e com a sensação de que estou com um pouco de febre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ような気がする$$),
        (1, $$ような気がします$$),
        (2, $$ような気がする$$),
        (2, $$ような気がします$$),
        (3, $$ような気がする$$),
        (3, $$ような気がします$$),
        (4, $$ような気がした$$),
        (5, $$ような気がする$$),
        (5, $$ような気がします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
