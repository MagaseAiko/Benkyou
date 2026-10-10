-- n4-grammar-39 — 〜くする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-39',
    'grammar',
    'N4',
    $$〜くする$$,
    $$ku suru$$,
    $$Tornar / Deixar (mais...)$$,
    $$くする é usado com adjetivos い para dizer que alguém muda algo de propósito, deixando aquilo com uma nova característica. Equivale a "tornar" ou "deixar".

Para formar, tira-se o い do adjetivo e acrescenta-se く, seguido de する. Por exemplo, deixar o quarto claro, deixar o som baixo, deixar o cabelo curto.

A diferença em relação a くなる é quem causa a mudança. Com くなる, a mudança acontece naturalmente ("ficou escuro"). Com くする, alguém faz a mudança acontecer ("deixei escuro").

Por isso, a coisa que muda é marcada com を, como objeto da ação.

Com adjetivos な e substantivos, a estrutura equivalente é にする, como em きれいにする (deixar limpo).$$,
    $$Compare: 部屋が明るくなった (o quarto ficou claro, por exemplo porque amanheceu) e 部屋を明るくした (eu deixei o quarto claro, acendendo a luz).

Em lojas, pedir desconto com 安くしてください ou 安くしてもらえませんか é bem comum em alguns contextos.

くする é muito usado em pedidos práticos, como aumentar ou diminuir o volume.$$,
    $$Substantivo + を + Adjetivo い sem い + く + する
Exceção: いい → よくする

Pedido: 〜くしてください
Passado: 〜くした / 〜くしました

Equivalente com adjetivos な: Adjetivo な + に + する$$,
    $$くする$$,
    $$くする|くします|くした|くしました|くして$$,
    ARRAY['く', 'する']::text[],
    ARRAY['くする', 'くします', 'くした', 'くしました', 'くして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-39', $$カーテンを開けて、部屋を明るくしました。$$, $$カーテンをあけて、へやをあかるくしました。$$, $$Abri a cortina e deixei o quarto claro.$$),
    ('n4-grammar-39', $$すみません、音を小さくしてください。$$, $$すみません、おとをちいさくしてください。$$, $$Com licença, abaixe o som, por favor.$$),
    ('n4-grammar-39', $$夏だから、髪を短くしたいです。$$, $$なつだから、かみをみじかくしたいです。$$, $$Como é verão, quero deixar o cabelo curto.$$),
    ('n4-grammar-39', $$今日は料理を少し辛くしました。$$, $$きょうはりょうりをすこしからくしました。$$, $$Hoje deixei a comida um pouco mais apimentada.$$),
    ('n4-grammar-39', $$値段をもう少し安くしてくれませんか。$$, $$ねだんをもうすこしやすくしてくれませんか。$$, $$Não pode deixar o preço um pouco mais barato?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビの音を大き____ください。$$, $$Aumente o volume da TV, por favor.$$),
        (2, $$子供のために、カレーを甘____。$$, $$Deixei o curry mais suave por causa das crianças.$$),
        (3, $$部屋が暗いから、もう少し明る____ください。$$, $$O quarto está escuro, então deixe-o um pouco mais claro, por favor.$$),
        (4, $$冬は部屋を暖か____寝ます。$$, $$No inverno, durmo com o quarto aquecido.$$),
        (5, $$文章を短____、読みやすくしました。$$, $$Encurtei o texto e o deixei mais fácil de ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くして$$),
        (2, $$くしました$$),
        (2, $$くした$$),
        (3, $$くして$$),
        (4, $$くして$$),
        (5, $$くして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
