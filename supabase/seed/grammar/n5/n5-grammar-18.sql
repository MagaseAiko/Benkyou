-- n5-grammar-18 — 一緒に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-18',
    'grammar',
    'N5',
    $$一緒に$$,
    $$issho ni$$,
    $$Juntos / Junto com$$,
    $$一緒に significa "juntos". Ele mostra que duas ou mais pessoas fazem a mesma ação ao mesmo tempo, ou no mesmo lugar.

Ele funciona como um advérbio, então vem antes do verbo. Para dizer com quem a ação é feita, usa-se a pessoa seguida da partícula と antes de 一緒に.

É muito comum em convites. Junto com ませんか ou ましょう, ele forma convites naturais para fazer algo com alguém.

Quando o "com quem" já está claro pela conversa, a pessoa pode ser omitida, e 一緒に sozinho já entende-se como "comigo" ou "com a gente".$$,
    $$A palavra 一緒 sozinha significa "juntos" ou "o mesmo". Por isso, a expressão 一緒です pode significar "é igual" ou "estamos juntos", dependendo do contexto.

Dizer só と, sem 一緒に, também é possível, mas 一緒に reforça a ideia de que a ação foi compartilhada.

Em grupos, o japonês costuma usar みんなで antes de 一緒に para dizer "todos juntos".$$,
    $$一緒に + Verbo
Pessoa + と + 一緒に + Verbo
一緒に + Verbo ませんか (convite)
一緒に + Verbo ましょう (proposta)

Escrita: 一緒に / いっしょに$$,
    $$一緒に$$,
    $$一緒に|いっしょに$$,
    ARRAY['一緒', 'に']::text[],
    ARRAY['一緒に', 'いっしょに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-18', $$一緒に帰りましょう。$$, $$いっしょにかえりましょう。$$, $$Vamos voltar juntos.$$),
    ('n5-grammar-18', $$友達と一緒に映画を見ました。$$, $$ともだちといっしょにえいがをみました。$$, $$Vi um filme junto com um amigo.$$),
    ('n5-grammar-18', $$週末、一緒に買い物に行きませんか。$$, $$しゅうまつ、いっしょにかいものにいきませんか。$$, $$Quer ir fazer compras comigo no fim de semana?$$),
    ('n5-grammar-18', $$毎朝、犬と一緒に公園を散歩します。$$, $$まいあさ、いぬといっしょにこうえんをさんぽします。$$, $$Toda manhã, passeio no parque junto com o cachorro.$$),
    ('n5-grammar-18', $$今は家族と一緒に住んでいます。$$, $$いまはかぞくといっしょにすんでいます。$$, $$Agora moro junto com a minha família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、____勉強しませんか。$$, $$Amanhã, quer estudar junto comigo?$$),
        (2, $$母と____料理を作りました。$$, $$Fiz comida junto com a minha mãe.$$),
        (3, $$みんなで____歌いましょう。$$, $$Vamos todos cantar juntos.$$),
        (4, $$いつか彼女と____旅行に行きたいです。$$, $$Algum dia quero viajar junto com a minha namorada.$$),
        (5, $$子供のころ、よく祖父と____釣りに行きました。$$, $$Quando era criança, eu ia muito pescar junto com meu avô.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一緒に$$),
        (1, $$いっしょに$$),
        (2, $$一緒に$$),
        (2, $$いっしょに$$),
        (3, $$一緒に$$),
        (3, $$いっしょに$$),
        (4, $$一緒に$$),
        (4, $$いっしょに$$),
        (5, $$一緒に$$),
        (5, $$いっしょに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
