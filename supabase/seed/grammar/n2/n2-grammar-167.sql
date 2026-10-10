-- n2-grammar-167 — 〜というふうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-167',
    'grammar',
    'N2',
    $$〜というふうに$$,
    $$to iu fuu ni$$,
    $$Desta forma / Assim como / Do jeito que$$,
    $$というふうに serve para mostrar a forma ou o modo como algo é feito, geralmente dando exemplos. Equivale a "desta forma" ou "do jeito que".

A pessoa explica um padrão ou uma maneira de fazer algo, muitas vezes listando exemplos. Por exemplo, "segunda é inglês, terça é matemática, desta forma estudo uma matéria por dia".

Também pode citar o que alguém disse ou pensou, como "ele disse que viria, desse jeito".$$,
    $$É parecido com というように e のように.

Na fala, aparece muito como っていうふうに.$$,
    $$Frase + というふうに + Verbo
Frase + というふうな / というふうだ$$,
    $$というふうに$$,
    $$というふうに|というふうな|というように|っていうふうに$$,
    ARRAY['と', 'いう', 'ふう', 'に']::text[],
    ARRAY['というふうに', 'というふうな', 'というように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-167', $$月曜日は英語、火曜日は数学というふうに、毎日違う科目を勉強している。$$, $$げつようびはえいご、かようびはすうがくというふうに、まいにちちがうかもくをべんきょうしている。$$, $$Segunda é inglês, terça é matemática, desta forma estudo uma matéria diferente por dia.$$),
    ('n2-grammar-167', $$彼は来ないというふうに言っていた。$$, $$かれはこないというふうにいっていた。$$, $$Ele disse, desse jeito, que não viria.$$),
    ('n2-grammar-167', $$朝はジョギング、夜はヨガというふうに、運動を続けている。$$, $$あさはジョギング、よるはヨガというふうに、うんどうをつづけている。$$, $$De manhã corrida, à noite ioga, desta forma continuo me exercitando.$$),
    ('n2-grammar-167', $$一人が質問して、もう一人が答えるというふうに練習してください。$$, $$ひとりがしつもんして、もうひとりがこたえるというふうにれんしゅうしてください。$$, $$Pratiquem assim: um pergunta e o outro responde.$$),
    ('n2-grammar-167', $$最初に予約して、次に支払うというふうに手続きを進めます。$$, $$さいしょによやくして、つぎにしはらうというふうにてつづきをすすめます。$$, $$O procedimento segue assim: primeiro reserva e depois paga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人ずつ順番に話す____、会議を進めよう。$$, $$Vamos conduzir a reunião assim: cada um fala na sua vez.$$),
        (2, $$春は桜、秋は紅葉____、季節ごとに楽しめる。$$, $$Na primavera as cerejeiras, no outono as folhas vermelhas, desta forma dá para aproveitar cada estação.$$),
        (3, $$先生は明日休む____言っていた。$$, $$O professor disse que amanhã vai faltar.$$),
        (4, $$左手でこれを押さえて、右手で切る____してください。$$, $$Faça assim: segure isto com a mão esquerda e corte com a direita.$$),
        (5, $$毎日少しずつ貯金する____、目標を立てた。$$, $$Estabeleci uma meta desta forma: economizar um pouco todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というふうに$$),
        (1, $$というように$$),
        (2, $$というふうに$$),
        (2, $$というように$$),
        (3, $$というふうに$$),
        (3, $$というように$$),
        (4, $$というふうに$$),
        (4, $$というように$$),
        (5, $$というふうに$$),
        (5, $$というように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
