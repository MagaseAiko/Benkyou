-- n3-grammar-59 — もしかしたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-59',
    'grammar',
    'N3',
    $$もしかしたら$$,
    $$moshika shitara$$,
    $$Talvez / Pode ser que / Será que$$,
    $$もしかしたら é usado para indicar uma possibilidade, sem certeza. Equivale a "talvez" ou "pode ser que".

Ele fica no começo da frase e quase sempre aparece junto com かもしれない no final, reforçando a ideia de dúvida.

Por exemplo, "talvez amanhã chova" ou "pode ser que ele já tenha ido embora".

A forma もしかすると tem o mesmo sentido e soa um pouco mais formal. A forma もしかして é usada principalmente em perguntas, quando a pessoa suspeita de algo e quer confirmar: "por acaso você é o Tanaka?".$$,
    $$もしかして é muito útil para perguntar algo com delicadeza, sem afirmar diretamente, como ao reconhecer alguém.

Na fala casual, もしかしたら pode ser reduzido para もしかしたら… sozinho, deixando a frase em aberto.

Essas expressões indicam uma possibilidade baixa ou média. Para algo mais provável, usa-se たぶん.$$,
    $$もしかしたら + … + かもしれない
もしかすると + … + かもしれない (um pouco mais formal)
もしかして + … + ですか / の？ (pergunta: por acaso...?)$$,
    $$もしかしたら$$,
    $$もしかしたら|もしかすると|もしかして$$,
    ARRAY['もしかしたら']::text[],
    ARRAY['もしかしたら', 'もしかすると', 'もしかして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-59', $$空が暗いから、もしかしたら、明日は雨かもしれない。$$, $$そらがくらいから、もしかしたら、あしたはあめかもしれない。$$, $$O céu está escuro, talvez chova amanhã.$$),
    ('n3-grammar-59', $$電気が消えている。もしかしたら、彼はもう帰ったかもしれません。$$, $$でんきがきえている。もしかしたら、かれはもうかえったかもしれません。$$, $$As luzes estão apagadas. Pode ser que ele já tenha ido embora.$$),
    ('n3-grammar-59', $$もしかすると、この話は本当かもしれない。$$, $$もしかすると、このはなしはほんとうかもしれない。$$, $$Talvez esta história seja verdade.$$),
    ('n3-grammar-59', $$すみません、もしかして、田中さんですか。$$, $$すみません、もしかして、たなかさんですか。$$, $$Com licença, por acaso o senhor é o Tanaka?$$),
    ('n3-grammar-59', $$頑張れば、もしかしたら、試験に合格できるかもしれない。$$, $$がんばれば、もしかしたら、しけんにごうかくできるかもしれない。$$, $$Se eu me esforçar, talvez consiga passar na prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、明日行けないかもしれません。$$, $$Talvez eu não possa ir amanhã.$$),
        (2, $$____、彼女は風邪をひいたのかもしれない。$$, $$Pode ser que ela tenha pegado um resfriado.$$),
        (3, $$____、財布は家にあるかもしれない。$$, $$Talvez a carteira esteja em casa.$$),
        (4, $$____、この答えは間違っているかもしれない。$$, $$Pode ser que esta resposta esteja errada.$$),
        (5, $$雪がひどいから、____、今日は電車が遅れるかもしれない。$$, $$A neve está forte, então talvez o trem atrase hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしかしたら$$),
        (1, $$もしかすると$$),
        (2, $$もしかしたら$$),
        (2, $$もしかすると$$),
        (3, $$もしかしたら$$),
        (3, $$もしかすると$$),
        (4, $$もしかしたら$$),
        (4, $$もしかすると$$),
        (5, $$もしかしたら$$),
        (5, $$もしかすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
