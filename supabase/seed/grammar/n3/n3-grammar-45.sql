-- n3-grammar-45 — 〜っけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-45',
    'grammar',
    'N3',
    $$〜っけ$$,
    $$kke$$,
    $$Mesmo? / Era... não era? / Como era mesmo?$$,
    $$っけ é uma partícula de final de frase usada quando a pessoa tenta lembrar ou confirmar algo de que não tem certeza. Equivale a "como era mesmo?", "era..., não era?".

Ela é usada para perguntar algo que você sabia, mas esqueceu, ou para confirmar uma informação. Por exemplo, "a reunião era a que horas mesmo?" ou "amanhã é folga, não é?".

Também pode ser usada falando consigo mesmo, ao recordar o passado com nostalgia: "quando era criança, brincava muito neste parque, né...".

Com substantivos e adjetivos な, usa-se だっけ ou だったっけ. Com verbos e adjetivos い, usa-se a forma た + っけ.

っけ é informal e muito usada na conversa.$$,
    $$A forma educada でしたっけ é muito útil para perguntar algo que você esqueceu sem soar mal-educado, como お名前、何でしたっけ.

Mesmo falando do presente, っけ costuma usar o passado, porque a pessoa está tentando lembrar de algo que já sabia.

No uso de nostalgia, っけ é bem comum em conversas sobre a infância.$$,
    $$Substantivo / Adjetivo な + だっけ / だったっけ
Verbo / Adjetivo い na forma た + っけ
Palavra interrogativa + … + だっけ

Educado: でしたっけ / ましたっけ$$,
    $$っけ$$,
    $$っけ|だっけ$$,
    ARRAY['っけ']::text[],
    ARRAY['っけ', 'だっけ', 'でしたっけ', 'たっけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-45', $$会議は何時からだっけ？$$, $$かいぎはなんじからだっけ？$$, $$A reunião é a partir de que horas mesmo?$$),
    ('n3-grammar-45', $$あの人の名前、何だっけ。$$, $$あのひとのなまえ、なんだっけ。$$, $$Qual é mesmo o nome daquela pessoa?$$),
    ('n3-grammar-45', $$鍵、どこに置いたっけ？$$, $$かぎ、どこにおいたっけ？$$, $$Onde foi mesmo que eu deixei a chave?$$),
    ('n3-grammar-45', $$明日は休みだったっけ？$$, $$あしたはやすみだったっけ？$$, $$Amanhã é folga, não é?$$),
    ('n3-grammar-45', $$子供のころ、よくこの公園で遊んだっけ。$$, $$こどものころ、よくこのこうえんであそんだっけ。$$, $$Quando eu era criança, brincava muito neste parque, né...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんの誕生日はいつだ____。$$, $$Quando é mesmo o aniversário do Tanaka?$$),
        (2, $$この本、どこで買った____。$$, $$Onde foi mesmo que comprei este livro?$$),
        (3, $$宿題、もう出した____？$$, $$Eu já entreguei a lição?$$),
        (4, $$昔はこの辺に大きな川があった____。$$, $$Antigamente tinha um rio grande por aqui, né...$$),
        (5, $$あれ、今日は何曜日だ____。$$, $$Ué, que dia da semana é hoje mesmo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っけ$$),
        (2, $$っけ$$),
        (3, $$っけ$$),
        (4, $$っけ$$),
        (5, $$っけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
