-- n1-grammar-181 — 〜たら〜たで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-181',
    'grammar',
    'N1',
    $$〜たら〜たで$$,
    $$tara ~ ta de$$,
    $$Se... também tem seus problemas / Se acontecer... aí / Tanto faz se$$,
    $$たら〜たで indica que, mesmo que algo aconteça como se queria, ou de outra forma, surgem novos problemas ou situações. Equivale a "se..., também tem seus problemas" ou "se acontecer..., aí...".

Muitas vezes a pessoa mostra que nenhuma situação é perfeita. Por exemplo, "quando não tem dinheiro é ruim, mas quando tem, também dá trabalho".

Também pode mostrar aceitação, como "se der errado, aí a gente pensa".$$,
    $$Muitas vezes vem junto com ば〜で, que tem um sentido parecido.

A segunda parte costuma mostrar um novo problema ou uma ideia de "tanto faz".$$,
    $$Verbo (forma たら) + Mesmo verbo (forma た) + で
Adjetivo い (forma かったら) + Mesmo adjetivo (forma かった) + で
Adjetivo な / Substantivo + だったら + だったで$$,
    $$たら〜たで$$,
    $$たで|だで|ったで$$,
    ARRAY['たら', 'た', 'で']::text[],
    ARRAY['たら〜たで', 'だったら〜だったで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-181', $$お金がないと困るが、あったらあったで心配が増える。$$, $$おかねがないとこまるが、あったらあったでしんぱいがふえる。$$, $$Sem dinheiro é ruim, mas quando se tem, também aumentam as preocupações.$$),
    ('n1-grammar-181', $$子供が小さいと大変だが、大きくなったらなったで別の悩みがある。$$, $$こどもがちいさいとたいへんだが、おおきくなったらなったでべつのなやみがある。$$, $$Com filhos pequenos é difícil, mas quando crescem, surgem outras preocupações.$$),
    ('n1-grammar-181', $$失敗したら失敗したで、また考えればいい。$$, $$しっぱいしたらしっぱいしたで、またかんがえればいい。$$, $$Se der errado, aí a gente pensa de novo.$$),
    ('n1-grammar-181', $$暇だったら暇だったで、退屈だ。$$, $$ひまだったらひまだったで、たいくつだ。$$, $$Quando estou desocupado, também fico entediado.$$),
    ('n1-grammar-181', $$雨が降ったら降ったで、家で映画を見よう。$$, $$あめがふったらふったで、いえでえいがをみよう。$$, $$Se chover, tudo bem, vamos ver um filme em casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事がないと困るが、忙しかったら忙しかった____、大変だ。$$, $$Sem trabalho é ruim, mas quando estou ocupado também é difícil.$$),
        (2, $$一人暮らしは寂しいが、家族と住んだら住んだ____、うるさい。$$, $$Morar sozinho é solitário, mas morar com a família também é barulhento.$$),
        (3, $$遅れたら遅れた____、仕方がない。$$, $$Se atrasar, aí não tem jeito.$$),
        (4, $$合格したらした____、また新しい悩みが出てくる。$$, $$Se passar, também vão surgir novas preocupações.$$),
        (5, $$車があったらあった____、維持費がかかる。$$, $$Ter carro também tem seus problemas, gasta-se com manutenção.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で$$),
        (2, $$で$$),
        (3, $$で$$),
        (4, $$で$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
