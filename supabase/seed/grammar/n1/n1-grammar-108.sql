-- n1-grammar-108 — 〜に至る / 〜に至った
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-108',
    'grammar',
    'N1',
    $$〜に至る / 〜に至った$$,
    $$ni itaru / ni itatta$$,
    $$Chegar a / Acabar em / Culminar em$$,
    $$に至る indica que algo chegou a um ponto final, a um resultado ou a uma situação extrema, depois de um processo. Equivale a "chegar a" ou "culminar em".

Por exemplo, "depois de muita discussão, chegaram a um acordo" ou "a doença piorou e ele chegou a ser internado".

É uma expressão formal, comum em notícias e textos.$$,
    $$Expressões comuns são 結論に至る, 合意に至る, 死に至る e 現在に至る.

A forma に至るまで significa "até mesmo" e tem outro uso.$$,
    $$Substantivo + に至る / に至った
Verbo (forma dicionário) + に至る / に至った$$,
    $$に至る$$,
    $$に至る|に至った|に至り|に至って|に至らず|にいたる|にいたった$$,
    ARRAY['に', '至る']::text[],
    ARRAY['に至る', 'に至った', 'に至り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-108', $$長い話し合いの末、ようやく合意に至った。$$, $$ながいはなしあいのすえ、ようやくごういにいたった。$$, $$Depois de uma longa discussão, finalmente chegaram a um acordo.$$),
    ('n1-grammar-108', $$その病気は、放っておくと死に至ることもある。$$, $$そのびょうきは、ほうっておくとしにいたることもある。$$, $$Essa doença, se não for tratada, pode levar à morte.$$),
    ('n1-grammar-108', $$彼が会社を辞めるに至った理由はわからない。$$, $$かれがかいしゃをやめるにいたったりゆうはわからない。$$, $$Não se sabe o motivo que o levou a sair da empresa.$$),
    ('n1-grammar-108', $$事件は大きな問題に至らずに済んだ。$$, $$じけんはおおきなもんだいにいたらずにすんだ。$$, $$O incidente não chegou a virar um grande problema.$$),
    ('n1-grammar-108', $$その町は、大きく発展して現在に至る。$$, $$そのまちは、おおきくはってんしてげんざいにいたる。$$, $$Aquela cidade se desenvolveu muito até chegar aos dias de hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いろいろ検討した結果、この結論____。$$, $$Depois de analisar várias coisas, chegamos a esta conclusão.$$),
        (2, $$小さなけんかが、離婚____。$$, $$Uma pequena briga acabou em divórcio.$$),
        (3, $$この会社は百年の歴史を経て現在____。$$, $$Esta empresa passou por cem anos de história até chegar aos dias de hoje.$$),
        (4, $$けが人が出る____事故だった。$$, $$Foi um acidente que chegou a deixar feridos.$$),
        (5, $$両国の交渉は、合意____。$$, $$As negociações entre os dois países chegaram a um acordo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至った$$),
        (1, $$にいたった$$),
        (2, $$に至った$$),
        (2, $$にいたった$$),
        (3, $$に至る$$),
        (3, $$にいたる$$),
        (4, $$に至る$$),
        (4, $$に至った$$),
        (5, $$に至った$$),
        (5, $$にいたった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
