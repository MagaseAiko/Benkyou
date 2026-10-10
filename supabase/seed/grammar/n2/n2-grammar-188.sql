-- n2-grammar-188 — 〜より [2]
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-188',
    'grammar',
    'N2',
    $$〜より [2]$$,
    $$yori$$,
    $$A partir de / Desde / De$$,
    $$より também pode indicar o ponto de partida no tempo ou no espaço, com o mesmo sentido de から. Equivale a "a partir de", "desde" ou "de".

Esse uso é formal e aparece principalmente em avisos, anúncios, cartas e documentos. Por exemplo, "a reunião começa a partir das três" ou "uma carta do presidente".

Na fala do dia a dia, usa-se から.$$,
    $$Não se confunde com より de comparação, que significa "do que".

Expressões comuns são 本日より, 〜より始まる e 〜よりお知らせ.$$,
    $$Substantivo (tempo / lugar / pessoa) + より$$,
    $$より$$,
    $$より$$,
    ARRAY['より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-188', $$会議は午後三時より始まります。$$, $$かいぎはごごさんじよりはじまります。$$, $$A reunião começa a partir das três da tarde.$$),
    ('n2-grammar-188', $$本日より営業時間が変わります。$$, $$ほんじつよりえいぎょうじかんがかわります。$$, $$A partir de hoje, o horário de funcionamento muda.$$),
    ('n2-grammar-188', $$社長よりご挨拶があります。$$, $$しゃちょうよりごあいさつがあります。$$, $$Haverá uma saudação do presidente.$$),
    ('n2-grammar-188', $$東京駅より新幹線で出発します。$$, $$とうきょうえきよりしんかんせんでしゅっぱつします。$$, $$Partiremos de trem-bala a partir da estação de Tóquio.$$),
    ('n2-grammar-188', $$お客様よりお電話がありました。$$, $$おきゃくさまよりおでんわがありました。$$, $$Houve uma ligação de um cliente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来月一日____、料金が値上げされます。$$, $$A partir do dia primeiro do mês que vem, as tarifas vão aumentar.$$),
        (2, $$担当者____ご連絡いたします。$$, $$O responsável entrará em contato.$$),
        (3, $$式は十時____行われます。$$, $$A cerimônia será realizada a partir das dez.$$),
        (4, $$三番線____電車が発車します。$$, $$O trem parte da plataforma três.$$),
        (5, $$学校____お知らせがあります。$$, $$Há um comunicado da escola.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
