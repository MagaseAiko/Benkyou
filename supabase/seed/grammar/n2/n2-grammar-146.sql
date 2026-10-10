-- n2-grammar-146 — そうすると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-146',
    'grammar',
    'N2',
    $$そうすると$$,
    $$sou suru to$$,
    $$Então / Nesse caso / Fazendo isso$$,
    $$そうすると tem dois usos principais.

O primeiro indica o resultado de uma ação. Equivale a "fazendo isso" ou "aí". Por exemplo, "aperte este botão. Aí a porta abre".

O segundo é tirar uma conclusão a partir do que a outra pessoa disse. Equivale a "então" ou "nesse caso". Por exemplo, "a reunião é às três? Então temos que sair às duas".$$,
    $$No primeiro uso, é parecido com すると.

No segundo uso, é parecido com それなら e つまり.$$,
    $$Frase (ação, com ponto final) + そうすると + Resultado
(Fala do outro) + そうすると、 + Conclusão$$,
    $$そうすると$$,
    $$そうすると$$,
    ARRAY['そう', 'すると']::text[],
    ARRAY['そうすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-146', $$このボタンを押してください。そうすると、ドアが開きます。$$, $$このボタンをおしてください。そうすると、ドアがあきます。$$, $$Aperte este botão. Aí a porta abre.$$),
    ('n2-grammar-146', $$「会議は三時からです。」「そうすると、二時には出なければなりませんね。」$$, $$「かいぎはさんじからです。」「そうすると、にじにはでなければなりませんね。」$$, $$A reunião é às três. Então temos que sair às duas, né?$$),
    ('n2-grammar-146', $$毎日少しずつ練習する。そうすると、自然に上手になる。$$, $$まいにちすこしずつれんしゅうする。そうすると、しぜんにじょうずになる。$$, $$Pratique um pouco todo dia. Fazendo isso, você melhora naturalmente.$$),
    ('n2-grammar-146', $$「彼は来ないそうです。」「そうすると、四人ですね。」$$, $$「かれはこないそうです。」「そうすると、よにんですね。」$$, $$Dizem que ele não vem. Nesse caso, seremos quatro, né?$$),
    ('n2-grammar-146', $$窓を開けた。そうすると、涼しい風が入ってきた。$$, $$まどをあけた。そうすると、すずしいかぜがはいってきた。$$, $$Abri a janela. Aí entrou uma brisa fresca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この道をまっすぐ行ってください。____、右に駅が見えます。$$, $$Siga reto por esta rua. Aí você verá a estação à direita.$$),
        (2, $$「明日は休みです。」「____、会議は明後日ですね。」$$, $$Amanhã é folga. Então a reunião é depois de amanhã, né?$$),
        (3, $$水を加えて混ぜます。____、柔らかくなります。$$, $$Acrescente água e misture. Fazendo isso, fica macio.$$),
        (4, $$「料金は一人三千円です。」「____、全部で一万五千円ですね。」$$, $$A taxa é de três mil ienes por pessoa. Nesse caso, ao todo são quinze mil, né?$$),
        (5, $$早く寝るようにした。____、朝が楽になった。$$, $$Comecei a dormir cedo. Aí as manhãs ficaram mais fáceis.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうすると$$),
        (2, $$そうすると$$),
        (3, $$そうすると$$),
        (4, $$そうすると$$),
        (5, $$そうすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
