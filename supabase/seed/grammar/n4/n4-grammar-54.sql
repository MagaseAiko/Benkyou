-- n4-grammar-54 — 〜なら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-54',
    'grammar',
    'N4',
    $$〜なら$$,
    $$nara$$,
    $$Se / Se for o caso de / Quanto a$$,
    $$なら é uma forma condicional usada para responder ou reagir a algo: uma situação mencionada pelo outro, uma intenção ou um tema da conversa. Equivale a "se", "se for o caso de" ou "quanto a".

O uso mais característico é dar conselhos ou opiniões sobre algo que a outra pessoa disse. Por exemplo, se alguém diz que quer ir ao Japão, você responde: "se for ao Japão, recomendo Kyoto".

Outro uso é apresentar um tema, com o sentido de "falando de...", "quanto a...". Por exemplo, "computadores, aquela loja é barata".

Diferente de たら, com なら a condição não precisa ter acontecido antes. Por isso, a segunda parte pode ser algo que acontece antes da primeira, como preparar algo antes de viajar.

なら vem depois de substantivos e adjetivos な diretamente, e depois da forma simples de verbos e adjetivos い.$$,
    $$なら é muito natural em conversas quando se responde a algo que o outro acabou de dizer.

Com verbos, a frase com なら pode significar "se você vai fazer isso...", e o conselho pode ser algo para fazer antes, como levar um guarda-chuva se for sair.

A forma のなら também existe, com o mesmo sentido e um tom mais explicativo.$$,
    $$Substantivo + なら
Adjetivo な + なら
Verbo (forma simples) + なら
Adjetivo い + なら$$,
    $$なら$$,
    $$なら$$,
    ARRAY['なら']::text[],
    ARRAY['なら', 'のなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-54', $$日本へ行くなら、京都がおすすめです。$$, $$にほんへいくなら、きょうとがおすすめです。$$, $$Se você vai ao Japão, recomendo Kyoto.$$),
    ('n4-grammar-54', $$「パソコンが欲しいんです。」「パソコンなら、あの店が安いですよ。」$$, $$「パソコンがほしいんです。」「パソコンなら、あのみせがやすいですよ。」$$, $$"Quero um computador." "Se é computador, aquela loja é barata."$$),
    ('n4-grammar-54', $$疲れているなら、休んだほうがいい。$$, $$つかれているなら、やすんだほうがいい。$$, $$Se você está cansado, é melhor descansar.$$),
    ('n4-grammar-54', $$明日雨なら、試合は中止です。$$, $$あしたあめなら、しあいはちゅうしです。$$, $$Se chover amanhã, a partida será cancelada.$$),
    ('n4-grammar-54', $$あなたが行くなら、私も行きます。$$, $$あなたがいくなら、わたしもいきます。$$, $$Se você for, eu também vou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「すしが食べたい。」「すし____、駅前の店がいいよ。」$$, $$"Quero comer sushi." "Se é sushi, a loja em frente à estação é boa."$$),
        (2, $$車で行く____、お酒は飲まないでください。$$, $$Se for de carro, não beba álcool.$$),
        (3, $$暇____、ちょっと手伝ってくれませんか。$$, $$Se você estiver livre, pode me ajudar um pouco?$$),
        (4, $$英語の先生を探している____、いい人を知っていますよ。$$, $$Se você está procurando um professor de inglês, conheço uma pessoa boa.$$),
        (5, $$君がそう言う____、信じるよ。$$, $$Se você diz isso, eu acredito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なら$$),
        (2, $$なら$$),
        (3, $$なら$$),
        (4, $$なら$$),
        (5, $$なら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
