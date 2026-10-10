-- n1-grammar-225 — 〜とは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-225',
    'grammar',
    'N1',
    $$〜とは$$,
    $$to wa$$,
    $$Que / Quem diria que / É surpreendente que$$,
    $$とは, no fim de uma frase, expressa surpresa, espanto ou indignação diante de algo inesperado. Equivale a "que...!" ou "quem diria que...".

Muitas vezes a frase fica incompleta, porque a emoção já basta. Por exemplo, "quem diria que ele ia passar!" ou "que absurdo ele mentir assim!".

Também é usado para definir algo, com o sentido de "o que é...", como "o que é felicidade?".$$,
    $$No uso de surpresa, costuma terminar com 驚いた, 思わなかった ou ficar sem continuação.

É parecido com なんて, mas とは é mais formal.$$,
    $$Frase (forma simples) + とは (surpresa)
Substantivo + とは + Definição$$,
    $$とは$$,
    $$とは$$,
    ARRAY['と', 'は']::text[],
    ARRAY['とは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-225', $$あの彼が試験に合格するとは。$$, $$あのかれがしけんにごうかくするとは。$$, $$Quem diria que ele ia passar na prova!$$),
    ('n1-grammar-225', $$こんなところで会うとは思わなかった。$$, $$こんなところであうとはおもわなかった。$$, $$Não imaginava que nos encontraríamos num lugar desses.$$),
    ('n1-grammar-225', $$子供にこんなことを言うとは、ひどい親だ。$$, $$こどもにこんなことをいうとは、ひどいおやだ。$$, $$Dizer uma coisa dessas a uma criança, que pai horrível.$$),
    ('n1-grammar-225', $$幸せとは、何だろう。$$, $$しあわせとは、なんだろう。$$, $$O que será a felicidade?$$),
    ('n1-grammar-225', $$一日でこんなに雪が積もるとは驚いた。$$, $$いちにちでこんなにゆきがつもるとはおどろいた。$$, $$Fiquei surpreso que tenha acumulado tanta neve em um dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$まさか彼が犯人だった____。$$, $$Quem diria que ele era o culpado!$$),
        (2, $$十年ぶりに会えるなんて、こんな日が来る____思わなかった。$$, $$Não imaginava que chegaria o dia de nos reencontrarmos depois de dez anos.$$),
        (3, $$友情____、何だろう。$$, $$O que é a amizade?$$),
        (4, $$あんなに簡単な問題を間違える____。$$, $$Que absurdo errar um problema tão fácil!$$),
        (5, $$この年で結婚する____、自分でも驚いている。$$, $$Até eu estou surpreso de me casar nesta idade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-225', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは$$),
        (2, $$とは$$),
        (3, $$とは$$),
        (4, $$とは$$),
        (5, $$とは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
