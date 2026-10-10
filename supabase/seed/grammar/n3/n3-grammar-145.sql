-- n3-grammar-145 — 〜と共に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-145',
    'grammar',
    'N3',
    $$〜と共に$$,
    $$to tomo ni$$,
    $$Junto com / À medida que / Ao mesmo tempo que$$,
    $$と共に é uma expressão formal com três usos principais.

O primeiro é "junto com": fazer algo com outra pessoa ou grupo, como "receber o ano novo junto com a família". É uma forma mais formal de と一緒に.

O segundo é "à medida que" ou "com": uma mudança acompanha outra, como "com o passar dos tempos, a vida das pessoas também mudou". Nesse uso, é parecido com につれて.

O terceiro é "ao mesmo tempo que": algo acontece simultaneamente a outra coisa, como "com a chegada da primavera, as cerejeiras começaram a florir". Também pode indicar que alguém tem duas qualidades ao mesmo tempo: "ele é cantor e, ao mesmo tempo, ator".

Por ser formal, と共に aparece muito em discursos, notícias e textos escritos.$$,
    $$Em cartas e discursos formais, frases como 皆様と共に ("junto com todos vocês") são comuns.

No uso de "à medida que", と共に soa mais formal que につれて.

Na conversa do dia a dia, prefira と一緒に para "junto com".$$,
    $$Substantivo (pessoa) + と共に + Verbo (junto com)
Substantivo / Verbo (forma de dicionário) + と共に + Mudança (à medida que)
Substantivo + の + Acontecimento + と共に (ao mesmo tempo)
Substantivo + であると共に + Substantivo + でもある

Escrita: と共に / とともに$$,
    $$と共に$$,
    $$と共に|とともに$$,
    ARRAY['と', '共に']::text[],
    ARRAY['と共に', 'とともに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-145', $$家族と共に、新しい年を迎えた。$$, $$かぞくとともに、あたらしいとしをむかえた。$$, $$Recebi o ano novo junto com a família.$$),
    ('n3-grammar-145', $$時代と共に、人々の生活も変わった。$$, $$じだいとともに、ひとびとのせいかつもかわった。$$, $$Com o passar dos tempos, a vida das pessoas também mudou.$$),
    ('n3-grammar-145', $$年をとると共に、体力が落ちてきた。$$, $$としをとるとともに、たいりょくがおちてきた。$$, $$À medida que envelheço, minha força física vem diminuindo.$$),
    ('n3-grammar-145', $$春の訪れと共に、桜が咲き始めた。$$, $$はるのおとずれとともに、さくらがさきはじめた。$$, $$Com a chegada da primavera, as cerejeiras começaram a florir.$$),
    ('n3-grammar-145', $$彼は歌手であると共に、俳優でもある。$$, $$かれはかしゅであるとともに、はいゆうでもある。$$, $$Ele é cantor e, ao mesmo tempo, ator.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仲間____、山に登った。$$, $$Subi a montanha junto com os companheiros.$$),
        (2, $$経済の発展____、生活が豊かになった。$$, $$Com o desenvolvimento da economia, a vida ficou mais próspera.$$),
        (3, $$彼女は結婚する____、仕事をやめた。$$, $$Ela saiu do emprego ao mesmo tempo que se casou.$$),
        (4, $$技術の進歩____、便利な世の中になった。$$, $$Com o progresso da tecnologia, o mundo ficou mais prático.$$),
        (5, $$彼女は医者である____、母親でもある。$$, $$Ela é médica e, ao mesmo tempo, mãe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と共に$$),
        (1, $$とともに$$),
        (2, $$と共に$$),
        (2, $$とともに$$),
        (3, $$と共に$$),
        (3, $$とともに$$),
        (4, $$と共に$$),
        (4, $$とともに$$),
        (5, $$と共に$$),
        (5, $$とともに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
