-- n2-grammar-42 — かえって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-42',
    'grammar',
    'N2',
    $$かえって$$,
    $$kaette$$,
    $$Pelo contrário / Ao invés disso / Até piorou$$,
    $$かえって é um advérbio que indica que o resultado foi o oposto do que se esperava, geralmente pior. Equivale a "pelo contrário", "ao invés disso" ou "até piorou".

A ideia é que uma ação feita para melhorar algo acabou tendo o efeito contrário. Por exemplo, "tomei o remédio e, pelo contrário, piorei" ou "fui de táxi e, ao invés de ganhar tempo, demorei mais".

Ela é muito parecida com 逆に, mas かえって destaca mais a frustração de uma tentativa que deu errado.

Também aparece em frases como "a explicação é tão detalhada que, ao invés de ajudar, fica mais difícil de entender".$$,
    $$かえって não é o verbo かえる (voltar). É um advérbio com sentido de inversão.

A frase かえってご迷惑をおかけしました ("acabei causando mais incômodo") é uma forma educada de pedir desculpas.

Comparado a むしろ, かえって costuma ter tom negativo, de resultado indesejado.$$,
    $$Ação (com intenção de melhorar) + かえって + Resultado oposto

Escrita: かえって / 却って$$,
    $$かえって$$,
    $$かえって|却って$$,
    ARRAY['かえって']::text[],
    ARRAY['かえって', '却って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-42', $$薬を飲んだら、かえって悪くなった。$$, $$くすりをのんだら、かえってわるくなった。$$, $$Tomei o remédio e, pelo contrário, piorei.$$),
    ('n2-grammar-42', $$手伝ったら、かえって邪魔になった。$$, $$てつだったら、かえってじゃまになった。$$, $$Tentei ajudar e, ao invés disso, acabei atrapalhando.$$),
    ('n2-grammar-42', $$渋滞で、タクシーで行ったら、かえって時間がかかった。$$, $$じゅうたいで、タクシーでいったら、かえってじかんがかかった。$$, $$Com o trânsito, fui de táxi e acabei demorando ainda mais.$$),
    ('n2-grammar-42', $$説明が詳しすぎて、かえってわかりにくい。$$, $$せつめいがくわしすぎて、かえってわかりにくい。$$, $$A explicação é tão detalhada que, ao invés de ajudar, fica difícil de entender.$$),
    ('n2-grammar-42', $$安い物を買ったら、すぐ壊れてかえって高くついた。$$, $$やすいものをかったら、すぐこわれてかえってたかくついた。$$, $$Comprei algo barato, quebrou logo e acabou saindo mais caro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$休んだら、____疲れた。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$),
        (2, $$急いだら、____遅くなった。$$, $$Corri e, ao invés de chegar antes, cheguei mais tarde.$$),
        (3, $$慰めたら、____彼女を泣かせてしまった。$$, $$Tentei consolar e, pelo contrário, fiz ela chorar.$$),
        (4, $$近道をしたら、____道に迷った。$$, $$Peguei um atalho e, ao invés disso, me perdi.$$),
        (5, $$親切にしたつもりが、____迷惑をかけた。$$, $$Achei que estava sendo gentil, mas acabei incomodando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かえって$$),
        (2, $$かえって$$),
        (3, $$かえって$$),
        (4, $$かえって$$),
        (5, $$かえって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
