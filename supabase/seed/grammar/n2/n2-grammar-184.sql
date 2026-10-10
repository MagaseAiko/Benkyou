-- n2-grammar-184 — わずかに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-184',
    'grammar',
    'N2',
    $$わずかに$$,
    $$wazuka ni$$,
    $$Levemente / Por pouco / Ligeiramente$$,
    $$わずかに indica uma quantidade, grau ou diferença muito pequena. Equivale a "levemente", "ligeiramente" ou "por pouco".

Por exemplo, "a temperatura subiu levemente" ou "perdeu por uma diferença mínima".

É uma palavra um pouco formal, comum em descrições e notícias. A forma わずか, sem に, também é usada antes de números, como "apenas três pessoas".$$,
    $$É parecido com 少し, mas わずか destaca que a quantidade é muito pequena.

A forma わずかな vem antes de substantivos, como わずかなお金.$$,
    $$わずかに + Verbo / Adjetivo
わずか + Número / Quantidade
わずかな + Substantivo$$,
    $$わずかに$$,
    $$わずかに|わずか|僅かに$$,
    ARRAY['わずか', 'に']::text[],
    ARRAY['わずかに', 'わずか', 'わずかな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-184', $$気温がわずかに上がった。$$, $$きおんがわずかにあがった。$$, $$A temperatura subiu levemente.$$),
    ('n2-grammar-184', $$わずかに一点差で負けた。$$, $$わずかにいってんさでまけた。$$, $$Perdemos por uma diferença mínima de um ponto.$$),
    ('n2-grammar-184', $$窓からわずかに光が入ってくる。$$, $$まどからわずかにひかりがはいってくる。$$, $$Entra um pouquinho de luz pela janela.$$),
    ('n2-grammar-184', $$参加者はわずか三人だった。$$, $$さんかしゃはわずかさんにんだった。$$, $$Os participantes foram apenas três pessoas.$$),
    ('n2-grammar-184', $$わずかなお金しか残っていない。$$, $$わずかなおかねしかのこっていない。$$, $$Só sobrou um pouquinho de dinheiro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の声が____震えていた。$$, $$A voz dele tremia levemente.$$),
        (2, $$売り上げは去年より____増えた。$$, $$As vendas aumentaram ligeiramente em relação ao ano passado.$$),
        (3, $$____な時間でも、勉強に使おう。$$, $$Vamos usar até o pouco tempo que temos para estudar.$$),
        (4, $$ゴールまで____届かなかった。$$, $$Faltou muito pouco para chegar ao gol.$$),
        (5, $$この町の人口は____千人だ。$$, $$A população desta cidade é de apenas mil pessoas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わずかに$$),
        (1, $$わずか$$),
        (2, $$わずかに$$),
        (2, $$わずか$$),
        (3, $$わずか$$),
        (4, $$わずかに$$),
        (4, $$わずか$$),
        (5, $$わずか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
