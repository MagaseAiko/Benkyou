-- n1-grammar-20 — 〜でもあり〜でもある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-20',
    'grammar',
    'N1',
    $$〜でもあり〜でもある$$,
    $$demo ari ~ demo aru$$,
    $$É tanto... quanto / É ao mesmo tempo... e / É também$$,
    $$でもあり〜でもある indica que algo ou alguém tem duas características ao mesmo tempo. Equivale a "é tanto... quanto" ou "é ao mesmo tempo... e".

As duas características podem ser parecidas ou opostas. Por exemplo, "ele é professor e também pesquisador" ou "é uma alegria e, ao mesmo tempo, uma tristeza".

É uma expressão um pouco formal.$$,
    $$Com adjetivos い, a forma é くもあり〜くもある, como うれしくもあり寂しくもある.

É parecido com と同時に.$$,
    $$Substantivo / Adjetivo な + でもあり + Substantivo / Adjetivo な + でもある$$,
    $$でもあり〜でもある$$,
    $$でもあり|でもある|くもあり$$,
    ARRAY['でも', 'あり', 'でも', 'ある']::text[],
    ARRAY['でもあり〜でもある', 'くもあり〜くもある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-20', $$彼は教師でもあり、研究者でもある。$$, $$かれはきょうしでもあり、けんきゅうしゃでもある。$$, $$Ele é professor e também pesquisador.$$),
    ('n1-grammar-20', $$子供の卒業はうれしくもあり、寂しくもある。$$, $$こどものそつぎょうはうれしくもあり、さびしくもある。$$, $$A formatura do filho é ao mesmo tempo uma alegria e uma tristeza.$$),
    ('n1-grammar-20', $$この仕事は大変でもあり、楽しくもある。$$, $$このしごとはたいへんでもあり、たのしくもある。$$, $$Este trabalho é tanto difícil quanto divertido.$$),
    ('n1-grammar-20', $$彼女は母親でもあり、社長でもある。$$, $$かのじょはははおやでもあり、しゃちょうでもある。$$, $$Ela é mãe e também presidente de empresa.$$),
    ('n1-grammar-20', $$この町は便利でもあり、静かでもある。$$, $$このまちはべんりでもあり、しずかでもある。$$, $$Esta cidade é prática e, ao mesmo tempo, tranquila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は歌手____、俳優でもある。$$, $$Ele é cantor e também ator.$$),
        (2, $$この経験は苦しく____、楽しくもあった。$$, $$Esta experiência foi tanto dolorosa quanto divertida.$$),
        (3, $$彼女は私の先輩でもあり、親友____。$$, $$Ela é minha veterana e também minha melhor amiga.$$),
        (4, $$この料理は簡単でもあり、健康的____。$$, $$Este prato é fácil e, ao mesmo tempo, saudável.$$),
        (5, $$医者____、作家でもある人物だ。$$, $$É uma pessoa que é médico e também escritor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でもあり$$),
        (2, $$もあり$$),
        (3, $$でもある$$),
        (4, $$でもある$$),
        (5, $$でもあり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
