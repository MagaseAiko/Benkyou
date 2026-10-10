-- n5-grammar-31 — 〜ませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-31',
    'grammar',
    'N5',
    $$〜ませんか$$,
    $$masen ka$$,
    $$Que tal...? / Você não quer...? / Vamos...?$$,
    $$ませんか é usado para fazer convites de forma educada. Equivale a "você não quer...?" ou "que tal...?".

A forma é negativa (ません) com か de pergunta, mas o sentido não é negativo. Perguntar "você não vai...?" deixa a outra pessoa livre para recusar, e por isso soa gentil e respeitoso.

Esse é o jeito mais educado e comum de convidar alguém no nível N5. Ele combina muito com 一緒に, quando você quer fazer algo junto com a pessoa.

Na fala informal, entre amigos, o mesmo convite é feito com a forma ない e entonação de pergunta, como "não quer ir?".$$,
    $$A diferença entre ませんか e ましょう está na pressão: ませんか pergunta a vontade do outro, enquanto ましょう já propõe a ação como se estivesse decidido. Por isso, ませんか é mais adequado para convidar alguém pela primeira vez.

Para recusar um convite de forma educada, os japoneses raramente dizem "não" diretamente. É comum usar ちょっと… e deixar a frase incompleta.

Quando alguém aceita um convite feito com ませんか, a resposta natural é いいですね ou ええ、〜ましょう.$$,
    $$Verbo na forma ます sem ます + ませんか
一緒に + Verbo ませんか

Informal: Verbo na forma ない + ？ (com entonação de pergunta)$$,
    $$ませんか$$,
    $$ませんか$$,
    ARRAY['ません', 'か']::text[],
    ARRAY['ませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-31', $$一緒に昼ご飯を食べませんか。$$, $$いっしょにひるごはんをたべませんか。$$, $$Quer almoçar comigo?$$),
    ('n5-grammar-31', $$週末、映画を見に行きませんか。$$, $$しゅうまつ、えいがをみにいきませんか。$$, $$Que tal irmos ver um filme no fim de semana?$$),
    ('n5-grammar-31', $$ちょっと休みませんか。$$, $$ちょっとやすみませんか。$$, $$Que tal descansarmos um pouco?$$),
    ('n5-grammar-31', $$今度、うちに遊びに来ませんか。$$, $$こんど、うちにあそびにきませんか。$$, $$Da próxima vez, não quer vir aqui em casa?$$),
    ('n5-grammar-31', $$「お茶でも飲みませんか。」「いいですね。」$$, $$「おちゃでものみませんか。」「いいですね。」$$, $$"Que tal tomarmos um chá?" "Boa ideia."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、一緒にテニスをし____。$$, $$Amanhã, quer jogar tênis comigo?$$),
        (2, $$日曜日、公園に行き____。$$, $$Que tal irmos ao parque no domingo?$$),
        (3, $$駅の前のカフェでコーヒーを飲み____。$$, $$Que tal tomarmos um café na cafeteria em frente à estação?$$),
        (4, $$「今晩、一緒にご飯を食べ____。」「すみません、今晩はちょっと…。」$$, $$"Quer jantar comigo hoje?" "Desculpe, hoje não dá..."$$),
        (5, $$夏休みに、一緒に沖縄へ行き____。$$, $$Nas férias de verão, não quer ir a Okinawa comigo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ませんか$$),
        (2, $$ませんか$$),
        (3, $$ませんか$$),
        (4, $$ませんか$$),
        (5, $$ませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
