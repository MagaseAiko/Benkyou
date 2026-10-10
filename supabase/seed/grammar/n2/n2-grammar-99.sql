-- n2-grammar-99 — 〜に応じて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-99',
    'grammar',
    'N2',
    $$〜に応じて$$,
    $$ni oujite$$,
    $$De acordo com / Conforme / Dependendo de$$,
    $$に応じて indica que algo muda ou se adapta conforme outra coisa. Equivale a "de acordo com", "conforme" ou "dependendo de".

Costuma vir com palavras que indicam variação, como idade, nível, quantidade, necessidade ou situação. Por exemplo, "o salário muda de acordo com a experiência".

Também pode significar "atender a" um pedido, como "atender a uma entrevista".$$,
    $$É parecido com によって, mas に応じて destaca que algo é ajustado de forma adequada.

A forma に応じた vem antes de substantivos, como 能力に応じた仕事.$$,
    $$Substantivo + に応じて + Verbo
Substantivo + に応じた + Substantivo$$,
    $$に応じて$$,
    $$に応じて|に応じ|に応じた|におうじて$$,
    ARRAY['に', '応じて']::text[],
    ARRAY['に応じて', 'に応じ', 'に応じた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-99', $$経験に応じて、給料が決まる。$$, $$けいけんにおうじて、きゅうりょうがきまる。$$, $$O salário é definido de acordo com a experiência.$$),
    ('n2-grammar-99', $$予算に応じて、プランを選んでください。$$, $$よさんにおうじて、プランをえらんでください。$$, $$Escolha o plano conforme o seu orçamento.$$),
    ('n2-grammar-99', $$季節に応じて、メニューが変わる。$$, $$きせつにおうじて、メニューがかわる。$$, $$O cardápio muda dependendo da estação.$$),
    ('n2-grammar-99', $$レベルに応じた授業を受けられる。$$, $$レベルにおうじたじゅぎょうをうけられる。$$, $$É possível ter aulas de acordo com o seu nível.$$),
    ('n2-grammar-99', $$必要に応じて、資料を追加します。$$, $$ひつようにおうじて、しりょうをついかします。$$, $$Conforme a necessidade, acrescentaremos materiais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$年齢____、料金が違います。$$, $$O preço muda de acordo com a idade.$$),
        (2, $$天気____、予定を変更します。$$, $$Mudaremos os planos dependendo do tempo.$$),
        (3, $$売り上げ____、ボーナスが支払われる。$$, $$O bônus é pago conforme as vendas.$$),
        (4, $$能力____仕事を任せる。$$, $$Confio as tarefas de acordo com a capacidade de cada um.$$),
        (5, $$客の注文____、料理を作る。$$, $$Faço os pratos conforme o pedido do cliente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に応じて$$),
        (1, $$に応じ$$),
        (1, $$におうじて$$),
        (2, $$に応じて$$),
        (2, $$に応じ$$),
        (2, $$におうじて$$),
        (3, $$に応じて$$),
        (3, $$に応じ$$),
        (3, $$におうじて$$),
        (4, $$に応じて$$),
        (4, $$に応じ$$),
        (4, $$におうじて$$),
        (5, $$に応じて$$),
        (5, $$に応じ$$),
        (5, $$におうじて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
