-- n1-grammar-139 — 〜の極み
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-139',
    'grammar',
    'N1',
    $$〜の極み$$,
    $$no kiwami$$,
    $$O auge de / O cúmulo de / O máximo de$$,
    $$の極み indica o grau mais alto possível de algo. Equivale a "o auge de", "o cúmulo de" ou "o máximo de".

Pode ser usado com coisas boas, como "o auge do luxo", ou ruins, como "o cúmulo do cansaço".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 贅沢の極み, 疲労の極み, 感激の極み e 無責任の極み.

É parecido com の至り, mas の極み é usado com mais tipos de palavras.$$,
    $$Substantivo + の極み
Substantivo + の極みだ / の極みに達する$$,
    $$の極み$$,
    $$の極み|のきわみ$$,
    ARRAY['の', '極み']::text[],
    ARRAY['の極み', 'の極みだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-139', $$高級ホテルで過ごす休日は、贅沢の極みだ。$$, $$こうきゅうホテルですごすきゅうじつは、ぜいたくのきわみだ。$$, $$Passar as férias num hotel de luxo é o auge da sofisticação.$$),
    ('n1-grammar-139', $$三日間寝ずに働いて、疲労の極みに達した。$$, $$みっかかんねずにはたらいて、ひろうのきわみにたっした。$$, $$Trabalhei três dias sem dormir e cheguei ao máximo do cansaço.$$),
    ('n1-grammar-139', $$彼の発言は、無責任の極みだ。$$, $$かれのはつげんは、むせきにんのきわみだ。$$, $$A declaração dele é o cúmulo da irresponsabilidade.$$),
    ('n1-grammar-139', $$夢がかなって、感激の極みです。$$, $$ゆめがかなって、かんげきのきわみです。$$, $$Realizei meu sonho e estou no auge da emoção.$$),
    ('n1-grammar-139', $$こんな結果になるとは、痛恨の極みだ。$$, $$こんなけっかになるとは、つうこんのきわみだ。$$, $$Chegar a este resultado é o máximo do arrependimento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$美しい景色を見ながらの温泉は、幸せ____だ。$$, $$Uma fonte termal com vista linda é o auge da felicidade.$$),
        (2, $$約束を破るなんて、失礼____だ。$$, $$Quebrar a promessa é o cúmulo da falta de educação.$$),
        (3, $$優勝できて、喜び____です。$$, $$Vencer o campeonato é o máximo da alegria.$$),
        (4, $$この料理は、美味____だ。$$, $$Este prato é o auge do sabor.$$),
        (5, $$試合に負けて、悔しさ____だった。$$, $$Perder a partida foi o máximo da frustração.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の極み$$),
        (1, $$のきわみ$$),
        (2, $$の極み$$),
        (2, $$のきわみ$$),
        (3, $$の極み$$),
        (3, $$のきわみ$$),
        (4, $$の極み$$),
        (4, $$のきわみ$$),
        (5, $$の極み$$),
        (5, $$のきわみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
