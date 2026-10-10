-- n3-grammar-134 — 〜てもかまわない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-134',
    'grammar',
    'N3',
    $$〜てもかまわない$$,
    $$te mo kamawanai$$,
    $$Pode / Não tem problema / Não me importo$$,
    $$てもかまわない é usado para dar ou pedir permissão, ou para dizer que algo não é um problema. Equivale a "pode", "não tem problema" ou "não me importo".

かまう significa "se importar". Assim, かまわない é "não me importo". A ideia literal é "mesmo que faça isso, não me importo".

O sentido é parecido com てもいい, mas てもかまわない soa um pouco mais formal e educado. Por isso, é comum em situações de trabalho e com pessoas desconhecidas.

Com a forma ない, なくてもかまわない significa "não precisa".

Também pode expressar flexibilidade em relação às próprias preferências, como "pode ser caro, não me importo".$$,
    $$Em perguntas educadas, てもかまいませんか é uma alternativa mais formal a てもいいですか.

A expressão 気にしなくてかまいません ("não precisa se preocupar") é comum em atendimento ao cliente.

Responder かまいませんよ é uma forma educada de dizer "pode, sim".$$,
    $$Verbo na forma て + もかまわない / もかまいません
Verbo na forma ない sem い + くてもかまわない (não precisa)
Adjetivo い sem い + くてもかまわない
Substantivo / Adjetivo な + でもかまわない

Pergunta: 〜てもかまいませんか
Escrita: かまわない / 構わない$$,
    $$てもかまわない$$,
    $$てもかまわない|でもかまわない|ても構わない|でも構わない|てもかまいません|でもかまいません$$,
    ARRAY['ても', 'かまわない']::text[],
    ARRAY['てもかまわない', 'てもかまいません', 'でもかまわない', 'なくてもかまわない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-134', $$すみません、ここに座ってもかまいませんか。$$, $$すみません、ここにすわってもかまいませんか。$$, $$Com licença, posso me sentar aqui?$$),
    ('n3-grammar-134', $$明日は来なくてもかまわない。$$, $$あしたはこなくてもかまわない。$$, $$Amanhã você não precisa vir.$$),
    ('n3-grammar-134', $$この書類は鉛筆で書いてもかまいません。$$, $$このしょるいはえんぴつでかいてもかまいません。$$, $$Este documento pode ser preenchido a lápis.$$),
    ('n3-grammar-134', $$少しぐらい遅れてもかまわないよ。$$, $$すこしぐらいおくれてもかまわないよ。$$, $$Não tem problema se atrasar um pouquinho.$$),
    ('n3-grammar-134', $$高くてもかまわないから、いい物を買いたい。$$, $$たかくてもかまわないから、いいものをかいたい。$$, $$Não me importo se for caro, quero comprar algo bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋を使っ____か。$$, $$Posso usar esta sala?$$),
        (2, $$忙しければ、手伝わなく____。$$, $$Se estiver ocupado, não precisa ajudar.$$),
        (3, $$質問には英語で答え____。$$, $$Pode responder às perguntas em inglês.$$),
        (4, $$部屋は駅に近ければ、狭くても____。$$, $$Se o apartamento for perto da estação, não me importo que seja pequeno.$$),
        (5, $$少しぐらい高く____から、この店で買おう。$$, $$Não me importo se for um pouco mais caro, vamos comprar nesta loja.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもかまいません$$),
        (2, $$てもかまわない$$),
        (2, $$てもかまいません$$),
        (3, $$てもかまいません$$),
        (3, $$てもかまわない$$),
        (4, $$かまわない$$),
        (4, $$かまいません$$),
        (5, $$てもかまわない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
