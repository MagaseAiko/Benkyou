-- n4-grammar-104 — 〜てよかった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-104',
    'grammar',
    'N4',
    $$〜てよかった$$,
    $$te yokatta$$,
    $$Que bom que / Ainda bem que$$,
    $$てよかった é usado para expressar alívio ou satisfação com algo que aconteceu. Equivale a "que bom que..." ou "ainda bem que...".

Ele junta a forma て, que aqui indica o motivo, com よかった, o passado de いい. A ideia é "por ter acontecido isso, foi bom".

É usado tanto para coisas que a própria pessoa fez, como ter levado um guarda-chuva, quanto para situações em geral, como todos estarem bem.

Na forma negativa, なくてよかった significa "ainda bem que não...", como ainda bem que não houve acidente.

Com substantivos e adjetivos な, usa-se でよかった.$$,
    $$Para arrependimento, o oposto é ばよかった (devia ter feito), que aparece no N3.

A frase 会えてよかった, "foi bom te conhecer", é muito usada em despedidas.

Muitas vezes, てよかった vem com ね, buscando a concordância do outro: "ainda bem, né?".$$,
    $$Verbo na forma て + よかった
Verbo na forma ない sem い + くてよかった (ainda bem que não)
Adjetivo い sem い + くてよかった
Substantivo / Adjetivo な + でよかった

Educado: てよかったです$$,
    $$てよかった$$,
    $$てよかった|でよかった$$,
    ARRAY['て', 'よかった']::text[],
    ARRAY['てよかった', 'てよかったです', 'でよかった', 'なくてよかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-104', $$日本に来てよかったです。$$, $$にほんにきてよかったです。$$, $$Foi muito bom ter vindo ao Japão.$$),
    ('n4-grammar-104', $$早く出かけてよかった。$$, $$はやくでかけてよかった。$$, $$Ainda bem que saí cedo.$$),
    ('n4-grammar-104', $$あなたに会えてよかった。$$, $$あなたにあえてよかった。$$, $$Foi muito bom te conhecer.$$),
    ('n4-grammar-104', $$急に雨が降ったけど、傘を持ってきてよかったね。$$, $$きゅうにあめがふったけど、かさをもってきてよかったね。$$, $$Choveu de repente, mas ainda bem que trouxemos o guarda-chuva, né?$$),
    ('n4-grammar-104', $$みんな元気でよかった。$$, $$みんなげんきでよかった。$$, $$Que bom que todos estão bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この大学に入っ____です。$$, $$Que bom que entrei nesta faculdade.$$),
        (2, $$試験に合格でき____。$$, $$Ainda bem que consegui passar na prova.$$),
        (3, $$大きな事故がなく____ですね。$$, $$Ainda bem que não houve nenhum acidente grave, né?$$),
        (4, $$薬を飲ん____。もう元気だ。$$, $$Ainda bem que tomei o remédio. Já estou bem.$$),
        (5, $$雨がやん____ね。$$, $$Que bom que a chuva parou, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てよかった$$),
        (2, $$てよかった$$),
        (2, $$てよかったです$$),
        (3, $$てよかった$$),
        (4, $$でよかった$$),
        (5, $$でよかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
