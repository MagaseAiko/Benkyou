-- n5-grammar-35 — もう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-35',
    'grammar',
    'N5',
    $$もう$$,
    $$mou$$,
    $$Já / Mais / Não mais$$,
    $$もう é um advérbio com sentidos que dependem da frase, mas que giram em torno da ideia de "mudança de situação".

Com o verbo no passado, もう significa "já": a ação aconteceu e a situação mudou. Em perguntas, もう〜ましたか pergunta se algo já foi feito.

Antes de números e quantidades, もう significa "mais", como em mais um, mais uma vez, mais um pouco.

Com o verbo no negativo, もう significa "não mais": algo que acontecia antes deixou de acontecer.

O oposto de もう (já) é まだ (ainda). Por isso, para responder "ainda não" a uma pergunta com もう, usa-se まだ.$$,
    $$Na resposta afirmativa, é comum repetir もう: はい、もう〜ました.

A expressão もう一度 significa "mais uma vez" e é muito usada para pedir que alguém repita algo.

Dito sozinho e com certo tom, もう também expressa irritação, algo como "ah, poxa!". Esse uso é bem coloquial.$$,
    $$もう + Verbo na forma ました / た (já fez)
もう + Verbo ましたか (pergunta: já fez?)
もう + Quantidade (mais um / mais uma vez)
もう + Verbo negativo (não mais)
もう + Horário / Situação + です (já é...)$$,
    $$もう$$,
    $$もう$$,
    ARRAY['もう']::text[],
    ARRAY['もう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-35', $$もう宿題をしました。$$, $$もうしゅくだいをしました。$$, $$Já fiz a lição.$$),
    ('n5-grammar-35', $$「もう昼ご飯を食べましたか。」「はい、もう食べました。」$$, $$「もうひるごはんをたべましたか。」「はい、もうたべました。」$$, $$"Você já almoçou?" "Sim, já almocei."$$),
    ('n5-grammar-35', $$もう一度言ってください。$$, $$もういちどいってください。$$, $$Diga mais uma vez, por favor.$$),
    ('n5-grammar-35', $$もう十時ですよ。早く寝ましょう。$$, $$もうじゅうじですよ。はやくねましょう。$$, $$Já são dez horas. Vamos dormir cedo.$$),
    ('n5-grammar-35', $$もうタバコは吸いません。$$, $$もうタバコはすいません。$$, $$Não fumo mais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は____会社に行きました。$$, $$Meu pai já foi para a empresa.$$),
        (2, $$すみません、____一つください。$$, $$Com licença, me dê mais um, por favor.$$),
        (3, $$「映画は始まりましたか。」「はい、____始まりましたよ。」$$, $$"O filme já começou?" "Sim, já começou."$$),
        (4, $$____遅いから、帰りましょう。$$, $$Já está tarde, vamos voltar.$$),
        (5, $$あの店には____行きたくないです。$$, $$Não quero mais ir àquela loja.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もう$$),
        (2, $$もう$$),
        (3, $$もう$$),
        (4, $$もう$$),
        (5, $$もう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
