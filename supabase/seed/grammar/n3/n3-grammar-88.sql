-- n3-grammar-88 — 〜には（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-88',
    'grammar',
    'N3',
    $$〜には（目的）$$,
    $$ni wa (mokuteki)$$,
    $$Para (fazer) / A fim de$$,
    $$Nesse uso, には indica um objetivo, e a segunda parte explica o que é necessário ou recomendado para alcançá-lo. Equivale a "para" ou "a fim de".

Ele vem depois do verbo na forma de dicionário. Por exemplo, "para ir à estação, pegue este ônibus" ou "para entrar na faculdade, é preciso passar no exame".

A segunda parte costuma ser uma condição, uma necessidade, um conselho ou uma informação útil, com expressões como 必要だ, なければならない, がいい, が便利だ ou かかる.

A diferença em relação a ために é que ために expressa uma intenção ou um esforço para alcançar algo, enquanto には apresenta o objetivo de forma geral e diz o que é preciso para chegar lá.$$,
    $$Não confunda com には de lugar e tempo, que é a partícula に com は de destaque, como em 東京には (em Tóquio).

Essa estrutura é muito útil para pedir e dar informações práticas, como caminhos e requisitos.

Com substantivos, a ideia de objetivo é expressa com のには ou com ために.$$,
    $$Verbo na forma de dicionário + には + Condição / Necessidade / Conselho
… + には + 〜が必要だ / 〜なければならない / 〜がいい / 〜が便利だ / 〜かかる$$,
    $$には$$,
    $$には$$,
    ARRAY['に', 'は']::text[],
    ARRAY['には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-88', $$駅に行くには、このバスに乗ってください。$$, $$えきにいくには、このバスにのってください。$$, $$Para ir à estação, pegue este ônibus.$$),
    ('n3-grammar-88', $$日本語が上手になるには、毎日練習することが大切だ。$$, $$にほんごがじょうずになるには、まいにちれんしゅうすることがたいせつだ。$$, $$Para melhorar o japonês, é importante praticar todo dia.$$),
    ('n3-grammar-88', $$その大学に入るには、試験に合格しなければならない。$$, $$そのだいがくにはいるには、しけんにごうかくしなければならない。$$, $$Para entrar nessa faculdade, é preciso passar no exame.$$),
    ('n3-grammar-88', $$この料理を作るには、三時間かかる。$$, $$このりょうりをつくるには、さんじかんかかる。$$, $$Para fazer esta comida, leva três horas.$$),
    ('n3-grammar-88', $$健康を保つには、よく寝ることが一番だ。$$, $$けんこうをたもつには、よくねることがいちばんだ。$$, $$Para manter a saúde, o melhor é dormir bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山に登る____、準備が必要だ。$$, $$Para subir o Monte Fuji, é preciso se preparar.$$),
        (2, $$この会社に入る____、英語ができなければならない。$$, $$Para entrar nesta empresa, é preciso saber inglês.$$),
        (3, $$空港へ行く____、電車が便利です。$$, $$Para ir ao aeroporto, o trem é prático.$$),
        (4, $$夢をかなえる____、努力が必要だ。$$, $$Para realizar um sonho, é preciso esforço.$$),
        (5, $$車を運転する____、免許がいる。$$, $$Para dirigir um carro, é preciso ter carteira.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には$$),
        (2, $$には$$),
        (3, $$には$$),
        (4, $$には$$),
        (5, $$には$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
