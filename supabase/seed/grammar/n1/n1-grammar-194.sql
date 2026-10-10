-- n1-grammar-194 — 〜ても知らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-194',
    'grammar',
    'N1',
    $$〜ても知らない$$,
    $$te mo shiranai$$,
    $$Depois não diga que não avisei / Problema seu / Não me responsabilizo$$,
    $$ても知らない é usado para avisar alguém de que, se algo ruim acontecer, a responsabilidade é da própria pessoa. Equivale a "depois não diga que não avisei" ou "problema seu".

O tom é de advertência, às vezes com irritação. Por exemplo, "se não estudar, vai reprovar, depois não diga que não avisei".

É uma expressão coloquial.$$,
    $$A forma たら知らない também é muito usada, com o mesmo sentido.

É usada com pessoas próximas, como familiares e amigos.$$,
    $$Verbo (forma て) + も知らない / も知らないよ
Verbo (forma たら) + 知らない$$,
    $$ても知らない$$,
    $$ても知らない|でも知らない|ても知らないよ|でも知りません|ても知りません|たら知らない$$,
    ARRAY['て', 'も', '知らない']::text[],
    ARRAY['ても知らない', 'でも知らない', 'たら知らない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-194', $$勉強しないで、試験に落ちても知らないよ。$$, $$べんきょうしないで、しけんにおちてもしらないよ。$$, $$Se não estudar e reprovar, depois não diga que não avisei.$$),
    ('n1-grammar-194', $$そんなに食べて、お腹を壊しても知らないからね。$$, $$そんなにたべて、おなかをこわしてもしらないからね。$$, $$Comendo tanto assim, se passar mal, problema seu.$$),
    ('n1-grammar-194', $$傘を持たないで、雨にぬれても知らないよ。$$, $$かさをもたないで、あめにぬれてもしらないよ。$$, $$Se sair sem guarda-chuva e se molhar, não me responsabilizo.$$),
    ('n1-grammar-194', $$夜更かしして、明日起きられなくても知らない。$$, $$よふかしして、あしたおきられなくてもしらない。$$, $$Se ficar acordado até tarde e não conseguir acordar amanhã, problema seu.$$),
    ('n1-grammar-194', $$先生に言いつけたら知らないぞ。$$, $$せんせいにいいつけたらしらないぞ。$$, $$Se você contar para o professor, vai ver só.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんな格好で出かけて、風邪をひい____。$$, $$Saindo assim, se pegar resfriado, depois não diga que não avisei.$$),
        (2, $$早く準備しないと、遅れ____。$$, $$Se não se arrumar logo e se atrasar, problema seu.$$),
        (3, $$無理をして、倒れ____。$$, $$Se forçar e passar mal, não me responsabilizo.$$),
        (4, $$お金を使いすぎて、後で困っ____。$$, $$Se gastar demais e passar aperto depois, problema seu.$$),
        (5, $$宿題をしないで、先生に怒られ____。$$, $$Se não fizer a lição e levar bronca do professor, depois não diga que não avisei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-194', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても知らないよ$$),
        (1, $$ても知らない$$),
        (2, $$ても知らないよ$$),
        (2, $$ても知らない$$),
        (3, $$ても知らないよ$$),
        (3, $$ても知らない$$),
        (4, $$ても知らないよ$$),
        (4, $$ても知らない$$),
        (5, $$ても知らないよ$$),
        (5, $$ても知らない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
