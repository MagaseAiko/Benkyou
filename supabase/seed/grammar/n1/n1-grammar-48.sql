-- n1-grammar-48 — 〜可能性がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-48',
    'grammar',
    'N1',
    $$〜可能性がある$$,
    $$kanousei ga aru$$,
    $$Há possibilidade de / Pode ser que / É possível que$$,
    $$可能性がある indica que existe a possibilidade de algo acontecer ou ser verdade. Equivale a "há possibilidade de" ou "pode ser que".

É uma expressão objetiva, muito usada em notícias, relatórios, previsões e explicações. Por exemplo, "há possibilidade de chover amanhã".

Pode ser usada tanto para coisas boas quanto ruins.$$,
    $$Para indicar alta probabilidade, usa-se 可能性が高い. Para baixa, 可能性が低い.

É mais formal e objetivo que かもしれない.

Não se confunde com 恐れがある, que é usado apenas para coisas ruins.$$,
    $$Verbo (forma simples) + 可能性がある
Adjetivo い + 可能性がある
Adjetivo な / Substantivo + である + 可能性がある$$,
    $$可能性がある$$,
    $$可能性がある|可能性があります|可能性が|可能性も|可能性は|かのうせいがある$$,
    ARRAY['可能性', 'が', 'ある']::text[],
    ARRAY['可能性がある', '可能性があります', '可能性が高い', '可能性もある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-48', $$明日は雨が降る可能性がある。$$, $$あしたはあめがふるかのうせいがある。$$, $$Há possibilidade de chover amanhã.$$),
    ('n1-grammar-48', $$この薬は副作用が出る可能性があります。$$, $$このくすりはふくさようがでるかのうせいがあります。$$, $$Este remédio pode causar efeitos colaterais.$$),
    ('n1-grammar-48', $$彼が犯人である可能性が高い。$$, $$かれがはんにんであるかのうせいがたかい。$$, $$É bem possível que ele seja o culpado.$$),
    ('n1-grammar-48', $$計画が変更される可能性もある。$$, $$けいかくがへんこうされるかのうせいもある。$$, $$Também é possível que o plano seja alterado.$$),
    ('n1-grammar-48', $$この技術は将来、大きく発展する可能性がある。$$, $$このぎじゅつはしょうらい、おおきくはってんするかのうせいがある。$$, $$Esta tecnologia tem possibilidade de se desenvolver muito no futuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車が遅れる____。$$, $$Há possibilidade de o trem atrasar.$$),
        (2, $$この問題は、すぐに解決できる____。$$, $$É possível que este problema seja resolvido logo.$$),
        (3, $$彼女が優勝する____高い。$$, $$A possibilidade de ela vencer é alta.$$),
        (4, $$このデータは間違っている____。$$, $$Pode ser que estes dados estejam errados.$$),
        (5, $$台風が上陸する____。$$, $$Há possibilidade de o tufão chegar à terra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$可能性がある$$),
        (1, $$可能性があります$$),
        (2, $$可能性がある$$),
        (2, $$可能性があります$$),
        (3, $$可能性が$$),
        (3, $$可能性は$$),
        (4, $$可能性がある$$),
        (4, $$可能性があります$$),
        (5, $$可能性がある$$),
        (5, $$可能性があります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
