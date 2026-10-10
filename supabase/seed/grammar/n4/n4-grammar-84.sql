-- n4-grammar-84 — 〜たところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-84',
    'grammar',
    'N4',
    $$〜たところ$$,
    $$ta tokoro$$,
    $$Acabar de (neste exato momento)$$,
    $$たところ é usado para dizer que uma ação acabou de terminar, neste exato momento. Equivale a "acabei de" ou "agora mesmo terminei".

Ele é formado pelo verbo na forma た + ところ. ところ significa "ponto" ou "momento", então a ideia é "estou no ponto logo depois de ter feito isso".

Ele é muito usado para responder perguntas sobre o andamento de algo, como "já comeu?" ou "já chegou?", indicando que a ação foi concluída agorinha.

É comum aparecer com palavras como 今, ちょうど e たった今, que reforçam a ideia de algo recentíssimo.

A diferença em relação a たばかり é o tempo. たところ fala do momento imediatamente após a ação. たばかり pode cobrir um período maior, conforme a sensação de quem fala.$$,
    $$A palavra ところ forma um trio importante: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

Não confunda com たところ do N3, que significa "quando fiz..., aconteceu tal coisa" e introduz um resultado.

Com たところ, não se usam expressões de tempo amplas como 先週 ou 先月. Para isso, usa-se たばかり.$$,
    $$Verbo na forma た + ところ + です / だ
今 / ちょうど / たった今 + Verbo た + ところです$$,
    $$たところ$$,
    $$たところ|だところ$$,
    ARRAY['た', 'ところ']::text[],
    ARRAY['たところ', 'だところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-84', $$今、家に着いたところです。$$, $$いま、いえについたところです。$$, $$Acabei de chegar em casa agora.$$),
    ('n4-grammar-84', $$ちょうど今、仕事が終わったところだ。$$, $$ちょうどいま、しごとがおわったところだ。$$, $$O trabalho acabou de terminar agora mesmo.$$),
    ('n4-grammar-84', $$「もう食べた？」「うん、今食べたところ。」$$, $$「もうたべた？」「うん、いまたべたところ。」$$, $$"Já comeu?" "Sim, acabei de comer agora."$$),
    ('n4-grammar-84', $$電車はたった今出たところです。$$, $$でんしゃはたったいまでたところです。$$, $$O trem acabou de sair agora mesmo.$$),
    ('n4-grammar-84', $$今、あなたのメールを読んだところです。$$, $$いま、あなたのメールをよんだところです。$$, $$Acabei de ler o seu e-mail agora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「まだ寝ないの？」「今、宿題が終わっ____だよ。」$$, $$"Ainda não vai dormir?" "Acabei de terminar a lição agora."$$),
        (2, $$今、駅に着い____です。$$, $$Acabei de chegar à estação agora.$$),
        (3, $$映画はちょうど今始まっ____です。$$, $$O filme acabou de começar agora mesmo.$$),
        (4, $$今、薬を飲ん____です。$$, $$Acabei de tomar o remédio agora.$$),
        (5, $$「田中さんはいますか。」「たった今、帰っ____です。」$$, $$"O Tanaka está?" "Ele acabou de ir embora agora mesmo."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たところ$$),
        (2, $$たところ$$),
        (3, $$たところ$$),
        (4, $$だところ$$),
        (5, $$たところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
