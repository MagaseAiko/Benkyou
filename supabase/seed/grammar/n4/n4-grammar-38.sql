-- n4-grammar-38 — 〜ことにする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-38',
    'grammar',
    'N4',
    $$〜ことにする$$,
    $$koto ni suru$$,
    $$Decidir (fazer) / Resolver$$,
    $$ことにする é usado para dizer que a própria pessoa decidiu fazer ou não fazer algo. Equivale a "decidir" ou "resolver".

A estrutura junta o verbo na forma de dicionário ou na forma ない com こと e にする. A ideia é "escolher essa ação" entre as opções possíveis.

No passado, ことにした / ことにしました indica uma decisão já tomada. No presente, ことにする / ことにします indica uma decisão tomada naquele momento.

A diferença em relação a ことになる é importante: ことにする mostra uma decisão pessoal, de quem fala; ことになる mostra algo decidido por fatores externos.$$,
    $$Quando a decisão vira um hábito, usa-se ことにしている, que aparece mais adiante no N4.

ことにする também pode significar "fingir que" ou "considerar como", em frases como "vamos considerar que isso não aconteceu". Esse uso é mais avançado.

Compare com つもり: つもり é uma intenção, ことにする é uma decisão já tomada.$$,
    $$Verbo na forma de dicionário + ことにする
Verbo na forma ない + ことにする

Decisão tomada: ことにした / ことにしました
Decisão agora: ことにする / ことにします
Proposta: ことにしよう$$,
    $$ことにする$$,
    $$ことにする|ことにします|ことにした|ことにしました|ことにしよう$$,
    ARRAY['こと', 'に', 'する']::text[],
    ARRAY['ことにする', 'ことにします', 'ことにした', 'ことにしました', 'ことにしよう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-38', $$明日から毎日走ることにしました。$$, $$あしたからまいにちはしることにしました。$$, $$Decidi correr todos os dias a partir de amanhã.$$),
    ('n4-grammar-38', $$今年は国に帰らないことにした。$$, $$ことしはくににかえらないことにした。$$, $$Decidi não voltar para o meu país este ano.$$),
    ('n4-grammar-38', $$体のために、お酒をやめることにします。$$, $$からだのために、おさけをやめることにします。$$, $$Pela minha saúde, vou parar de beber.$$),
    ('n4-grammar-38', $$よく考えて、この会社に入ることにしました。$$, $$よくかんがえて、このかいしゃにはいることにしました。$$, $$Depois de pensar bem, decidi entrar nesta empresa.$$),
    ('n4-grammar-38', $$雨だから、今日は出かけないことにしよう。$$, $$あめだから、きょうはでかけないことにしよう。$$, $$Está chovendo, então vamos decidir não sair hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康のために、毎朝野菜ジュースを飲む____。$$, $$Pela saúde, decidi tomar suco de verduras toda manhã.$$),
        (2, $$夏休みは北海道へ行く____。$$, $$Decidi ir a Hokkaido nas férias de verão.$$),
        (3, $$もうタバコは吸わない____。$$, $$Decidi não fumar mais.$$),
        (4, $$今日は疲れたから、外で食べる____。$$, $$Hoje estou cansado, então vou comer fora.$$),
        (5, $$迷ったけど、新しいパソコンを買う____。$$, $$Fiquei em dúvida, mas decidi comprar um computador novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにしました$$),
        (1, $$ことにした$$),
        (2, $$ことにしました$$),
        (2, $$ことにした$$),
        (2, $$ことにします$$),
        (3, $$ことにしました$$),
        (3, $$ことにした$$),
        (3, $$ことにします$$),
        (3, $$ことにする$$),
        (4, $$ことにする$$),
        (4, $$ことにします$$),
        (4, $$ことにしよう$$),
        (5, $$ことにしました$$),
        (5, $$ことにした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
