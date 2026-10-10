-- n3-grammar-92 — 〜を中心に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-92',
    'grammar',
    'N3',
    $$〜を中心に$$,
    $$wo chuushin ni$$,
    $$Centrado em / Principalmente / Tendo como centro$$,
    $$を中心に é usado para indicar o centro, o foco principal ou a parte mais importante de algo. Equivale a "centrado em", "principalmente" ou "tendo como centro".

中心 significa "centro". Assim, a estrutura mostra o ponto em torno do qual algo acontece, se desenvolve ou se organiza.

Ela tem alguns usos: um centro físico (a Terra gira em torno do Sol, uma cidade cresce ao redor da estação), um grupo principal (um jogo popular principalmente entre jovens), uma área principal (chuvas fortes principalmente na região de Kanto) e um foco de atividade (uma aula centrada na gramática).

Antes de um substantivo, usa-se を中心とした ou を中心とする.$$,
    $$Em notícias sobre o tempo, を中心に aparece muito para indicar a região mais afetada.

Para pessoas, を中心に indica quem lidera ou é o centro de um grupo, como em 彼を中心にチームができた.

Também é comum em descrições de cursos e programas: o que é o foco principal.$$,
    $$Substantivo + を中心に + Verbo / Frase
Substantivo + を中心として + Verbo (formal)
Substantivo + を中心とした / を中心とする + Substantivo

Escrita: 中心 / ちゅうしん$$,
    $$を中心に$$,
    $$を中心に|を中心と|をちゅうしん$$,
    ARRAY['を', '中心', 'に']::text[],
    ARRAY['を中心に', 'を中心として', 'を中心とした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-92', $$この町は駅を中心に発展した。$$, $$このまちはえきをちゅうしんにはってんした。$$, $$Esta cidade se desenvolveu em torno da estação.$$),
    ('n3-grammar-92', $$若者を中心に、このゲームが人気だ。$$, $$わかものをちゅうしんに、このゲームがにんきだ。$$, $$Este jogo é popular, principalmente entre os jovens.$$),
    ('n3-grammar-92', $$地球は太陽を中心に回っている。$$, $$ちきゅうはたいようをちゅうしんにまわっている。$$, $$A Terra gira em torno do Sol.$$),
    ('n3-grammar-92', $$今日の授業は文法を中心に進めます。$$, $$きょうのじゅぎょうはぶんぽうをちゅうしんにすすめます。$$, $$A aula de hoje vai ser centrada na gramática.$$),
    ('n3-grammar-92', $$昨日は関東地方を中心に、大雨が降った。$$, $$きのうはかんとうちほうをちゅうしんに、おおあめがふった。$$, $$Ontem choveu forte, principalmente na região de Kanto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しいリーダーの彼____、新しいチームができた。$$, $$Formou-se uma nova equipe em torno dele, o novo líder.$$),
        (2, $$この店は女性____人気がある。$$, $$Esta loja é popular principalmente entre as mulheres.$$),
        (3, $$東京____、地震の被害が出た。$$, $$Houve danos do terremoto, principalmente em Tóquio.$$),
        (4, $$会議では、来年の計画____話し合った。$$, $$Na reunião, conversamos principalmente sobre o plano do ano que vem.$$),
        (5, $$日本の経済は東京____動いている。$$, $$A economia do Japão gira em torno de Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を中心に$$),
        (2, $$を中心に$$),
        (3, $$を中心に$$),
        (4, $$を中心に$$),
        (5, $$を中心に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
