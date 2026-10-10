-- n1-grammar-21 — 〜でも何でもない / 〜くも何ともない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-21',
    'grammar',
    'N1',
    $$〜でも何でもない / 〜くも何ともない$$,
    $$demo nandemo nai / kumo nantomo nai$$,
    $$Não é nada disso / Nem um pouco / De jeito nenhum$$,
    $$でも何でもない e くも何ともない negam algo com muita força. Equivalem a "não é nada disso" ou "nem um pouco".

でも何でもない vem depois de substantivos e adjetivos な. Por exemplo, "ele não é meu amigo nem nada" ou "isso não é nada estranho".

くも何ともない vem depois de adjetivos い. Por exemplo, "não está nem um pouco difícil" ou "não dói nada".

O tom é enfático e muitas vezes um pouco irritado.$$,
    $$Expressões comuns são 友達でも何でもない, 痛くも何ともない e 怖くも何ともない.

É mais forte que ではない ou くない.$$,
    $$Substantivo / Adjetivo な + でも何でもない
Adjetivo い (sem い) + くも何ともない$$,
    $$でも何でもない$$,
    $$でも何でもない|でもなんでもない|くも何ともない|くもなんともない|でも何でもありません|くも何ともありません$$,
    ARRAY['でも', '何でも', 'ない']::text[],
    ARRAY['でも何でもない', 'くも何ともない', 'でも何でもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-21', $$彼は友達でも何でもない。$$, $$かれはともだちでもなんでもない。$$, $$Ele não é meu amigo nem nada.$$),
    ('n1-grammar-21', $$こんな傷、痛くも何ともない。$$, $$こんなきず、いたくもなんともない。$$, $$Um machucado desses não dói nada.$$),
    ('n1-grammar-21', $$そんなことは秘密でも何でもない。$$, $$そんなことはひみつでもなんでもない。$$, $$Isso não é segredo nenhum.$$),
    ('n1-grammar-21', $$この程度の寒さは、つらくも何ともない。$$, $$このていどのさむさは、つらくもなんともない。$$, $$Um frio desses não é nem um pouco difícil.$$),
    ('n1-grammar-21', $$彼の意見は特別でも何でもありません。$$, $$かれのいけんはとくべつでもなんでもありません。$$, $$A opinião dele não tem nada de especial.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あんな映画、面白____。$$, $$Aquele filme não tem graça nenhuma.$$),
        (2, $$彼女は恋人____。ただの同僚だ。$$, $$Ela não é minha namorada nem nada. É só uma colega.$$),
        (3, $$一人で住むのは寂し____。$$, $$Morar sozinho não é nem um pouco solitário.$$),
        (4, $$その話は冗談____。本当のことだ。$$, $$Isso não é brincadeira nenhuma. É verdade.$$),
        (5, $$こんな問題、難し____よ。$$, $$Um problema desses não é nada difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くも何ともない$$),
        (1, $$くもなんともない$$),
        (2, $$でも何でもない$$),
        (2, $$でもなんでもない$$),
        (3, $$くも何ともない$$),
        (3, $$くもなんともない$$),
        (4, $$でも何でもない$$),
        (4, $$でもなんでもない$$),
        (5, $$くも何ともない$$),
        (5, $$くもなんともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
