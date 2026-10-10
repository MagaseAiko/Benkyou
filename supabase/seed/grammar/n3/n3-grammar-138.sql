-- n3-grammar-138 — 〜といっても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-138',
    'grammar',
    'N3',
    $$〜といっても$$,
    $$to itte mo$$,
    $$Embora se diga que / Na verdade / É... mas$$,
    $$といっても é usado para corrigir ou limitar uma impressão que a frase anterior poderia dar. Equivale a "embora se diga que..., na verdade..." ou "é..., mas...".

A primeira parte apresenta algo que poderia soar impressionante ou importante, e a segunda mostra que a realidade é mais simples, menor ou diferente do esperado.

Por exemplo, "sei cozinhar, mas só coisas simples", "sou presidente, mas a empresa só tem três funcionários" ou "folga, mas só de dois dias".

O tom costuma ser de modéstia, honestidade ou de ajuste da expectativa do ouvinte.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.$$,
    $$といっても é diferente de と言ってもいい (pode-se dizer que), que reforça uma afirmação.

É muito útil para falar de si mesmo com modéstia, evitando parecer que está se gabando.

Na fala, também se usa って言っても com o mesmo sentido.$$,
    $$Substantivo + といっても、 + Realidade mais simples
Verbo / Adjetivo (forma simples) + といっても、 + Realidade

Escrita: といっても / と言っても$$,
    $$といっても$$,
    $$といっても|と言っても$$,
    ARRAY['と', 'いって', 'も']::text[],
    ARRAY['といっても', 'と言っても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-138', $$料理ができるといっても、簡単なものだけです。$$, $$りょうりができるといっても、かんたんなものだけです。$$, $$Sei cozinhar, mas só coisas simples.$$),
    ('n3-grammar-138', $$休みといっても、二日だけだ。$$, $$やすみといっても、ふつかだけだ。$$, $$Folga, sim, mas só de dois dias.$$),
    ('n3-grammar-138', $$日本語が話せるといっても、日常会話程度です。$$, $$にほんごがはなせるといっても、にちじょうかいわていどです。$$, $$Falo japonês, mas só o nível de conversa do dia a dia.$$),
    ('n3-grammar-138', $$社長といっても、社員は三人しかいない。$$, $$しゃちょうといっても、しゃいんはさんにんしかいない。$$, $$Sou presidente, mas a empresa só tem três funcionários.$$),
    ('n3-grammar-138', $$この町は寒いといっても、雪は降らない。$$, $$このまちはさむいといっても、ゆきはふらない。$$, $$Esta cidade é fria, mas não chega a nevar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行____、近くの温泉に行っただけだ。$$, $$Viagem, sim, mas só fui a uma fonte termal aqui perto.$$),
        (2, $$英語ができる____、少しだけです。$$, $$Sei inglês, mas só um pouco.$$),
        (3, $$仕事が忙しい____、毎日ではない。$$, $$O trabalho é corrido, mas não todos os dias.$$),
        (4, $$家____、小さなアパートです。$$, $$Casa, sim, mas é um apartamento pequeno.$$),
        (5, $$夏休み____、宿題がたくさんある。$$, $$São férias de verão, mas tem muita lição.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といっても$$),
        (1, $$と言っても$$),
        (2, $$といっても$$),
        (2, $$と言っても$$),
        (3, $$といっても$$),
        (3, $$と言っても$$),
        (4, $$といっても$$),
        (4, $$と言っても$$),
        (5, $$といっても$$),
        (5, $$と言っても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
