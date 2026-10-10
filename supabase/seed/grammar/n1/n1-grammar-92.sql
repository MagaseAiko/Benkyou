-- n1-grammar-92 — 〜ないとも限らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-92',
    'grammar',
    'N1',
    $$〜ないとも限らない$$,
    $$nai tomo kagiranai$$,
    $$Pode ser que / Não é impossível que / Nunca se sabe se$$,
    $$ないとも限らない indica que existe uma pequena possibilidade de algo acontecer, geralmente algo ruim. Equivale a "pode ser que" ou "nunca se sabe se".

A pessoa usa essa expressão para justificar um cuidado ou uma precaução. Por exemplo, "pode ser que chova, então leve o guarda-chuva".

Muitas vezes a segunda parte é um conselho ou uma ação de prevenção.$$,
    $$É parecido com かもしれない, mas ないとも限らない destaca uma possibilidade pequena e ruim.

A forma ないとは限らない tem um sentido parecido.$$,
    $$Verbo (forma ない) + とも限らない
Adjetivo い (forma くない) + とも限らない$$,
    $$ないとも限らない$$,
    $$ないとも限らない|ないともかぎらない|ないとも限りません$$,
    ARRAY['ない', 'とも', '限らない']::text[],
    ARRAY['ないとも限らない', 'ないともかぎらない', 'ないとも限りません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-92', $$雨が降らないとも限らないから、傘を持っていこう。$$, $$あめがふらないともかぎらないから、かさをもっていこう。$$, $$Pode ser que chova, então vamos levar guarda-chuva.$$),
    ('n1-grammar-92', $$事故が起きないとも限らないので、保険に入っておこう。$$, $$じこがおきないともかぎらないので、ほけんにはいっておこう。$$, $$Nunca se sabe se vai acontecer um acidente, então vamos fazer seguro.$$),
    ('n1-grammar-92', $$誰かに聞かれないとも限らないから、小さい声で話して。$$, $$だれかにきかれないともかぎらないから、ちいさいこえではなして。$$, $$Pode ser que alguém ouça, então fale baixo.$$),
    ('n1-grammar-92', $$彼が気を変えないとも限らない。$$, $$かれがきをかえないともかぎらない。$$, $$Não é impossível que ele mude de ideia.$$),
    ('n1-grammar-92', $$地震が来ないとも限りませんから、準備しておきましょう。$$, $$じしんがこないともかぎりませんから、じゅんびしておきましょう。$$, $$Pode ser que venha um terremoto, então vamos nos preparar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混ま____から、早めに出よう。$$, $$Pode ser que a estrada esteja cheia, então vamos sair mais cedo.$$),
        (2, $$パソコンが壊れ____ので、データを保存しておく。$$, $$Nunca se sabe se o computador vai quebrar, então salvo os dados.$$),
        (3, $$忘れ____から、メモしておこう。$$, $$Pode ser que eu esqueça, então vou anotar.$$),
        (4, $$泥棒が入ら____ので、鍵をかけてください。$$, $$Pode ser que entre um ladrão, então tranque a porta.$$),
        (5, $$病気にかから____から、健康診断を受けよう。$$, $$Nunca se sabe se vamos adoecer, então vamos fazer exames.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないとも限らない$$),
        (1, $$ないともかぎらない$$),
        (2, $$ないとも限らない$$),
        (2, $$ないともかぎらない$$),
        (3, $$ないとも限らない$$),
        (3, $$ないともかぎらない$$),
        (4, $$ないとも限らない$$),
        (4, $$ないともかぎらない$$),
        (4, $$ないとも限りません$$),
        (5, $$ないとも限らない$$),
        (5, $$ないともかぎらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
