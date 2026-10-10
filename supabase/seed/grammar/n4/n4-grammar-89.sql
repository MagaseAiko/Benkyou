-- n4-grammar-89 — 〜たらいいですか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-89',
    'grammar',
    'N4',
    $$〜たらいいですか$$,
    $$tara ii desu ka$$,
    $$O que devo...? / Como devo...?$$,
    $$たらいいですか é usado para pedir conselho ou instrução. Equivale a "o que devo fazer?", "como devo...?" ou "onde devo...?".

Ele junta a forma たら ("se fizer") com いいですか ("está bom?"). A ideia literal é "se eu fizer..., está bom?".

Quase sempre aparece com palavras interrogativas, como どう, 何, どこ, いつ e 誰, para perguntar qual é a melhor forma de agir.

Dentro de uma frase maior, como "não sei para quem perguntar", usa-se たらいいか, seguido de わからない ou 迷う.

Para ser ainda mais educado, usa-se たらいいでしょうか.$$,
    $$どうしたらいいですか é uma das perguntas mais úteis para pedir ajuda em qualquer situação.

ばいいですか tem o mesmo sentido e também é muito usada. A diferença é pequena e muitas vezes as duas podem ser trocadas.

A resposta costuma vir com たらいいですよ ou ばいいですよ, oferecendo a sugestão.$$,
    $$Palavra interrogativa + … + Verbo na forma た + らいいですか
Palavra interrogativa + … + Verbo た + らいいか + わからない / 迷う

Mais educado: たらいいでしょうか
Equivalente: ばいいですか$$,
    $$たらいいですか$$,
    $$たらいい|だらいい$$,
    ARRAY['たら', 'いい', 'ですか']::text[],
    ARRAY['たらいいですか', 'たらいいでしょうか', 'たらいいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-89', $$すみません、駅までどう行ったらいいですか。$$, $$すみません、えきまでどういったらいいですか。$$, $$Com licença, como faço para ir até a estação?$$),
    ('n4-grammar-89', $$このボタンはいつ押したらいいですか。$$, $$このボタンはいつおしたらいいですか。$$, $$Quando devo apertar este botão?$$),
    ('n4-grammar-89', $$誰に聞いたらいいかわからない。$$, $$だれにきいたらいいかわからない。$$, $$Não sei para quem perguntar.$$),
    ('n4-grammar-89', $$母の誕生日に何を買ったらいいでしょうか。$$, $$ははのたんじょうびになにをかったらいいでしょうか。$$, $$O que devo comprar para o aniversário da minha mãe?$$),
    ('n4-grammar-89', $$この薬は一日何回飲んだらいいですか。$$, $$このくすりはいちにちなんかいのんだらいいですか。$$, $$Quantas vezes por dia devo tomar este remédio?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この書類はどこに出し____。$$, $$Onde devo entregar este documento?$$),
        (2, $$明日は何時に来____ですか。$$, $$A que horas devo vir amanhã?$$),
        (3, $$日本語が上手になるには、どうし____ですか。$$, $$O que devo fazer para melhorar meu japonês?$$),
        (4, $$パーティーに何を着て行っ____か、迷っています。$$, $$Estou em dúvida sobre o que vestir para a festa.$$),
        (5, $$この漢字は何と読ん____ですか。$$, $$Como devo ler este kanji?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たらいいですか$$),
        (2, $$たらいい$$),
        (3, $$たらいい$$),
        (4, $$たらいい$$),
        (5, $$だらいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
