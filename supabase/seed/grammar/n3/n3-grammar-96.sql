-- n3-grammar-96 — 〜おかげで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-96',
    'grammar',
    'N3',
    $$〜おかげで$$,
    $$okage de$$,
    $$Graças a / Por causa de (positivo)$$,
    $$おかげで é usado para indicar que algo bom aconteceu graças a uma pessoa, uma ação ou uma circunstância. Equivale a "graças a".

A primeira parte mostra a causa, e a segunda, o resultado positivo. O tom é de gratidão. Por exemplo, "graças ao professor, passei na prova" ou "graças ao remédio, a febre baixou".

Ele vem depois de substantivos com の, e da forma simples de verbos e adjetivos.

Na forma おかげだ ou おかげです, no final da frase, expressa gratidão diretamente: "consegui graças a todos vocês".

O oposto, para causas negativas, é せいで.$$,
    $$A expressão おかげさまで é uma resposta educada e muito comum quando alguém pergunta como você está: "graças a Deus / graças a vocês, estou bem".

Às vezes, おかげで é usado com ironia para algo ruim, como "graças a você, me atrasei". Nesse caso, o tom é sarcástico.

A diferença entre おかげで e せいで é só o tom: positivo ou negativo.$$,
    $$Substantivo + の + おかげで + Resultado positivo
Verbo / Adjetivo (forma simples, geralmente passado) + おかげで + Resultado
Adjetivo な + な + おかげで
… + のは + 〜のおかげだ / おかげです

Escrita: おかげ / お陰$$,
    $$おかげで$$,
    $$おかげで|おかげだ|おかげです|お陰で$$,
    ARRAY['おかげ', 'で']::text[],
    ARRAY['おかげで', 'おかげだ', 'おかげです', 'おかげさまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-96', $$先生のおかげで、試験に合格できました。$$, $$せんせいのおかげで、しけんにごうかくできました。$$, $$Graças ao professor, consegui passar na prova.$$),
    ('n3-grammar-96', $$薬を飲んだおかげで、熱が下がった。$$, $$くすりをのんだおかげで、ねつがさがった。$$, $$Graças ao remédio que tomei, a febre baixou.$$),
    ('n3-grammar-96', $$天気がよかったおかげで、楽しい旅行になった。$$, $$てんきがよかったおかげで、たのしいりょこうになった。$$, $$Graças ao tempo bom, a viagem foi divertida.$$),
    ('n3-grammar-96', $$友達が手伝ってくれたおかげで、早く終わった。$$, $$ともだちがてつだってくれたおかげで、はやくおわった。$$, $$Graças à ajuda do meu amigo, terminei cedo.$$),
    ('n3-grammar-96', $$成功できたのは、みんなのおかげです。$$, $$せいこうできたのは、みんなのおかげです。$$, $$Se consegui ter sucesso, foi graças a todos vocês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族の____、元気に暮らしています。$$, $$Graças à minha família, vivo bem e com saúde.$$),
        (2, $$毎日練習した____、上手になった。$$, $$Graças ao treino diário, melhorei.$$),
        (3, $$地図があった____、道に迷わなかった。$$, $$Graças ao mapa, não me perdi.$$),
        (4, $$早く寝た____、今朝は気分がいい。$$, $$Graças a ter dormido cedo, hoje de manhã estou me sentindo bem.$$),
        (5, $$田中さんが教えてくれた____、わかりました。$$, $$Graças à explicação do Tanaka, entendi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おかげで$$),
        (2, $$おかげで$$),
        (3, $$おかげで$$),
        (4, $$おかげで$$),
        (5, $$おかげで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
