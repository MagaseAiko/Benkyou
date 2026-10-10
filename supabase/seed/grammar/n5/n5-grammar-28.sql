-- n5-grammar-28 — まだ〜ていません
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-28',
    'grammar',
    'N5',
    $$まだ〜ていません$$,
    $$mada ~ te imasen$$,
    $$Ainda não (fiz) / Ainda não aconteceu$$,
    $$まだ〜ていません é usado para dizer que algo ainda não foi feito ou ainda não aconteceu até agora, mas que pode ou deve acontecer depois.

A estrutura junta まだ (ainda) com o verbo na forma て seguido de いません. A forma ている aqui não indica uma ação em andamento, e sim um estado: "estar sem ter feito". A ideia é que a situação "não feito" continua até o momento atual.

Um ponto muito importante: em japonês, para dizer "ainda não fiz", não se usa o passado negativo ませんでした. O passado negativo indica que algo não aconteceu em um momento terminado do passado, enquanto まだ〜ていません fala do estado atual.

Na forma informal, usa-se ていない, e na fala casual é comum reduzir para てない.$$,
    $$Responder "ainda não" a uma pergunta com もう〜ましたか pode ser feito de duas formas: com a frase completa usando ていません, ou de forma curta com まだです.

Usar ませんでした no lugar de ていません é um erro muito comum de estudantes. Com ませんでした, a frase passa a ideia de que a oportunidade já acabou.

Na fala rápida, a forma ていない vira てない, e でいない vira でない.$$,
    $$まだ + Verbo na forma て + いません (educado)
まだ + Verbo na forma て + いない (informal)
まだ + Verbo na forma て + ない (informal falado)$$,
    $$ていません$$,
    $$ていません|でいません|ていない|でいない$$,
    ARRAY['まだ', 'て', 'いません']::text[],
    ARRAY['ていません', 'でいません', 'ていない', 'でいない', 'てない', 'でない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-28', $$まだ昼ご飯を食べていません。$$, $$まだひるごはんをたべていません。$$, $$Ainda não almocei.$$),
    ('n5-grammar-28', $$その映画はまだ見ていません。$$, $$そのえいがはまだみていません。$$, $$Ainda não vi esse filme.$$),
    ('n5-grammar-28', $$宿題がまだ終わっていない。$$, $$しゅくだいがまだおわっていない。$$, $$A lição ainda não terminou.$$),
    ('n5-grammar-28', $$田中さんはまだ来ていませんね。$$, $$たなかさんはまだきていませんね。$$, $$O Tanaka ainda não chegou, né?$$),
    ('n5-grammar-28', $$その本は買ったけど、まだ読んでいません。$$, $$そのほんはかったけど、まだよんでいません。$$, $$Comprei esse livro, mas ainda não li.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$まだ部屋を掃除し____。$$, $$Ainda não limpei o quarto.$$),
        (2, $$「レポートはもう出しましたか。」「いいえ、まだ出し____。」$$, $$"Você já entregou o relatório?" "Não, ainda não entreguei."$$),
        (3, $$バスはまだ来____。$$, $$O ônibus ainda não veio.$$),
        (4, $$新しい漢字をまだ覚え____。$$, $$Ainda não decorei os kanji novos.$$),
        (5, $$薬はもらったけど、まだ飲ん____。$$, $$Peguei o remédio, mas ainda não tomei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていません$$),
        (1, $$ていない$$),
        (2, $$ていません$$),
        (3, $$ていません$$),
        (3, $$ていない$$),
        (4, $$ていません$$),
        (4, $$ていない$$),
        (5, $$でいません$$),
        (5, $$でいない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
