-- n2-grammar-172 — 〜とか（で）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-172',
    'grammar',
    'N2',
    $$〜とか（で）$$,
    $$toka (de)$$,
    $$Ouvi dizer que / Parece que / Disseram que$$,
    $$とか, no fim de uma frase, indica que a informação foi ouvida de alguém, mas sem total certeza. Equivale a "ouvi dizer que" ou "parece que".

É uma forma mais vaga e suave de transmitir uma informação, parecida com そうだ. Por exemplo, "ouvi dizer que ele vai se casar".

Na forma とかで, explica um motivo que a pessoa ouviu, como "disseram que estava doente, por isso faltou".$$,
    $$É mais vago e coloquial que そうだ.

Às vezes vem junto com 何でも ou 確か, como 何でも〜とか.$$,
    $$Frase (forma simples) + とか
Frase (forma simples) + とかで、 + Resultado$$,
    $$とか$$,
    $$とかで|とか$$,
    ARRAY['とか']::text[],
    ARRAY['とか', 'とかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-172', $$彼は来月結婚するとか。$$, $$かれはらいげつけっこんするとか。$$, $$Ouvi dizer que ele vai se casar no mês que vem.$$),
    ('n2-grammar-172', $$田中さんは風邪をひいたとかで、今日は休みです。$$, $$たなかさんはかぜをひいたとかで、きょうはやすみです。$$, $$Disseram que o Tanaka pegou resfriado, por isso faltou hoje.$$),
    ('n2-grammar-172', $$あの店は来週閉店するとか。$$, $$あのみせはらいしゅうへいてんするとか。$$, $$Parece que aquela loja vai fechar na semana que vem.$$),
    ('n2-grammar-172', $$電車が止まったとかで、彼は遅れてきた。$$, $$でんしゃがとまったとかで、かれはおくれてきた。$$, $$Ele chegou atrasado porque disseram que o trem parou.$$),
    ('n2-grammar-172', $$明日は雪が降るとか。$$, $$あしたはゆきがふるとか。$$, $$Ouvi dizer que vai nevar amanhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅前に新しいカフェができた____。$$, $$Ouvi dizer que abriu um café novo em frente à estação.$$),
        (2, $$用事がある____、彼女は先に帰った。$$, $$Disseram que tinha um compromisso, então ela foi embora antes.$$),
        (3, $$あの二人は付き合っている____。$$, $$Parece que aqueles dois estão namorando.$$),
        (4, $$家族が入院した____、彼は急いで帰国した。$$, $$Disseram que alguém da família foi internado, então ele voltou às pressas para o país.$$),
        (5, $$今年の夏は特に暑くなる____。$$, $$Ouvi dizer que este verão vai ser especialmente quente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とか$$),
        (2, $$とかで$$),
        (3, $$とか$$),
        (4, $$とかで$$),
        (5, $$とか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
