-- n3-grammar-72 — 〜んだって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-72',
    'grammar',
    'N3',
    $$〜んだって$$,
    $$n datte$$,
    $$Dizem que / Ouvi dizer que / É verdade que...?$$,
    $$んだって é uma forma casual de repassar uma informação que se ouviu de alguém. Equivale a "dizem que" ou "ouvi dizer que".

Ela junta んだ (explicação) com って (citação). A ideia é "ouvi que é assim".

É muito comum entre amigos e família, para contar novidades, fofocas e notícias. Por exemplo, "o Tanaka vai se casar no mês que vem, ouvi dizer".

Com entonação de pergunta, んだって？ serve para confirmar algo que a pessoa ouviu: "é verdade que você vai se mudar?".

Com substantivos e adjetivos な, usa-se なんだって.$$,
    $$んだって é bem informal. Em situações educadas, use そうです ou と聞きました.

As mulheres às vezes usam a forma んですって, um pouco mais suave e tradicional.

Na pergunta んだって？, a pessoa geralmente está surpresa e quer saber se a informação é verdadeira.$$,
    $$Verbo / Adjetivo い (forma simples) + んだって
Substantivo / Adjetivo な + なんだって
… + んだって？ (confirmação: é verdade que...?)

Forma educada equivalente: 〜そうです$$,
    $$んだって$$,
    $$んだって|なんだって$$,
    ARRAY['ん', 'だって']::text[],
    ARRAY['んだって', 'なんだって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-72', $$ねえ、田中さん、来月結婚するんだって。$$, $$ねえ、たなかさん、らいげつけっこんするんだって。$$, $$Ei, ouvi dizer que o Tanaka vai se casar no mês que vem.$$),
    ('n3-grammar-72', $$明日は雨なんだって。$$, $$あしたはあめなんだって。$$, $$Dizem que amanhã vai chover.$$),
    ('n3-grammar-72', $$あの店のラーメン、すごくおいしいんだって。$$, $$あのみせのラーメン、すごくおいしいんだって。$$, $$Dizem que o ramen daquela loja é muito gostoso.$$),
    ('n3-grammar-72', $$先生、今日は休みなんだって。$$, $$せんせい、きょうはやすみなんだって。$$, $$Ouvi dizer que o professor está de folga hoje.$$),
    ('n3-grammar-72', $$彼女、アメリカに留学するんだって？$$, $$かのじょ、アメリカにりゅうがくするんだって？$$, $$É verdade que ela vai fazer intercâmbio nos Estados Unidos?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$山田さん、会社をやめる____。$$, $$Ouvi dizer que o Yamada vai sair da empresa.$$),
        (2, $$明日のテストは難しい____。$$, $$Dizem que a prova de amanhã é difícil.$$),
        (3, $$あの映画、すごくおもしろい____よ。$$, $$Dizem que aquele filme é muito bom.$$),
        (4, $$部長は今日、出張な____。$$, $$Ouvi dizer que o gerente está em viagem de trabalho hoje.$$),
        (5, $$君、来月引っ越す____？$$, $$É verdade que você vai se mudar no mês que vem?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んだって$$),
        (2, $$んだって$$),
        (3, $$んだって$$),
        (4, $$んだって$$),
        (5, $$んだって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
