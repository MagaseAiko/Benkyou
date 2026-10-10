-- n3-grammar-26 — 〜気味
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-26',
    'grammar',
    'N3',
    $$〜気味$$,
    $$gimi$$,
    $$Um pouco / Meio / Com tendência a$$,
    $$気味 é usado para dizer que alguém ou algo está um pouco em certo estado, geralmente negativo. Equivale a "um pouco", "meio" ou "com tendência a".

Ele vem depois de substantivos ou do verbo na forma ます sem ます. Por exemplo, 風邪気味 (meio resfriado), 疲れ気味 (um pouco cansado), 太り気味 (um pouco acima do peso).

A ideia é de um estado leve, que não é muito forte, mas que se percebe. Por isso, é usado para sintomas, cansaço, tendências de peso, atrasos e mudanças graduais.

気味 funciona como um adjetivo な: pode ser seguido de だ, です, な e で.$$,
    $$Comparando: がち indica que algo acontece com frequência; 気味 indica que, no momento, há um pouco daquele estado.

Sozinho, 気味 (きみ) aparece em palavras como 気味が悪い, que significa "estranho" ou "assustador".

風邪気味 é uma das expressões mais usadas para justificar um mal-estar leve no trabalho ou na escola.$$,
    $$Substantivo + 気味 + だ / です (風邪気味 / 緊張気味 / 寝不足気味)
Verbo na forma ます sem ます + 気味 + だ / です (疲れ気味 / 太り気味 / 遅れ気味)
〜気味 + で、 + Frase

Escrita: 気味 / ぎみ (lido ぎみ como sufixo)$$,
    $$気味$$,
    $$気味|ぎみ$$,
    ARRAY['気味']::text[],
    ARRAY['気味', 'ぎみ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-26', $$今日は少し風邪気味です。$$, $$きょうはすこしかぜぎみです。$$, $$Hoje estou meio resfriado.$$),
    ('n3-grammar-26', $$最近、疲れ気味なので、早く寝ています。$$, $$さいきん、つかれぎみなので、はやくねています。$$, $$Ultimamente estou um pouco cansado, então tenho dormido cedo.$$),
    ('n3-grammar-26', $$彼は少し太り気味だ。$$, $$かれはすこしふとりぎみだ。$$, $$Ele está um pouco acima do peso.$$),
    ('n3-grammar-26', $$電車が遅れ気味で、会議に間に合うか心配だ。$$, $$でんしゃがおくれぎみで、かいぎにまにあうかしんぱいだ。$$, $$O trem está meio atrasado, e estou preocupado se vou chegar a tempo para a reunião.$$),
    ('n3-grammar-26', $$仕事が忙しくて、寝不足気味です。$$, $$しごとがいそがしくて、ねぶそくぎみです。$$, $$Estou com o trabalho corrido e meio sem dormir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$少し熱があって、風邪____です。$$, $$Estou com um pouco de febre, meio resfriado.$$),
        (2, $$最近働きすぎて、疲れ____だ。$$, $$Ultimamente trabalhei demais e estou meio cansado.$$),
        (3, $$冬休みに食べすぎて、太り____です。$$, $$Comi demais nas férias de inverno e estou um pouco acima do peso.$$),
        (4, $$試験の前で、彼は緊張____だった。$$, $$Antes da prova, ele estava meio nervoso.$$),
        (5, $$最近の物価は上がり____だ。$$, $$Ultimamente os preços estão com tendência de alta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$気味$$),
        (1, $$ぎみ$$),
        (2, $$気味$$),
        (2, $$ぎみ$$),
        (3, $$気味$$),
        (3, $$ぎみ$$),
        (4, $$気味$$),
        (4, $$ぎみ$$),
        (5, $$気味$$),
        (5, $$ぎみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
