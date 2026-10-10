-- n2-grammar-130 — 〜恐れがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-130',
    'grammar',
    'N2',
    $$〜恐れがある$$,
    $$osore ga aru$$,
    $$Há risco de / Pode ser que / Corre o risco de$$,
    $$恐れがある indica que existe a possibilidade de algo ruim acontecer. Equivale a "há risco de" ou "corre o risco de".

É usado apenas para coisas negativas, como desastres, doenças ou problemas. Por exemplo, "há risco de o tufão atingir a região".

É uma expressão formal, muito usada em notícias, previsões do tempo e avisos.$$,
    $$Não se usa para coisas boas. Para possibilidades neutras, usa-se かもしれない.

Também é escrito おそれがある.

A forma negativa, 恐れはない, significa "não há risco".$$,
    $$Verbo (forma dicionário) + 恐れがある
Substantivo + の + 恐れがある$$,
    $$恐れがある$$,
    $$恐れがある|おそれがある|恐れがあります|おそれがあります|恐れもある$$,
    ARRAY['恐れ', 'が', 'ある']::text[],
    ARRAY['恐れがある', 'おそれがある', '恐れがあります', '恐れもある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-130', $$台風が上陸する恐れがある。$$, $$たいふうがじょうりくするおそれがある。$$, $$Há risco de o tufão atingir a terra.$$),
    ('n2-grammar-130', $$この薬は副作用の恐れがあります。$$, $$このくすりはふくさようのおそれがあります。$$, $$Este remédio pode causar efeitos colaterais.$$),
    ('n2-grammar-130', $$大雨で川があふれる恐れがある。$$, $$おおあめでかわがあふれるおそれがある。$$, $$Com a chuva forte, há risco de o rio transbordar.$$),
    ('n2-grammar-130', $$このままでは、会社が倒産するおそれがある。$$, $$このままでは、かいしゃがとうさんするおそれがある。$$, $$Do jeito que está, a empresa corre o risco de falir.$$),
    ('n2-grammar-130', $$その病気は他の人にうつる恐れがあります。$$, $$そのびょうきはほかのひとにうつるおそれがあります。$$, $$Essa doença pode ser transmitida para outras pessoas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日は大雪になる____。$$, $$Há risco de nevar forte amanhã.$$),
        (2, $$この地域は地震の____。$$, $$Esta região corre risco de terremoto.$$),
        (3, $$放っておくと、病気が悪化する____。$$, $$Se deixar como está, há risco de a doença piorar.$$),
        (4, $$このままでは、試合に負ける____。$$, $$Do jeito que está, há risco de perder a partida.$$),
        (5, $$古い建物なので、倒れる____。$$, $$Como é um prédio velho, há risco de desabar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$恐れがある$$),
        (1, $$おそれがある$$),
        (1, $$恐れがあります$$),
        (1, $$おそれがあります$$),
        (2, $$恐れがある$$),
        (2, $$おそれがある$$),
        (2, $$恐れがあります$$),
        (2, $$おそれがあります$$),
        (3, $$恐れがある$$),
        (3, $$おそれがある$$),
        (3, $$恐れがあります$$),
        (3, $$おそれがあります$$),
        (4, $$恐れがある$$),
        (4, $$おそれがある$$),
        (4, $$恐れがあります$$),
        (4, $$おそれがあります$$),
        (5, $$恐れがある$$),
        (5, $$おそれがある$$),
        (5, $$恐れがあります$$),
        (5, $$おそれがあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
