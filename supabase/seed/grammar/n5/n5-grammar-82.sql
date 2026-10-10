-- n5-grammar-82 — 〜でした・〜ではありませんでした
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-82',
    'grammar',
    'N5',
    $$〜でした・〜ではありませんでした$$,
    $$deshita / dewa arimasen deshita$$,
    $$Era / Foi / Não era / Não foi$$,
    $$でした e ではありませんでした são as formas do passado de です. Elas servem para dizer o que algo "era" ou "foi", e o que "não era" ou "não foi".

São usadas depois de substantivos e de adjetivos な. Por exemplo, para dizer que ontem foi domingo, que alguém era estudante ou que uma prova não foi fácil.

でした é o passado afirmativo. ではありませんでした é o passado negativo, e é formado juntando ではありません com でした. Na fala, では costuma virar じゃ, formando じゃありませんでした.

Existe ainda outra forma educada para o passado negativo: ではなかったです ou じゃなかったです. Ela é um pouco mais leve e muito usada na conversa.

Atenção: com adjetivos い, essas formas não são usadas. O passado do adjetivo い é formado pelo próprio adjetivo, com かった.$$,
    $$Um erro clássico é dizer おいしいでした. Com adjetivos い, o passado correto é おいしかったです.

ではありませんでした soa mais formal e escrito. じゃなかったです é mais comum na conversa do dia a dia.

Essas formas também aparecem depois de の em explicações, como em のでした, mas esse uso é mais avançado.$$,
    $$Substantivo / Adjetivo な + でした
Substantivo / Adjetivo な + ではありませんでした
Substantivo / Adjetivo な + じゃありませんでした
Substantivo / Adjetivo な + ではなかったです / じゃなかったです

Informal: だった / じゃなかった / ではなかった$$,
    $$でした$$,
    $$でした|ではありませんでした|じゃありませんでした|ではなかった|じゃなかった$$,
    ARRAY['でした', 'ではありませんでした']::text[],
    ARRAY['でした', 'ではありませんでした', 'じゃありませんでした', 'ではなかったです', 'じゃなかったです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-82', $$昨日は日曜日でした。$$, $$きのうはにちようびでした。$$, $$Ontem foi domingo.$$),
    ('n5-grammar-82', $$子供のころ、私は静かな子でした。$$, $$こどものころ、わたしはしずかなこでした。$$, $$Quando criança, eu era uma criança quieta.$$),
    ('n5-grammar-82', $$昨日の試験は簡単ではありませんでした。$$, $$きのうのしけんはかんたんではありませんでした。$$, $$A prova de ontem não foi fácil.$$),
    ('n5-grammar-82', $$先週は休みじゃありませんでした。$$, $$せんしゅうはやすみじゃありませんでした。$$, $$Semana passada não foi folga.$$),
    ('n5-grammar-82', $$あの店は、前は有名ではなかったです。$$, $$あのみせは、まえはゆうめいではなかったです。$$, $$Aquela loja, antes, não era famosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日はいい天気____。$$, $$Ontem fez um tempo bom.$$),
        (2, $$父は昔、先生____。$$, $$Meu pai, antigamente, era professor.$$),
        (3, $$昨日のパーティーはあまりにぎやか____。$$, $$A festa de ontem não foi muito animada.$$),
        (4, $$子供のころ、野菜が嫌い____。$$, $$Quando criança, eu não gostava de verdura.$$),
        (5, $$「昨日は暇でしたか。」「いいえ、暇____。」$$, $$"Você estava livre ontem?" "Não, não estava livre."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でした$$),
        (2, $$でした$$),
        (3, $$ではありませんでした$$),
        (3, $$じゃありませんでした$$),
        (3, $$ではなかったです$$),
        (3, $$じゃなかったです$$),
        (4, $$でした$$),
        (5, $$ではありませんでした$$),
        (5, $$じゃありませんでした$$),
        (5, $$ではなかったです$$),
        (5, $$じゃなかったです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
