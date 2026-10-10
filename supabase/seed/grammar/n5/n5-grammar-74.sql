-- n5-grammar-74 — 〜つもり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-74',
    'grammar',
    'N5',
    $$〜つもり$$,
    $$tsumori$$,
    $$Pretender / Ter a intenção de / Planejar$$,
    $$つもり é usado para falar de planos e intenções. Equivale a "pretender", "ter a intenção de" ou "planejar".

Ele vem depois do verbo na forma de dicionário, para planos de fazer algo, ou na forma ない, para planos de não fazer algo. No final, usa-se です ou だ.

つもり mostra uma decisão que a pessoa já tomou, ainda que não seja definitiva. Por isso, é mais firme que たい, que só expressa vontade.

Para negar a intenção com força, usa-se つもりはない, que significa "não tenho a menor intenção de".

Em perguntas, つもりですか pergunta sobre os planos de alguém, mas pode soar direto quando dito a superiores.$$,
    $$A diferença entre つもり e たい é importante: たい é desejo ("queria"), つもり é plano ("pretendo"). Dá para querer algo sem ter a intenção de fazer.

Com superiores, perguntar つもりですか pode soar como cobrança. É mais natural perguntar de forma indireta, com 予定.

予定 também significa "plano", mas é usado para algo mais concreto e agendado, como uma viagem com data marcada.$$,
    $$Verbo na forma de dicionário + つもりです / つもりだ
Verbo na forma ない + つもりです (planeja não fazer)
Verbo na forma de dicionário + つもりはありません / つもりはない (sem intenção nenhuma)
Pergunta: 〜つもりですか$$,
    $$つもり$$,
    $$つもり$$,
    ARRAY['つもり']::text[],
    ARRAY['つもり', 'つもりです', 'つもりだ', 'つもりはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-74', $$来年、日本に留学するつもりです。$$, $$らいねん、にほんにりゅうがくするつもりです。$$, $$Ano que vem, pretendo fazer intercâmbio no Japão.$$),
    ('n5-grammar-74', $$夏休みは国に帰るつもりです。$$, $$なつやすみはくににかえるつもりです。$$, $$Nas férias de verão, pretendo voltar para o meu país.$$),
    ('n5-grammar-74', $$今日は甘い物を食べないつもりです。$$, $$きょうはあまいものをたべないつもりです。$$, $$Hoje pretendo não comer doces.$$),
    ('n5-grammar-74', $$週末は何をするつもりですか。$$, $$しゅうまつはなにをするつもりですか。$$, $$O que você pretende fazer no fim de semana?$$),
    ('n5-grammar-74', $$彼と結婚するつもりはありません。$$, $$かれとけっこんするつもりはありません。$$, $$Não tenho a menor intenção de me casar com ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、図書館に行く____です。$$, $$Amanhã, pretendo ir à biblioteca.$$),
        (2, $$大学を卒業したら、医者になる____です。$$, $$Depois de me formar na faculdade, pretendo ser médico.$$),
        (3, $$今年はもうタバコを吸わない____です。$$, $$Este ano, pretendo não fumar mais.$$),
        (4, $$冬休みはどこへ行く____ですか。$$, $$Aonde você pretende ir nas férias de inverno?$$),
        (5, $$今の会社をやめる____はありません。$$, $$Não tenho intenção nenhuma de sair da empresa atual.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもり$$),
        (2, $$つもり$$),
        (3, $$つもり$$),
        (4, $$つもり$$),
        (5, $$つもり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
