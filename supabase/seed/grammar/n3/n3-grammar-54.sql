-- n3-grammar-54 — 〜くせに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-54',
    'grammar',
    'N3',
    $$〜くせに$$,
    $$kuse ni$$,
    $$Apesar de / Mesmo sendo / E ainda por cima$$,
    $$くせに é usado para criticar ou reclamar de alguém cujo comportamento não combina com a situação. Equivale a "apesar de", "mesmo sendo" ou "e ainda por cima".

A primeira parte apresenta um fato sobre a pessoa, e a segunda mostra uma atitude que contradiz esse fato e que irrita quem fala. Por exemplo, "ele sabe, mas não me conta" ou "não faz nada e ainda reclama".

O tom é sempre de crítica, desprezo ou irritação. Por isso, くせに é bem mais forte e emocional que のに.

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

O sujeito das duas partes precisa ser o mesmo, e geralmente não é quem fala.$$,
    $$Por ser crítico, くせに pode soar ofensivo. Deve ser usado com cuidado, principalmente com pessoas que não são próximas.

No final da frase, くせに sozinho expressa uma reclamação incompleta, como "e ainda por cima...!".

A palavra 癖 (くせ) sozinha significa "mania" ou "hábito".$$,
    $$Verbo / Adjetivo い (forma simples) + くせに
Adjetivo な + な + くせに
Substantivo + の + くせに

Escrita: くせに / 癖に$$,
    $$くせに$$,
    $$くせに|癖に$$,
    ARRAY['くせ', 'に']::text[],
    ARRAY['くせに', '癖に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-54', $$彼は答えを知っているくせに、教えてくれない。$$, $$かれはこたえをしっているくせに、おしえてくれない。$$, $$Ele sabe a resposta e mesmo assim não me conta.$$),
    ('n3-grammar-54', $$子供のくせに、生意気なことを言う。$$, $$こどものくせに、なまいきなことをいう。$$, $$É só uma criança e já fala com arrogância.$$),
    ('n3-grammar-54', $$自分は何もしないくせに、文句ばかり言う。$$, $$じぶんはなにもしないくせに、もんくばかりいう。$$, $$Não faz nada e ainda vive reclamando.$$),
    ('n3-grammar-54', $$下手なくせに、いつも自慢している。$$, $$へたなくせに、いつもじまんしている。$$, $$É ruim nisso e ainda vive se gabando.$$),
    ('n3-grammar-54', $$お金がないくせに、高い物ばかり買う。$$, $$おかねがないくせに、たかいものばかりかう。$$, $$Não tem dinheiro e ainda só compra coisa cara.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は太っている____、甘い物ばかり食べる。$$, $$Ele está acima do peso e ainda só come doce.$$),
        (2, $$自分が悪い____、謝らない。$$, $$A culpa é dele e mesmo assim não pede desculpas.$$),
        (3, $$学生の____、全然勉強しない。$$, $$É estudante e não estuda nada.$$),
        (4, $$本当は好きな____、嫌いなふりをしている。$$, $$No fundo gosta e mesmo assim finge que não gosta.$$),
        (5, $$一度も行ったことがない____、知っているように話す。$$, $$Nunca foi lá e mesmo assim fala como se conhecesse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くせに$$),
        (2, $$くせに$$),
        (3, $$くせに$$),
        (4, $$くせに$$),
        (5, $$くせに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
