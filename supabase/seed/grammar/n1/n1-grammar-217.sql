-- n1-grammar-217 — 〜ともあろうものが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-217',
    'grammar',
    'N1',
    $$〜ともあろうものが$$,
    $$tomo arou mono ga$$,
    $$Logo alguém que é / Justo um / Mesmo sendo$$,
    $$ともあろうものが indica surpresa ou crítica porque alguém em uma posição importante fez algo inadequado. Equivale a "logo alguém que é..." ou "justo um...".

A primeira parte é uma posição respeitada, e a segunda é uma atitude que não combina com ela. Por exemplo, "logo um professor, cometer um erro desses".

É uma expressão formal, com tom de crítica forte.$$,
    $$Também aparece como ともあろう人が.

É usado para criticar quem deveria dar o exemplo.$$,
    $$Substantivo (posição) + ともあろうものが / ともあろう者が
Substantivo + ともあろう + Substantivo$$,
    $$ともあろうものが$$,
    $$ともあろうものが|ともあろう者が|ともあろう人が|ともあろう$$,
    ARRAY['とも', 'あろう', 'もの', 'が']::text[],
    ARRAY['ともあろうものが', 'ともあろう者が', 'ともあろう人が']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-217', $$教師ともあろうものが、生徒に暴力を振るうとは。$$, $$きょうしともあろうものが、せいとにぼうりょくをふるうとは。$$, $$Logo um professor, agredir um aluno...$$),
    ('n1-grammar-217', $$警察官ともあろう者が、法律を破るなんて。$$, $$けいさつかんともあろうものが、ほうりつをやぶるなんて。$$, $$Justo um policial, quebrar a lei...$$),
    ('n1-grammar-217', $$大臣ともあろう人が、そんな発言をするとは驚いた。$$, $$だいじんともあろうひとが、そんなはつげんをするとはおどろいた。$$, $$Fiquei surpreso que logo um ministro fizesse uma declaração dessas.$$),
    ('n1-grammar-217', $$プロともあろうものが、こんな簡単なミスをするなんて。$$, $$プロともあろうものが、こんなかんたんなミスをするなんて。$$, $$Logo um profissional, cometer um erro tão simples...$$),
    ('n1-grammar-217', $$医者ともあろう者が、患者の秘密をもらすとは。$$, $$いしゃともあろうものが、かんじゃのひみつをもらすとは。$$, $$Justo um médico, revelar os segredos dos pacientes...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長____、会社のお金を使い込むとは。$$, $$Logo o presidente, desviar o dinheiro da empresa...$$),
        (2, $$裁判官____、賄賂を受け取るなんて。$$, $$Justo um juiz, aceitar propina...$$),
        (3, $$大学教授____、論文を盗むとは信じられない。$$, $$É inacreditável que logo um professor universitário plagie um artigo.$$),
        (4, $$チャンピオン____、こんな相手に負けるとは。$$, $$Logo o campeão, perder para um adversário desses...$$),
        (5, $$政治家____、嘘をつくなんて許せない。$$, $$É imperdoável que logo um político minta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-217', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともあろうものが$$),
        (1, $$ともあろう者が$$),
        (1, $$ともあろう人が$$),
        (2, $$ともあろうものが$$),
        (2, $$ともあろう者が$$),
        (2, $$ともあろう人が$$),
        (3, $$ともあろうものが$$),
        (3, $$ともあろう者が$$),
        (3, $$ともあろう人が$$),
        (4, $$ともあろうものが$$),
        (4, $$ともあろう者が$$),
        (4, $$ともあろう人が$$),
        (5, $$ともあろうものが$$),
        (5, $$ともあろう者が$$),
        (5, $$ともあろう人が$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
