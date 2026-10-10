-- n2-grammar-157 — 〜てまで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-157',
    'grammar',
    'N2',
    $$〜てまで$$,
    $$te made$$,
    $$A ponto de / Chegando a / Até o ponto de$$,
    $$てまで indica que alguém chega a um extremo para conseguir algo. Equivale a "a ponto de" ou "chegando a".

Muitas vezes a pessoa que fala critica ou questiona esse exagero. Por exemplo, "não quero ganhar a ponto de mentir".

Também pode mostrar admiração pelo esforço de alguém, como "ele veio até aqui, a ponto de faltar ao trabalho".$$,
    $$É muito comum na forma てまで〜たくない, "não quero chegar a ponto de...".

É parecido com てでも, mas てまで costuma ter um tom de crítica ao exagero.$$,
    $$Verbo (forma て) + まで + Frase
Verbo (forma て) + まで + Verbo (forma たくない)$$,
    $$てまで$$,
    $$てまで|でまで$$,
    ARRAY['て', 'まで']::text[],
    ARRAY['てまで', 'でまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-157', $$嘘をついてまで、勝ちたくない。$$, $$うそをついてまで、かちたくない。$$, $$Não quero ganhar a ponto de mentir.$$),
    ('n2-grammar-157', $$借金してまで、高い車を買う必要はない。$$, $$しゃっきんしてまで、たかいくるまをかうひつようはない。$$, $$Não é preciso comprar um carro caro a ponto de fazer dívida.$$),
    ('n2-grammar-157', $$彼は仕事を休んでまで、手伝いに来てくれた。$$, $$かれはしごとをやすんでまで、てつだいにきてくれた。$$, $$Ele chegou a faltar ao trabalho para vir me ajudar.$$),
    ('n2-grammar-157', $$徹夜してまで、ゲームをするのはよくない。$$, $$てつやしてまで、ゲームをするのはよくない。$$, $$Não é bom jogar videogame a ponto de virar a noite.$$),
    ('n2-grammar-157', $$人を傷つけてまで、自分の意見を通したくない。$$, $$ひとをきずつけてまで、じぶんのいけんをとおしたくない。$$, $$Não quero impor minha opinião a ponto de magoar alguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達を裏切っ____、お金がほしいとは思わない。$$, $$Não quero dinheiro a ponto de trair um amigo.$$),
        (2, $$体を壊し____、働く必要はない。$$, $$Não precisa trabalhar a ponto de arruinar a saúde.$$),
        (3, $$何時間も並ん____、食べたいとは思わない。$$, $$Não tenho vontade de comer a ponto de ficar horas na fila.$$),
        (4, $$彼女は家を売っ____、夢を追いかけた。$$, $$Ela chegou a vender a casa para correr atrás do sonho.$$),
        (5, $$規則を破っ____、やることではない。$$, $$Não é algo que valha a pena fazer a ponto de quebrar as regras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てまで$$),
        (2, $$てまで$$),
        (3, $$でまで$$),
        (4, $$てまで$$),
        (5, $$てまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
