-- n4-grammar-06 — 〜場合は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-06',
    'grammar',
    'N4',
    $$〜場合は$$,
    $$baai wa$$,
    $$No caso de / Caso / Se$$,
    $$場合は é usado para falar de uma situação possível e do que deve ser feito se ela acontecer. Equivale a "no caso de" ou "caso".

場合 significa "caso" ou "situação". Assim, a estrutura apresenta uma hipótese e, em seguida, a instrução ou consequência para aquele caso.

É muito comum em avisos, regras, manuais e instruções, principalmente para situações que não são do dia a dia, como emergências, atrasos, perdas ou problemas.

Por isso, soa mais formal e objetivo do que たら ou ば. Ele vem depois de verbos e adjetivos na forma simples, de adjetivos な com な, e de substantivos com の.$$,
    $$場合 normalmente não é usado para coisas que certamente vão acontecer. Ele apresenta um caso possível, não garantido.

Também é comum a forma 場合には, que tem o mesmo sentido, com um pouco mais de ênfase.

A leitura é ばあい, e não ばごう. É uma palavra com leitura que mistura os dois sistemas de leitura dos kanji.$$,
    $$Verbo (forma simples: dicionário / ない / た) + 場合は
Adjetivo い + 場合は
Adjetivo な + な + 場合は
Substantivo + の + 場合は

Escrita: 場合 / ばあい$$,
    $$場合$$,
    $$場合|ばあい$$,
    ARRAY['場合', 'は']::text[],
    ARRAY['場合は', 'ばあいは', '場合には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-06', $$雨の場合は、試合は中止です。$$, $$あめのばあいは、しあいはちゅうしです。$$, $$Em caso de chuva, a partida será cancelada.$$),
    ('n4-grammar-06', $$火事の場合は、エレベーターを使わないでください。$$, $$かじのばあいは、エレベーターをつかわないでください。$$, $$Em caso de incêndio, não use o elevador.$$),
    ('n4-grammar-06', $$遅れる場合は、電話してください。$$, $$おくれるばあいは、でんわしてください。$$, $$Caso vá se atrasar, ligue, por favor.$$),
    ('n4-grammar-06', $$熱が下がらない場合は、病院へ行ってください。$$, $$ねつがさがらないばあいは、びょういんへいってください。$$, $$Se a febre não baixar, vá ao hospital.$$),
    ('n4-grammar-06', $$カードをなくした場合は、すぐに銀行に連絡してください。$$, $$カードをなくしたばあいは、すぐにぎんこうにれんらくしてください。$$, $$Caso perca o cartão, entre em contato com o banco imediatamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地震の____、机の下に入ってください。$$, $$Em caso de terremoto, entre embaixo da mesa.$$),
        (2, $$会議に出られない____、メールで知らせてください。$$, $$Caso não possa participar da reunião, avise por e-mail.$$),
        (3, $$質問がある____、手を挙げてください。$$, $$Caso tenha alguma pergunta, levante a mão.$$),
        (4, $$道に迷った____、この番号に電話してください。$$, $$Caso se perca, ligue para este número.$$),
        (5, $$子供の____、料金は半額です。$$, $$No caso de crianças, o preço é a metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$場合は$$),
        (1, $$ばあいは$$),
        (2, $$場合は$$),
        (2, $$ばあいは$$),
        (3, $$場合は$$),
        (3, $$ばあいは$$),
        (4, $$場合は$$),
        (4, $$ばあいは$$),
        (5, $$場合は$$),
        (5, $$ばあいは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
