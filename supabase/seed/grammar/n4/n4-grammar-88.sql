-- n4-grammar-88 — 〜たらどう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-88',
    'grammar',
    'N4',
    $$〜たらどう$$,
    $$tara dou$$,
    $$Que tal...? / Por que você não...?$$,
    $$たらどう é usado para dar uma sugestão ou um conselho. Equivale a "que tal...?" ou "por que você não...?".

Ele junta a forma たら ("se fizer") com どう ("como fica?"). A ideia literal é "se você fizer isso, que tal?".

A forma たらどう？ é informal e usada com amigos e familiares. A forma たらどうですか é educada, e たらいかがですか é ainda mais polida.

O tom é de recomendação, mas, dependendo da entonação, たらどう pode soar como uma cobrança ou um conselho impaciente, como "por que você não faz logo isso?".$$,
    $$Com superiores, prefira たらいかがですか, que soa respeitoso e suave.

ほうがいい também dá conselhos, mas soa mais firme. たらどう deixa a decisão mais aberta para o outro.

Às vezes, a frase termina só em たら, sem どう, com o mesmo sentido de sugestão.$$,
    $$Verbo na forma た + ら + どう？ (informal)
Verbo na forma た + ら + どうですか (educado)
Verbo na forma た + ら + いかがですか (muito educado)$$,
    $$たらどう$$,
    $$たらどう|だらどう$$,
    ARRAY['たら', 'どう']::text[],
    ARRAY['たらどう', 'たらどうですか', 'たらいかがですか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-88', $$疲れているなら、少し休んだらどう？$$, $$つかれているなら、すこしやすんだらどう？$$, $$Se está cansado, que tal descansar um pouco?$$),
    ('n4-grammar-88', $$先生に相談したらどうですか。$$, $$せんせいにそうだんしたらどうですか。$$, $$Por que você não conversa com o professor?$$),
    ('n4-grammar-88', $$一度、医者に見てもらったらどう？$$, $$いちど、いしゃにみてもらったらどう？$$, $$Que tal ir ao médico uma vez?$$),
    ('n4-grammar-88', $$雨が降りそうだから、傘を持って行ったらどうですか。$$, $$あめがふりそうだから、かさをもっていったらどうですか。$$, $$Parece que vai chover, que tal levar um guarda-chuva?$$),
    ('n4-grammar-88', $$もう少し早く起きたらどう？$$, $$もうすこしはやくおきたらどう？$$, $$Que tal acordar um pouco mais cedo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$わからないなら、辞書で調べ____？$$, $$Se não entende, que tal procurar no dicionário?$$),
        (2, $$寒いなら、コートを着____ですか。$$, $$Se está com frio, que tal vestir o casaco?$$),
        (3, $$毎日少しずつ練習し____？$$, $$Que tal praticar um pouco todo dia?$$),
        (4, $$熱があるなら、病院に行っ____ですか。$$, $$Se está com febre, por que não vai ao hospital?$$),
        (5, $$気になるなら、本人に直接聞い____？$$, $$Se está curioso, por que não pergunta direto para a pessoa?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たらどう$$),
        (2, $$たらどう$$),
        (3, $$たらどう$$),
        (4, $$たらどう$$),
        (5, $$たらどう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
