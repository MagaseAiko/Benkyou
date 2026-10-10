-- n5-grammar-77 — 〜はどうですか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-77',
    'grammar',
    'N5',
    $$〜はどうですか$$,
    $$wa dou desu ka$$,
    $$Que tal...? / Como está...? / Como é...?$$,
    $$はどうですか é usado para perguntar a opinião ou a impressão de alguém sobre algo. Equivale a "como está...?", "como é...?" ou "o que você acha de...?".

どう significa "como", e a pergunta pede uma avaliação: se algo está bom, ruim, difícil, divertido.

Ela também serve para fazer sugestões e propostas, com o sentido de "que tal...?". Por exemplo, para propor um dia, um lugar ou uma opção.

Para perguntar sobre algo que já passou, usa-se はどうでしたか, como ao perguntar sobre uma viagem ou uma prova.

Para oferecer algo, como comida ou bebida, a forma mais educada é はいかがですか.$$,
    $$いかが é a versão educada de どう. Atendentes de lojas e restaurantes usam muito いかがですか para oferecer produtos.

Ao sugerir, はどうですか é mais suave do que dizer diretamente "vamos fazer isso", porque deixa o outro decidir.

A resposta pode ser uma opinião curta, como いいですね, ou uma descrição com adjetivos.$$,
    $$Substantivo + は + どうですか
Substantivo + は + どうでしたか (passado)
Substantivo + は + いかがですか (mais educado)
Substantivo + は + どう？ (informal)$$,
    $$はどうですか$$,
    $$はどう|はいかが$$,
    ARRAY['は', 'どう', 'ですか']::text[],
    ARRAY['はどうですか', 'はどうでしたか', 'はいかがですか', 'はどう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-77', $$新しい仕事はどうですか。$$, $$あたらしいしごとはどうですか。$$, $$Como está o novo trabalho?$$),
    ('n5-grammar-77', $$日本の生活はどうですか。$$, $$にほんのせいかつはどうですか。$$, $$Como é a vida no Japão?$$),
    ('n5-grammar-77', $$「明日はどうですか。」「明日は大丈夫です。」$$, $$「あしたはどうですか。」「あしたはだいじょうぶです。」$$, $$"Que tal amanhã?" "Amanhã está bom."$$),
    ('n5-grammar-77', $$旅行はどうでしたか。$$, $$りょこうはどうでしたか。$$, $$Como foi a viagem?$$),
    ('n5-grammar-77', $$コーヒーはいかがですか。$$, $$コーヒーはいかがですか。$$, $$Aceita um café?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$最近、体の調子____。$$, $$Como anda a sua saúde ultimamente?$$),
        (2, $$「今週の土曜日____。」「いいですよ。」$$, $$"Que tal este sábado?" "Pode ser."$$),
        (3, $$昨日のテスト____。$$, $$Como foi a prova de ontem?$$),
        (4, $$お茶____。$$, $$Aceita um chá?$$),
        (5, $$この赤いシャツ____？$$, $$Que tal esta camisa vermelha?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はどうですか$$),
        (2, $$はどうですか$$),
        (3, $$はどうでしたか$$),
        (4, $$はいかがですか$$),
        (4, $$はどうですか$$),
        (5, $$はどう$$),
        (5, $$はどうですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
