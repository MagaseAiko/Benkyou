-- n1-grammar-190 — 〜てやまない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-190',
    'grammar',
    'N1',
    $$〜てやまない$$,
    $$te yamanai$$,
    $$Sinceramente / Do fundo do coração / Não deixar de$$,
    $$てやまない indica um sentimento forte e contínuo, que não para. Equivale a "sinceramente" ou "do fundo do coração".

Costuma vir com verbos de sentimento ou desejo, como desejar, esperar, amar e respeitar. Por exemplo, "desejo sinceramente o seu sucesso".

É uma expressão muito formal, usada em discursos, cartas e mensagens.$$,
    $$Combinações comuns são 願ってやまない, 祈ってやまない, 愛してやまない e 期待してやまない.

O sujeito costuma ser a primeira pessoa.$$,
    $$Verbo (forma て) + やまない$$,
    $$てやまない$$,
    $$てやまない|てやまなかった|でやまない|てやみません$$,
    ARRAY['て', 'やまない']::text[],
    ARRAY['てやまない', 'てやみません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-190', $$皆様のご健康を願ってやみません。$$, $$みなさまのごけんこうをねがってやみません。$$, $$Desejo sinceramente saúde a todos.$$),
    ('n1-grammar-190', $$世界の平和を祈ってやまない。$$, $$せかいのへいわをいのってやまない。$$, $$Rezo do fundo do coração pela paz no mundo.$$),
    ('n1-grammar-190', $$彼は故郷を愛してやまなかった。$$, $$かれはこきょうをあいしてやまなかった。$$, $$Ele amava profundamente sua terra natal.$$),
    ('n1-grammar-190', $$君の活躍を期待してやまない。$$, $$きみのかつやくをきたいしてやまない。$$, $$Espero sinceramente o seu sucesso.$$),
    ('n1-grammar-190', $$多くの人が尊敬してやまない先生だ。$$, $$おおくのひとがそんけいしてやまないせんせいだ。$$, $$É um professor que muitas pessoas respeitam profundamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お二人の幸せを願っ____。$$, $$Desejo do fundo do coração a felicidade de vocês dois.$$),
        (2, $$被災地の一日も早い復興を祈っ____。$$, $$Rezo sinceramente pela rápida recuperação das áreas atingidas.$$),
        (3, $$若い世代の成長を期待し____。$$, $$Espero sinceramente o crescimento da nova geração.$$),
        (4, $$彼女は音楽を愛し____人だった。$$, $$Ela era uma pessoa que amava profundamente a música.$$),
        (5, $$皆様のご成功を祈っ____。$$, $$Desejo sinceramente o sucesso de todos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-190', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てやまない$$),
        (1, $$てやみません$$),
        (2, $$てやまない$$),
        (2, $$てやみません$$),
        (3, $$てやまない$$),
        (3, $$てやみません$$),
        (4, $$てやまない$$),
        (5, $$てやまない$$),
        (5, $$てやみません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
