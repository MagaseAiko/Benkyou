-- n1-grammar-05 — 〜あっての
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-05',
    'grammar',
    'N1',
    $$〜あっての$$,
    $$atte no$$,
    $$Graças a / Só existe por causa de / Depende de$$,
    $$あっての indica que algo só existe ou só é possível por causa de outra coisa. Equivale a "graças a" ou "só existe por causa de".

A pessoa destaca a importância de algo que serve de base. Por exemplo, "o sucesso só existe graças ao esforço" ou "uma loja só existe por causa dos clientes".

A forma mais comum é A あっての B, que significa "B só existe porque existe A".$$,
    $$Uma expressão muito comum é お客様あっての商売, "o comércio só existe graças aos clientes".

A forma あってこそ tem um sentido parecido, "justamente por existir...".$$,
    $$Substantivo A + あっての + Substantivo B
Substantivo A + あってこそ$$,
    $$あっての$$,
    $$あっての|あってこそ$$,
    ARRAY['あって', 'の']::text[],
    ARRAY['あっての', 'あってこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-05', $$お客様あっての店です。$$, $$おきゃくさまあってのみせです。$$, $$Uma loja só existe graças aos clientes.$$),
    ('n1-grammar-05', $$健康あっての人生だ。$$, $$けんこうあってのじんせいだ。$$, $$A vida só tem sentido com saúde.$$),
    ('n1-grammar-05', $$皆さんの協力あっての成功です。$$, $$みなさんのきょうりょくあってのせいこうです。$$, $$Este sucesso só foi possível graças à cooperação de todos.$$),
    ('n1-grammar-05', $$努力あっての結果だ。$$, $$どりょくあってのけっかだ。$$, $$Este resultado é fruto do esforço.$$),
    ('n1-grammar-05', $$ファンの応援あってこそ、ここまで来られた。$$, $$ファンのおうえんあってこそ、ここまでこられた。$$, $$Só cheguei até aqui graças ao apoio dos fãs.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$選手は観客____プロだ。$$, $$Um atleta profissional só existe por causa do público.$$),
        (2, $$家族の支え____今の私です。$$, $$Sou o que sou hoje graças ao apoio da minha família.$$),
        (3, $$命____物種だ。$$, $$Sem vida, não há nada.$$),
        (4, $$会社は社員____ものだ。$$, $$Uma empresa só existe graças aos funcionários.$$),
        (5, $$信頼____関係が大切だ。$$, $$Uma relação baseada em confiança é importante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あっての$$),
        (2, $$あっての$$),
        (3, $$あっての$$),
        (4, $$あっての$$),
        (5, $$あっての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
