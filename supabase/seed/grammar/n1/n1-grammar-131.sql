-- n1-grammar-131 — 〜には無理がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-131',
    'grammar',
    'N1',
    $$〜には無理がある$$,
    $$ni wa muri ga aru$$,
    $$É forçado / Não é razoável / É difícil de aceitar$$,
    $$には無理がある indica que uma ideia, um plano ou uma explicação não é razoável ou não faz sentido. Equivale a "é forçado" ou "não é razoável".

A pessoa critica algo que parece impossível ou pouco lógico. Por exemplo, "terminar tudo em um dia é forçado demais" ou "essa explicação não é convincente".

É uma expressão um pouco formal.$$,
    $$Muitas vezes vem com のは ou のには antes.

É parecido com 無理だ, mas には無理がある soa mais suave e analítico.$$,
    $$Verbo (forma dicionário) + のには無理がある
Substantivo + には無理がある$$,
    $$には無理がある$$,
    $$には無理がある|には無理があります|に無理がある|には無理があった$$,
    ARRAY['に', 'は', '無理', 'が', 'ある']::text[],
    ARRAY['には無理がある', 'には無理があります', 'に無理がある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-131', $$一日で全部終わらせるのには無理がある。$$, $$いちにちでぜんぶおわらせるのにはむりがある。$$, $$Terminar tudo em um dia é forçado demais.$$),
    ('n1-grammar-131', $$彼の説明には無理がある。$$, $$かれのせつめいにはむりがある。$$, $$A explicação dele não é convincente.$$),
    ('n1-grammar-131', $$この予算で家を建てるのには無理があります。$$, $$このよさんでいえをたてるのにはむりがあります。$$, $$Construir uma casa com este orçamento não é razoável.$$),
    ('n1-grammar-131', $$最初から、この計画には無理があった。$$, $$さいしょから、このけいかくにはむりがあった。$$, $$Desde o começo, este plano era inviável.$$),
    ('n1-grammar-131', $$三人でこの仕事をするのには無理がある。$$, $$さんにんでこのしごとをするのにはむりがある。$$, $$Fazer este trabalho em três pessoas não é razoável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その話を信じるの____。$$, $$É difícil de acreditar nessa história.$$),
        (2, $$一か月で日本語を話せるようになるの____。$$, $$Aprender a falar japonês em um mês é forçado demais.$$),
        (3, $$このスケジュール____。$$, $$Este cronograma não é razoável.$$),
        (4, $$子供一人で行かせるの____。$$, $$Mandar uma criança sozinha não é razoável.$$),
        (5, $$その理論____と専門家は言う。$$, $$Os especialistas dizem que essa teoria é forçada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には無理がある$$),
        (1, $$には無理があります$$),
        (2, $$には無理がある$$),
        (2, $$には無理があります$$),
        (3, $$には無理がある$$),
        (3, $$には無理があります$$),
        (4, $$には無理がある$$),
        (4, $$には無理があります$$),
        (5, $$には無理がある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
