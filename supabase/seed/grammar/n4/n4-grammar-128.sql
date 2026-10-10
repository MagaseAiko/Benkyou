-- n4-grammar-128 — 〜ようと思う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-128',
    'grammar',
    'N4',
    $$〜ようと思う$$,
    $$you to omou$$,
    $$Pensar em (fazer) / Estar pensando em / Pretender$$,
    $$ようと思う é usado para dizer que você está pensando em fazer algo, ou que tem a intenção de fazer. Equivale a "estou pensando em..." ou "pretendo...".

Ele junta a forma volitiva do verbo (行こう, 食べよう) com と思う. A ideia literal é "penso: vou fazer isso".

A forma ようと思います expressa uma intenção no momento da fala. A forma ようと思っています indica uma intenção que a pessoa já tem há algum tempo, mais firme.

Comparado a つもり, ようと思う soa mais suave e flexível, como uma ideia que ainda está sendo considerada.$$,
    $$Para falar da intenção de outra pessoa, usa-se ようと思っている, e não ようと思う.

Na pergunta, 〜ようと思っていますか é uma forma educada de perguntar os planos de alguém.

ようと思ったけど significa "eu ia fazer, mas...", indicando uma intenção que não se concretizou.$$,
    $$Forma volitiva + と思う / と思います
Forma volitiva + と思っている / と思っています (intenção que se mantém)

Exemplos: 行く → 行こうと思う / 食べる → 食べようと思う / する → しようと思う$$,
    $$ようと思う$$,
    $$うと思|うとおも$$,
    ARRAY['よう', 'と', '思う']::text[],
    ARRAY['ようと思う', 'ようと思います', 'ようと思っている', 'おうと思う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-128', $$来年、日本へ留学しようと思います。$$, $$らいねん、にほんへりゅうがくしようとおもいます。$$, $$Estou pensando em fazer intercâmbio no Japão no ano que vem.$$),
    ('n4-grammar-128', $$週末は家でゆっくり休もうと思う。$$, $$しゅうまつはいえでゆっくりやすもうとおもう。$$, $$No fim de semana, penso em descansar em casa com calma.$$),
    ('n4-grammar-128', $$新しいパソコンを買おうと思っています。$$, $$あたらしいパソコンをかおうとおもっています。$$, $$Estou pensando em comprar um computador novo.$$),
    ('n4-grammar-128', $$疲れたから、今日は早く寝ようと思います。$$, $$つかれたから、きょうははやくねようとおもいます。$$, $$Estou cansado, então penso em dormir cedo hoje.$$),
    ('n4-grammar-128', $$将来、自分の店を開こうと思っている。$$, $$しょうらい、じぶんのみせをひらこうとおもっている。$$, $$No futuro, pretendo abrir minha própria loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休みに北海道へ行こ____います。$$, $$Estou pensando em ir a Hokkaido nas férias de verão.$$),
        (2, $$明日から毎朝走ろ____。$$, $$Estou pensando em correr toda manhã a partir de amanhã.$$),
        (3, $$来月、駅の近くに引っ越そ____います。$$, $$Estou pensando em me mudar para perto da estação no mês que vem.$$),
        (4, $$今夜はカレーを作ろ____。$$, $$Hoje à noite, penso em fazer curry.$$),
        (5, $$大学を卒業したら、日本で働こ____いる。$$, $$Depois de me formar na faculdade, pretendo trabalhar no Japão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うと思って$$),
        (2, $$うと思います$$),
        (2, $$うと思う$$),
        (3, $$うと思って$$),
        (4, $$うと思います$$),
        (4, $$うと思う$$),
        (5, $$うと思って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
