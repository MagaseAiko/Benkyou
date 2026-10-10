-- n3-grammar-50 — 〜ことになっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-50',
    'grammar',
    'N3',
    $$〜ことになっている$$,
    $$koto ni natte iru$$,
    $$Está estabelecido que / É regra que / Está combinado que$$,
    $$ことになっている é usado para falar de regras, costumes ou planos já decididos, que não dependem da vontade de quem fala. Equivale a "está estabelecido que", "é regra que" ou "está combinado que".

Ele vem de ことになる (ficar decidido) na forma ている, indicando que a decisão já existe e continua valendo.

Os usos principais são:
• Regras de um lugar ou instituição: horários de um dormitório, normas de uma empresa.
• Costumes sociais: tirar os sapatos ao entrar em casa no Japão.
• Planos já combinados: um encontro marcado.

A diferença em relação a ことにしている é quem decidiu. ことにしている é uma regra pessoal, decidida pela própria pessoa. ことになっている é uma regra externa ou um combinado com outros.$$,
    $$ことになっている é muito usado para explicar regras de forma educada, sem parecer que é uma ordem pessoal.

Funcionários costumam usar essa forma para explicar normas aos clientes: "segundo as regras, não é possível...".

Para obrigações gerais, como leis, também se usa なければならない, mas ことになっている soa mais suave e explicativo.$$,
    $$Verbo na forma de dicionário + ことになっている
Verbo na forma ない + ことになっている

Educado: ことになっています$$,
    $$ことになっている$$,
    $$ことになっている|ことになっています|ことになってい$$,
    ARRAY['こと', 'に', 'なって', 'いる']::text[],
    ARRAY['ことになっている', 'ことになっています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-50', $$この会社では、毎朝九時に会議をすることになっている。$$, $$このかいしゃでは、まいあさくじにかいぎをすることになっている。$$, $$Nesta empresa, é regra fazer uma reunião todo dia às nove.$$),
    ('n3-grammar-50', $$この寮では、夜十時以降は外出できないことになっています。$$, $$このりょうでは、よるじゅうじいこうはがいしゅつできないことになっています。$$, $$Neste dormitório, é regra não sair depois das dez da noite.$$),
    ('n3-grammar-50', $$来週、田中さんと会うことになっている。$$, $$らいしゅう、たなかさんとあうことになっている。$$, $$Está combinado que vou me encontrar com o Tanaka na semana que vem.$$),
    ('n3-grammar-50', $$日本では、家に入るとき靴を脱ぐことになっている。$$, $$にほんでは、いえにはいるときくつをぬぐことになっている。$$, $$No Japão, é costume tirar os sapatos ao entrar em casa.$$),
    ('n3-grammar-50', $$遅刻した人は、反省文を書くことになっています。$$, $$ちこくしたひとは、はんせいぶんをかくことになっています。$$, $$Quem chega atrasado tem que escrever uma carta de reflexão, segundo a regra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この学校では、制服を着る____。$$, $$Nesta escola, é regra usar uniforme.$$),
        (2, $$試験中は、辞書を使ってはいけない____。$$, $$Durante a prova, é regra não usar dicionário.$$),
        (3, $$明日、社長と会う____。$$, $$Está combinado que vou me encontrar com o presidente amanhã.$$),
        (4, $$ここではタバコを吸わない____。$$, $$Aqui é regra não fumar.$$),
        (5, $$この部署では、毎月最後の金曜日に飲み会をする____。$$, $$Neste departamento, é costume fazer uma confraternização na última sexta-feira do mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことになっている$$),
        (1, $$ことになっています$$),
        (2, $$ことになっている$$),
        (2, $$ことになっています$$),
        (3, $$ことになっている$$),
        (3, $$ことになっています$$),
        (4, $$ことになっている$$),
        (4, $$ことになっています$$),
        (5, $$ことになっている$$),
        (5, $$ことになっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
