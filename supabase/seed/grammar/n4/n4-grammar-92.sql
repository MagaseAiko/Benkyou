-- n4-grammar-92 — 〜てほしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-92',
    'grammar',
    'N4',
    $$〜てほしい$$,
    $$te hoshii$$,
    $$Querer que (alguém) faça / Gostaria que$$,
    $$てほしい é usado para dizer que você quer que outra pessoa faça algo, ou que algo aconteça. Equivale a "querer que..." ou "gostaria que...".

A diferença em relação a たい é quem faz a ação. Com たい, é você que quer fazer. Com てほしい, você quer que outra pessoa faça.

A pessoa de quem se espera a ação é marcada com に. Para desejos sobre coisas que não são pessoas, como o tempo ou uma situação, ela é marcada com が.

Na forma negativa, ないでほしい significa "não quero que...", "gostaria que não...".

Dizer てほしい diretamente a superiores pode soar exigente. Com eles, é melhor usar pedidos como ていただけませんか.$$,
    $$Terminar com てほしいんですが… é uma forma comum de fazer um pedido de modo indireto, deixando a frase em aberto.

Com superiores, てほしい soa como uma exigência. Prefira ていただきたいです ou ていただけませんか.

Como ほしい é um adjetivo い, てほしい se conjuga como tal: てほしくない, てほしかった.$$,
    $$Pessoa + に + Verbo na forma て + ほしい
Coisa / Situação + が + Verbo na forma て + ほしい
Verbo na forma ない + で + ほしい (não quero que...)

Educado: てほしいです
Pedido indireto: てほしいんですが…

Escrita: ほしい / 欲しい$$,
    $$てほしい$$,
    $$てほしい|でほしい|て欲しい|で欲しい|てほしく|でほしく$$,
    ARRAY['て', 'ほしい']::text[],
    ARRAY['てほしい', 'てほしいです', 'ないでほしい', 'て欲しい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-92', $$もっとゆっくり話してほしい。$$, $$もっとゆっくりはなしてほしい。$$, $$Queria que você falasse mais devagar.$$),
    ('n4-grammar-92', $$母にはいつまでも元気でいてほしいです。$$, $$ははにはいつまでもげんきでいてほしいです。$$, $$Quero que minha mãe continue saudável para sempre.$$),
    ('n4-grammar-92', $$このことは誰にも言わないでほしい。$$, $$このことはだれにもいわないでほしい。$$, $$Não quero que você conte isso para ninguém.$$),
    ('n4-grammar-92', $$早く春が来てほしいなあ。$$, $$はやくはるがきてほしいなあ。$$, $$Queria que a primavera chegasse logo.$$),
    ('n4-grammar-92', $$すみません、この仕事を手伝ってほしいんですが…。$$, $$すみません、このしごとをてつだってほしいんですが…。$$, $$Com licença, eu queria que você me ajudasse com este trabalho...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日は早く来____。$$, $$Quero que você venha cedo amanhã.$$),
        (2, $$彼にもっと勉強し____です。$$, $$Quero que ele estude mais.$$),
        (3, $$この話は秘密にし____。$$, $$Quero que esta história fique em segredo.$$),
        (4, $$部屋でタバコを吸わない____。$$, $$Não quero que você fume no quarto.$$),
        (5, $$雨が早くやん____なあ。$$, $$Queria que a chuva parasse logo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てほしい$$),
        (1, $$てほしいです$$),
        (2, $$てほしい$$),
        (3, $$てほしい$$),
        (4, $$でほしい$$),
        (5, $$でほしい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
