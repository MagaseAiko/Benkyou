-- n1-grammar-237 — 〜はそっちのけで / 〜をそっちのけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-237',
    'grammar',
    'N1',
    $$〜はそっちのけで / 〜をそっちのけで$$,
    $$wa socchinoke de / wo socchinoke de$$,
    $$Deixando de lado / Esquecendo de / Sem dar atenção a$$,
    $$そっちのけで indica que alguém deixou de lado algo importante para se dedicar a outra coisa. Equivale a "deixando de lado" ou "sem dar atenção a".

O tom costuma ser de crítica, porque a pessoa negligencia algo que deveria fazer. Por exemplo, "deixando os estudos de lado, só joga videogame".

É uma expressão coloquial.$$,
    $$É parecido com をよそに e を後回しにして.

A forma そっちのけにする também é usada.$$,
    $$Substantivo + はそっちのけで / をそっちのけで + Outra atividade$$,
    $$そっちのけで$$,
    $$そっちのけで|そっちのけに|そっちのけ$$,
    ARRAY['そっちのけ', 'で']::text[],
    ARRAY['はそっちのけで', 'をそっちのけで', 'そっちのけにする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-237', $$勉強はそっちのけで、ゲームばかりしている。$$, $$べんきょうはそっちのけで、ゲームばかりしている。$$, $$Deixando os estudos de lado, só fica jogando videogame.$$),
    ('n1-grammar-237', $$仕事をそっちのけで、おしゃべりをしている。$$, $$しごとをそっちのけで、おしゃべりをしている。$$, $$Estão conversando sem dar atenção ao trabalho.$$),
    ('n1-grammar-237', $$子供たちは宿題そっちのけで、外で遊んでいる。$$, $$こどもたちはしゅくだいそっちのけで、そとであそんでいる。$$, $$As crianças estão brincando lá fora, esquecendo a lição de casa.$$),
    ('n1-grammar-237', $$彼は家族をそっちのけで、趣味に夢中だ。$$, $$かれはかぞくをそっちのけで、しゅみにむちゅうだ。$$, $$Ele está vidrado no hobby, deixando a família de lado.$$),
    ('n1-grammar-237', $$主役はそっちのけで、みんな料理に夢中だった。$$, $$しゅやくはそっちのけで、みんなりょうりにむちゅうだった。$$, $$Todos estavam vidrados na comida, esquecendo o homenageado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$練習____、彼はスマホを見ている。$$, $$Deixando o treino de lado, ele fica olhando o celular.$$),
        (2, $$自分の仕事を____、人の手伝いばかりしている。$$, $$Deixando o próprio trabalho de lado, só fica ajudando os outros.$$),
        (3, $$試験勉強____、漫画を読んでいる。$$, $$Deixando o estudo para a prova de lado, está lendo mangá.$$),
        (4, $$彼女は彼氏____、友達と話している。$$, $$Ela está conversando com as amigas, sem dar atenção ao namorado.$$),
        (5, $$会議の議題____、雑談ばかりだった。$$, $$Deixando a pauta da reunião de lado, foi só conversa fiada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-237', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はそっちのけで$$),
        (1, $$をそっちのけで$$),
        (2, $$そっちのけで$$),
        (2, $$そっちのけにして$$),
        (3, $$はそっちのけで$$),
        (3, $$をそっちのけで$$),
        (4, $$をそっちのけで$$),
        (4, $$はそっちのけで$$),
        (5, $$はそっちのけで$$),
        (5, $$をそっちのけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
