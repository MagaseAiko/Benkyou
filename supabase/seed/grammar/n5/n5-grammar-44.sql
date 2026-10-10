-- n5-grammar-44 — 〜なる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-44',
    'grammar',
    'N5',
    $$〜なる$$,
    $$naru$$,
    $$Tornar-se / Ficar / Virar$$,
    $$なる significa "tornar-se", "ficar" ou "virar". Ele mostra uma mudança: algo passa de um estado para outro.

A forma de ligar なる depende da palavra que vem antes. Com substantivos e adjetivos な, usa-se に antes de なる. Com adjetivos い, troca-se o い final por く.

なる é usado para mudanças de profissão, idade, estação do ano, clima, sentimentos e habilidades, entre muitas outras coisas.

Um ponto importante é que なる indica uma mudança que acontece naturalmente ou como resultado de algo. Quando alguém provoca a mudança de propósito, o japonês usa する no lugar de なる.$$,
    $$A diferença entre なる e する é importante: きれいになる é "ficar limpo", enquanto きれいにする é "deixar limpo", ou seja, alguém limpou.

Para idade, usa-se なる para dizer quantos anos alguém vai fazer ou fez.

Em lojas e restaurantes, frases com になります aparecem muito como uma forma educada de apresentar algo, como o valor da conta. É um uso típico do atendimento ao cliente.$$,
    $$Substantivo + に + なる
Adjetivo な (sem な) + に + なる
Adjetivo い sem い + く + なる

Educado: なります
Passado: なった / なりました
Desejo: になりたい / くなりたい$$,
    $$なる$$,
    $$になる|になります|になりました|になった|になって|になりたい|くなる|くなります|くなりました|くなった|くなって$$,
    ARRAY['に', 'く', 'なる']::text[],
    ARRAY['になる', 'になります', 'になった', 'になりました', 'くなる', 'くなります', 'くなった', 'くなりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-44', $$弟は医者になりました。$$, $$おとうとはいしゃになりました。$$, $$Meu irmão mais novo virou médico.$$),
    ('n5-grammar-44', $$掃除して、部屋がきれいになった。$$, $$そうじして、へやがきれいになった。$$, $$Limpei, e o quarto ficou limpo.$$),
    ('n5-grammar-44', $$十一月になって、寒くなりました。$$, $$じゅういちがつになって、さむくなりました。$$, $$Chegou novembro e esfriou.$$),
    ('n5-grammar-44', $$将来、先生になりたいです。$$, $$しょうらい、せんせいになりたいです。$$, $$No futuro, quero ser professor.$$),
    ('n5-grammar-44', $$日本語が上手になりましたね。$$, $$にほんごがじょうずになりましたね。$$, $$Seu japonês melhorou bastante, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$姉は来年二十歳に____。$$, $$Minha irmã mais velha vai fazer vinte anos no ano que vem.$$),
        (2, $$薬を飲んで、元気に____。$$, $$Tomei o remédio e fiquei bem.$$),
        (3, $$急に空が暗く____。$$, $$De repente, o céu ficou escuro.$$),
        (4, $$大人になったら、何に____たいですか。$$, $$Quando crescer, o que você quer ser?$$),
        (5, $$毎日練習して、ピアノが上手に____。$$, $$Pratiquei todo dia e fiquei bom no piano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なります$$),
        (1, $$なる$$),
        (2, $$なりました$$),
        (2, $$なった$$),
        (3, $$なりました$$),
        (3, $$なった$$),
        (4, $$なり$$),
        (5, $$なりました$$),
        (5, $$なった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
