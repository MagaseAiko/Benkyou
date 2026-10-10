-- n1-grammar-132 — 〜によらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-132',
    'grammar',
    'N1',
    $$〜によらず$$,
    $$ni yorazu$$,
    $$Independentemente de / Sem depender de / Seja qual for$$,
    $$によらず indica que algo não depende de uma condição. Equivale a "independentemente de" ou "sem depender de".

Costuma vir com palavras como aparência, idade, sexo, experiência ou método. Por exemplo, "contratamos sem levar em conta a idade".

A expressão 見かけによらず significa "apesar da aparência", como "apesar da aparência, ele é forte".$$,
    $$Expressões comuns são 見かけによらず, 年齢によらず, 何事によらず e 理由のいかんによらず.

É parecido com を問わず e に関わらず.$$,
    $$Substantivo + によらず
Palavra interrogativa + によらず$$,
    $$によらず$$,
    $$によらず$$,
    ARRAY['に', 'よらず']::text[],
    ARRAY['によらず', '見かけによらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-132', $$彼は見かけによらず、力が強い。$$, $$かれはみかけによらず、ちからがつよい。$$, $$Apesar da aparência, ele é forte.$$),
    ('n1-grammar-132', $$年齢によらず、誰でも参加できる。$$, $$ねんれいによらず、だれでもさんかできる。$$, $$Qualquer pessoa pode participar, independentemente da idade.$$),
    ('n1-grammar-132', $$何事によらず、最後までやり遂げることが大切だ。$$, $$なにごとによらず、さいごまでやりとげることがたいせつだ。$$, $$Seja qual for a tarefa, o importante é ir até o fim.$$),
    ('n1-grammar-132', $$性別によらず、能力で評価する。$$, $$せいべつによらず、のうりょくでひょうかする。$$, $$Avaliamos pela capacidade, independentemente do sexo.$$),
    ('n1-grammar-132', $$彼女は見かけによらず、よく食べる。$$, $$かのじょはみかけによらず、よくたべる。$$, $$Apesar da aparência, ela come bastante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この店は見かけ____、料理がおいしい。$$, $$Apesar da aparência, a comida desta loja é gostosa.$$),
        (2, $$経験の有無____、やる気のある人を採用する。$$, $$Contratamos pessoas motivadas, com ou sem experiência.$$),
        (3, $$何事____、準備が大切だ。$$, $$Seja qual for a coisa, a preparação é importante.$$),
        (4, $$国籍____、優秀な人材を集めている。$$, $$Reunimos pessoas talentosas, independentemente da nacionalidade.$$),
        (5, $$あの人は見かけ____、優しい人だ。$$, $$Apesar da aparência, aquela pessoa é gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によらず$$),
        (2, $$によらず$$),
        (3, $$によらず$$),
        (4, $$によらず$$),
        (5, $$によらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
