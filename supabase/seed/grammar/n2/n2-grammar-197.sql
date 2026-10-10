-- n2-grammar-197 — 〜ほど〜はない・〜くらい〜はない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-197',
    'grammar',
    'N2',
    $$〜ほど〜はない・〜くらい〜はない$$,
    $$hodo ~ wa nai / kurai ~ wa nai$$,
    $$Não há nada tão... quanto / Nada é mais... do que / Não existe... como$$,
    $$ほど〜はない e くらい〜はない servem para dizer que algo é o mais alto em algum aspecto, de acordo com a opinião da pessoa. Equivale a "não há nada tão... quanto" ou "nada é mais... do que".

Por exemplo, "não há nada tão divertido quanto viajar" ou "não existe pessoa tão gentil quanto ela".

É uma forma de comparação que expressa uma opinião forte e pessoal.$$,
    $$ぐらい também pode ser usado no lugar de くらい.

Expressões comuns são これほど〜はない e 〜ほど〜ものはない.$$,
    $$Substantivo + ほど + Adjetivo + Substantivo + はない
Substantivo + くらい + Adjetivo + Substantivo + はない
Verbo (forma dicionário) + ほど + Adjetivo + ことはない$$,
    $$ほど〜はない$$,
    $$ほど|くらい|ぐらい$$,
    ARRAY['ほど', 'は', 'ない']::text[],
    ARRAY['ほど〜はない', 'くらい〜はない', 'ぐらい〜はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-197', $$旅行ほど楽しいものはない。$$, $$りょこうほどたのしいものはない。$$, $$Não há nada tão divertido quanto viajar.$$),
    ('n2-grammar-197', $$彼女くらい優しい人はいない。$$, $$かのじょくらいやさしいひとはいない。$$, $$Não existe pessoa tão gentil quanto ela.$$),
    ('n2-grammar-197', $$今年の夏ほど暑い夏はなかった。$$, $$ことしのなつほどあついなつはなかった。$$, $$Nunca houve um verão tão quente quanto o deste ano.$$),
    ('n2-grammar-197', $$家族と過ごす時間ぐらい大切なものはない。$$, $$かぞくとすごすじかんぐらいたいせつなものはない。$$, $$Nada é mais importante do que o tempo com a família.$$),
    ('n2-grammar-197', $$一人で食事をするほど寂しいことはない。$$, $$ひとりでしょくじをするほどさびしいことはない。$$, $$Não há nada tão solitário quanto comer sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康____大切なものはない。$$, $$Nada é mais importante do que a saúde.$$),
        (2, $$この映画____感動した映画はない。$$, $$Não há filme que me emocionou tanto quanto este.$$),
        (3, $$富士山____美しい山はない。$$, $$Não existe montanha tão bonita quanto o monte Fuji.$$),
        (4, $$母の料理____おいしいものはない。$$, $$Não há nada tão gostoso quanto a comida da minha mãe.$$),
        (5, $$友達に裏切られる____悲しいことはない。$$, $$Não há nada tão triste quanto ser traído por um amigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-197', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (1, $$くらい$$),
        (1, $$ぐらい$$),
        (2, $$ほど$$),
        (2, $$くらい$$),
        (2, $$ぐらい$$),
        (3, $$ほど$$),
        (3, $$くらい$$),
        (3, $$ぐらい$$),
        (4, $$ほど$$),
        (4, $$くらい$$),
        (4, $$ぐらい$$),
        (5, $$ほど$$),
        (5, $$くらい$$),
        (5, $$ぐらい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
