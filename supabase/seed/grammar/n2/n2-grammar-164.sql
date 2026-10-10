-- n2-grammar-164 — 〜ては〜ては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-164',
    'grammar',
    'N2',
    $$〜ては〜ては$$,
    $$te wa ~ te wa$$,
    $$Ora... ora / Faz... e então / Repetidamente$$,
    $$ては〜ては indica que duas ações se repetem várias vezes, uma depois da outra. Equivale a "faz... e então..., faz... e então..." ou "ora... ora...".

Por exemplo, "escrevia e apagava, escrevia e apagava" ou "comia e dormia, comia e dormia".

Também aparece com uma única ação, ては, seguida de outra, para mostrar uma repetição, como "toda vez que chovia, o rio transbordava".$$,
    $$É uma expressão que dá ritmo à frase e mostra repetição.

Na fala, também aparece como ちゃ〜ちゃ.$$,
    $$Verbo A (forma て) + は + Verbo B (forma ます sem ます)、Verbo A (forma て) + は + Verbo B
Verbo A (forma て) + は + Verbo B (repetição)$$,
    $$ては〜ては$$,
    $$ては|では$$,
    ARRAY['て', 'は']::text[],
    ARRAY['ては〜ては', 'では〜では']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-164', $$手紙を書いては消し、書いては消しした。$$, $$てがみをかいてはけし、かいてはけしした。$$, $$Escrevia a carta e apagava, escrevia e apagava.$$),
    ('n2-grammar-164', $$休みの日は、食べては寝、食べては寝ている。$$, $$やすみのひは、たべてはね、たべてはねている。$$, $$Nos dias de folga, como e durmo, como e durmo.$$),
    ('n2-grammar-164', $$雨が降っては止み、降っては止みしている。$$, $$あめがふってはやみ、ふってはやみしている。$$, $$A chuva cai e para, cai e para.$$),
    ('n2-grammar-164', $$彼は失敗しては立ち上がった。$$, $$かれはしっぱいしてはたちあがった。$$, $$Ele falhava e se levantava de novo.$$),
    ('n2-grammar-164', $$読んでは考え、考えては読んだ。$$, $$よんではかんがえ、かんがえてはよんだ。$$, $$Lia e pensava, pensava e lia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供は転ん____起き、転んでは起きした。$$, $$A criança caía e se levantava, caía e se levantava.$$),
        (2, $$彼女は服を着____脱ぎ、着ては脱ぎした。$$, $$Ela vestia a roupa e tirava, vestia e tirava.$$),
        (3, $$波が寄せ____返す。$$, $$As ondas vêm e voltam.$$),
        (4, $$考えては書き、書い____考えた。$$, $$Pensava e escrevia, escrevia e pensava.$$),
        (5, $$夜中に何度も目が覚め____眠った。$$, $$Acordei e dormi várias vezes durante a noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$では$$),
        (2, $$ては$$),
        (3, $$ては$$),
        (4, $$ては$$),
        (5, $$ては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
