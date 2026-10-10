-- n4-grammar-47 — 〜も（強調）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-47',
    'grammar',
    'N4',
    $$〜も（強調）$$,
    $$mo (kyouchou)$$,
    $$Nada menos que / Até / Nem um sequer$$,
    $$No N4, も aparece depois de números e quantidades com um sentido de ênfase, diferente do "também" do N5.

Em frases afirmativas, número + も mostra que a quantidade é maior do que o esperado. Equivale a "nada menos que", "até" ou "todo esse tanto". Por exemplo, estudar oito horas, ter mil livros.

Em frases negativas, "um" + contador + も significa "nem um sequer". Por exemplo, não ter nem um iene, não ter rido nem uma vez. A negação fica total.

Nos dois casos, quem fala está expressando surpresa ou destacando que a quantidade é extrema, para mais ou para menos.$$,
    $$A entonação ajuda a mostrar surpresa: o número costuma ser destacado na fala.

Para expressar que a quantidade é pequena, o japonês usa しか〜ない ("só"). も faz o contrário: destaca que é muito.

Expressões como 一人も, 一つも e 一度も são muito frequentes em frases negativas.$$,
    $$Número + Contador + も + Verbo afirmativo (nada menos que)
一 + Contador + も + Verbo negativo (nem um sequer)
一度も / 一回も + negativo (nem uma vez)
少しも + negativo (nem um pouco)$$,
    $$も$$,
    $$も$$,
    ARRAY['も']::text[],
    ARRAY['も']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-47', $$昨日は八時間も勉強しました。$$, $$きのうははちじかんもべんきょうしました。$$, $$Ontem estudei oito horas inteiras.$$),
    ('n4-grammar-47', $$彼は本を千冊も持っている。$$, $$かれはほんをせんさつももっている。$$, $$Ele tem nada menos que mil livros.$$),
    ('n4-grammar-47', $$パーティーに百人も来ました。$$, $$パーティーにひゃくにんもきました。$$, $$Vieram até cem pessoas à festa.$$),
    ('n4-grammar-47', $$財布にお金が一円もない。$$, $$さいふにおかねがいちえんもない。$$, $$Não tenho nem um iene na carteira.$$),
    ('n4-grammar-47', $$今日は一度も笑わなかった。$$, $$きょうはいちどもわらわなかった。$$, $$Hoje não ri nem uma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅まで二時間____かかりました。$$, $$Levou duas horas inteiras até a estação.$$),
        (2, $$あのかばんは五十万円____するそうです。$$, $$Dizem que aquela bolsa custa nada menos que quinhentos mil ienes.$$),
        (3, $$テストの漢字は一つ____わかりませんでした。$$, $$Não entendi nem um kanji da prova.$$),
        (4, $$彼は一日に十杯____コーヒーを飲む。$$, $$Ele toma até dez xícaras de café por dia.$$),
        (5, $$夏休みの間、一日____休みませんでした。$$, $$Durante as férias de verão, não descansei nem um dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も$$),
        (2, $$も$$),
        (3, $$も$$),
        (4, $$も$$),
        (5, $$も$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
