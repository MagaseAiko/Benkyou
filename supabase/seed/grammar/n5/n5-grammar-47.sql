-- n5-grammar-47 — に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-47',
    'grammar',
    'N5',
    $$に$$,
    $$ni$$,
    $$Em / Para / A / Às$$,
    $$に é uma das partículas mais versáteis do japonês. A ideia central é marcar um "ponto": um ponto no tempo, um ponto no espaço ou o ponto de chegada de uma ação.

Os principais usos são:
• Tempo específico: horários, dias e datas em que algo acontece.
• Lugar de existência: onde algo ou alguém está, com ある e いる.
• Destino: para onde se vai, se vem ou se volta.
• Pessoa que recebe a ação: a quem se dá algo, com quem se encontra, para quem se telefona.
• Ponto de chegada: onde se entra, onde se senta, em que veículo se sobe.
• Frequência: quantas vezes algo acontece em um período.

Para tempos relativos, como hoje, amanhã e toda semana, normalmente não se usa に. Ele é usado com tempos "marcados", como horas, datas e dias da semana.$$,
    $$A diferença entre に e で para lugares é um ponto clássico: に marca onde algo está ou para onde vai, e で marca onde uma ação acontece.

Com destinos, に e へ podem ser trocados na maioria dos casos. に destaca o ponto de chegada, e へ destaca a direção.

Palavras como 今日, 明日, 毎日 e 来週 normalmente não levam に.$$,
    $$Tempo específico + に
Lugar + に + ある / いる
Destino + に + 行く / 来る / 帰る
Pessoa + に + あげる / 会う / 電話する / 聞く
Lugar / Veículo + に + 入る / 乗る / 座る
Período + に + Número de vezes$$,
    $$に$$,
    $$に$$,
    ARRAY['に']::text[],
    ARRAY['に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-47', $$毎朝七時に起きます。$$, $$まいあさしちじにおきます。$$, $$Acordo às sete toda manhã.$$),
    ('n5-grammar-47', $$猫は机の下にいます。$$, $$ねこはつくえのしたにいます。$$, $$O gato está embaixo da mesa.$$),
    ('n5-grammar-47', $$来年、日本に行きます。$$, $$らいねん、にほんにいきます。$$, $$Ano que vem, vou para o Japão.$$),
    ('n5-grammar-47', $$友達に手紙を書きました。$$, $$ともだちにてがみをかきました。$$, $$Escrevi uma carta para um amigo.$$),
    ('n5-grammar-47', $$一週間に三回、ジムに行きます。$$, $$いっしゅうかんにさんかい、ジムにいきます。$$, $$Vou à academia três vezes por semana.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業は九時____始まります。$$, $$A aula começa às nove.$$),
        (2, $$銀行は駅の前____あります。$$, $$O banco fica em frente à estação.$$),
        (3, $$駅で電車____乗ります。$$, $$Pego o trem na estação.$$),
        (4, $$昨日、町で先生____会いました。$$, $$Ontem encontrei o professor na cidade.$$),
        (5, $$一日____二回、薬を飲みます。$$, $$Tomo o remédio duas vezes por dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (2, $$に$$),
        (3, $$に$$),
        (4, $$に$$),
        (5, $$に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
