-- n5-grammar-64 — 〜たり〜たりする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-64',
    'grammar',
    'N5',
    $$〜たり〜たりする$$,
    $$tari ~ tari suru$$,
    $$Fazer coisas como... e... / Às vezes... às vezes...$$,
    $$たり〜たりする é usado para listar ações como exemplos, sem dizer que são as únicas. Equivale a "fazer coisas como A e B".

Cada verbo da lista vai para a forma た e recebe り. No final, a frase termina com する, que carrega o tempo e o nível de formalidade: します, しました, しています.

A ordem das ações não importa e não indica sequência. A ideia é apenas mostrar alguns exemplos do que se faz ou fez.

Quando os dois verbos são opostos, como vir e não vir, ou quente e frio, a estrutura indica alternância: "às vezes A, às vezes B".

Também é possível usar só um たり para dar um exemplo, deixando subentendido que há outras coisas.$$,
    $$Um erro comum é esquecer o する no final. Sem ele, a frase fica incompleta.

Para listar ações em ordem, uma depois da outra, o japonês usa a forma て, e não たり.

Com substantivos, a lista de exemplos é feita com や, que tem uma ideia parecida.$$,
    $$Verbo A na forma た + り + Verbo B na forma た + り + する
Verbo na forma た + り + する (um único exemplo)
Adjetivo い sem い + かったり
Substantivo / Adjetivo な + だったり

Com verbos cuja forma た termina em だ: だり$$,
    $$たり$$,
    $$たり|だり$$,
    ARRAY['たり', 'する']::text[],
    ARRAY['たり', 'だり', 'たりする', 'たりします', 'たりしました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-64', $$週末は掃除をしたり、洗濯をしたりします。$$, $$しゅうまつはそうじをしたり、せんたくをしたりします。$$, $$No fim de semana, faço coisas como limpar a casa e lavar roupa.$$),
    ('n5-grammar-64', $$休みの日は本を読んだり、映画を見たりしています。$$, $$やすみのひはほんをよんだり、えいがをみたりしています。$$, $$Nos dias de folga, fico lendo livros, vendo filmes e coisas assim.$$),
    ('n5-grammar-64', $$パーティーで歌ったり踊ったりしました。$$, $$パーティーでうたったりおどったりしました。$$, $$Na festa, cantamos, dançamos e tudo mais.$$),
    ('n5-grammar-64', $$最近、天気は暑かったり寒かったりします。$$, $$さいきん、てんきはあつかったりさむかったりします。$$, $$Ultimamente, o tempo às vezes está quente, às vezes frio.$$),
    ('n5-grammar-64', $$昨日は友達と買い物をしたりして、楽しかったです。$$, $$きのうはともだちとかいものをしたりして、たのしかったです。$$, $$Ontem fiz compras com amigos, entre outras coisas, e foi divertido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日曜日はテレビを見____、ゲームをしたりします。$$, $$No domingo, faço coisas como ver TV e jogar videogame.$$),
        (2, $$夏休みは海で泳い____、山に登ったりしました。$$, $$Nas férias de verão, nadei no mar, subi montanhas e tudo mais.$$),
        (3, $$電車の中で音楽を聞い____、寝たりします。$$, $$No trem, faço coisas como ouvir música e dormir.$$),
        (4, $$彼は授業に来____来なかったりします。$$, $$Ele às vezes vem à aula, às vezes não.$$),
        (5, $$カフェで友達と話し____、お茶を飲んだりしました。$$, $$Na cafeteria, conversei com amigos, tomei chá e coisas assim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たり$$),
        (2, $$だり$$),
        (3, $$たり$$),
        (4, $$たり$$),
        (5, $$たり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
