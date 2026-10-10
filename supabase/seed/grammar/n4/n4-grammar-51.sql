-- n4-grammar-51 — なかなか〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-51',
    'grammar',
    'N4',
    $$なかなか〜ない$$,
    $$nakanaka ~ nai$$,
    $$Não... de jeito nenhum / Custa a / Demora para$$,
    $$なかなか〜ない é usado para dizer que algo não acontece, ou demora muito para acontecer, mesmo que a pessoa espere ou se esforce. Equivale a "custa a...", "demora para..." ou "não... de jeito nenhum".

なかなか vem antes do verbo, e o verbo fica na forma negativa. A ideia é de frustração ou dificuldade: a pessoa quer que algo aconteça, mas não acontece com facilidade.

É muito usado com ações que se espera que aconteçam, como o ônibus chegar, a chuva parar, conseguir dormir, decorar algo ou um resfriado melhorar.

Com a forma potencial, ele expressa dificuldade para conseguir fazer algo, como "não consigo decorar de jeito nenhum".$$,
    $$Em frases afirmativas, なかなか tem outro sentido: "bastante", "muito", geralmente como elogio, como em "é bem gostoso". Esse uso aparece no N3.

Comparado a あまり〜ない, que indica pouca frequência ou intensidade, なかなか〜ない destaca a dificuldade e a espera.

É comum usar なかなか com てくれない para reclamar que alguém ou algo não colabora, como uma criança que não dorme.$$,
    $$なかなか + Verbo na forma negativa
なかなか + Verbo potencial negativo (não consegue... de jeito nenhum)$$,
    $$なかなか$$,
    $$なかなか$$,
    ARRAY['なかなか', 'ない']::text[],
    ARRAY['なかなか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-51', $$バスがなかなか来ません。$$, $$バスがなかなかきません。$$, $$O ônibus está demorando muito para chegar.$$),
    ('n4-grammar-51', $$この漢字はなかなか覚えられない。$$, $$このかんじはなかなかおぼえられない。$$, $$Não consigo decorar este kanji de jeito nenhum.$$),
    ('n4-grammar-51', $$昨日の夜は、なかなか眠れませんでした。$$, $$きのうのよるは、なかなかねむれませんでした。$$, $$Ontem à noite, custei a pegar no sono.$$),
    ('n4-grammar-51', $$仕事がなかなか終わらない。$$, $$しごとがなかなかおわらない。$$, $$O trabalho não termina nunca.$$),
    ('n4-grammar-51', $$風邪がなかなか治らなくて困っています。$$, $$かぜがなかなかなおらなくてこまっています。$$, $$O resfriado não passa de jeito nenhum, e estou sofrendo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が____やみませんね。$$, $$A chuva não para de jeito nenhum, né?$$),
        (2, $$毎日勉強しているのに、日本語が____上手になりません。$$, $$Estudo todo dia, mas meu japonês custa a melhorar.$$),
        (3, $$子供が____寝てくれない。$$, $$A criança não dorme de jeito nenhum.$$),
        (4, $$彼からの返事が____来ない。$$, $$A resposta dele está demorando muito para chegar.$$),
        (5, $$この問題は難しくて、答えが____わからない。$$, $$Esta questão é difícil, e não consigo achar a resposta de jeito nenhum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なかなか$$),
        (2, $$なかなか$$),
        (3, $$なかなか$$),
        (4, $$なかなか$$),
        (5, $$なかなか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
