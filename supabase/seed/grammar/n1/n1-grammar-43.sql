-- n1-grammar-43 — 〜じみた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-43',
    'grammar',
    'N1',
    $$〜じみた$$,
    $$jimita$$,
    $$Com jeito de / Que parece / Infantil$$,
    $$じみた indica que algo parece ou tem características de algo, geralmente de forma negativa. Equivale a "com jeito de" ou "que parece".

Por exemplo, 子供じみた significa "infantil", e 脅迫じみた significa "com tom de ameaça".

É usado para criticar uma atitude ou um comportamento.$$,
    $$Expressões comuns são 子供じみた, 年寄りじみた, 芝居じみた, 脅迫じみた e 狂気じみた.

É parecido com めいた e っぽい, mas じみた tem um tom mais crítico.$$,
    $$Substantivo + じみた + Substantivo
Substantivo + じみている$$,
    $$じみた$$,
    $$じみた|じみて$$,
    ARRAY['じみた']::text[],
    ARRAY['じみた', 'じみている', 'じみて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-43', $$そんな子供じみたことはやめなさい。$$, $$そんなこどもじみたことはやめなさい。$$, $$Pare com essa infantilidade.$$),
    ('n1-grammar-43', $$彼の言い方は脅迫じみていた。$$, $$かれのいいかたはきょうはくじみていた。$$, $$O jeito como ele falou tinha um tom de ameaça.$$),
    ('n1-grammar-43', $$芝居じみた態度に、みんなあきれた。$$, $$しばいじみたたいどに、みんなあきれた。$$, $$Todos ficaram pasmos com aquela atitude teatral.$$),
    ('n1-grammar-43', $$まだ若いのに、年寄りじみたことを言う。$$, $$まだわかいのに、としよりじみたことをいう。$$, $$Ainda é jovem, mas fala como um velho.$$),
    ('n1-grammar-43', $$狂気じみた行動に驚いた。$$, $$きょうきじみたこうどうにおどろいた。$$, $$Fiquei surpreso com aquele comportamento que parecia loucura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大人なのに、子供____いたずらをする。$$, $$Mesmo sendo adulto, faz travessuras infantis.$$),
        (2, $$彼の話は説教____いて、聞きたくない。$$, $$O que ele fala parece um sermão, não quero ouvir.$$),
        (3, $$芝居____言い訳はやめてくれ。$$, $$Pare com essas desculpas teatrais.$$),
        (4, $$その手紙には脅迫____内容が書かれていた。$$, $$Aquela carta tinha um conteúdo com tom de ameaça.$$),
        (5, $$彼女の服装は少し年寄り____。$$, $$As roupas dela têm um pouco de jeito de velha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じみた$$),
        (2, $$じみて$$),
        (3, $$じみた$$),
        (4, $$じみた$$),
        (5, $$じみている$$),
        (5, $$じみていた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
