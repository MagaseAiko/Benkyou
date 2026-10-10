-- n2-grammar-136 — せめて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-136',
    'grammar',
    'N2',
    $$せめて$$,
    $$semete$$,
    $$Pelo menos / Ao menos / No mínimo$$,
    $$せめて indica o mínimo que a pessoa deseja, mesmo que não consiga o ideal. Equivale a "pelo menos" ou "ao menos".

A pessoa aceita que não pode ter tudo, mas espera ou pede ao menos uma pequena parte. Por exemplo, "se não pode vir, pelo menos ligue".

A frase costuma terminar com um desejo, um pedido ou uma intenção, como たい, てほしい ou ください.$$,
    $$É parecido com 少なくとも, mas せめて expressa desejo, enquanto 少なくとも é mais objetivo.

Costuma aparecer junto com だけでも ou くらい.$$,
    $$せめて + Substantivo / Quantidade + だけでも / くらい
せめて + Frase (desejo / pedido)$$,
    $$せめて$$,
    $$せめて$$,
    ARRAY['せめて']::text[],
    ARRAY['せめて', 'せめて〜だけでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-136', $$来られないなら、せめて電話くらいしてほしい。$$, $$こられないなら、せめてでんわくらいしてほしい。$$, $$Se não pode vir, pelo menos ligue.$$),
    ('n2-grammar-136', $$せめて週に一回は運動したい。$$, $$せめてしゅうにいっかいはうんどうしたい。$$, $$Quero me exercitar pelo menos uma vez por semana.$$),
    ('n2-grammar-136', $$優勝は無理でも、せめて三位には入りたい。$$, $$ゆうしょうはむりでも、せめてさんいにははいりたい。$$, $$Mesmo que vencer seja impossível, quero ao menos ficar em terceiro.$$),
    ('n2-grammar-136', $$せめて名前だけでも教えてください。$$, $$せめてなまえだけでもおしえてください。$$, $$Me diga ao menos o seu nome.$$),
    ('n2-grammar-136', $$せめてもう一日休みがあればいいのに。$$, $$せめてもういちにちやすみがあればいいのに。$$, $$Seria bom ter pelo menos mais um dia de folga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____一時間だけでも寝たい。$$, $$Quero dormir pelo menos uma hora.$$),
        (2, $$忙しくても、____朝ご飯は食べなさい。$$, $$Mesmo ocupado, pelo menos tome o café da manhã.$$),
        (3, $$____雨がやむまで待ちましょう。$$, $$Vamos esperar ao menos até a chuva parar.$$),
        (4, $$全部は無理でも、____半分は終わらせたい。$$, $$Mesmo que tudo seja impossível, quero terminar ao menos a metade.$$),
        (5, $$____お礼だけでも言わせてください。$$, $$Deixe-me ao menos agradecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せめて$$),
        (2, $$せめて$$),
        (3, $$せめて$$),
        (4, $$せめて$$),
        (5, $$せめて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
