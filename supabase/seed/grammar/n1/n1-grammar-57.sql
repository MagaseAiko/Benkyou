-- n1-grammar-57 — 〜極まる / 〜極まりない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-57',
    'grammar',
    'N1',
    $$〜極まる / 〜極まりない$$,
    $$kiwamaru / kiwamari nai$$,
    $$Extremamente / Ao extremo / Totalmente$$,
    $$極まる e 極まりない indicam que algo chegou ao grau máximo. Equivalem a "extremamente" ou "ao extremo".

Apesar de um ser afirmativo e o outro negativo, os dois têm o mesmo sentido. Costumam vir com adjetivos な que expressam algo negativo, como rude, perigoso, desagradável ou irresponsável. Por exemplo, "uma atitude extremamente rude".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 失礼極まりない, 危険極まりない, 不愉快極まる e 無責任極まりない.

Também aparece como 感極まる, "ficar extremamente emocionado".$$,
    $$Adjetivo な (sem な) + 極まる
Adjetivo な (sem な) + 極まりない
Adjetivo な (sem な) + 極まりない + Substantivo$$,
    $$極まりない$$,
    $$極まりない|極まる|極まりなく|きわまりない|きわまる|極まって$$,
    ARRAY['極まり', 'ない']::text[],
    ARRAY['極まりない', '極まる', '極まりなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-57', $$彼の態度は失礼極まりない。$$, $$かれのたいどはしつれいきわまりない。$$, $$A atitude dele é extremamente rude.$$),
    ('n1-grammar-57', $$夜中に山に登るのは危険極まる。$$, $$よなかにやまにのぼるのはきけんきわまる。$$, $$Subir a montanha de madrugada é perigoso ao extremo.$$),
    ('n1-grammar-57', $$無責任極まりない発言だ。$$, $$むせきにんきわまりないはつげんだ。$$, $$É uma declaração totalmente irresponsável.$$),
    ('n1-grammar-57', $$彼女は感極まって泣き出した。$$, $$かのじょはかんきわまってなきだした。$$, $$Ela ficou tão emocionada que começou a chorar.$$),
    ('n1-grammar-57', $$不愉快極まりない出来事だった。$$, $$ふゆかいきわまりないできごとだった。$$, $$Foi um acontecimento extremamente desagradável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞かないなんて、失礼____。$$, $$Não ouvir os outros é extremamente rude.$$),
        (2, $$こんな道を自転車で走るのは危険____。$$, $$Andar de bicicleta numa rua dessas é perigoso ao extremo.$$),
        (3, $$彼の言い訳は不愉快____。$$, $$As desculpas dele são extremamente desagradáveis.$$),
        (4, $$それは非常識____行動だ。$$, $$Isso é um comportamento totalmente sem bom senso.$$),
        (5, $$この作業は単調____。$$, $$Este trabalho é monótono ao extremo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$極まりない$$),
        (1, $$極まる$$),
        (2, $$極まりない$$),
        (2, $$極まる$$),
        (3, $$極まりない$$),
        (3, $$極まる$$),
        (4, $$極まりない$$),
        (5, $$極まりない$$),
        (5, $$極まる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
