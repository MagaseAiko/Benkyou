-- n1-grammar-140 — 〜のなんのって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-140',
    'grammar',
    'N1',
    $$〜のなんのって$$,
    $$no nan no tte$$,
    $$Nem te conto / Muito mesmo / Demais$$,
    $$のなんのって expressa que algo foi tão intenso que é difícil descrever com palavras. Equivale a "nem te conto" ou "muito mesmo".

É uma expressão coloquial e emotiva, usada para contar uma experiência marcante. Por exemplo, "estava frio que nem te conto".

Na fala, também aparece como のなんの.$$,
    $$Costuma ser seguido de uma frase que mostra a consequência, como "não conseguia nem me mexer".

É muito usado ao relatar experiências na fala.$$,
    $$Adjetivo い + のなんのって
Adjetivo な + な + のなんのって
Verbo (forma simples) + のなんのって$$,
    $$のなんのって$$,
    $$のなんのって|のなんの$$,
    ARRAY['の', 'なん', 'の', 'って']::text[],
    ARRAY['のなんのって', 'のなんの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-140', $$昨日は寒いのなんのって、手が動かなかった。$$, $$きのうはさむいのなんのって、てがうごかなかった。$$, $$Ontem estava frio que nem te conto, não conseguia mexer as mãos.$$),
    ('n1-grammar-140', $$あの店のラーメンはおいしいのなんのって。$$, $$あのみせのラーメンはおいしいのなんのって。$$, $$O lámen daquela loja é gostoso demais.$$),
    ('n1-grammar-140', $$子供が生まれて、うれしいのなんのって。$$, $$こどもがうまれて、うれしいのなんのって。$$, $$Meu filho nasceu e fiquei feliz que nem te conto.$$),
    ('n1-grammar-140', $$試験が難しいのなんのって、全然できなかった。$$, $$しけんがむずかしいのなんのって、ぜんぜんできなかった。$$, $$A prova foi difícil demais, não consegui fazer nada.$$),
    ('n1-grammar-140', $$彼の話が面白いのなんのって、ずっと笑っていた。$$, $$かれのはなしがおもしろいのなんのって、ずっとわらっていた。$$, $$A conversa dele foi engraçada demais, fiquei rindo o tempo todo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の山登りは疲れた____、すぐに寝てしまった。$$, $$A caminhada na montanha ontem foi cansativa demais, dormi na hora.$$),
        (2, $$その映画は怖い____、夜眠れなかった。$$, $$Esse filme foi tão assustador que não consegui dormir à noite.$$),
        (3, $$夏の東京は暑い____。$$, $$Tóquio no verão é quente que nem te conto.$$),
        (4, $$駅前はにぎやかな____、まっすぐ歩けないほどだった。$$, $$A frente da estação estava tão movimentada que mal dava para andar reto.$$),
        (5, $$歯が痛い____、何も食べられなかった。$$, $$O dente doía tanto que não consegui comer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のなんのって$$),
        (1, $$のなんの$$),
        (2, $$のなんのって$$),
        (2, $$のなんの$$),
        (3, $$のなんのって$$),
        (3, $$のなんの$$),
        (4, $$のなんのって$$),
        (4, $$のなんの$$),
        (5, $$のなんのって$$),
        (5, $$のなんの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
