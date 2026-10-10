-- n5-grammar-15 — 〜ほうがいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-15',
    'grammar',
    'N5',
    $$〜ほうがいい$$,
    $$hou ga ii$$,
    $$É melhor / Deveria / Seria bom$$,
    $$ほうがいい é usado para dar conselhos e recomendações. Equivale a "é melhor..." ou "você deveria...".

A palavra ほう significa "lado" ou "opção". A ideia é comparar: entre fazer e não fazer, "o lado de fazer é melhor". Por isso, o conselho soa bem claro e direto.

Para aconselhar a fazer algo, o mais comum é usar o verbo no passado (forma た), mesmo que a ação seja no futuro. Para aconselhar a não fazer algo, usa-se a forma ない.

Como o conselho é direto, ele pode soar forte quando dito a um superior. Para suavizar, os japoneses costumam acrescentar と思います ou よ no final.$$,
    $$Usar a forma de dicionário em vez da forma た também é possível, mas a forma た soa mais natural e é a mais usada quando se dá um conselho direto a alguém.

Com a forma ない, nunca se usa o passado: o correto é ないほうがいい, e não なかったほうがいい.

A palavra ほう aqui é a mesma de より〜ほうが, usada para comparações. Lembrar dessa ligação ajuda a entender por que o conselho tem um tom de escolha entre duas opções.$$,
    $$Verbo na forma た + ほうがいい
Verbo na forma ない + ほうがいい

Educado: ほうがいいです
Mais suave: ほうがいいと思います

Escrita: ほうがいい / 方がいい
Forma escrita mais formal: ほうがよい$$,
    $$ほうがいい$$,
    $$ほうがいい|方がいい|ほうがよい|方がよい$$,
    ARRAY['ほう', 'が', 'いい']::text[],
    ARRAY['ほうがいい', '方がいい', 'ほうがいいです', '方がいいです', 'ほうがよい', '方がよい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-15', $$早く寝たほうがいいですよ。$$, $$はやくねたほうがいいですよ。$$, $$É melhor você dormir cedo.$$),
    ('n5-grammar-15', $$傘を持っていったほうがいい。$$, $$かさをもっていったほうがいい。$$, $$É melhor levar guarda-chuva.$$),
    ('n5-grammar-15', $$あまりお酒を飲まないほうがいいです。$$, $$あまりおさけをのまないほうがいいです。$$, $$É melhor não beber muito.$$),
    ('n5-grammar-15', $$熱があるなら、病院に行った方がいいよ。$$, $$ねつがあるなら、びょういんにいったほうがいいよ。$$, $$Se você está com febre, é melhor ir ao hospital.$$),
    ('n5-grammar-15', $$この道は夜は危ないから、通らないほうがいいと思います。$$, $$このみちはよるはあぶないから、とおらないほうがいいとおもいます。$$, $$Esta rua é perigosa à noite, então acho melhor não passar por ela.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れているなら、休んだ____よ。$$, $$Se você está cansado, é melhor descansar.$$),
        (2, $$冬の北海道は寒いから、コートを着た____です。$$, $$Hokkaido no inverno é frio, então é melhor usar casaco.$$),
        (3, $$夜遅くに一人で歩かない____。$$, $$É melhor não andar sozinho tarde da noite.$$),
        (4, $$風邪なら、薬を飲んだ____ですよ。$$, $$Se for resfriado, é melhor você tomar o remédio.$$),
        (5, $$先生に聞いた____と思います。$$, $$Acho que é melhor perguntar ao professor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうがいい$$),
        (1, $$方がいい$$),
        (1, $$ほうがいいです$$),
        (1, $$方がいいです$$),
        (2, $$ほうがいい$$),
        (2, $$方がいい$$),
        (3, $$ほうがいい$$),
        (3, $$方がいい$$),
        (3, $$ほうがいいです$$),
        (3, $$方がいいです$$),
        (4, $$ほうがいい$$),
        (4, $$方がいい$$),
        (5, $$ほうがいい$$),
        (5, $$方がいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
