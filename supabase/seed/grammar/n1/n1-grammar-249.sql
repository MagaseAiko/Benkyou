-- n1-grammar-249 — 〜ようにも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-249',
    'grammar',
    'N1',
    $$〜ようにも〜ない$$,
    $$you nimo ~ nai$$,
    $$Mesmo querendo não dá / Por mais que queira não consegue / Não há como$$,
    $$ようにも〜ない indica que a pessoa quer fazer algo, mas não consegue por algum motivo. Equivale a "mesmo querendo, não dá" ou "por mais que queira, não consegue".

A estrutura repete o mesmo verbo, primeiro na forma volitiva e depois na forma potencial negativa. Por exemplo, "mesmo querendo sair, não consigo por causa da chuva".

É uma expressão de impotência diante da situação.$$,
    $$A segunda parte costuma ser できない ou a forma potencial negativa do verbo.

Muitas vezes há um motivo explicado antes, como falta de dinheiro, tempo ou informação.$$,
    $$Verbo (forma volitiva) + にも + Mesmo verbo (forma potencial negativa)$$,
    $$ようにも〜ない$$,
    $$ようにも|うにも$$,
    ARRAY['よう', 'に', 'も', 'ない']::text[],
    ARRAY['ようにも〜ない', 'うにも〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-249', $$連絡先がわからないので、連絡しようにもできない。$$, $$れんらくさきがわからないので、れんらくしようにもできない。$$, $$Como não sei o contato, mesmo querendo entrar em contato, não dá.$$),
    ('n1-grammar-249', $$お金がないので、買おうにも買えない。$$, $$おかねがないので、かおうにもかえない。$$, $$Como não tenho dinheiro, mesmo querendo comprar, não consigo.$$),
    ('n1-grammar-249', $$足をけがして、歩こうにも歩けない。$$, $$あしをけがして、あるこうにもあるけない。$$, $$Machuquei o pé e, por mais que queira andar, não consigo.$$),
    ('n1-grammar-249', $$雨がひどくて、出かけようにも出かけられない。$$, $$あめがひどくて、でかけようにもでかけられない。$$, $$A chuva está tão forte que, mesmo querendo sair, não dá.$$),
    ('n1-grammar-249', $$頭が痛くて、寝ようにも寝られない。$$, $$あたまがいたくて、ねようにもねられない。$$, $$Estou com tanta dor de cabeça que, mesmo querendo dormir, não consigo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$忙しくて、休もう____休めない。$$, $$Estou tão ocupado que, mesmo querendo descansar, não consigo.$$),
        (2, $$声が出なくて、話そう____話せない。$$, $$Estou sem voz e, por mais que queira falar, não consigo.$$),
        (3, $$材料がなくて、作ろう____作れない。$$, $$Sem ingredientes, mesmo querendo cozinhar, não dá.$$),
        (4, $$電話番号を忘れて、かけよう____かけられない。$$, $$Esqueci o número e, mesmo querendo ligar, não consigo.$$),
        (5, $$道が混んでいて、急ごう____急げない。$$, $$A estrada está tão cheia que, por mais que queira me apressar, não dá.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-249', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも$$),
        (2, $$にも$$),
        (3, $$にも$$),
        (4, $$にも$$),
        (5, $$にも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
