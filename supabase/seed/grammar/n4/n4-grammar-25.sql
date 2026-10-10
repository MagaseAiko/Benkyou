-- n4-grammar-25 — 〜じゃないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-25',
    'grammar',
    'N4',
    $$〜じゃないか$$,
    $$ja nai ka$$,
    $$Não é que...! / Ora / Eu não disse?$$,
    $$じゃないか é uma expressão casual usada no final da frase para mostrar surpresa, chamar atenção para algo óbvio ou repreender alguém. Equivale a "ora!", "não é que...!" ou "eu não disse?".

Apesar de ter forma negativa, o sentido é afirmativo. Quem fala está, na verdade, afirmando algo com ênfase.

Os usos mais comuns são:
• Surpresa ao perceber algo: "ora, se não é o Tanaka!".
• Elogio inesperado: "nossa, é gostoso!".
• Lembrar ou repreender: "eu não te disse?", "você está atrasado!".

Ele é informal e soa um pouco masculino ou direto. A versão じゃないですか é mais educada e muito usada na conversa para buscar concordância.$$,
    $$Na fala dos jovens, じゃん é a forma mais curta e casual, muito usada no dia a dia.

じゃないですか às vezes é usado demais, para apresentar algo como se fosse óbvio para o outro. Em excesso, pode soar presunçoso.

A entonação é importante: descendo, é uma afirmação enfática; subindo, vira uma pergunta de confirmação.$$,
    $$Substantivo / Adjetivo な + じゃないか
Adjetivo い + じゃないか
Verbo (forma simples) + じゃないか

Educado: じゃないですか
Forma escrita / formal: ではないか
Forma muito casual: じゃん$$,
    $$じゃないか$$,
    $$じゃないか|じゃないですか|じゃん$$,
    ARRAY['じゃ', 'ない', 'か']::text[],
    ARRAY['じゃないか', 'じゃないですか', 'じゃん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-25', $$あれ、田中じゃないか。$$, $$あれ、たなかじゃないか。$$, $$Ué, não é o Tanaka?$$),
    ('n4-grammar-25', $$このケーキ、おいしいじゃないか。$$, $$このケーキ、おいしいじゃないか。$$, $$Ora, este bolo é gostoso!$$),
    ('n4-grammar-25', $$だから言ったじゃないか。$$, $$だからいったじゃないか。$$, $$Eu não te disse?$$),
    ('n4-grammar-25', $$遅かったじゃないか。どうしたの？$$, $$おそかったじゃないか。どうしたの？$$, $$Você demorou, hein! O que aconteceu?$$),
    ('n4-grammar-25', $$いい天気じゃないですか。散歩しましょう。$$, $$いいてんきじゃないですか。さんぽしましょう。$$, $$Que dia bonito, não é? Vamos dar uma caminhada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何だ、山田____。久しぶり。$$, $$Ora, se não é o Yamada! Quanto tempo.$$),
        (2, $$約束の時間はもう過ぎている____。$$, $$Já passou da hora combinada, ora!$$),
        (3, $$君の絵、上手____。$$, $$Seu desenho é bom, hein!$$),
        (4, $$危ない____。気をつけて。$$, $$Que perigo! Tome cuidado.$$),
        (5, $$前にも話した____。忘れたの？$$, $$Eu já te falei antes, não falei? Esqueceu?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃないか$$),
        (2, $$じゃないか$$),
        (3, $$じゃないか$$),
        (4, $$じゃないか$$),
        (5, $$じゃないか$$),
        (5, $$じゃないですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
