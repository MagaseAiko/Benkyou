-- n2-grammar-181 — 〜上は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-181',
    'grammar',
    'N2',
    $$〜上は$$,
    $$ue wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$上は indica que, já que uma decisão foi tomada ou uma situação existe, é preciso agir de acordo com ela até o fim. Equivale a "já que" ou "uma vez que".

A segunda parte costuma expressar determinação, obrigação ou conselho, como なければならない, べきだ ou つもりだ. Por exemplo, "já que prometi, tenho que cumprir".

É uma expressão formal, parecida com 以上は e からには.$$,
    $$É mais formal que からには e aparece mais na escrita.

Também é escrito うえは.

A primeira parte costuma ser uma decisão ou um compromisso importante.$$,
    $$Verbo (forma dicionário / forma た) + 上は + Determinação / Obrigação$$,
    $$上は$$,
    $$上は|うえは$$,
    ARRAY['上', 'は']::text[],
    ARRAY['上は', 'うえは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-181', $$約束した上は、必ず守らなければならない。$$, $$やくそくしたうえは、かならずまもらなければならない。$$, $$Já que prometi, tenho que cumprir sem falta.$$),
    ('n2-grammar-181', $$引き受けた上は、最後まで責任を持ちます。$$, $$ひきうけたうえは、さいごまでせきにんをもちます。$$, $$Uma vez que aceitei, vou assumir a responsabilidade até o fim.$$),
    ('n2-grammar-181', $$こうなった上は、やるしかない。$$, $$こうなったうえは、やるしかない。$$, $$Já que chegou a este ponto, só resta fazer.$$),
    ('n2-grammar-181', $$留学すると決めた上は、しっかり勉強するつもりだ。$$, $$りゅうがくするときめたうえは、しっかりべんきょうするつもりだ。$$, $$Já que decidi estudar no exterior, pretendo estudar com afinco.$$),
    ('n2-grammar-181', $$試合に出る上は、優勝を目指す。$$, $$しあいにでるうえは、ゆうしょうをめざす。$$, $$Já que vou participar da competição, vou buscar o título.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長になった____、会社を守らなければならない。$$, $$Já que me tornei presidente, tenho que proteger a empresa.$$),
        (2, $$ここまで来た____、あきらめるわけにはいかない。$$, $$Já que cheguei até aqui, não posso desistir.$$),
        (3, $$契約した____、条件に従うべきだ。$$, $$Uma vez que assinou o contrato, deve seguir as condições.$$),
        (4, $$やると言った____、最後までやる。$$, $$Já que disse que faria, vou fazer até o fim.$$),
        (5, $$真実を知った____、黙っているわけにはいかない。$$, $$Já que soube a verdade, não posso ficar calado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上は$$),
        (1, $$うえは$$),
        (2, $$上は$$),
        (2, $$うえは$$),
        (3, $$上は$$),
        (3, $$うえは$$),
        (4, $$上は$$),
        (4, $$うえは$$),
        (5, $$上は$$),
        (5, $$うえは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
