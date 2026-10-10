-- n1-grammar-125 — 〜に即して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-125',
    'grammar',
    'N1',
    $$〜に即して$$,
    $$ni sokushite$$,
    $$De acordo com / Conforme / Baseado em$$,
    $$に即して indica que algo é feito de acordo com a realidade, os fatos ou a situação concreta. Equivale a "de acordo com" ou "conforme".

A pessoa destaca que a ação se adapta ao que é real, e não a ideias abstratas. Por exemplo, "vamos pensar em medidas de acordo com a situação real".

É uma expressão formal, comum em textos e no trabalho.$$,
    $$Costuma vir com palavras como 事実, 現実, 状況, 実情 e 実態.

É parecido com に沿って e に基づいて.$$,
    $$Substantivo + に即して / に即し
Substantivo + に即した + Substantivo$$,
    $$に即して$$,
    $$に即して|に即し|に即した|にそくして$$,
    ARRAY['に', '即して']::text[],
    ARRAY['に即して', 'に即し', 'に即した']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-125', $$事実に即して、報告書を書いてください。$$, $$じじつにそくして、ほうこくしょをかいてください。$$, $$Escreva o relatório de acordo com os fatos.$$),
    ('n1-grammar-125', $$現実に即した計画を立てる必要がある。$$, $$げんじつにそくしたけいかくをたてるひつようがある。$$, $$É preciso fazer um plano baseado na realidade.$$),
    ('n1-grammar-125', $$状況に即して、柔軟に対応しよう。$$, $$じょうきょうにそくして、じゅうなんにたいおうしよう。$$, $$Vamos reagir com flexibilidade conforme a situação.$$),
    ('n1-grammar-125', $$地域の実情に即し、対策を考えた。$$, $$ちいきのじつじょうにそくし、たいさくをかんがえた。$$, $$Pensamos nas medidas de acordo com a situação real da região.$$),
    ('n1-grammar-125', $$経験に即したアドバイスは役に立つ。$$, $$けいけんにそくしたアドバイスはやくにたつ。$$, $$Conselhos baseados na experiência são úteis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$法律____判断する。$$, $$Julgamos de acordo com a lei.$$),
        (2, $$学生のレベル____授業を行う。$$, $$As aulas são dadas de acordo com o nível dos alunos.$$),
        (3, $$現場の声____、改善を進めた。$$, $$Fizemos melhorias conforme a opinião de quem está no local de trabalho.$$),
        (4, $$時代____教育が求められている。$$, $$Está sendo exigida uma educação de acordo com a época.$$),
        (5, $$実態____調査を行った。$$, $$Fizemos uma pesquisa de acordo com a realidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に即して$$),
        (1, $$に即し$$),
        (1, $$にそくして$$),
        (2, $$に即して$$),
        (2, $$に即し$$),
        (2, $$にそくして$$),
        (3, $$に即して$$),
        (3, $$に即し$$),
        (3, $$にそくして$$),
        (4, $$に即した$$),
        (5, $$に即して$$),
        (5, $$に即し$$),
        (5, $$にそくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
