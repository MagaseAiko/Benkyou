-- n2-grammar-23 — 〜ふうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-23',
    'grammar',
    'N2',
    $$〜ふうに$$,
    $$fuu ni$$,
    $$Deste jeito / Daquele jeito / Desta maneira$$,
    $$ふうに é usado para indicar a maneira ou o estilo de fazer algo. Equivale a "deste jeito", "daquele jeito" ou "desta maneira".

Ele aparece muito com こんな, そんな, あんな e どんな, formando こんなふうに (assim, deste jeito), あんなふうに (daquele jeito) e どんなふうに (de que jeito).

Também pode vir depois de verbos e com そういう, como em そういうふうに考えたことはなかった ("nunca pensei desse jeito").

Antes de um substantivo, usa-se ふうな: こんなふうな服 (uma roupa deste estilo).

É um pouco mais casual que のように e muito comum na conversa.$$,
    $$Em perguntas, どんなふうに pede detalhes sobre o modo: "como exatamente você fez?".

風 também aparece como sufixo em palavras como 和風 (estilo japonês) e 洋風 (estilo ocidental).

Comparado a ように, ふうに soa mais coloquial e descritivo.$$,
    $$こんな / そんな / あんな / どんな + ふうに + Verbo
そういう / こういう + ふうに + Verbo
Verbo (forma simples) + ふうに + Verbo
… + ふうな + Substantivo

Escrita: ふうに / 風に$$,
    $$ふうに$$,
    $$ふうに|風に|ふうな|風な$$,
    ARRAY['ふう', 'に']::text[],
    ARRAY['ふうに', '風に', 'ふうな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-23', $$こんなふうに書いてください。$$, $$こんなふうにかいてください。$$, $$Escreva deste jeito, por favor.$$),
    ('n2-grammar-23', $$彼はいつもあんなふうに笑う。$$, $$かれはいつもあんなふうにわらう。$$, $$Ele sempre ri daquele jeito.$$),
    ('n2-grammar-23', $$このケーキ、どんなふうに作ったんですか。$$, $$このケーキ、どんなふうにつくったんですか。$$, $$De que jeito você fez este bolo?$$),
    ('n2-grammar-23', $$先生が説明したふうに、やってみました。$$, $$せんせいがせつめいしたふうに、やってみました。$$, $$Tentei fazer do jeito que o professor explicou.$$),
    ('n2-grammar-23', $$そういうふうに考えたことはなかった。$$, $$そういうふうにかんがえたことはなかった。$$, $$Nunca tinha pensado desse jeito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$野菜はこんな____切ってください。$$, $$Corte as verduras deste jeito, por favor.$$),
        (2, $$この機械はどんな____使えばいいですか。$$, $$De que jeito devo usar esta máquina?$$),
        (3, $$そういう____言われると、困ります。$$, $$Se você fala desse jeito, fico sem graça.$$),
        (4, $$彼女はいつもあんな____話す人だ。$$, $$Ela é uma pessoa que sempre fala daquele jeito.$$),
        (5, $$彼が言った____、もう一度やってみよう。$$, $$Vamos tentar mais uma vez do jeito que ele disse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふうに$$),
        (1, $$風に$$),
        (2, $$ふうに$$),
        (2, $$風に$$),
        (3, $$ふうに$$),
        (3, $$風に$$),
        (4, $$ふうに$$),
        (4, $$風に$$),
        (5, $$ふうに$$),
        (5, $$風に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
