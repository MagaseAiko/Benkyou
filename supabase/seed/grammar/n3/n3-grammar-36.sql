-- n3-grammar-36 — 〜かける
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-36',
    'grammar',
    'N3',
    $$〜かける$$,
    $$kakeru$$,
    $$Começar a (e parar) / Pela metade / Quase$$,
    $$かける, ligado a outro verbo, indica que uma ação começou mas não foi concluída, ou que algo esteve prestes a acontecer. Equivale a "começar a e parar", "pela metade" ou "quase".

A estrutura junta o verbo na forma ます sem ます com かける. O resultado funciona como um verbo do grupo 2.

Os usos mais comuns são:
• Ação interrompida: começar a dizer algo e parar, começar a ler e não terminar.
• Estado pela metade: com かけの + substantivo, indica algo que ficou incompleto, como 読みかけの本 (livro lido pela metade) ou 食べかけのパン (pão mordido).
• Quase acontecer: com verbos de mudança, como 死ぬ ou 転ぶ, indica que algo quase aconteceu.$$,
    $$Não confunda com かける sozinho, que tem muitos sentidos, como "pendurar", "telefonar" e "sentar-se".

A forma かけの + substantivo é muito usada para objetos deixados pela metade, como bebidas, comidas, livros e cartas.

Com 死ぬ, 死にかける significa "quase morrer" e aparece em relatos de acidentes ou doenças graves.$$,
    $$Verbo na forma ます sem ます + かける
Verbo sem ます + かけ + の + Substantivo (pela metade)
Verbo sem ます + かけた (quase aconteceu / começou e parou)
Verbo sem ます + かけて、 + … (começou a... e então...)$$,
    $$かける$$,
    $$かけ$$,
    ARRAY['かける']::text[],
    ARRAY['かける', 'かけ', 'かけた', 'かけて', 'かけの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-36', $$読みかけの本が机の上にある。$$, $$よみかけのほんがつくえのうえにある。$$, $$Há um livro lido pela metade em cima da mesa.$$),
    ('n3-grammar-36', $$何か言いかけて、彼は黙った。$$, $$なにかいいかけて、かれはだまった。$$, $$Ele começou a dizer algo e ficou calado.$$),
    ('n3-grammar-36', $$食べかけのパンを捨てないで。$$, $$たべかけのパンをすてないで。$$, $$Não jogue fora o pão comido pela metade.$$),
    ('n3-grammar-36', $$私は事故で死にかけたことがある。$$, $$わたしはじこでしにかけたことがある。$$, $$Eu já quase morri num acidente.$$),
    ('n3-grammar-36', $$宿題をやりかけたまま、寝てしまった。$$, $$しゅくだいをやりかけたまま、ねてしまった。$$, $$Acabei dormindo com a lição feita pela metade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$書き____の手紙を引き出しにしまった。$$, $$Guardei na gaveta a carta escrita pela metade.$$),
        (2, $$彼女は何か言い____、やめた。$$, $$Ela começou a dizer algo, mas parou.$$),
        (3, $$冷蔵庫に飲み____のジュースが残っている。$$, $$Tem um suco tomado pela metade na geladeira.$$),
        (4, $$雪の道で転び____が、大丈夫だった。$$, $$Quase caí na rua com neve, mas fiquei bem.$$),
        (5, $$作り____の料理を置いて、電話に出た。$$, $$Deixei a comida pela metade e atendi o telefone.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かけ$$),
        (2, $$かけて$$),
        (3, $$かけ$$),
        (4, $$かけた$$),
        (5, $$かけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
