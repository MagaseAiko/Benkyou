-- n3-grammar-91 — 〜のでしょうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-91',
    'grammar',
    'N3',
    $$〜のでしょうか$$,
    $$no deshou ka$$,
    $$Será que...? / Poderia me dizer...? (pergunta educada)$$,
    $$のでしょうか é uma forma muito educada e suave de fazer uma pergunta. Equivale a "será que...?" ou "poderia me dizer...?".

Ela junta の (explicação), でしょう (suposição) e か (pergunta). O resultado é uma pergunta indireta, que não pressiona o ouvinte. Quem pergunta mostra que quer entender uma situação, sem exigir uma resposta direta.

É muito usada para pedir informações a desconhecidos, para perguntar algo delicado no trabalho e para expressar dúvidas ou preocupações, inclusive falando consigo mesmo.

Na fala, の costuma virar ん, formando んでしょうか.

Com substantivos e adjetivos な, usa-se なのでしょうか.$$,
    $$Comparando: ですか é uma pergunta direta; のですか pede explicação; のでしょうか é a forma mais suave e humilde.

Em reuniões, のでしょうか também serve para levantar uma dúvida sobre uma decisão sem soar como crítica: 本当にこれでいいのでしょうか.

Em textos, a frase pode ficar como uma pergunta retórica, convidando o leitor a refletir.$$,
    $$Verbo / Adjetivo い (forma simples) + のでしょうか
Substantivo / Adjetivo な + な + のでしょうか

Fala: 〜んでしょうか
Pedido de orientação: Verbo ば + いいのでしょうか$$,
    $$のでしょうか$$,
    $$のでしょうか|んでしょうか$$,
    ARRAY['の', 'でしょう', 'か']::text[],
    ARRAY['のでしょうか', 'んでしょうか', 'なのでしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-91', $$すみません、駅はどこにあるのでしょうか。$$, $$すみません、えきはどこにあるのでしょうか。$$, $$Com licença, poderia me dizer onde fica a estação?$$),
    ('n3-grammar-91', $$どうして彼は来ないのでしょうか。$$, $$どうしてかれはこないのでしょうか。$$, $$Por que será que ele não vem?$$),
    ('n3-grammar-91', $$この書類は、誰に出せばいいのでしょうか。$$, $$このしょるいは、だれにだせばいいのでしょうか。$$, $$Para quem devo entregar este documento?$$),
    ('n3-grammar-91', $$明日の会議は何時からなのでしょうか。$$, $$あしたのかいぎはなんじからなのでしょうか。$$, $$A reunião de amanhã é a partir de que horas?$$),
    ('n3-grammar-91', $$本当にこれでいいのでしょうか。$$, $$ほんとうにこれでいいのでしょうか。$$, $$Será que está mesmo tudo bem assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どうすれば日本語が上手になる____。$$, $$O que será que eu devo fazer para melhorar meu japonês?$$),
        (2, $$すみません、この電車は東京駅に止まる____。$$, $$Com licença, este trem para na estação de Tóquio?$$),
        (3, $$先生はいつ戻られる____。$$, $$Quando será que o professor volta?$$),
        (4, $$彼女はなぜ泣いている____。$$, $$Por que será que ela está chorando?$$),
        (5, $$何も変えなくて、このままでいい____。$$, $$Será que está bom deixar assim, sem mudar nada?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のでしょうか$$),
        (1, $$んでしょうか$$),
        (2, $$のでしょうか$$),
        (2, $$んでしょうか$$),
        (3, $$のでしょうか$$),
        (3, $$んでしょうか$$),
        (4, $$のでしょうか$$),
        (4, $$んでしょうか$$),
        (5, $$のでしょうか$$),
        (5, $$んでしょうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
