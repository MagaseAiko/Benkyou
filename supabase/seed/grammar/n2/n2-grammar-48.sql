-- n2-grammar-48 — 〜からこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-48',
    'grammar',
    'N2',
    $$〜からこそ$$,
    $$kara koso$$,
    $$Justamente porque / É exatamente por isso que$$,
    $$からこそ é usado para enfatizar que um motivo específico é o verdadeiro ou o mais importante. Equivale a "justamente porque" ou "é exatamente por isso que".

Ele junta から (porque) com こそ (ênfase). A ideia é destacar o motivo, muitas vezes de forma surpreendente ou contrária ao senso comum.

Por exemplo, "falo com rigor justamente porque gosto de você" ou "é justamente por ter falhado que se pode aprender".

Muitas vezes, o motivo pareceria negativo à primeira vista, mas, na verdade, é a razão de algo positivo. Por exemplo, "é justamente por estar ocupado que o descanso é importante".

A frase costuma terminar com のだ ou です, reforçando a explicação.$$,
    $$からこそ não é usado com motivos negativos para resultados negativos simples. Ele destaca um motivo especial, muitas vezes com valor positivo.

Em discursos e cartas, からこそ é usado para expressar convicção e gratidão.

Comparado a ばこそ (N1), からこそ é mais comum na conversa.$$,
    $$Verbo / Adjetivo (forma simples) + からこそ、 + Resultado / Opinião
Substantivo / Adjetivo な + だ + からこそ
… + からこそ + 〜のだ / 〜んです$$,
    $$からこそ$$,
    $$からこそ$$,
    ARRAY['から', 'こそ']::text[],
    ARRAY['からこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-48', $$あなたのことが好きだからこそ、厳しく言うのです。$$, $$あなたのことがすきだからこそ、きびしくいうのです。$$, $$Falo com rigor justamente porque gosto de você.$$),
    ('n2-grammar-48', $$失敗したからこそ、学べることもある。$$, $$しっぱいしたからこそ、まなべることもある。$$, $$É justamente por ter falhado que há coisas que se pode aprender.$$),
    ('n2-grammar-48', $$毎日努力したからこそ、成功できた。$$, $$まいにちどりょくしたからこそ、せいこうできた。$$, $$Foi justamente por ter me esforçado todo dia que consegui ter sucesso.$$),
    ('n2-grammar-48', $$忙しいからこそ、休みが大切だ。$$, $$いそがしいからこそ、やすみがたいせつだ。$$, $$É justamente por estar ocupado que o descanso é importante.$$),
    ('n2-grammar-48', $$家族がいるからこそ、頑張れる。$$, $$かぞくがいるからこそ、がんばれる。$$, $$É justamente por ter a família que consigo me esforçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達だ____、本当のことを言う。$$, $$Justamente por sermos amigos, digo a verdade.$$),
        (2, $$苦労した____、今の幸せがある。$$, $$É justamente por ter passado dificuldades que tenho a felicidade de hoje.$$),
        (3, $$この仕事は難しい____、やりがいがある。$$, $$É justamente por ser difícil que este trabalho é gratificante.$$),
        (4, $$好きだ____、毎日続けられる。$$, $$É justamente por gostar que consigo continuar todos os dias.$$),
        (5, $$大切な人だ____、守りたい。$$, $$Justamente por ser uma pessoa importante, quero protegê-la.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からこそ$$),
        (2, $$からこそ$$),
        (3, $$からこそ$$),
        (4, $$からこそ$$),
        (5, $$からこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
