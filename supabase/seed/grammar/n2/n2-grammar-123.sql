-- n2-grammar-123 — 〜をめぐって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-123',
    'grammar',
    'N2',
    $$〜をめぐって$$,
    $$wo megutte$$,
    $$Em torno de / Sobre / A respeito de$$,
    $$をめぐって indica o tema central de uma discussão, disputa ou conflito. Equivale a "em torno de" ou "sobre".

Costuma vir com verbos como discutir, brigar, debater e disputar, e geralmente há várias opiniões ou pessoas envolvidas. Por exemplo, "houve uma discussão sobre o novo projeto".

É uma expressão formal, muito usada em notícias.$$,
    $$É parecido com について, mas をめぐって é usado quando há debate, conflito ou opiniões diferentes.

A forma をめぐる vem antes de substantivos, como 遺産をめぐる争い.$$,
    $$Substantivo + をめぐって / をめぐり + Verbo
Substantivo + をめぐる + Substantivo$$,
    $$をめぐって$$,
    $$をめぐって|をめぐり|をめぐる|を巡って|を巡り|を巡る$$,
    ARRAY['を', 'めぐって']::text[],
    ARRAY['をめぐって', 'をめぐり', 'をめぐる', 'を巡って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-123', $$新しい空港の建設をめぐって、住民の意見が分かれた。$$, $$あたらしいくうこうのけんせつをめぐって、じゅうみんのいけんがわかれた。$$, $$As opiniões dos moradores se dividiram em torno da construção do novo aeroporto.$$),
    ('n2-grammar-123', $$遺産をめぐって、兄弟が争っている。$$, $$いさんをめぐって、きょうだいがあらそっている。$$, $$Os irmãos estão brigando pela herança.$$),
    ('n2-grammar-123', $$この問題をめぐり、国会で議論が行われた。$$, $$このもんだいをめぐり、こっかいでぎろんがおこなわれた。$$, $$Houve um debate no parlamento sobre este problema.$$),
    ('n2-grammar-123', $$環境をめぐる問題は、ますます深刻になっている。$$, $$かんきょうをめぐるもんだいは、ますますしんこくになっている。$$, $$Os problemas relacionados ao meio ambiente estão cada vez mais sérios.$$),
    ('n2-grammar-123', $$一人の女性をめぐって、二人の男が争った。$$, $$ひとりのじょせいをめぐって、ふたりのおとこがあらそった。$$, $$Dois homens disputaram uma mesma mulher.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$税金の値上げ____、反対の声が上がっている。$$, $$Há vozes contrárias ao aumento dos impostos.$$),
        (2, $$会社の将来____、社員たちが話し合った。$$, $$Os funcionários conversaram sobre o futuro da empresa.$$),
        (3, $$土地____トラブルが起きた。$$, $$Houve um problema envolvendo o terreno.$$),
        (4, $$その事件____、さまざまなうわさが流れた。$$, $$Circularam vários boatos sobre esse caso.$$),
        (5, $$優勝____、三チームが激しく戦っている。$$, $$Três equipes estão disputando ferozmente o título.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をめぐって$$),
        (1, $$をめぐり$$),
        (1, $$を巡って$$),
        (1, $$を巡り$$),
        (2, $$をめぐって$$),
        (2, $$をめぐり$$),
        (2, $$を巡って$$),
        (2, $$を巡り$$),
        (3, $$をめぐる$$),
        (3, $$を巡る$$),
        (3, $$をめぐって$$),
        (3, $$を巡って$$),
        (4, $$をめぐって$$),
        (4, $$をめぐり$$),
        (4, $$を巡って$$),
        (4, $$を巡り$$),
        (5, $$をめぐって$$),
        (5, $$をめぐり$$),
        (5, $$を巡って$$),
        (5, $$を巡り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
