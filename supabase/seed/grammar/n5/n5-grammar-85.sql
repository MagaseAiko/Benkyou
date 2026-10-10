-- n5-grammar-85 — この・その・あの・どの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-85',
    'grammar',
    'N5',
    $$この・その・あの・どの$$,
    $$kono / sono / ano / dono$$,
    $$Este / Esse / Aquele / Qual$$,
    $$この, その, あの e どの são usados antes de um substantivo para apontar qual coisa ou pessoa está sendo mencionada. Eles nunca aparecem sozinhos: sempre precisam de um substantivo depois.

A lógica de distância é a mesma de これ, それ e あれ:
• この: perto de quem fala ("este").
• その: perto de quem ouve ("esse").
• あの: longe dos dois ("aquele").
• どの: a pergunta "qual?", para escolher entre três ou mais.

A diferença em relação a これ e それ é a função: これ substitui o substantivo, enquanto この acompanha o substantivo.

あの também é usado para lembrar algo que os dois conhecem, como uma época ou um lugar do passado.$$,
    $$Um erro comum é usar この sozinho, sem substantivo. Quando o substantivo não aparece, o certo é usar これ.

Para escolher entre apenas duas opções, o mais natural é どちらの.

A palavra あのう, com som alongado, é uma interjeição usada para chamar a atenção ou hesitar, como "hum...". Não tem a função de あの + substantivo.$$,
    $$この / その / あの / どの + Substantivo

この: perto de quem fala
その: perto de quem ouve
あの: longe dos dois / algo que os dois conhecem
どの: qual (entre três ou mais)$$,
    $$この$$,
    $$この|その|あの|どの$$,
    ARRAY['この', 'その', 'あの', 'どの']::text[],
    ARRAY['この', 'その', 'あの', 'どの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-85', $$この本はおもしろいです。$$, $$このほんはおもしろいです。$$, $$Este livro é interessante.$$),
    ('n5-grammar-85', $$その傘は誰のですか。$$, $$そのかさはだれのですか。$$, $$De quem é esse guarda-chuva?$$),
    ('n5-grammar-85', $$あの人は誰ですか。$$, $$あのひとはだれですか。$$, $$Quem é aquela pessoa?$$),
    ('n5-grammar-85', $$どの電車に乗りますか。$$, $$どのでんしゃにのりますか。$$, $$Em qual trem você vai entrar?$$),
    ('n5-grammar-85', $$あの時は本当に楽しかったね。$$, $$あのときはほんとうにたのしかったね。$$, $$Aquela época foi muito divertida, né?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私が持っている____かばんは新しいです。$$, $$Esta bolsa que estou segurando é nova.$$),
        (2, $$あなたが持っている____ペン、ちょっと貸して。$$, $$Me empresta essa caneta que você está segurando?$$),
        (3, $$遠くに見える____山の名前を知っていますか。$$, $$Você sabe o nome daquela montanha que se vê ao longe?$$),
        (4, $$この三つの中で、____色が好きですか。$$, $$Destas três, de qual cor você gosta?$$),
        (5, $$子供のころ住んでいた____町に、もう一度行きたいです。$$, $$Quero ir mais uma vez àquela cidade onde morei quando criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$この$$),
        (2, $$その$$),
        (3, $$あの$$),
        (4, $$どの$$),
        (5, $$あの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
