-- n1-grammar-224 — 〜とて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-224',
    'grammar',
    'N1',
    $$〜とて$$,
    $$tote$$,
    $$Mesmo / Até mesmo / Mesmo que$$,
    $$とて é uma forma antiga e formal de でも ou だって. Equivale a "mesmo" ou "até mesmo".

A pessoa mostra que, mesmo em um caso especial, a situação é igual. Por exemplo, "mesmo um especialista não sabe a resposta" ou "eu também não sou exceção".

Também aparece como たとて, com o sentido de "mesmo que".$$,
    $$É usado principalmente na escrita e em falas formais.

Expressões comuns são 私とて, 子供とて e いくら〜たとて.$$,
    $$Substantivo + とて
Verbo (forma た) + とて (mesmo que)$$,
    $$とて$$,
    $$とて$$,
    ARRAY['とて']::text[],
    ARRAY['とて', 'たとて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-224', $$私とて、失敗することはある。$$, $$わたしとて、しっぱいすることはある。$$, $$Até mesmo eu às vezes erro.$$),
    ('n1-grammar-224', $$専門家とて、すべてを知っているわけではない。$$, $$せんもんかとて、すべてをしっているわけではない。$$, $$Mesmo um especialista não sabe tudo.$$),
    ('n1-grammar-224', $$子供とて、ルールは守らなければならない。$$, $$こどもとて、ルールはまもらなければならない。$$, $$Mesmo uma criança precisa seguir as regras.$$),
    ('n1-grammar-224', $$今から急いだとて、間に合わないだろう。$$, $$いまからいそいだとて、まにあわないだろう。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-224', $$彼とて、悪気があったわけではない。$$, $$かれとて、わるぎがあったわけではない。$$, $$Até mesmo ele não fez por mal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長____、一人では何もできない。$$, $$Mesmo o presidente não consegue fazer nada sozinho.$$),
        (2, $$母____、毎日料理をするのは大変だろう。$$, $$Até mesmo para minha mãe deve ser difícil cozinhar todos os dias.$$),
        (3, $$いくら謝った____、許してもらえない。$$, $$Mesmo que peça desculpas, não vou ser perdoado.$$),
        (4, $$私____、本当は行きたくない。$$, $$Até mesmo eu, na verdade, não quero ir.$$),
        (5, $$天才____、努力なしには成功できない。$$, $$Mesmo um gênio não consegue ter sucesso sem esforço.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-224', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とて$$),
        (2, $$とて$$),
        (3, $$とて$$),
        (4, $$とて$$),
        (5, $$とて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
