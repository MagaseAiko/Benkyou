-- n1-grammar-241 — やれ〜やれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-241',
    'grammar',
    'N1',
    $$やれ〜やれ$$,
    $$yare ~ yare$$,
    $$Ora é... ora é / Uma hora é... outra hora é / É isso e aquilo$$,
    $$やれ〜やれ serve para listar várias coisas que alguém fala ou exige repetidamente, geralmente com tom de reclamação. Equivale a "ora é..., ora é..." ou "é isso e aquilo".

A pessoa mostra irritação com tantas exigências ou acontecimentos. Por exemplo, "ora é reunião, ora é relatório, nunca tenho tempo".

É uma expressão coloquial.$$,
    $$Costuma ser seguido de と ou で, como やれ〜だ、やれ〜だと.

É parecido com 〜とか〜とか e 〜だの〜だの.$$,
    $$やれ + Substantivo / Frase + だ、やれ + Substantivo / Frase + だ$$,
    $$やれ〜やれ$$,
    $$やれ$$,
    ARRAY['やれ']::text[],
    ARRAY['やれ〜やれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-241', $$やれ会議だ、やれ報告書だと、休む暇がない。$$, $$やれかいぎだ、やれほうこくしょだと、やすむひまがない。$$, $$Ora é reunião, ora é relatório, não tenho tempo para descansar.$$),
    ('n1-grammar-241', $$母はやれ勉強しろ、やれ早く寝ろとうるさい。$$, $$はははやれべんきょうしろ、やれはやくねろとうるさい。$$, $$Minha mãe vive enchendo: ora é para estudar, ora é para dormir cedo.$$),
    ('n1-grammar-241', $$やれ結婚式だ、やれ引っ越しだと、お金がかかる。$$, $$やれけっこんしきだ、やれひっこしだと、おかねがかかる。$$, $$Uma hora é casamento, outra hora é mudança, só se gasta dinheiro.$$),
    ('n1-grammar-241', $$子供はやれお腹がすいた、やれ眠いと文句ばかり言う。$$, $$こどもはやれおなかがすいた、やれねむいともんくばかりいう。$$, $$A criança só reclama: ora está com fome, ora está com sono.$$),
    ('n1-grammar-241', $$やれ寒いだ、やれ暑いだと、彼はいつも不満を言っている。$$, $$やれさむいだ、やれあついだと、かれはいつもふまんをいっている。$$, $$Ora está frio, ora está calor, ele vive reclamando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____テストだ、やれ宿題だと、学生は忙しい。$$, $$Ora é prova, ora é lição de casa, os alunos vivem ocupados.$$),
        (2, $$上司はやれ遅い、____雑だと文句を言う。$$, $$O chefe reclama que é lento, que é desleixado.$$),
        (3, $$____病院だ、やれ買い物だと、毎日出かけている。$$, $$Ora é hospital, ora é compras, saio todos os dias.$$),
        (4, $$妻はやれ掃除しろ、____片付けろと言う。$$, $$Minha esposa manda limpar e arrumar, uma coisa atrás da outra.$$),
        (5, $$____新年会だ、やれ歓迎会だと、飲み会が多い。$$, $$Ora é festa de Ano-Novo, ora é festa de boas-vindas, há muitas confraternizações.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-241', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やれ$$),
        (2, $$やれ$$),
        (3, $$やれ$$),
        (4, $$やれ$$),
        (5, $$やれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
