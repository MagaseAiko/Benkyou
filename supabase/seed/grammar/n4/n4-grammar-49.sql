-- n4-grammar-49 — 〜など
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-49',
    'grammar',
    'N4',
    $$〜など$$,
    $$nado$$,
    $$Etc. / E outros / Coisas como$$,
    $$など é usado depois de substantivos para indicar que existem outras coisas além das mencionadas. Equivale a "etc.", "e outros" ou "coisas como".

É muito comum no final de uma lista feita com や, reforçando a ideia de que os itens citados são apenas exemplos. Mas também pode vir depois de um único substantivo.

Depois de など, vêm as partículas normalmente, como が, を, に e の.

など também é usado para dar uma sugestão de forma suave, como oferecer "um chá ou algo assim", deixando a outra pessoa à vontade para escolher.$$,
    $$Na fala casual, など costuma virar なんか, que também pode ter um tom de desprezo em alguns contextos, como "uma coisa dessas".

など também aparece com sentido de modéstia ou desvalorização, como dizer que algo seu não é grande coisa. Esse uso é mais avançado.

Em textos formais, など aparece muito em listas de exemplos, como em instruções e explicações.$$,
    $$Substantivo A + や + Substantivo B + など + partícula
Substantivo + など + partícula
Substantivo + など + の + Substantivo
Substantivo + など + いかがですか (sugestão suave)$$,
    $$など$$,
    $$など$$,
    ARRAY['など']::text[],
    ARRAY['など']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-49', $$机の上に本やノートなどがあります。$$, $$つくえのうえにほんやノートなどがあります。$$, $$Em cima da mesa tem livros, cadernos e outras coisas.$$),
    ('n4-grammar-49', $$旅行で京都や奈良などに行きました。$$, $$りょこうできょうとやならなどにいきました。$$, $$Na viagem, fui a lugares como Kyoto e Nara.$$),
    ('n4-grammar-49', $$私はりんごやバナナなどの果物が好きです。$$, $$わたしはりんごやバナナなどのくだものがすきです。$$, $$Gosto de frutas como maçã e banana.$$),
    ('n4-grammar-49', $$週末は掃除や洗濯などをします。$$, $$しゅうまつはそうじやせんたくなどをします。$$, $$No fim de semana, faço limpeza, lavo roupa e outras coisas.$$),
    ('n4-grammar-49', $$お茶などいかがですか。$$, $$おちゃなどいかがですか。$$, $$Aceita um chá ou algo assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に肉や魚____が入っています。$$, $$Na geladeira tem carne, peixe e outras coisas.$$),
        (2, $$スポーツはサッカーやテニス____をします。$$, $$De esportes, jogo futebol, tênis e outros.$$),
        (3, $$学校で日本語や英語____を勉強しています。$$, $$Na escola estudo japonês, inglês e outras matérias.$$),
        (4, $$東京や大阪____の大きい町に住みたい。$$, $$Quero morar numa cidade grande como Tóquio ou Osaka.$$),
        (5, $$食後に、コーヒー____いかがですか。$$, $$Depois da refeição, aceita um café ou algo assim?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$など$$),
        (2, $$など$$),
        (3, $$など$$),
        (4, $$など$$),
        (5, $$など$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
