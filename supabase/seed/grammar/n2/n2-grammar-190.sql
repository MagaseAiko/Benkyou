-- n2-grammar-190 — 〜ようでは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-190',
    'grammar',
    'N2',
    $$〜ようでは$$,
    $$you dewa$$,
    $$Se for assim / Desse jeito / Se continuar assim$$,
    $$ようでは indica que, se uma situação ruim continuar, o resultado será negativo. Equivale a "se for assim..." ou "desse jeito...".

A primeira parte mostra uma atitude ou um estado que a pessoa critica, e a segunda mostra uma consequência ruim. Por exemplo, "se você se atrasa todo dia, não vai ser promovido".

O tom é de crítica, advertência ou preocupação.$$,
    $$Na fala, aparece como ようじゃ.

A segunda parte costuma ser だめだ, 困る, できない ou 無理だ.$$,
    $$Verbo (forma simples) + ようでは + Resultado negativo
Adjetivo い + ようでは
Adjetivo な + な + ようでは$$,
    $$ようでは$$,
    $$ようでは|ようじゃ$$,
    ARRAY['よう', 'では']::text[],
    ARRAY['ようでは', 'ようじゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-190', $$毎日遅刻するようでは、昇進は無理だ。$$, $$まいにちちこくするようでは、しょうしんはむりだ。$$, $$Se você se atrasa todo dia, promoção é impossível.$$),
    ('n2-grammar-190', $$こんな簡単な問題がわからないようでは、合格できない。$$, $$こんなかんたんなもんだいがわからないようでは、ごうかくできない。$$, $$Se não entende um problema tão simples, não vai passar.$$),
    ('n2-grammar-190', $$すぐにあきらめるようでは、何もできないよ。$$, $$すぐにあきらめるようでは、なにもできないよ。$$, $$Se desiste logo, não vai conseguir fazer nada.$$),
    ('n2-grammar-190', $$この程度で疲れるようじゃ、山には登れない。$$, $$このていどでつかれるようじゃ、やまにはのぼれない。$$, $$Se fica cansado com tão pouco, não vai conseguir subir a montanha.$$),
    ('n2-grammar-190', $$人の話を聞かないようでは、いいリーダーになれない。$$, $$ひとのはなしをきかないようでは、いいリーダーになれない。$$, $$Se não ouve os outros, não vai ser um bom líder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$挨拶もできない____、社会人として失格だ。$$, $$Se não consegue nem cumprimentar, é reprovado como profissional.$$),
        (2, $$宿題を忘れる____、先生に怒られるよ。$$, $$Se esquecer a lição de casa, o professor vai brigar com você.$$),
        (3, $$こんなにミスが多い____、仕事を任せられない。$$, $$Com tantos erros assim, não dá para confiar o trabalho a você.$$),
        (4, $$毎日お酒を飲む____、体を壊すよ。$$, $$Se beber todo dia, vai acabar doente.$$),
        (5, $$自分で決められない____、困るね。$$, $$Se não consegue decidir sozinho, fica complicado, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-190', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようでは$$),
        (1, $$ようじゃ$$),
        (2, $$ようでは$$),
        (2, $$ようじゃ$$),
        (3, $$ようでは$$),
        (3, $$ようじゃ$$),
        (4, $$ようでは$$),
        (4, $$ようじゃ$$),
        (5, $$ようでは$$),
        (5, $$ようじゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
