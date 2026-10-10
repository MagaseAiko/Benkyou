-- n3-grammar-81 — 〜にしたがって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-81',
    'grammar',
    'N3',
    $$〜にしたがって$$,
    $$ni shitagatte$$,
    $$De acordo com / Seguindo / À medida que$$,
    $$にしたがって tem dois usos principais.

O primeiro é "de acordo com" ou "seguindo": fazer algo obedecendo a instruções, regras, ordens ou um mapa. Por exemplo, "siga as instruções do professor" ou "jogue o lixo de acordo com as regras". Nesse uso, ele vem depois de substantivos.

O segundo é "à medida que": uma mudança acompanha outra, de forma proporcional. Por exemplo, "à medida que envelhecemos, perdemos força física". Nesse uso, ele vem depois de verbos na forma de dicionário, geralmente verbos de mudança.

O verbo 従う significa "seguir" ou "obedecer". A forma にしたがい, sem て, é mais formal e aparece na escrita.$$,
    $$No uso de "à medida que", にしたがって é parecido com につれて. につれて é um pouco mais comum na conversa, e にしたがって é mais formal.

Em avisos de emergência, 係員の指示に従って ("sigam as instruções dos funcionários") é uma frase muito comum.

No uso de "seguindo", a segunda parte costuma ser uma ação que alguém realiza.$$,
    $$Substantivo (指示 / 規則 / 地図) + にしたがって + Verbo (seguindo)
Verbo de mudança (forma de dicionário) + にしたがって + Mudança (à medida que)

Formal: にしたがい
Escrita: にしたがって / に従って$$,
    $$にしたがって$$,
    $$にしたがって|に従って|にしたがい|に従い$$,
    ARRAY['に', 'したがって']::text[],
    ARRAY['にしたがって', 'に従って', 'にしたがい', 'に従い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-81', $$先生の指示にしたがって、作業を進めてください。$$, $$せんせいのしじにしたがって、さぎょうをすすめてください。$$, $$Sigam as instruções do professor e continuem o trabalho.$$),
    ('n3-grammar-81', $$年をとるにしたがって、体力が落ちてきた。$$, $$としをとるにしたがって、たいりょくがおちてきた。$$, $$À medida que envelheço, minha força física vem diminuindo.$$),
    ('n3-grammar-81', $$地図にしたがって歩くと、駅に着いた。$$, $$ちずにしたがってあるくと、えきについた。$$, $$Seguindo o mapa, cheguei à estação.$$),
    ('n3-grammar-81', $$町が発展するにしたがって、人口も増えた。$$, $$まちがはってんするにしたがって、じんこうもふえた。$$, $$À medida que a cidade se desenvolveu, a população também aumentou.$$),
    ('n3-grammar-81', $$規則に従って、ゴミを出してください。$$, $$きそくにしたがって、ゴミをだしてください。$$, $$Coloque o lixo para fora de acordo com as regras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$説明書____、組み立ててください。$$, $$Monte seguindo o manual, por favor.$$),
        (2, $$山の上に登る____、気温が下がる。$$, $$À medida que se sobe a montanha, a temperatura cai.$$),
        (3, $$国民は法律____、税金を払う。$$, $$Os cidadãos pagam impostos de acordo com a lei.$$),
        (4, $$日本語が上手になる____、日本の生活が楽しくなった。$$, $$À medida que meu japonês melhorou, a vida no Japão ficou mais divertida.$$),
        (5, $$火事の時は、係員の案内____、避難してください。$$, $$Em caso de incêndio, evacuem seguindo as orientações dos funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたがって$$),
        (1, $$に従って$$),
        (2, $$にしたがって$$),
        (2, $$に従って$$),
        (3, $$にしたがって$$),
        (3, $$に従って$$),
        (4, $$にしたがって$$),
        (4, $$に従って$$),
        (5, $$にしたがって$$),
        (5, $$に従って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
