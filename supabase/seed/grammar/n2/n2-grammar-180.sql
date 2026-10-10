-- n2-grammar-180 — 〜つつある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-180',
    'grammar',
    'N2',
    $$〜つつある$$,
    $$tsutsu aru$$,
    $$Estar em processo de / Vir + gerúndio / Pouco a pouco$$,
    $$つつある indica que uma mudança está acontecendo agora, aos poucos, em uma direção. Equivale a "estar em processo de" ou "vir + gerúndio", como "vem diminuindo".

É usado com verbos de mudança, como aumentar, diminuir, mudar, melhorar e desaparecer. Por exemplo, "a população vem diminuindo".

É uma expressão formal, comum em notícias e textos.$$,
    $$É parecido com ている, mas つつある destaca que a mudança ainda está em andamento.

Não se usa com verbos que não indicam mudança, como 読む ou 食べる.$$,
    $$Verbo (forma ます sem ます) + つつある$$,
    $$つつある$$,
    $$つつある|つつあります|つつあった$$,
    ARRAY['つつ', 'ある']::text[],
    ARRAY['つつある', 'つつあります', 'つつあった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-180', $$日本の人口は減りつつある。$$, $$にほんのじんこうはへりつつある。$$, $$A população do Japão vem diminuindo.$$),
    ('n2-grammar-180', $$景気は回復しつつあります。$$, $$けいきはかいふくしつつあります。$$, $$A economia está em processo de recuperação.$$),
    ('n2-grammar-180', $$地球の気温は上がりつつある。$$, $$ちきゅうのきおんはあがりつつある。$$, $$A temperatura da Terra vem subindo.$$),
    ('n2-grammar-180', $$古い習慣が消えつつある。$$, $$ふるいしゅうかんがきえつつある。$$, $$Os costumes antigos estão desaparecendo pouco a pouco.$$),
    ('n2-grammar-180', $$彼の病気はよくなりつつある。$$, $$かれのびょうきはよくなりつつある。$$, $$A doença dele vem melhorando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は大きく変わり____。$$, $$Esta cidade vem mudando muito.$$),
        (2, $$外国人観光客が増え____。$$, $$O número de turistas estrangeiros vem aumentando.$$),
        (3, $$森林が失われ____。$$, $$As florestas estão sendo perdidas pouco a pouco.$$),
        (4, $$台風が近づき____。$$, $$O tufão está se aproximando.$$),
        (5, $$新しい技術が広まり____。$$, $$A nova tecnologia vem se espalhando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-180', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つつある$$),
        (1, $$つつあります$$),
        (2, $$つつある$$),
        (2, $$つつあります$$),
        (3, $$つつある$$),
        (3, $$つつあります$$),
        (4, $$つつある$$),
        (4, $$つつあります$$),
        (5, $$つつある$$),
        (5, $$つつあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
