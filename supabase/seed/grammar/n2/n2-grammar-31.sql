-- n2-grammar-31 — 〜以上に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-31',
    'grammar',
    'N2',
    $$〜以上に$$,
    $$ijou ni$$,
    $$Mais do que / Além do que / Acima de$$,
    $$以上に é usado para dizer que algo superou uma expectativa, uma previsão ou um ponto de comparação. Equivale a "mais do que" ou "além do que".

Ele aparece muito com palavras de expectativa, como 思った (pensei), 予想 (previsão), 想像 (imaginação) e 期待 (expectativa). Por exemplo, "a prova foi mais difícil do que eu pensava" ou "o trabalho é mais pesado do que eu imaginava".

Também é usado para comparar com um padrão anterior: "vou me esforçar ainda mais do que da última vez".

Antes de um substantivo, usa-se 以上の: 期待以上の結果 (um resultado acima das expectativas).

É parecido com より, mas 以上に destaca que a expectativa foi ultrapassada.$$,
    $$Não confunda com 以上は (já que), que tem outro sentido.

Em avaliações de produtos e serviços, 期待以上 ("acima das expectativas") é um elogio comum.

以上 sozinho também significa "acima de" em números, como 二十歳以上 (vinte anos ou mais).$$,
    $$Verbo (forma simples) + 以上に + Adjetivo / Verbo
Substantivo (予想 / 想像 / 期待 / 前回) + 以上に
… + 以上の + Substantivo$$,
    $$以上に$$,
    $$以上に|以上の$$,
    ARRAY['以上', 'に']::text[],
    ARRAY['以上に', '以上の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-31', $$試験は思った以上に難しかった。$$, $$しけんはおもったいじょうにむずかしかった。$$, $$A prova foi mais difícil do que eu pensava.$$),
    ('n2-grammar-31', $$彼は予想以上に早く来た。$$, $$かれはよそういじょうにはやくきた。$$, $$Ele chegou mais cedo do que o previsto.$$),
    ('n2-grammar-31', $$この仕事は想像以上に大変だ。$$, $$このしごとはそうぞういじょうにたいへんだ。$$, $$Este trabalho é mais pesado do que eu imaginava.$$),
    ('n2-grammar-31', $$次の大会では、前回以上に頑張ります。$$, $$つぎのたいかいでは、ぜんかいいじょうにがんばります。$$, $$No próximo campeonato, vou me esforçar ainda mais do que da última vez.$$),
    ('n2-grammar-31', $$みんなの努力で、期待以上の結果が出た。$$, $$みんなのどりょくで、きたいいじょうのけっかがでた。$$, $$Graças ao esforço de todos, o resultado foi acima das expectativas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行は思った____楽しかった。$$, $$A viagem foi mais divertida do que eu pensava.$$),
        (2, $$実際に会った彼女は、想像____美しかった。$$, $$Pessoalmente, ela era mais bonita do que eu imaginava.$$),
        (3, $$今年の夏は去年____暑い。$$, $$Este verão está ainda mais quente do que o do ano passado.$$),
        (4, $$コンサートには予想____多くの人が集まった。$$, $$Muito mais gente do que o previsto foi ao show.$$),
        (5, $$それは期待____の成果だった。$$, $$Foi um resultado acima das expectativas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以上に$$),
        (2, $$以上に$$),
        (3, $$以上に$$),
        (4, $$以上に$$),
        (5, $$以上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
