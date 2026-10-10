-- n4-grammar-103 — 〜てやる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-103',
    'grammar',
    'N4',
    $$〜てやる$$,
    $$te yaru$$,
    $$Fazer (algo) para alguém (inferior) / Vou mostrar que...$$,
    $$てやる tem dois usos principais.

O primeiro é parecido com てあげる: fazer algo em benefício de alguém. A diferença é que てやる é usado para pessoas em posição inferior ou muito próximas, como filhos, irmãos mais novos, e também para animais e plantas. O tom é informal.

O segundo uso expressa uma determinação forte, muitas vezes com raiva ou desafio. É como dizer "vou mostrar que..." ou "eu vou...!". Por exemplo, "da próxima vez, eu vou ganhar de qualquer jeito!".

Por ser informal e às vezes rude, てやる deve ser usado com cuidado. Com pessoas que não são próximas, o mais adequado é てあげる.$$,
    $$Na fala de alguns pais, てやる é natural ao falar do que fazem pelos filhos. Hoje, muitas pessoas preferem てあげる por soar mais gentil.

No uso de desafio, てやる aparece muito em mangás, animes e filmes, em falas de personagens determinados ou revoltados.

O verbo やる sozinho também significa "dar" para inferiores, animais e plantas, como dar comida ao cachorro ou água às flores.$$,
    $$Pessoa / Animal + に + Verbo na forma て + やる

Passado: てやった / てやりました
Determinação: 〜てやる！ / 〜てやろう$$,
    $$てやる$$,
    $$てやる|てやった|てやり|てやろう|でやる|でやった|でやり$$,
    ARRAY['て', 'やる']::text[],
    ARRAY['てやる', 'てやった', 'てやりました', 'でやる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-103', $$弟に宿題を手伝ってやった。$$, $$おとうとにしゅくだいをてつだってやった。$$, $$Ajudei meu irmão mais novo com a lição.$$),
    ('n4-grammar-103', $$毎朝、犬を散歩に連れていってやる。$$, $$まいあさ、いぬをさんぽにつれていってやる。$$, $$Toda manhã, levo o cachorro para passear.$$),
    ('n4-grammar-103', $$息子に新しい自転車を買ってやりました。$$, $$むすこにあたらしいじてんしゃをかってやりました。$$, $$Comprei uma bicicleta nova para o meu filho.$$),
    ('n4-grammar-103', $$今度こそ、絶対に勝ってやる。$$, $$こんどこそ、ぜったいにかってやる。$$, $$Desta vez, eu vou ganhar de qualquer jeito!$$),
    ('n4-grammar-103', $$寝る前に、子供に絵本を読んでやった。$$, $$ねるまえに、こどもにえほんをよんでやった。$$, $$Antes de dormir, li um livro ilustrado para meu filho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$娘におもちゃを買っ____。$$, $$Comprei um brinquedo para minha filha.$$),
        (2, $$猫に特別なえさを作っ____。$$, $$Fiz uma comida especial para o gato.$$),
        (3, $$弟にきれいな字の書き方を教え____。$$, $$Ensinei meu irmão mais novo a escrever com letra bonita.$$),
        (4, $$次の試合では必ず勝っ____。$$, $$No próximo jogo, eu vou ganhar sem falta!$$),
        (5, $$子供に昔話を読ん____。$$, $$Li uma história antiga para meu filho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てやった$$),
        (1, $$てやりました$$),
        (2, $$てやった$$),
        (2, $$てやりました$$),
        (3, $$てやった$$),
        (3, $$てやりました$$),
        (4, $$てやる$$),
        (5, $$でやった$$),
        (5, $$でやりました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
