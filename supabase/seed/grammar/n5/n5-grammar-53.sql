-- n5-grammar-53 — 〜のが下手
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-53',
    'grammar',
    'N5',
    $$〜のが下手$$,
    $$no ga heta$$,
    $$Ser ruim em (fazer) / Não ter jeito para$$,
    $$のが下手 é usado para dizer que alguém não é bom em fazer alguma coisa. Equivale a "ser ruim em" ou "não ter jeito para".

下手 é um adjetivo な que significa "ruim em", "sem habilidade". Para falar de uma ação, e não de uma coisa, é preciso transformar o verbo em substantivo. Isso é feito com の: o verbo na forma de dicionário + の vira algo como "o ato de fazer".

Como 下手 indica a habilidade em relação a algo, a ação é marcada com が, e não com を. A pessoa que tem a dificuldade costuma vir com は.

Com substantivos, como esportes ou idiomas, não é preciso の: basta usar o substantivo + が + 下手.$$,
    $$Falar de si mesmo com 下手 é natural e humilde. Já dizer que outra pessoa é 下手 pode soar rude, então é melhor evitar dizer isso diretamente.

Para falar de algo em que você tem dificuldade ou não gosta de fazer, 苦手 também é muito usado. 苦手 tem mais a ideia de "não me dou bem com isso".

O oposto de 下手 é 上手.$$,
    $$Verbo na forma de dicionário + のが + 下手 + です / だ
Substantivo + が + 下手 + です / だ
Pessoa + は + Verbo + のが下手

Negativo: のが下手じゃない
Escrita: 下手 / へた$$,
    $$のが下手$$,
    $$のが下手|のがへた$$,
    ARRAY['の', 'が', '下手']::text[],
    ARRAY['のが下手', 'のがへた', 'のが下手です', 'のが下手だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-53', $$私は歌うのが下手です。$$, $$わたしはうたうのがへたです。$$, $$Eu sou ruim em cantar.$$),
    ('n5-grammar-53', $$兄は料理を作るのが下手だ。$$, $$あにはりょうりをつくるのがへただ。$$, $$Meu irmão mais velho não tem jeito para cozinhar.$$),
    ('n5-grammar-53', $$字を書くのが下手なので、パソコンを使います。$$, $$じをかくのがへたなので、パソコンをつかいます。$$, $$Como minha letra é ruim, uso o computador.$$),
    ('n5-grammar-53', $$父は人の名前を覚えるのが下手です。$$, $$ちちはひとのなまえをおぼえるのがへたです。$$, $$Meu pai é ruim em lembrar o nome das pessoas.$$),
    ('n5-grammar-53', $$私は絵を描くのが下手ですが、好きです。$$, $$わたしはえをかくのがへたですが、すきです。$$, $$Sou ruim em desenhar, mas gosto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は泳ぐ____です。$$, $$Eu sou ruim em nadar.$$),
        (2, $$弟は朝早く起きる____。$$, $$Meu irmão mais novo é ruim em acordar cedo.$$),
        (3, $$私は人の前で話す____です。$$, $$Eu sou ruim em falar na frente das pessoas.$$),
        (4, $$母は機械を使う____です。$$, $$Minha mãe não tem jeito para usar máquinas.$$),
        (5, $$彼はダンスをする____けど、とても楽しそうです。$$, $$Ele dança mal, mas parece se divertir muito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが下手$$),
        (1, $$のがへた$$),
        (2, $$のが下手です$$),
        (2, $$のがへたです$$),
        (2, $$のが下手だ$$),
        (2, $$のがへただ$$),
        (3, $$のが下手$$),
        (3, $$のがへた$$),
        (4, $$のが下手$$),
        (4, $$のがへた$$),
        (5, $$のが下手だ$$),
        (5, $$のがへただ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
