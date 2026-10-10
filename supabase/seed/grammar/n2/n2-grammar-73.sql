-- n2-grammar-73 — 〜ものか / 〜もんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-73',
    'grammar',
    'N2',
    $$〜ものか / 〜もんか$$,
    $$mono ka / mon ka$$,
    $$De jeito nenhum / Nunca que / Imagine se$$,
    $$ものか ou もんか no fim da frase expressa uma negação muito forte, em tom de pergunta retórica. Equivale a "de jeito nenhum" ou "nunca que...".

A pessoa mostra que está totalmente decidida a não fazer algo ou que acha algo impossível. Por exemplo, "nunca mais vou àquela loja!" ou "imagine se ele vai entender".

É uma expressão emotiva e informal. Na forma mais educada, aparece como ものですか.$$,
    $$Na fala masculina, também aparece como ものかよ ou もんかよ.

ものですか é usado na fala feminina mais educada.

Embora tenha forma de pergunta, o sentido é sempre negativo.$$,
    $$Verbo (forma dicionário) + ものか / もんか
Adjetivo い + ものか / もんか
Adjetivo な / Substantivo + な + ものか / もんか$$,
    $$ものか$$,
    $$ものか|もんか|ものですか$$,
    ARRAY['もの', 'か']::text[],
    ARRAY['ものか', 'もんか', 'ものですか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-73', $$あんな店には二度と行くものか。$$, $$あんなみせにはにどといくものか。$$, $$Nunca mais que eu vou àquela loja!$$),
    ('n2-grammar-73', $$負けるもんか。$$, $$まけるもんか。$$, $$De jeito nenhum vou perder!$$),
    ('n2-grammar-73', $$彼の気持ちなんて分かるものか。$$, $$かれのきもちなんてわかるものか。$$, $$Imagine se dá para entender o que ele sente.$$),
    ('n2-grammar-73', $$こんな問題、簡単なものか。$$, $$こんなもんだい、かんたんなものか。$$, $$Este problema não tem nada de fácil!$$),
    ('n2-grammar-73', $$あの人に謝るものですか。$$, $$あのひとにあやまるものですか。$$, $$Imagine se eu vou pedir desculpas àquela pessoa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなまずい料理、二度と食べる____。$$, $$Nunca mais vou comer uma comida ruim dessas!$$),
        (2, $$あいつの言うことなんか信じる____。$$, $$De jeito nenhum vou acreditar no que aquele cara diz!$$),
        (3, $$こんなことで泣く____。$$, $$Imagine se vou chorar por uma coisa dessas!$$),
        (4, $$彼が本当のことを言う____。$$, $$Imagine se ele vai dizer a verdade.$$),
        (5, $$絶対にあきらめる____。$$, $$De jeito nenhum vou desistir!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものか$$),
        (1, $$もんか$$),
        (1, $$ものですか$$),
        (2, $$ものか$$),
        (2, $$もんか$$),
        (2, $$ものですか$$),
        (3, $$ものか$$),
        (3, $$もんか$$),
        (3, $$ものですか$$),
        (4, $$ものか$$),
        (4, $$もんか$$),
        (4, $$ものですか$$),
        (5, $$ものか$$),
        (5, $$もんか$$),
        (5, $$ものですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
