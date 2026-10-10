-- n2-grammar-116 — 〜の下で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-116',
    'grammar',
    'N2',
    $$〜の下で$$,
    $$no moto de$$,
    $$Sob / Sob a orientação de / Debaixo de$$,
    $$の下で, lido もとで, indica que algo acontece sob a influência, orientação ou condição de algo ou alguém. Equivale a "sob" ou "sob a orientação de".

Pode se referir a uma pessoa, como "estudar sob a orientação de um professor famoso", ou a uma condição, como "sob a lei" ou "sob este acordo".

Também pode indicar um lugar físico, como "debaixo do céu azul".$$,
    $$Nesse uso, 下 é lido もと e não した.

A forma の下に é mais formal e aparece em textos sérios, como 法の下に.

Expressões comuns são 先生の下で, 指導の下で e 青空の下で.$$,
    $$Substantivo (pessoa) + の下で
Substantivo (condição / regra) + の下で / の下に$$,
    $$の下で$$,
    $$の下で|の下に|のもとで|のもとに$$,
    ARRAY['の', '下', 'で']::text[],
    ARRAY['の下で', 'の下に', 'のもとで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-116', $$有名な先生の下で、ピアノを習った。$$, $$ゆうめいなせんせいのもとで、ピアノをならった。$$, $$Aprendi piano sob a orientação de um professor famoso.$$),
    ('n2-grammar-116', $$青空の下で、お弁当を食べた。$$, $$あおぞらのもとで、おべんとうをたべた。$$, $$Comi a marmita debaixo do céu azul.$$),
    ('n2-grammar-116', $$専門家の指導の下で、実験を行った。$$, $$せんもんかのしどうのもとで、じっけんをおこなった。$$, $$Fizemos o experimento sob a orientação de especialistas.$$),
    ('n2-grammar-116', $$すべての人は法の下に平等だ。$$, $$すべてのひとはほうのもとにびょうどうだ。$$, $$Todas as pessoas são iguais perante a lei.$$),
    ('n2-grammar-116', $$厳しい条件の下で、選手たちは練習を続けた。$$, $$きびしいじょうけんのもとで、せんしゅたちはれんしゅうをつづけた。$$, $$Sob condições difíceis, os atletas continuaram treinando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は父親の____、料理の修業をした。$$, $$Ele treinou culinária sob a orientação do pai.$$),
        (2, $$医師の管理____、新しい薬を試した。$$, $$Testamos o novo remédio sob a supervisão do médico.$$),
        (3, $$太陽____、子供たちが元気に遊んでいる。$$, $$Debaixo do sol, as crianças brincam animadas.$$),
        (4, $$新しい社長____、会社は大きく変わった。$$, $$Sob o novo presidente, a empresa mudou muito.$$),
        (5, $$この契約____、両社は協力していく。$$, $$Sob este contrato, as duas empresas vão cooperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$下で$$),
        (1, $$もとで$$),
        (2, $$の下で$$),
        (2, $$の下に$$),
        (2, $$のもとで$$),
        (2, $$のもとに$$),
        (3, $$の下で$$),
        (3, $$のもとで$$),
        (4, $$の下で$$),
        (4, $$のもとで$$),
        (5, $$の下で$$),
        (5, $$の下に$$),
        (5, $$のもとで$$),
        (5, $$のもとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
