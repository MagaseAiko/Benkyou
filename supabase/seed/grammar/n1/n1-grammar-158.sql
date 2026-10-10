-- n1-grammar-158 — 〜を余儀なくされる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-158',
    'grammar',
    'N1',
    $$〜を余儀なくされる$$,
    $$wo yogi naku sareru$$,
    $$Ser forçado a / Ver-se obrigado a / Não ter escolha senão$$,
    $$を余儀なくされる indica que alguém foi obrigado a fazer algo por causa de uma situação que não podia controlar. Equivale a "ser forçado a" ou "ver-se obrigado a".

A causa costuma ser um desastre, uma doença, uma crise ou outro fator externo. Por exemplo, "por causa do terremoto, os moradores foram forçados a evacuar".

É uma expressão muito formal, comum em notícias.$$,
    $$A forma ativa, を余儀なくさせる, significa "forçar alguém a".

Costuma vir com palavras como 中止, 避難, 延期, 変更 e 撤退.$$,
    $$Substantivo (ação) + を余儀なくされる
Substantivo + を余儀なくされた$$,
    $$を余儀なくされる$$,
    $$を余儀なくされ|を余儀なくさせ|をよぎなくされ$$,
    ARRAY['を', '余儀なく', 'される']::text[],
    ARRAY['を余儀なくされる', 'を余儀なくされた', 'を余儀なくさせる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-158', $$地震のため、住民は避難を余儀なくされた。$$, $$じしんのため、じゅうみんはひなんをよぎなくされた。$$, $$Por causa do terremoto, os moradores foram forçados a evacuar.$$),
    ('n1-grammar-158', $$大雨で、試合は中止を余儀なくされた。$$, $$おおあめで、しあいはちゅうしをよぎなくされた。$$, $$Por causa da chuva forte, a partida teve que ser cancelada.$$),
    ('n1-grammar-158', $$けがのため、彼は引退を余儀なくされた。$$, $$けがのため、かれはいんたいをよぎなくされた。$$, $$Por causa da lesão, ele se viu obrigado a se aposentar.$$),
    ('n1-grammar-158', $$不景気で、多くの店が閉店を余儀なくされている。$$, $$ふけいきで、おおくのみせがへいてんをよぎなくされている。$$, $$Por causa da recessão, muitas lojas estão sendo forçadas a fechar.$$),
    ('n1-grammar-158', $$計画の変更を余儀なくされた。$$, $$けいかくのへんこうをよぎなくされた。$$, $$Fomos forçados a mudar o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$台風で、飛行機は欠航____。$$, $$Por causa do tufão, os voos foram forçados a ser cancelados.$$),
        (2, $$資金不足で、工事は中断____。$$, $$Por falta de verba, a obra teve que ser interrompida.$$),
        (3, $$病気のため、彼女は入院____。$$, $$Por causa da doença, ela se viu obrigada a ser internada.$$),
        (4, $$戦争で、多くの人が移住____。$$, $$Por causa da guerra, muitas pessoas foram forçadas a migrar.$$),
        (5, $$経営悪化で、会社は人員削減____いる。$$, $$Com a piora da administração, a empresa está sendo forçada a cortar pessoal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を余儀なくされた$$),
        (2, $$を余儀なくされた$$),
        (3, $$を余儀なくされた$$),
        (4, $$を余儀なくされた$$),
        (5, $$を余儀なくされて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
