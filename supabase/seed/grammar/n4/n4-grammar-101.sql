-- n4-grammar-101 — 〜てしまう・〜ちゃう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-101',
    'grammar',
    'N4',
    $$〜てしまう・〜ちゃう$$,
    $$te shimau / chau$$,
    $$Acabar fazendo / Fazer sem querer / Terminar completamente$$,
    $$てしまう tem dois usos principais.

O primeiro é indicar que uma ação foi concluída completamente, até o fim. Por exemplo, terminar toda a lição ou ler o livro inteiro. Com たい, expressa vontade de acabar logo com algo.

O segundo, muito comum, é expressar arrependimento, lamento ou que algo aconteceu sem querer. Por exemplo, esquecer o guarda-chuva no trem ou quebrar um prato importante. O tom é de "acabei fazendo isso" ou "que pena".

Às vezes, os dois sentidos se misturam, e o contexto mostra se o tom é neutro ou de lamento.

Na fala casual, てしまう é reduzido para ちゃう, e でしまう para じゃう. No passado, ficam ちゃった e じゃった.$$,
    $$ちゃった e じゃった são extremamente comuns na conversa do dia a dia, principalmente para contar pequenos acidentes ou erros.

Em algumas regiões, existe ainda a forma てまう, típica do dialeto de Kansai.

Compare: 忘れた apenas informa o fato; 忘れてしまった mostra que a pessoa lamenta ter esquecido.$$,
    $$Verbo na forma て + しまう

Educado: てしまいます
Passado: てしまった / てしまいました
Fala casual: てしまう → ちゃう / でしまう → じゃう
Passado casual: ちゃった / じゃった$$,
    $$てしまう$$,
    $$てしま|でしま|ちゃう|ちゃった|じゃう|じゃった|ちゃいま|じゃいま$$,
    ARRAY['て', 'しまう']::text[],
    ARRAY['てしまう', 'てしまった', 'てしまいました', 'ちゃう', 'ちゃった', 'じゃう', 'じゃった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-101', $$昨日の夜、宿題を全部やってしまいました。$$, $$きのうのよる、しゅくだいをぜんぶやってしまいました。$$, $$Ontem à noite, terminei toda a lição.$$),
    ('n4-grammar-101', $$電車の中に傘を忘れてしまった。$$, $$でんしゃのなかにかさをわすれてしまった。$$, $$Acabei esquecendo o guarda-chuva no trem.$$),
    ('n4-grammar-101', $$ケーキを全部食べちゃった。$$, $$ケーキをぜんぶたべちゃった。$$, $$Acabei comendo o bolo inteiro.$$),
    ('n4-grammar-101', $$大事な皿を割ってしまいました。$$, $$だいじなさらをわってしまいました。$$, $$Acabei quebrando um prato importante.$$),
    ('n4-grammar-101', $$早くこの本を読んでしまいたい。$$, $$はやくこのほんをよんでしまいたい。$$, $$Quero terminar de ler este livro logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅で財布をなくし____。$$, $$Acabei perdendo a carteira na estação.$$),
        (2, $$寝坊して、授業に遅れ____。$$, $$Dormi demais e acabei me atrasando para a aula.$$),
        (3, $$今日中にこの仕事をやっ____ます。$$, $$Vou terminar este trabalho ainda hoje.$$),
        (4, $$つい、友達の秘密を話し____。$$, $$Sem querer, acabei contando o segredo do meu amigo.$$),
        (5, $$間違えて、人のジュースを飲ん____。$$, $$Por engano, acabei bebendo o suco de outra pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしまいました$$),
        (1, $$てしまった$$),
        (1, $$ちゃった$$),
        (2, $$てしまいました$$),
        (2, $$てしまった$$),
        (2, $$ちゃった$$),
        (3, $$てしまい$$),
        (4, $$てしまった$$),
        (4, $$ちゃった$$),
        (4, $$てしまいました$$),
        (5, $$でしまった$$),
        (5, $$じゃった$$),
        (5, $$でしまいました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
