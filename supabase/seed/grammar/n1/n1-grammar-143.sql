-- n1-grammar-143 — 〜を踏まえて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-143',
    'grammar',
    'N1',
    $$〜を踏まえて$$,
    $$wo fumaete$$,
    $$Levando em conta / Com base em / Considerando$$,
    $$を踏まえて indica que algo é feito levando em conta uma informação, um resultado ou uma situação anterior. Equivale a "levando em conta" ou "com base em".

É muito usado no trabalho, em reuniões e relatórios. Por exemplo, "com base nos resultados da pesquisa, vamos pensar num novo plano".

É uma expressão formal.$$,
    $$É parecido com に基づいて e を考慮して.

Costuma vir com palavras como 結果, 経験, 意見, 現状 e 反省.$$,
    $$Substantivo + を踏まえて / を踏まえ
Substantivo + を踏まえた + Substantivo$$,
    $$を踏まえて$$,
    $$を踏まえて|を踏まえ|を踏まえた|をふまえて$$,
    ARRAY['を', '踏まえて']::text[],
    ARRAY['を踏まえて', 'を踏まえ', 'を踏まえた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-143', $$調査の結果を踏まえて、新しい計画を立てよう。$$, $$ちょうさのけっかをふまえて、あたらしいけいかくをたてよう。$$, $$Com base nos resultados da pesquisa, vamos fazer um novo plano.$$),
    ('n1-grammar-143', $$前回の反省を踏まえ、準備を進めた。$$, $$ぜんかいのはんせいをふまえ、じゅんびをすすめた。$$, $$Levando em conta as lições da última vez, avançamos com os preparativos.$$),
    ('n1-grammar-143', $$皆さんの意見を踏まえた上で、決定します。$$, $$みなさんのいけんをふまえたうえで、けっていします。$$, $$Vamos decidir depois de considerar a opinião de todos.$$),
    ('n1-grammar-143', $$現状を踏まえて、対策を考える必要がある。$$, $$げんじょうをふまえて、たいさくをかんがえるひつようがある。$$, $$É preciso pensar em medidas considerando a situação atual.$$),
    ('n1-grammar-143', $$経験を踏まえたアドバイスをもらった。$$, $$けいけんをふまえたアドバイスをもらった。$$, $$Recebi um conselho baseado na experiência.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お客様の声____、サービスを改善した。$$, $$Melhoramos o serviço levando em conta a opinião dos clientes.$$),
        (2, $$過去の失敗____、同じミスをしないようにする。$$, $$Considerando os erros do passado, vamos evitar cometer o mesmo erro.$$),
        (3, $$話し合いの結果____、方針を決めた。$$, $$Definimos a diretriz com base no resultado da conversa.$$),
        (4, $$データ____提案をしてください。$$, $$Faça uma proposta baseada nos dados.$$),
        (5, $$社会の変化____、制度を見直す。$$, $$Vamos rever o sistema levando em conta as mudanças da sociedade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を踏まえて$$),
        (1, $$を踏まえ$$),
        (1, $$をふまえて$$),
        (2, $$を踏まえて$$),
        (2, $$を踏まえ$$),
        (2, $$をふまえて$$),
        (3, $$を踏まえて$$),
        (3, $$を踏まえ$$),
        (3, $$をふまえて$$),
        (4, $$を踏まえた$$),
        (5, $$を踏まえて$$),
        (5, $$を踏まえ$$),
        (5, $$をふまえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
