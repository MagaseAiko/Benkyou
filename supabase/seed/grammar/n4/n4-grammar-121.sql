-- n4-grammar-121 — やっと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-121',
    'grammar',
    'N4',
    $$やっと$$,
    $$yatto$$,
    $$Finalmente / Enfim / Por fim$$,
    $$やっと é um advérbio que significa "finalmente" ou "enfim". Ele é usado quando algo desejado acontece depois de muito tempo de espera ou de bastante esforço.

O tom é de alívio ou satisfação: a pessoa esperou, tentou ou se esforçou, e o resultado chegou. Por exemplo, terminar uma lição longa, passar numa prova depois de várias tentativas ou o ônibus chegar depois de muita espera.

Ele costuma aparecer com o verbo no passado ou com expressões de mudança, como ようになった.

やっと é diferente de ついに. ついに também significa "finalmente", mas soa mais formal e dramático, e pode ser usado para resultados bons ou ruins. やっと é usado quase sempre para algo desejado.$$,
    $$Por ter um tom de alívio, やっと não combina bem com resultados negativos. Para algo ruim que finalmente aconteceu, usa-se ついに.

Também existe a expressão やっと〜できる, para algo que se consegue fazer com muito custo.

Na fala, やっと pode aparecer sozinho, como um suspiro de alívio: "finalmente!".$$,
    $$やっと + Verbo (passado)
やっと + Verbo potencial + ようになった
やっと + Substantivo + になった$$,
    $$やっと$$,
    $$やっと$$,
    ARRAY['やっと']::text[],
    ARRAY['やっと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-121', $$やっと宿題が終わった。$$, $$やっとしゅくだいがおわった。$$, $$Finalmente terminei a lição.$$),
    ('n4-grammar-121', $$三十分待って、やっとバスが来た。$$, $$さんじゅっぷんまって、やっとバスがきた。$$, $$Depois de esperar trinta minutos, o ônibus finalmente chegou.$$),
    ('n4-grammar-121', $$三回目の試験で、やっと合格しました。$$, $$さんかいめのしけんで、やっとごうかくしました。$$, $$Na terceira tentativa, finalmente passei na prova.$$),
    ('n4-grammar-121', $$長い冬が終わって、やっと春になりましたね。$$, $$ながいふゆがおわって、やっとはるになりましたね。$$, $$O longo inverno acabou e finalmente chegou a primavera, né?$$),
    ('n4-grammar-121', $$長い間探していた本が、やっと見つかった。$$, $$ながいあいださがしていたほんが、やっとみつかった。$$, $$Finalmente achei o livro que estava procurando havia muito tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一時間並んで、____店に入れた。$$, $$Depois de uma hora na fila, finalmente consegui entrar na loja.$$),
        (2, $$三日間降り続いた雨が、____やみました。$$, $$A chuva que caiu por três dias finalmente parou.$$),
        (3, $$長い仕事が____終わった。$$, $$O trabalho longo finalmente terminou.$$),
        (4, $$何度も練習して、____自転車に乗れるようになった。$$, $$Pratiquei muitas vezes e finalmente aprendi a andar de bicicleta.$$),
        (5, $$ずっと待っていた荷物が____届いた。$$, $$A encomenda que eu esperava havia tanto tempo finalmente chegou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やっと$$),
        (2, $$やっと$$),
        (3, $$やっと$$),
        (4, $$やっと$$),
        (5, $$やっと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
