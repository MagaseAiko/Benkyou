-- n5-grammar-86 — 疑問詞（何・誰・いつ・いくら・いくつ）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-86',
    'grammar',
    'N5',
    $$疑問詞（何・誰・いつ・いくら・いくつ）$$,
    $$gimonshi (nani / dare / itsu / ikura / ikutsu)$$,
    $$O que / Quem / Quando / Quanto custa / Quantos$$,
    $$疑問詞 são as palavras interrogativas, usadas para fazer perguntas abertas. No N5, as mais importantes são:
• 何 (なに / なん): "o que".
• 誰 (だれ): "quem".
• いつ: "quando".
• いくら: "quanto custa" ou "quanto" para preços e valores.
• いくつ: "quantos" para coisas, e também "quantos anos" para idade.

Em japonês, a palavra interrogativa não precisa ir para o começo da frase. Ela fica no mesmo lugar onde estaria a resposta. Por isso, a ordem da pergunta e da resposta é igual.

何 tem duas leituras. Antes de sons como t, d e n, e antes de contadores, costuma ser lido なん. Antes de partículas como を e が, costuma ser lido なに.

Quando a palavra interrogativa é o sujeito, ela é marcada com が, e nunca com は.$$,
    $$いつ normalmente não leva に, mesmo quando pergunta sobre um momento.

Para perguntar a idade de alguém de forma educada, usa-se おいくつですか. Para crianças, também é comum 何歳ですか.

Com も e o verbo negativo, as palavras interrogativas formam ideias como "nada" e "ninguém". Com か, formam "algo" e "alguém".$$,
    $$何 (なに) + を / が / に
何 (なん) + です / の / contador (何時 / 何人 / 何曜日)
誰 + が / に / と / の
いつ + Verbo / ですか
いくら + ですか
いくつ + ありますか / ですか (idade)

Formas educadas: どなた (quem) / おいくつ (idade)$$,
    $$何$$,
    $$何|誰|いつ|いくら|いくつ|なに|なん|だれ$$,
    ARRAY['何', '誰', 'いつ', 'いくら', 'いくつ']::text[],
    ARRAY['何', 'なに', 'なん', '誰', 'だれ', 'いつ', 'いくら', 'いくつ', 'どなた', 'おいくつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-86', $$これは何ですか。$$, $$これはなんですか。$$, $$O que é isto?$$),
    ('n5-grammar-86', $$あの人は誰ですか。$$, $$あのひとはだれですか。$$, $$Quem é aquela pessoa?$$),
    ('n5-grammar-86', $$誕生日はいつですか。$$, $$たんじょうびはいつですか。$$, $$Quando é o seu aniversário?$$),
    ('n5-grammar-86', $$このシャツはいくらですか。$$, $$このシャツはいくらですか。$$, $$Quanto custa esta camisa?$$),
    ('n5-grammar-86', $$箱の中にりんごはいくつありますか。$$, $$はこのなかにりんごはいくつありますか。$$, $$Quantas maçãs tem dentro da caixa?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「昨日、____を食べましたか。」「カレーを食べました。」$$, $$"O que você comeu ontem?" "Comi curry."$$),
        (2, $$「____が来ましたか。」「田中さんが来ました。」$$, $$"Quem veio?" "O Tanaka veio."$$),
        (3, $$「夏休みは____からですか。」「七月二十日からです。」$$, $$"A partir de quando são as férias de verão?" "A partir de 20 de julho."$$),
        (4, $$「この時計は____ですか。」「三千円です。」$$, $$"Quanto custa este relógio?" "Três mil ienes."$$),
        (5, $$「弟さんは____ですか。」「十歳です。」$$, $$"Quantos anos tem o seu irmão mais novo?" "Dez anos."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何$$),
        (1, $$なに$$),
        (2, $$誰$$),
        (2, $$だれ$$),
        (3, $$いつ$$),
        (4, $$いくら$$),
        (5, $$いくつ$$),
        (5, $$おいくつ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
