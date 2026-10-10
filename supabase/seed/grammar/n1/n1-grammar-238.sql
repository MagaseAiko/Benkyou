-- n1-grammar-238 — 〜わ〜わで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-238',
    'grammar',
    'N1',
    $$〜わ〜わで$$,
    $$wa ~ wa de$$,
    $$Entre... e / Não só... como também / Um atrás do outro$$,
    $$わ〜わで serve para listar vários problemas que aconteceram ao mesmo tempo, mostrando que a situação foi muito difícil. Equivale a "entre... e" ou "não só..., como também".

A pessoa reclama de uma série de coisas ruins. Por exemplo, "entre chuva e vento, foi um dia horrível".

É uma expressão coloquial.$$,
    $$Costuma terminar com 大変だった ou さんざんだった.

A forma 〜わ〜わ também aparece sem で, como 出るわ出るわ, "sai um atrás do outro".$$,
    $$Verbo / Adjetivo い (forma simples) + わ + Verbo / Adjetivo い + わで$$,
    $$わ〜わで$$,
    $$わで$$,
    ARRAY['わ', 'わ', 'で']::text[],
    ARRAY['わ〜わで', 'わ〜わ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-238', $$雨は降るわ風は吹くわで、ひどい一日だった。$$, $$あめはふるわかぜはふくわで、ひどいいちにちだった。$$, $$Entre chuva e vento, foi um dia horrível.$$),
    ('n1-grammar-238', $$財布はなくすわ電車は遅れるわで、さんざんだった。$$, $$さいふはなくすわでんしゃはおくれるわで、さんざんだった。$$, $$Perdi a carteira e o trem atrasou, foi um desastre.$$),
    ('n1-grammar-238', $$子供は泣くわ犬はほえるわで、うるさくて眠れない。$$, $$こどもはなくわいぬはほえるわで、うるさくてねむれない。$$, $$Entre a criança chorando e o cachorro latindo, não dá para dormir de tanto barulho.$$),
    ('n1-grammar-238', $$熱は出るわ咳は止まらないわで、大変だった。$$, $$ねつはでるわせきはとまらないわで、たいへんだった。$$, $$Tive febre e a tosse não parava, foi muito difícil.$$),
    ('n1-grammar-238', $$道は混んでいるわ店は休みだわで、旅行は失敗だった。$$, $$みちはこんでいるわみせはやすみだわで、りょこうはしっぱいだった。$$, $$A estrada estava cheia e a loja fechada, a viagem foi um fracasso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊するわ、忘れ物をする____、今日はついていない。$$, $$Dormi demais e esqueci coisas, hoje não é meu dia.$$),
        (2, $$値段は高いわ、味はまずい____、二度と行かない。$$, $$Era caro e a comida ruim, nunca mais vou.$$),
        (3, $$仕事は多いわ、上司は厳しい____、毎日つらい。$$, $$Tem muito trabalho e o chefe é rígido, todo dia é duro.$$),
        (4, $$足は痛いわ、荷物は重い____、もう歩けない。$$, $$O pé dói e a bagagem está pesada, não consigo mais andar.$$),
        (5, $$宿題はあるわ、試験はある____、遊ぶ暇がない。$$, $$Tem lição de casa e prova, não sobra tempo para brincar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-238', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わで$$),
        (2, $$わで$$),
        (3, $$わで$$),
        (4, $$わで$$),
        (5, $$わで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
