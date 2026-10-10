-- n1-grammar-63 — 〜こともあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-63',
    'grammar',
    'N1',
    $$〜こともあって$$,
    $$koto mo atte$$,
    $$Também por causa de / Em parte porque / Até porque$$,
    $$こともあって indica um dos motivos de algo, sugerindo que há outros motivos também. Equivale a "também por causa de" ou "em parte porque".

A pessoa apresenta uma razão de forma suave, sem dizer que é a única. Por exemplo, "em parte por ser feriado, o parque estava cheio".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com こともあり, que é mais formal.

Também aparece como ということもあって.$$,
    $$Verbo / Adjetivo (forma simples) + こともあって
Adjetivo な + な + こともあって
Substantivo + という + こともあって$$,
    $$こともあって$$,
    $$こともあって|こともあり$$,
    ARRAY['こと', 'も', 'あって']::text[],
    ARRAY['こともあって', 'こともあり', 'ということもあって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-63', $$休日だったこともあって、公園は混んでいた。$$, $$きゅうじつだったこともあって、こうえんはこんでいた。$$, $$Em parte por ser feriado, o parque estava cheio.$$),
    ('n1-grammar-63', $$駅から近いこともあって、この店はいつも人が多い。$$, $$えきからちかいこともあって、このみせはいつもひとがおおい。$$, $$Até porque fica perto da estação, esta loja vive cheia.$$),
    ('n1-grammar-63', $$疲れていたこともあり、すぐに寝てしまった。$$, $$つかれていたこともあり、すぐにねてしまった。$$, $$Em parte por estar cansado, dormi logo.$$),
    ('n1-grammar-63', $$初めての海外ということもあって、とても緊張した。$$, $$はじめてのかいがいということもあって、とてもきんちょうした。$$, $$Em parte por ser minha primeira vez no exterior, fiquei muito nervoso.$$),
    ('n1-grammar-63', $$値段が安いこともあって、よく売れている。$$, $$ねだんがやすいこともあって、よくうれている。$$, $$Também por causa do preço baixo, está vendendo bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降っていた____、客は少なかった。$$, $$Em parte porque estava chovendo, havia poucos clientes.$$),
        (2, $$彼は真面目な____、みんなに信頼されている。$$, $$Até porque é sério, ele tem a confiança de todos.$$),
        (3, $$夏休みという____、観光地はにぎやかだった。$$, $$Em parte por serem férias de verão, os pontos turísticos estavam movimentados.$$),
        (4, $$体調が悪かった____、早めに帰った。$$, $$Também por não estar bem de saúde, fui embora mais cedo.$$),
        (5, $$子供が生まれた____、広い家に引っ越した。$$, $$Em parte porque nosso filho nasceu, mudamos para uma casa maior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こともあって$$),
        (1, $$こともあり$$),
        (2, $$こともあって$$),
        (2, $$こともあり$$),
        (3, $$こともあって$$),
        (3, $$こともあり$$),
        (4, $$こともあって$$),
        (4, $$こともあり$$),
        (5, $$こともあって$$),
        (5, $$こともあり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
