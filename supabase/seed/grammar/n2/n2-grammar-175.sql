-- n2-grammar-175 — 〜ところに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-175',
    'grammar',
    'N2',
    $$〜ところに$$,
    $$tokoro ni$$,
    $$Justo quando / Bem na hora em que / No momento em que$$,
    $$ところに indica que algo inesperado aconteceu bem no momento em que a pessoa estava fazendo algo ou estava em determinada situação. Equivale a "justo quando" ou "bem na hora em que".

O acontecimento pode ser bom ou ruim, mas costuma interromper ou afetar a situação. Por exemplo, "justo quando eu ia sair, um amigo chegou".

As formas ところへ e ところを são parecidas.$$,
    $$ところへ é quase igual a ところに.

ところを é usado em expressões educadas, como お忙しいところを, e quando alguém é pego fazendo algo.$$,
    $$Verbo (forma dicionário / ている / た) + ところに
Adjetivo い + ところに
Substantivo + の + ところに$$,
    $$ところに$$,
    $$ところに|ところへ$$,
    ARRAY['ところ', 'に']::text[],
    ARRAY['ところに', 'ところへ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-175', $$出かけようとしているところに、友達が来た。$$, $$でかけようとしているところに、ともだちがきた。$$, $$Justo quando eu ia sair, um amigo chegou.$$),
    ('n2-grammar-175', $$お風呂に入っているところに、電話がかかってきた。$$, $$おふろにはいっているところに、でんわがかかってきた。$$, $$Bem na hora em que eu estava no banho, o telefone tocou.$$),
    ('n2-grammar-175', $$困っているところに、彼が助けに来てくれた。$$, $$こまっているところに、かれがたすけにきてくれた。$$, $$Justo quando eu estava em apuros, ele veio me ajudar.$$),
    ('n2-grammar-175', $$ちょうど話していたところへ、本人が現れた。$$, $$ちょうどはなしていたところへ、ほんにんがあらわれた。$$, $$Bem na hora em que falávamos dele, a própria pessoa apareceu.$$),
    ('n2-grammar-175', $$寝ようとしたところに、地震が起きた。$$, $$ねようとしたところに、じしんがおきた。$$, $$Justo quando eu ia dormir, houve um terremoto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$食事をしている____、お客さんが来た。$$, $$Bem na hora em que estávamos comendo, chegou uma visita.$$),
        (2, $$帰ろうとした____、部長に呼ばれた。$$, $$Justo quando eu ia embora, o gerente me chamou.$$),
        (3, $$お腹がすいている____、母がケーキを持ってきた。$$, $$Justo quando eu estava com fome, minha mãe trouxe um bolo.$$),
        (4, $$家を出た____、雨が降ってきた。$$, $$No momento em que saí de casa, começou a chover.$$),
        (5, $$悩んでいる____、先生がアドバイスをくれた。$$, $$Justo quando eu estava indeciso, o professor me deu um conselho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところに$$),
        (1, $$ところへ$$),
        (2, $$ところに$$),
        (2, $$ところへ$$),
        (3, $$ところに$$),
        (3, $$ところへ$$),
        (4, $$ところに$$),
        (4, $$ところへ$$),
        (5, $$ところに$$),
        (5, $$ところへ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
