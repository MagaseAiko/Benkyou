-- n4-grammar-27 — 〜かしら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-27',
    'grammar',
    'N4',
    $$〜かしら$$,
    $$kashira$$,
    $$Será que...? / Fico me perguntando$$,
    $$かしら é uma partícula de final de frase que expressa dúvida ou curiosidade, como "será que...?". Muitas vezes, a pessoa fala consigo mesma ou pensa em voz alta.

Ela tem o mesmo sentido de かな, mas é tradicionalmente associada à fala feminina. Por isso, aparece muito em falas de mulheres em filmes, novelas, livros e animes, principalmente de personagens mais maduras ou elegantes.

Também pode ser usada para fazer pedidos de forma delicada e indireta, principalmente com ないかしら, como "será que você não poderia...?".

A frase antes de かしら fica na forma simples. Com substantivos e adjetivos な, o だ costuma ser omitido.$$,
    $$Hoje em dia, かしら é menos comum na fala das mulheres jovens, que preferem かな. Mesmo assim, é muito frequente em ficção.

Homens raramente usam かしら, exceto em contextos específicos ou para efeito de personagem.

O tom de かしら é suave e reflexivo, nunca agressivo.$$,
    $$Verbo / Adjetivo い (forma simples) + かしら
Substantivo / Adjetivo な + かしら
Frase + のかしら
Verbo ない / てもらえない + かしら (pedido delicado)$$,
    $$かしら$$,
    $$かしら$$,
    ARRAY['かしら']::text[],
    ARRAY['かしら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-27', $$明日は晴れるかしら。$$, $$あしたははれるかしら。$$, $$Será que amanhã vai fazer sol?$$),
    ('n4-grammar-27', $$田中さん、もう帰ったのかしら。$$, $$たなかさん、もうかえったのかしら。$$, $$Será que o Tanaka já foi embora?$$),
    ('n4-grammar-27', $$この服、私に似合うかしら。$$, $$このふく、わたしににあうかしら。$$, $$Será que esta roupa fica bem em mim?$$),
    ('n4-grammar-27', $$誰が来たのかしら。$$, $$だれがきたのかしら。$$, $$Quem será que veio?$$),
    ('n4-grammar-27', $$ちょっと手伝ってもらえないかしら。$$, $$ちょっとてつだってもらえないかしら。$$, $$Será que você poderia me ajudar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨、早くやむ____。$$, $$Será que a chuva vai parar logo?$$),
        (2, $$あの人は誰____。$$, $$Quem será aquela pessoa?$$),
        (3, $$彼、私のこと覚えている____。$$, $$Será que ele se lembra de mim?$$),
        (4, $$ちょっと窓を開けてもいい____。$$, $$Será que posso abrir um pouco a janela?$$),
        (5, $$鍵、どこに置いたの____。$$, $$Onde será que deixei a chave?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かしら$$),
        (2, $$かしら$$),
        (3, $$かしら$$),
        (4, $$かしら$$),
        (5, $$かしら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
