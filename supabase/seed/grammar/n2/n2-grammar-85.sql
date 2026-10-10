-- n2-grammar-85 — 〜ねばならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-85',
    'grammar',
    'N2',
    $$〜ねばならない$$,
    $$neba naranai$$,
    $$Ter que / Ser preciso / Dever$$,
    $$ねばならない indica obrigação ou necessidade. Equivale a "ter que" ou "ser preciso".

Tem o mesmo sentido de なければならない, mas é uma forma antiga e formal, mais usada na escrita, em discursos e em textos sérios.

Por exemplo, "temos que proteger o meio ambiente".$$,
    $$Atenção à forma de する, que vira せねばならない e não しねばならない.

Na fala do dia a dia, usa-se mais なければならない ou なきゃ.

A forma ねばならぬ é ainda mais antiga e formal.$$,
    $$Verbo (forma ない sem ない) + ねばならない
する → せねばならない
来る → 来ねばならない$$,
    $$ねばならない$$,
    $$ねばならない|ねばならぬ|ねばなりません|ねばならなかった$$,
    ARRAY['ね', 'ば', 'ならない']::text[],
    ARRAY['ねばならない', 'ねばならぬ', 'ねばなりません', 'せねばならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-85', $$私たちは環境を守らねばならない。$$, $$わたしたちはかんきょうをまもらねばならない。$$, $$Nós temos que proteger o meio ambiente.$$),
    ('n2-grammar-85', $$この問題は早く解決せねばならない。$$, $$このもんだいははやくかいけつせねばならない。$$, $$Este problema precisa ser resolvido logo.$$),
    ('n2-grammar-85', $$約束は守らねばならぬ。$$, $$やくそくはまもらねばならぬ。$$, $$Promessas devem ser cumpridas.$$),
    ('n2-grammar-85', $$明日までにレポートを出さねばなりません。$$, $$あしたまでにレポートをださねばなりません。$$, $$Tenho que entregar o relatório até amanhã.$$),
    ('n2-grammar-85', $$彼は家族のために働かねばならなかった。$$, $$かれはかぞくのためにはたらかねばならなかった。$$, $$Ele teve que trabalhar pela família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日中にこの仕事を終わら____。$$, $$Tenho que terminar este trabalho ainda hoje.$$),
        (2, $$国民は法律を守ら____。$$, $$Os cidadãos devem obedecer às leis.$$),
        (3, $$この計画は見直さ____。$$, $$Este plano precisa ser revisto.$$),
        (4, $$もっと努力せ____。$$, $$Preciso me esforçar mais.$$),
        (5, $$子供の安全を第一に考え____。$$, $$É preciso pensar em primeiro lugar na segurança das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ねばならない$$),
        (1, $$ねばなりません$$),
        (1, $$ねばならぬ$$),
        (2, $$ねばならない$$),
        (2, $$ねばなりません$$),
        (2, $$ねばならぬ$$),
        (3, $$ねばならない$$),
        (3, $$ねばなりません$$),
        (3, $$ねばならぬ$$),
        (4, $$ねばならない$$),
        (4, $$ねばなりません$$),
        (4, $$ねばならぬ$$),
        (5, $$ねばならない$$),
        (5, $$ねばなりません$$),
        (5, $$ねばならぬ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
