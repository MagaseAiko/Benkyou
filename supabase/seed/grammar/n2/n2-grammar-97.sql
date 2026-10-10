-- n2-grammar-97 — 〜に基づいて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-97',
    'grammar',
    'N2',
    $$〜に基づいて$$,
    $$ni motozuite$$,
    $$Com base em / Baseado em / De acordo com$$,
    $$に基づいて indica que algo é feito tendo outra coisa como base, fundamento ou referência. Equivale a "com base em" ou "baseado em".

Costuma vir com palavras como dados, fatos, leis, experiência e pesquisa. Por exemplo, "um filme baseado em fatos reais" ou "decidir com base nos dados".

É uma expressão formal, comum em textos, relatórios e notícias.$$,
    $$É parecido com をもとに, mas に基づいて é mais formal e indica uma base mais rígida, como regras ou dados.

As formas に基づく e に基づいた vêm antes de substantivos.$$,
    $$Substantivo + に基づいて + Verbo
Substantivo + に基づく + Substantivo
Substantivo + に基づいた + Substantivo$$,
    $$に基づいて$$,
    $$に基づいて|に基づき|に基づく|に基づいた|にもとづいて$$,
    ARRAY['に', '基づいて']::text[],
    ARRAY['に基づいて', 'に基づき', 'に基づく', 'に基づいた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-97', $$この映画は実話に基づいて作られた。$$, $$このえいがはじつわにもとづいてつくられた。$$, $$Este filme foi feito com base em uma história real.$$),
    ('n2-grammar-97', $$データに基づいて、計画を立てた。$$, $$データにもとづいて、けいかくをたてた。$$, $$Fizemos o plano com base nos dados.$$),
    ('n2-grammar-97', $$法律に基づき、処分が決められた。$$, $$ほうりつにもとづき、しょぶんがきめられた。$$, $$A punição foi decidida de acordo com a lei.$$),
    ('n2-grammar-97', $$経験に基づくアドバイスは役に立つ。$$, $$けいけんにもとづくアドバイスはやくにたつ。$$, $$Conselhos baseados em experiência são úteis.$$),
    ('n2-grammar-97', $$調査に基づいた報告書を提出した。$$, $$ちょうさにもとづいたほうこくしょをていしゅつした。$$, $$Entreguei um relatório baseado na pesquisa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$アンケートの結果____、商品を改良した。$$, $$Melhoramos o produto com base no resultado da pesquisa.$$),
        (2, $$規則____、手続きを行ってください。$$, $$Faça os procedimentos de acordo com as regras.$$),
        (3, $$事実____記事を書くべきだ。$$, $$Deve-se escrever artigos com base em fatos.$$),
        (4, $$科学的な根拠____判断する。$$, $$Decido com base em fundamentos científicos.$$),
        (5, $$この小説は作者の体験____書かれた。$$, $$Este romance foi escrito com base nas experiências do autor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に基づいて$$),
        (1, $$に基づき$$),
        (1, $$にもとづいて$$),
        (2, $$に基づいて$$),
        (2, $$に基づき$$),
        (2, $$にもとづいて$$),
        (3, $$に基づいて$$),
        (3, $$に基づき$$),
        (3, $$にもとづいて$$),
        (4, $$に基づいて$$),
        (4, $$に基づき$$),
        (4, $$にもとづいて$$),
        (5, $$に基づいて$$),
        (5, $$に基づき$$),
        (5, $$にもとづいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
