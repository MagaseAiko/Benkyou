-- n3-grammar-180 — 〜ずに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-180',
    'grammar',
    'N3',
    $$〜ずに$$,
    $$zu ni$$,
    $$Sem / Sem fazer$$,
    $$ずに é usado para dizer que uma ação é feita sem fazer outra. Equivale a "sem" ou "sem fazer".

Ele tem o mesmo sentido de ないで, mas soa mais formal e escrito. Por isso, é muito comum em textos, notícias e na linguagem formal.

Para formar, tira-se ない da forma negativa e acrescenta-se ずに. Por exemplo, 食べない → 食べずに, 使わない → 使わずに.

O verbo する é uma exceção: vira せずに, e não しずに.

Por exemplo, "saí de casa sem tomar café da manhã" ou "ele foi embora sem dizer nada".$$,
    $$O erro mais comum é dizer しずに. O correto é sempre せずに.

ずに também aparece em ずにはいられない (não conseguir deixar de) e ずに済む (conseguir evitar), que são outras gramáticas.

Na fala do dia a dia, ないで é mais comum; ずに aparece mais na escrita.$$,
    $$Verbo na forma ない sem ない + ずに + Verbo
Exceções: する → せずに / 来る → 来ずに (こずに)

Forma escrita: Verbo sem ない + ず、 + Frase$$,
    $$ずに$$,
    $$ずに|ず、|せずに$$,
    ARRAY['ず', 'に']::text[],
    ARRAY['ずに', 'せずに', 'ず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-180', $$朝ご飯を食べずに、家を出た。$$, $$あさごはんをたべずに、いえをでた。$$, $$Saí de casa sem tomar café da manhã.$$),
    ('n3-grammar-180', $$辞書を使わずに、新聞を読んだ。$$, $$じしょをつかわずに、しんぶんをよんだ。$$, $$Li o jornal sem usar o dicionário.$$),
    ('n3-grammar-180', $$彼は何も言わずに帰った。$$, $$かれはなにもいわずにかえった。$$, $$Ele foi embora sem dizer nada.$$),
    ('n3-grammar-180', $$全然勉強せずに試験を受けた。$$, $$ぜんぜんべんきょうせずにしけんをうけた。$$, $$Fiz a prova sem ter estudado nada.$$),
    ('n3-grammar-180', $$雨なのに、傘を持たずに出かけた。$$, $$あめなのに、かさをもたずにでかけた。$$, $$Mesmo com chuva, saí sem levar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日は疲れて、歯を磨か____寝てしまった。$$, $$Ontem estava cansado e acabei dormindo sem escovar os dentes.$$),
        (2, $$誰にも相談せ____、一人で決めた。$$, $$Decidi sozinho, sem pedir conselho a ninguém.$$),
        (3, $$彼は一日中休ま____働き続けた。$$, $$Ele trabalhou o dia inteiro sem descansar.$$),
        (4, $$予約せ____レストランに行ったら、満席だった。$$, $$Fui ao restaurante sem reserva e estava lotado.$$),
        (5, $$地図を見____、目的地に着いた。$$, $$Cheguei ao destino sem olhar o mapa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-180', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずに$$),
        (2, $$ずに$$),
        (3, $$ずに$$),
        (4, $$ずに$$),
        (5, $$ずに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
