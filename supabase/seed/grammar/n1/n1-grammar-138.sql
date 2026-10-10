-- n1-grammar-138 — 〜の至り
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-138',
    'grammar',
    'N1',
    $$〜の至り$$,
    $$no itari$$,
    $$Extremamente / O máximo de / Profundamente$$,
    $$の至り indica que um sentimento ou estado chegou ao grau máximo. Equivale a "extremamente" ou "o máximo de".

É usado em expressões formais de agradecimento, honra ou desculpa, como "é uma honra imensa" ou "estou profundamente envergonhado".

Também aparece em 若気の至り, que significa "imprudência da juventude".$$,
    $$Expressões comuns são 光栄の至り, 恐縮の至り, 感激の至り e 若気の至り.

É muito usado em discursos e cartas formais.$$,
    $$Substantivo + の至りだ / の至りです$$,
    $$の至り$$,
    $$の至り|のいたり$$,
    ARRAY['の', '至り']::text[],
    ARRAY['の至り', 'の至りです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-138', $$このような賞をいただき、光栄の至りです。$$, $$このようなしょうをいただき、こうえいのいたりです。$$, $$Receber um prêmio como este é uma honra imensa.$$),
    ('n1-grammar-138', $$ご迷惑をおかけして、恐縮の至りです。$$, $$ごめいわくをおかけして、きょうしゅくのいたりです。$$, $$Estou profundamente constrangido pelo transtorno causado.$$),
    ('n1-grammar-138', $$あんなことをしたのは、若気の至りだった。$$, $$あんなことをしたのは、わかげのいたりだった。$$, $$Fazer aquilo foi imprudência da juventude.$$),
    ('n1-grammar-138', $$皆様にお祝いいただき、感激の至りです。$$, $$みなさまにおいわいいただき、かんげきのいたりです。$$, $$Estou extremamente emocionado por receber as felicitações de todos.$$),
    ('n1-grammar-138', $$このような失敗をして、赤面の至りです。$$, $$このようなしっぱいをして、せきめんのいたりです。$$, $$Estou profundamente envergonhado por um erro destes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大役を任され、光栄____です。$$, $$Ser encarregado de um papel tão importante é uma honra imensa.$$),
        (2, $$お忙しいところをお越しいただき、恐縮____です。$$, $$Fico profundamente grato por ter vindo apesar de estar tão ocupado.$$),
        (3, $$昔の失敗は若気____だと思ってください。$$, $$Considere os erros do passado como imprudência da juventude.$$),
        (4, $$このような温かい言葉をいただき、感謝____です。$$, $$Receber palavras tão calorosas me deixa extremamente grato.$$),
        (5, $$こんな基本的なミスをして、汗顔____です。$$, $$Cometer um erro tão básico me deixa profundamente envergonhado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の至り$$),
        (2, $$の至り$$),
        (3, $$の至り$$),
        (4, $$の至り$$),
        (5, $$の至り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
