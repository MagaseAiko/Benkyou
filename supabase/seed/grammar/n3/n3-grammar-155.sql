-- n3-grammar-155 — ついに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-155',
    'grammar',
    'N3',
    $$ついに$$,
    $$tsui ni$$,
    $$Finalmente / Afinal / Por fim$$,
    $$ついに é um advérbio que indica que algo finalmente aconteceu, depois de muito tempo, esforço ou de uma longa série de acontecimentos. Equivale a "finalmente", "afinal" ou "por fim".

O resultado pode ser positivo, como realizar um sonho depois de dez anos, ou negativo, como um computador velho que finalmente quebrou.

A diferença em relação a やっと é que やっと quase sempre expressa alívio por algo desejado. ついに é mais neutro e dramático, e pode ser usado tanto para coisas boas quanto ruins.

Também aparece em frases negativas, com o sentido de "no fim, nunca...": ついに来なかった (no fim, ele nunca veio).$$,
    $$Em notícias e anúncios, ついに aparece muito para lançamentos e conquistas: ついに発売!

Para resultados negativos, ついに é mais natural que やっと: ついに壊れた (finalmente quebrou).

ついに soa mais forte e solene que やっと, por isso é comum em histórias e narrativas.$$,
    $$ついに + Verbo no passado
ついに + Verbo negativo no passado (no fim, nunca...)

Escrita: ついに / 遂に$$,
    $$ついに$$,
    $$ついに|遂に$$,
    ARRAY['ついに']::text[],
    ARRAY['ついに', '遂に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-155', $$十年かかって、ついに夢がかなった。$$, $$じゅうねんかかって、ついにゆめがかなった。$$, $$Depois de dez anos, finalmente meu sonho se realizou.$$),
    ('n3-grammar-155', $$長い工事が終わって、ついに新しい駅ができた。$$, $$ながいこうじがおわって、ついにあたらしいえきができた。$$, $$A longa obra terminou e, finalmente, a nova estação ficou pronta.$$),
    ('n3-grammar-155', $$何度も失敗したが、ついに成功した。$$, $$なんどもしっぱいしたが、ついにせいこうした。$$, $$Fracassei muitas vezes, mas por fim consegui.$$),
    ('n3-grammar-155', $$不満が多かった彼は、ついに会社をやめてしまった。$$, $$ふまんがおおかったかれは、ついにかいしゃをやめてしまった。$$, $$Ele, que tinha muitas insatisfações, acabou saindo da empresa.$$),
    ('n3-grammar-155', $$待ちに待った夏休みが、ついに来た。$$, $$まちにまったなつやすみが、ついにきた。$$, $$As tão esperadas férias de verão finalmente chegaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三回目の挑戦で、____試験に合格した。$$, $$Na terceira tentativa, finalmente passei na prova.$$),
        (2, $$十年使った古いパソコンが____壊れてしまった。$$, $$O computador velho que usei por dez anos finalmente quebrou.$$),
        (3, $$長い戦争が____終わった。$$, $$A longa guerra finalmente acabou.$$),
        (4, $$何年も探していた本が、____見つかった。$$, $$O livro que eu procurava havia anos finalmente foi encontrado.$$),
        (5, $$ずっと黙っていた彼女は、____本当のことを話してくれた。$$, $$Ela, que ficou calada o tempo todo, finalmente me contou a verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ついに$$),
        (1, $$遂に$$),
        (2, $$ついに$$),
        (2, $$遂に$$),
        (3, $$ついに$$),
        (3, $$遂に$$),
        (4, $$ついに$$),
        (4, $$遂に$$),
        (5, $$ついに$$),
        (5, $$遂に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
