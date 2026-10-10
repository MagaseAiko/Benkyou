-- n3-grammar-147 — ところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-147',
    'grammar',
    'N3',
    $$ところで$$,
    $$tokoro de$$,
    $$A propósito / Mudando de assunto / Por falar nisso$$,
    $$ところで é uma conjunção usada para mudar de assunto de repente, introduzindo um tema novo. Equivale a "a propósito" ou "mudando de assunto".

Ela fica no começo da frase e avisa o ouvinte de que o tema da conversa vai mudar. Muitas vezes, o novo assunto não tem relação direta com o anterior.

É muito usada em conversas, cartas e e-mails, depois de cumprimentos ou de terminar um assunto. Por exemplo, "que dia bonito, né? A propósito, como vai o trabalho?".

Comparado a さて, que passa para a próxima etapa de algo planejado, ところで muda o assunto de forma mais livre e repentina.$$,
    $$Usar ところで com muita frequência pode parecer que você não está prestando atenção no que o outro diz.

Em e-mails, ところで é usado para introduzir um segundo assunto depois do principal.

そういえば ("por falar nisso") também muda de assunto, mas a partir de algo que lembra a conversa anterior.$$,
    $$Frase 1 (com ponto final) + ところで、 + Novo assunto
ところで、 + Pergunta$$,
    $$ところで$$,
    $$ところで$$,
    ARRAY['ところで']::text[],
    ARRAY['ところで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-147', $$ところで、明日の会議は何時からですか。$$, $$ところで、あしたのかいぎはなんじからですか。$$, $$A propósito, a reunião de amanhã é a partir de que horas?$$),
    ('n3-grammar-147', $$いい天気ですね。ところで、お仕事は順調ですか。$$, $$いいてんきですね。ところで、おしごとはじゅんちょうですか。$$, $$Que dia bonito, né? A propósito, como vai o trabalho?$$),
    ('n3-grammar-147', $$ところで、田中さんは元気？$$, $$ところで、たなかさんはげんき？$$, $$A propósito, o Tanaka está bem?$$),
    ('n3-grammar-147', $$この話はここまで。ところで、来週の予定は？$$, $$このはなしはここまで。ところで、らいしゅうのよていは？$$, $$Este assunto termina aqui. Mudando de assunto, quais são os planos para a semana que vem?$$),
    ('n3-grammar-147', $$ところで、あの本はもう読みましたか。$$, $$ところで、あのほんはもうよみましたか。$$, $$Por falar nisso, você já leu aquele livro?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は楽しかったね。____、次はいつ会える？$$, $$Hoje foi divertido, né? A propósito, quando podemos nos ver de novo?$$),
        (2, $$____、この前の話はどうなりましたか。$$, $$A propósito, o que aconteceu com aquele assunto de outro dia?$$),
        (3, $$仕事の話はこれで終わります。____、皆さん週末は何をしますか。$$, $$O assunto de trabalho termina aqui. Mudando de assunto, o que vocês vão fazer no fim de semana?$$),
        (4, $$____、お昼ご飯はもう食べた？$$, $$A propósito, você já almoçou?$$),
        (5, $$そうなんですか。____、田中さんを見ませんでしたか。$$, $$É mesmo? A propósito, você não viu o Tanaka?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところで$$),
        (2, $$ところで$$),
        (3, $$ところで$$),
        (4, $$ところで$$),
        (5, $$ところで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
