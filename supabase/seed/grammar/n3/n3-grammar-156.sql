-- n3-grammar-156 — 〜ついでに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-156',
    'grammar',
    'N3',
    $$〜ついでに$$,
    $$tsuide ni$$,
    $$Aproveitando que / De quebra / Já que vai$$,
    $$ついでに é usado para dizer que, aproveitando uma ação principal, a pessoa faz outra coisa a mais. Equivale a "aproveitando que", "de quebra" ou "já que vai...".

A ação principal vem antes de ついでに, e a ação extra vem depois. Por exemplo, "aproveitando que fui fazer compras, passei no correio" ou "já que vai à estação, coloca esta carta no correio?".

Ele vem depois de substantivos com の e de verbos na forma de dicionário ou た.

Sozinho, no meio da frase, ついでに significa "de quebra", "já que está nisso". É muito comum em pedidos casuais: "se for à loja, compra um chá pra mim também?".$$,
    $$ついでに é muito usado em pedidos entre amigos e família, deixando o pedido leve.

A ação extra é geralmente pequena e fácil de encaixar na principal.

A expressão お出かけのついでに ("aproveitando que vai sair") aparece em propagandas de lojas.$$,
    $$Substantivo + の + ついでに + Ação extra
Verbo (forma de dicionário / た) + ついでに + Ação extra
ついでに + Verbo (de quebra, já que está nisso)$$,
    $$ついでに$$,
    $$ついでに|ついで$$,
    ARRAY['ついで', 'に']::text[],
    ARRAY['ついでに', 'のついでに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-156', $$買い物のついでに、郵便局に寄った。$$, $$かいもののついでに、ゆうびんきょくによった。$$, $$Aproveitando que fui fazer compras, passei no correio.$$),
    ('n3-grammar-156', $$駅に行くついでに、この手紙を出してくれる？$$, $$えきにいくついでに、このてがみをだしてくれる？$$, $$Já que vai à estação, pode colocar esta carta no correio?$$),
    ('n3-grammar-156', $$東京に出張したついでに、友達に会った。$$, $$とうきょうにしゅっちょうしたついでに、ともだちにあった。$$, $$Aproveitando a viagem de trabalho a Tóquio, encontrei um amigo.$$),
    ('n3-grammar-156', $$掃除のついでに、窓も拭いた。$$, $$そうじのついでに、まどもふいた。$$, $$Aproveitando a faxina, limpei as janelas também.$$),
    ('n3-grammar-156', $$コンビニに行くなら、ついでにお茶を買ってきて。$$, $$コンビニにいくなら、ついでにおちゃをかってきて。$$, $$Se for à loja de conveniência, compra um chá para mim de quebra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$散歩の____、パンを買ってきた。$$, $$Aproveitando a caminhada, comprei pão.$$),
        (2, $$図書館へ行く____、この本を返してください。$$, $$Já que vai à biblioteca, devolva este livro, por favor.$$),
        (3, $$京都に行った____、奈良にも寄った。$$, $$Aproveitando que fui a Kyoto, passei também em Nara.$$),
        (4, $$お茶を入れる____、私の分もお願い。$$, $$Já que vai fazer chá, faz o meu também, por favor.$$),
        (5, $$銀行に行った____、買い物もした。$$, $$Aproveitando que fui ao banco, fiz compras também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ついでに$$),
        (2, $$ついでに$$),
        (3, $$ついでに$$),
        (4, $$ついでに$$),
        (5, $$ついでに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
