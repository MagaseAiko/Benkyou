-- n5-grammar-45 — 〜んです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-45',
    'grammar',
    'N5',
    $$〜んです$$,
    $$n desu$$,
    $$É que / Acontece que / Sabe$$,
    $$んです é usado para explicar uma situação, dar um motivo ou pedir uma explicação. Ele dá à frase o sentido de "é que...", "acontece que...".

A diferença entre uma frase normal e uma frase com んです é o foco. Uma frase normal só informa um fato. Com んです, a pessoa está ligando aquele fato ao contexto: explicando por que algo aconteceu, justificando algo ou mostrando interesse em entender a situação.

Em perguntas, んですか mostra que quem pergunta percebeu algo e quer uma explicação, como "o que aconteceu?" ao ver alguém triste.

Também é muito usado antes de um pedido ou pergunta, apresentando a situação primeiro: "é que eu queria ir à estação...".

んです é a forma falada de のです. Na fala informal, usa-se んだ ou の.$$,
    $$Usar んです demais pode soar insistente, porque toda frase vira uma explicação. Ele deve aparecer quando existe um contexto a ser explicado.

Em perguntas, んですか pode soar como cobrança se o tom for forte, principalmente em perguntas negativas.

Com substantivos e adjetivos な, não se esqueça do な: 休みなんです, e não 休みんです.$$,
    $$Verbo / Adjetivo い (forma simples) + んです
Substantivo / Adjetivo な + な + んです

Pergunta: 〜んですか
Antes de pedido: 〜んですが / 〜んですけど

Informal: 〜んだ / 〜の
Forma escrita: 〜のです$$,
    $$んです$$,
    $$んです|んだ$$,
    ARRAY['ん', 'です']::text[],
    ARRAY['んです', 'んですか', 'んだ', 'のです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-45', $$すみません、頭が痛いんです。$$, $$すみません、あたまがいたいんです。$$, $$Desculpe, é que estou com dor de cabeça.$$),
    ('n5-grammar-45', $$どうしたんですか。$$, $$どうしたんですか。$$, $$O que aconteceu?$$),
    ('n5-grammar-45', $$明日は休みなんです。$$, $$あしたはやすみなんです。$$, $$É que amanhã é folga.$$),
    ('n5-grammar-45', $$実は、来月結婚するんです。$$, $$じつは、らいげつけっこんするんです。$$, $$Na verdade, vou me casar no mês que vem.$$),
    ('n5-grammar-45', $$駅に行きたいんですが、どう行けばいいですか。$$, $$えきにいきたいんですが、どういけばいいですか。$$, $$Eu queria ir à estação. Como faço para chegar?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「どうして食べないんですか。」「お腹が痛い____。」$$, $$"Por que você não está comendo?" "É que estou com dor de barriga."$$),
        (2, $$元気がないですね。どうした____。$$, $$Você está desanimado, hein. O que houve?$$),
        (3, $$「昨日、休みましたね。」「ええ、熱があった____。」$$, $$"Você faltou ontem, né?" "Sim, é que eu estava com febre."$$),
        (4, $$このかばん、すごく高かった____よ。$$, $$Esta bolsa foi muito cara, sabia?$$),
        (5, $$「すみません、遅れて。」「いいえ、私も今来た____。」$$, $$"Desculpe o atraso." "Não tem problema, eu também acabei de chegar."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んです$$),
        (2, $$んですか$$),
        (3, $$んです$$),
        (4, $$んです$$),
        (4, $$んだ$$),
        (5, $$んです$$),
        (5, $$んだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
