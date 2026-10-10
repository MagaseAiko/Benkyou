-- n2-grammar-169 — 〜というものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-169',
    'grammar',
    'N2',
    $$〜というものだ$$,
    $$to iu mono da$$,
    $$Isso é que é / É assim que é / É isso que se chama$$,
    $$というものだ serve para dar uma opinião forte, apresentando algo como uma verdade geral ou como a definição de algo. Equivale a "isso é que é" ou "é assim que é".

A pessoa julga uma situação com base no bom senso. Por exemplo, "ajudar quem está em dificuldade, isso é que é amizade" ou "pedir isso a ele é um abuso".

É uma expressão de opinião, muitas vezes com tom de crítica ou de conclusão.$$,
    $$Na fala, aparece como ってもんだ.

Expressões comuns são それが人生というものだ e 無理というものだ.$$,
    $$Frase + というものだ
Substantivo + というものだ$$,
    $$というものだ$$,
    $$というものだ|というものです|ってもんだ|というもんだ$$,
    ARRAY['と', 'いう', 'もの', 'だ']::text[],
    ARRAY['というものだ', 'というものです', 'ってもんだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-169', $$困っている人を助けるのが、友達というものだ。$$, $$こまっているひとをたすけるのが、ともだちというものだ。$$, $$Ajudar quem está em dificuldade, isso é que é ser amigo.$$),
    ('n2-grammar-169', $$一日で全部覚えるのは無理というものだ。$$, $$いちにちでぜんぶおぼえるのはむりというものだ。$$, $$Decorar tudo em um dia é simplesmente impossível.$$),
    ('n2-grammar-169', $$思い通りにいかないのが、人生というものだ。$$, $$おもいどおりにいかないのが、じんせいというものだ。$$, $$As coisas não saírem como queremos, assim é a vida.$$),
    ('n2-grammar-169', $$約束を守らないのは、わがままというものだ。$$, $$やくそくをまもらないのは、わがままというものだ。$$, $$Não cumprir promessas é o que se chama de egoísmo.$$),
    ('n2-grammar-169', $$苦労してこそ、喜びも大きいというものです。$$, $$くろうしてこそ、よろこびもおおきいというものです。$$, $$É justamente com sofrimento que a alegria é maior, assim que é.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供に全部やらせるのは、かわいそう____。$$, $$Fazer a criança fazer tudo sozinha é uma crueldade.$$),
        (2, $$失敗から学ぶのが、成長____。$$, $$Aprender com os erros, isso é que é crescer.$$),
        (3, $$この値段でこの品質を求めるのは、ぜいたく____。$$, $$Querer esta qualidade por este preço é pedir demais.$$),
        (4, $$家族のために働くのが、親____。$$, $$Trabalhar pela família, isso é que é ser pai.$$),
        (5, $$人の物を勝手に使うのは、失礼____。$$, $$Usar as coisas dos outros sem permissão é falta de educação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というものだ$$),
        (1, $$というものです$$),
        (2, $$というものだ$$),
        (2, $$というものです$$),
        (3, $$というものだ$$),
        (3, $$というものです$$),
        (4, $$というものだ$$),
        (4, $$というものです$$),
        (5, $$というものだ$$),
        (5, $$というものです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
