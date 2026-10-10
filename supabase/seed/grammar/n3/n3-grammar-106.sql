-- n3-grammar-106 — せいぜい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-106',
    'grammar',
    'N3',
    $$せいぜい$$,
    $$seizei$$,
    $$No máximo / Quando muito / Na melhor das hipóteses$$,
    $$せいぜい é um advérbio que indica o limite máximo de algo, geralmente com a ideia de que não é muito. Equivale a "no máximo", "quando muito" ou "na melhor das hipóteses".

Ele aparece muito com quantidades, tempos e preços, mostrando que o valor é pequeno ou limitado: "até a estação, a pé, são no máximo dez minutos" ou "virão no máximo umas vinte pessoas".

Também pode indicar o máximo que alguém consegue fazer, com modéstia ou resignação: "o máximo que posso fazer é isso".

O tom costuma ser de "não é grande coisa" ou de cálculo realista.$$,
    $$Em um uso mais antigo e irônico, せいぜい頑張って significa algo como "boa sorte aí" com tom de desdém. Cuidado com esse sentido.

Comparado a 多くても (no máximo), せいぜい soa mais natural na conversa.

O oposto, para "no mínimo", é 少なくとも.$$,
    $$せいぜい + Quantidade / Tempo / Preço + だ / ぐらいだ
せいぜい + … + だろう (estimativa)
Sujeito + にできるのは + せいぜい + … + だ

Escrita: せいぜい / 精々$$,
    $$せいぜい$$,
    $$せいぜい|精々$$,
    ARRAY['せいぜい']::text[],
    ARRAY['せいぜい', '精々']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-106', $$駅まで歩いても、せいぜい十分だ。$$, $$えきまであるいても、せいぜいじゅっぷんだ。$$, $$Mesmo a pé, até a estação são no máximo dez minutos.$$),
    ('n3-grammar-106', $$この仕事なら、せいぜい一時間で終わるだろう。$$, $$このしごとなら、せいぜいいちじかんでおわるだろう。$$, $$Este trabalho deve levar no máximo uma hora.$$),
    ('n3-grammar-106', $$パーティーに来るのは、せいぜい二十人ぐらいだ。$$, $$パーティーにくるのは、せいぜいにじゅうにんぐらいだ。$$, $$Para a festa, devem vir no máximo umas vinte pessoas.$$),
    ('n3-grammar-106', $$私にできるのは、せいぜいこのくらいです。$$, $$わたしにできるのは、せいぜいこのくらいです。$$, $$O máximo que eu consigo fazer é isso.$$),
    ('n3-grammar-106', $$給料が上がっても、せいぜい五千円だろう。$$, $$きゅうりょうがあがっても、せいぜいごせんえんだろう。$$, $$Mesmo que o salário aumente, será no máximo cinco mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この古い車なら、売っても____十万円だろう。$$, $$Um carro velho desses, mesmo vendendo, vai dar no máximo cem mil ienes.$$),
        (2, $$夏休みと言っても、____一週間しかない。$$, $$Férias de verão, que nada: são no máximo uma semana.$$),
        (3, $$忙しくて、練習は____一日一時間しかできない。$$, $$Estou ocupado e consigo treinar no máximo uma hora por dia.$$),
        (4, $$この部屋に入れるのは、____五人だ。$$, $$Neste quarto cabem no máximo cinco pessoas.$$),
        (5, $$明日は雨が降っても、____小雨程度でしょう。$$, $$Mesmo que chova amanhã, deve ser no máximo uma garoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいぜい$$),
        (2, $$せいぜい$$),
        (3, $$せいぜい$$),
        (4, $$せいぜい$$),
        (5, $$せいぜい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
