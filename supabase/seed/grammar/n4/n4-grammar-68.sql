-- n4-grammar-68 — 〜終わる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-68',
    'grammar',
    'N4',
    $$〜終わる$$,
    $$owaru$$,
    $$Terminar de / Acabar de (fazer)$$,
    $$終わる, ligado a outro verbo, indica que uma ação foi concluída até o fim. Equivale a "terminar de" ou "acabar de fazer".

A estrutura junta o verbo na forma ます sem ます com 終わる. O resultado funciona como um verbo do grupo 1 e se conjuga normalmente: 終わります, 終わった, 終わって.

É usado com ações que têm duração e um fim claro, como ler um livro, escrever uma carta, comer uma refeição ou ver um filme.

O oposto é 始める (começar a). Com 終わる, a ideia é que a ação foi completada.$$,
    $$Também existe 終える, que é a versão transitiva e soa um pouco mais formal, como em 読み終える.

Com ações de um instante, como chegar ou acordar, 終わる não é usado, porque elas não têm duração.

Para dizer "terminei!" ao concluir uma tarefa, é muito comum ouvir 終わった！ ou できた！.$$,
    $$Verbo na forma ます sem ます + 終わる

Educado: 終わります
Passado: 終わった / 終わりました
Ligando: 終わって
Condicional: 終わったら

Escrita: 終わる / おわる$$,
    $$終わる$$,
    $$終わ|おわ$$,
    ARRAY['終わる']::text[],
    ARRAY['終わる', '終わります', '終わった', '終わりました', '終わって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-68', $$やっと宿題をし終わりました。$$, $$やっとしゅくだいをしおわりました。$$, $$Finalmente terminei de fazer a lição.$$),
    ('n4-grammar-68', $$この本を読み終わったら、貸してあげます。$$, $$このほんをよみおわったら、かしてあげます。$$, $$Quando terminar de ler este livro, eu te empresto.$$),
    ('n4-grammar-68', $$食べ終わった人から、外で遊んでいいですよ。$$, $$たべおわったひとから、そとであそんでいいですよ。$$, $$Quem terminar de comer pode ir brincar lá fora.$$),
    ('n4-grammar-68', $$手紙を書き終わって、ほっとした。$$, $$てがみをかきおわって、ほっとした。$$, $$Terminei de escrever a carta e fiquei aliviado.$$),
    ('n4-grammar-68', $$映画を見終わったあとで、感想を話し合った。$$, $$えいがをみおわったあとで、かんそうをはなしあった。$$, $$Depois de terminar de ver o filme, conversamos sobre o que achamos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の夜、やっとレポートを書き____。$$, $$Ontem à noite, finalmente terminei de escrever o relatório.$$),
        (2, $$本を読み____ら、感想を教えてください。$$, $$Quando terminar de ler o livro, me diga o que achou.$$),
        (3, $$全部食べ____人は、お皿を片付けてください。$$, $$Quem terminou de comer tudo, recolha o prato, por favor.$$),
        (4, $$洗濯物を干し____、少し休みました。$$, $$Terminei de estender a roupa e descansei um pouco.$$),
        (5, $$この仕事、何時ごろやり____そうですか。$$, $$A que horas você acha que vai terminar este trabalho?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$終わりました$$),
        (1, $$終わった$$),
        (1, $$おわりました$$),
        (1, $$おわった$$),
        (2, $$終わった$$),
        (2, $$おわった$$),
        (3, $$終わった$$),
        (3, $$おわった$$),
        (4, $$終わって$$),
        (4, $$おわって$$),
        (5, $$終わり$$),
        (5, $$おわり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
