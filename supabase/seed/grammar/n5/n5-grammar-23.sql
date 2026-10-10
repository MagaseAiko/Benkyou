-- n5-grammar-23 — から
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-23',
    'grammar',
    'N5',
    $$から$$,
    $$kara$$,
    $$Porque / Por isso / De / Desde / A partir de$$,
    $$から tem dois usos principais no N5, e os dois partem da mesma ideia de "origem".

O primeiro é indicar o motivo. Quando から vem depois de uma frase, ele mostra que aquilo é a causa do que vem depois. A ordem é a contrária do português: primeiro o motivo, depois o resultado. Você pode traduzir como "porque", "como" ou "então", conforme a frase.

O segundo é indicar o ponto de partida, seja de lugar ou de tempo. Depois de um substantivo, から significa "de", "desde" ou "a partir de".

No uso de motivo, から pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, é preciso colocar だ ou です antes de から.

A resposta a uma pergunta com どうして costuma terminar com から, como uma explicação curta.$$,
    $$から para motivo soa mais subjetivo e direto que ので. Por isso, ele é ótimo para conversas do dia a dia, mas pode soar um pouco forte em pedidos formais ou desculpas.

Não confunda から sozinho com てから, que significa "depois de fazer" e é outra gramática.

Para receber algo de alguém, os verbos もらう e 借りる podem usar から ou に para marcar a pessoa.$$,
    $$Motivo:
Verbo / Adjetivo い (forma simples ou educada) + から
Substantivo / Adjetivo な + だ / です + から
… + からです (resposta com o motivo)

Ponto de partida:
Substantivo (lugar) + から
Substantivo (tempo) + から$$,
    $$から$$,
    $$から$$,
    ARRAY['から']::text[],
    ARRAY['から', 'だから', 'ですから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-23', $$雨が降っているから、家にいます。$$, $$あめがふっているから、いえにいます。$$, $$Como está chovendo, vou ficar em casa.$$),
    ('n5-grammar-23', $$今日は日曜日だから、学校は休みです。$$, $$きょうはにちようびだから、がっこうはやすみです。$$, $$Hoje é domingo, então não tem aula.$$),
    ('n5-grammar-23', $$授業は九時から始まります。$$, $$じゅぎょうはくじからはじまります。$$, $$A aula começa às nove.$$),
    ('n5-grammar-23', $$ブラジルから来ました。$$, $$ブラジルからきました。$$, $$Vim do Brasil.$$),
    ('n5-grammar-23', $$「どうして食べないの？」「お腹がいっぱいだから。」$$, $$「どうしてたべないの？」「おなかがいっぱいだから。」$$, $$"Por que você não come?" "Porque estou cheio."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒い____、窓を閉めてください。$$, $$Está frio, então feche a janela, por favor.$$),
        (2, $$この銀行は九時____です。$$, $$Este banco abre a partir das nove.$$),
        (3, $$駅____家まで歩きました。$$, $$Andei da estação até a casa.$$),
        (4, $$明日はテストだ____、今日は勉強します。$$, $$Amanhã tem prova, então hoje vou estudar.$$),
        (5, $$「どうして遅れたんですか。」「電車が遅れた____です。」$$, $$"Por que você se atrasou?" "Porque o trem atrasou."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$から$$),
        (3, $$から$$),
        (4, $$から$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
