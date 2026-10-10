-- n5-grammar-57 — 〜ので
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-57',
    'grammar',
    'N5',
    $$〜ので$$,
    $$node$$,
    $$Porque / Como / Por isso$$,
    $$ので é usado para dar o motivo ou a causa de algo. Equivale a "porque", "como" ou "por isso", dependendo da frase.

A ordem é: primeiro o motivo, depois o resultado. ので fica no final da parte que explica o motivo.

A grande diferença entre ので e から está no tom. ので apresenta o motivo como algo objetivo, como um fato natural. Por isso, soa mais suave e educado, e é muito usado em pedidos, desculpas e explicações formais. から soa mais direto e pessoal.

Com substantivos e adjetivos な, usa-se な antes de ので, e não だ.$$,
    $$Para pedir permissão ou se desculpar, ので é quase sempre a melhor escolha, porque não soa como uma justificativa forçada.

Na fala rápida, ので às vezes vira んで. É bem coloquial.

Diferente de から, ので normalmente não é usado no final da frase para responder diretamente uma pergunta com どうして. Nesses casos, からです soa mais natural.$$,
    $$Verbo / Adjetivo い (forma simples) + ので
Substantivo / Adjetivo な + な + ので

Mais formal: Verbo ます / です + ので$$,
    $$ので$$,
    $$ので$$,
    ARRAY['ので']::text[],
    ARRAY['ので', 'なので']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-57', $$雨が降っているので、タクシーで行きます。$$, $$あめがふっているので、タクシーでいきます。$$, $$Como está chovendo, vou de táxi.$$),
    ('n5-grammar-57', $$頭が痛いので、今日は早く帰ります。$$, $$あたまがいたいので、きょうははやくかえります。$$, $$Estou com dor de cabeça, então hoje vou embora mais cedo.$$),
    ('n5-grammar-57', $$明日は休みなので、ゆっくり寝ます。$$, $$あしたはやすみなので、ゆっくりねます。$$, $$Amanhã é folga, então vou dormir bastante.$$),
    ('n5-grammar-57', $$道が混んでいたので、会議に遅れました。$$, $$みちがこんでいたので、かいぎにおくれました。$$, $$O trânsito estava ruim, então me atrasei para a reunião.$$),
    ('n5-grammar-57', $$すみません、用事があるので、お先に失礼します。$$, $$すみません、ようじがあるので、おさきにしつれいします。$$, $$Desculpe, tenho um compromisso, então vou indo antes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$熱がある____、学校を休みます。$$, $$Estou com febre, então vou faltar à escola.$$),
        (2, $$この本はおもしろい____、毎日読んでいます。$$, $$Este livro é interessante, então leio todo dia.$$),
        (3, $$今日は日曜日な____、銀行は休みです。$$, $$Hoje é domingo, então o banco está fechado.$$),
        (4, $$電車が遅れた____、遅刻しました。$$, $$O trem atrasou, então cheguei atrasado.$$),
        (5, $$少し寒い____、窓を閉めてもいいですか。$$, $$Está um pouco frio, então posso fechar a janela?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ので$$),
        (2, $$ので$$),
        (3, $$ので$$),
        (4, $$ので$$),
        (5, $$ので$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
