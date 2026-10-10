-- n1-grammar-206 — 〜というところだ / 〜といったところだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-206',
    'grammar',
    'N1',
    $$〜というところだ / 〜といったところだ$$,
    $$to iu tokoro da / to itta tokoro da$$,
    $$Mais ou menos / No máximo / É por aí$$,
    $$というところだ e といったところだ indicam que algo está aproximadamente em um certo nível, geralmente não muito alto. Equivalem a "mais ou menos" ou "no máximo".

A pessoa dá uma estimativa modesta. Por exemplo, "o salário é de no máximo duzentos mil ienes" ou "o resultado foi mais ou menos razoável".

É uma expressão comum na fala.$$,
    $$Muitas vezes a pessoa quer dizer que o nível não é tão grande quanto se imagina.

Também aparece como というところです, mais educado.$$,
    $$Substantivo / Número + というところだ
Substantivo / Número + といったところだ$$,
    $$というところだ$$,
    $$というところだ|といったところだ|というところです|といったところです$$,
    ARRAY['という', 'ところ', 'だ']::text[],
    ARRAY['というところだ', 'といったところだ', 'というところです', 'といったところです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-206', $$ここから駅までは、歩いて十分というところだ。$$, $$ここからえきまでは、あるいてじゅっぷんというところだ。$$, $$Daqui até a estação são uns dez minutos a pé, mais ou menos.$$),
    ('n1-grammar-206', $$この仕事の給料は、月二十万円といったところだ。$$, $$このしごとのきゅうりょうは、つきにじゅうまんえんといったところだ。$$, $$O salário deste trabalho é de no máximo duzentos mil ienes por mês.$$),
    ('n1-grammar-206', $$試験の出来は、まあまあといったところです。$$, $$しけんのできは、まあまあといったところです。$$, $$Fui mais ou menos na prova.$$),
    ('n1-grammar-206', $$参加者は五十人というところだろう。$$, $$さんかしゃはごじゅうにんというところだろう。$$, $$Os participantes devem ser uns cinquenta, é por aí.$$),
    ('n1-grammar-206', $$完成まであと一週間といったところだ。$$, $$かんせいまであといっしゅうかんといったところだ。$$, $$Falta mais ou menos uma semana para terminar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の英語は、日常会話ができる程度____。$$, $$Meu inglês é mais ou menos o suficiente para conversas do dia a dia.$$),
        (2, $$今年の売り上げは、去年と同じくらい____。$$, $$As vendas deste ano estão mais ou menos iguais às do ano passado.$$),
        (3, $$この店の味は、普通____。$$, $$O sabor desta loja é mais ou menos normal.$$),
        (4, $$ゴールまで、あと少し____。$$, $$Falta mais ou menos pouco para chegar ao objetivo.$$),
        (5, $$今の気温は、十度____。$$, $$A temperatura agora está em uns dez graus, é por aí.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-206', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というところだ$$),
        (1, $$といったところだ$$),
        (1, $$というところです$$),
        (1, $$といったところです$$),
        (2, $$というところだ$$),
        (2, $$といったところだ$$),
        (2, $$というところです$$),
        (2, $$といったところです$$),
        (3, $$というところだ$$),
        (3, $$といったところだ$$),
        (3, $$というところです$$),
        (3, $$といったところです$$),
        (4, $$というところだ$$),
        (4, $$といったところだ$$),
        (4, $$というところです$$),
        (4, $$といったところです$$),
        (5, $$というところだ$$),
        (5, $$といったところだ$$),
        (5, $$というところです$$),
        (5, $$といったところです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
