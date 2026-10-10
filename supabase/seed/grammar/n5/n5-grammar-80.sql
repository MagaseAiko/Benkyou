-- n5-grammar-80 — 〜より〜ほうが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-80',
    'grammar',
    'N5',
    $$〜より〜ほうが$$,
    $$yori ~ hou ga$$,
    $$B é mais... do que A / Prefiro B a A$$,
    $$より〜ほうが é usado para comparar duas coisas e destacar qual delas tem mais de certa característica. Equivale a "B é mais... do que A".

A palavra ほう significa "lado" ou "opção". Assim, a ideia é: "comparado a A, o lado de B é mais...". A opção destacada recebe ほうが.

Essa estrutura é a resposta natural para perguntas do tipo "A ou B, qual é mais...?", feitas com どちら. Na resposta, muitas vezes a parte com より nem aparece.

Com substantivos, usa-se の antes de ほう. Com verbos, o verbo na forma de dicionário vem direto antes de ほう.

Ela também é muito usada para expressar preferências, com 好き ou いい.$$,
    $$A diferença para は〜より〜です é o foco: aqui, a atenção está na opção escolhida, e não no tema da conversa.

Em perguntas com どちら, não se usa 一番, porque a comparação é entre apenas duas coisas.

A mesma palavra ほう aparece em ほうがいい, usada para conselhos. Nos dois casos, a ideia é "escolher um lado".$$,
    $$A + より + B + の + ほうが + Adjetivo
Verbo A + より + Verbo B + ほうが + Adjetivo
B + の + ほうが + Adjetivo (resposta curta)

Pergunta: A と B と どちらが + Adjetivo + ですか

Escrita: ほう / 方$$,
    $$ほうが$$,
    $$ほうが|方が$$,
    ARRAY['より', 'ほう', 'が']::text[],
    ARRAY['ほうが', '方が', 'のほうが', 'の方が']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-80', $$バスより電車のほうが速いです。$$, $$バスよりでんしゃのほうがはやいです。$$, $$O trem é mais rápido do que o ônibus.$$),
    ('n5-grammar-80', $$夏より冬のほうが好きです。$$, $$なつよりふゆのほうがすきです。$$, $$Gosto mais do inverno do que do verão.$$),
    ('n5-grammar-80', $$「犬と猫とどちらが好きですか。」「猫のほうが好きです。」$$, $$「いぬとねことどちらがすきですか。」「ねこのほうがすきです。」$$, $$"De qual você gosta mais, cachorro ou gato?" "Gosto mais de gato."$$),
    ('n5-grammar-80', $$外で遊ぶより家でゲームをするほうが楽しい。$$, $$そとであそぶよりいえでゲームをするほうがたのしい。$$, $$Jogar videogame em casa é mais divertido do que brincar lá fora.$$),
    ('n5-grammar-80', $$この店より、あの店の方が安いですよ。$$, $$このみせより、あのみせのほうがやすいですよ。$$, $$Aquela loja é mais barata do que esta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$東京より大阪の____物価が安いです。$$, $$Em Osaka, o custo de vida é mais barato do que em Tóquio.$$),
        (2, $$私は肉より魚の____好きです。$$, $$Eu gosto mais de peixe do que de carne.$$),
        (3, $$「コーヒーと紅茶とどちらがいいですか。」「紅茶の____いいです。」$$, $$"Café ou chá, qual você prefere?" "Prefiro chá."$$),
        (4, $$電話するより、メールを送る____早いです。$$, $$Mandar e-mail é mais rápido do que telefonar.$$),
        (5, $$一人で行くより、みんなで行く____楽しいですよ。$$, $$Ir com todo mundo é mais divertido do que ir sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうが$$),
        (1, $$方が$$),
        (2, $$ほうが$$),
        (2, $$方が$$),
        (3, $$ほうが$$),
        (3, $$方が$$),
        (4, $$ほうが$$),
        (4, $$方が$$),
        (5, $$ほうが$$),
        (5, $$方が$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
