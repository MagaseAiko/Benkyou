-- n1-grammar-184 — 〜たるもの / 〜たる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-184',
    'grammar',
    'N1',
    $$〜たるもの / 〜たる$$,
    $$taru mono / taru$$,
    $$Quem é / Na condição de / Alguém que é$$,
    $$たるもの e たる indicam uma posição ou papel importante e o comportamento esperado de quem ocupa esse lugar. Equivalem a "quem é..." ou "na condição de...".

A segunda parte costuma dizer como essa pessoa deve agir. Por exemplo, "quem é professor deve dar o exemplo aos alunos".

É uma expressão muito formal e antiquada, usada para falar de responsabilidades.$$,
    $$Expressões comuns são 教師たるもの, 親たるもの, 社会人たるもの e 王たる者.

É parecido com である以上, mas mais formal.$$,
    $$Substantivo (posição) + たるもの + べきだ / なければならない
Substantivo (posição) + たる + Substantivo$$,
    $$たるもの$$,
    $$たるもの|たる者|たる$$,
    ARRAY['たる', 'もの']::text[],
    ARRAY['たるもの', 'たる者', 'たる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-184', $$教師たるもの、生徒の手本にならなければならない。$$, $$きょうしたるもの、せいとのてほんにならなければならない。$$, $$Quem é professor deve ser um exemplo para os alunos.$$),
    ('n1-grammar-184', $$社会人たるもの、時間は守るべきだ。$$, $$しゃかいじんたるもの、じかんはまもるべきだ。$$, $$Quem é profissional deve ser pontual.$$),
    ('n1-grammar-184', $$親たる者、子供の安全を第一に考えるべきだ。$$, $$おやたるもの、こどものあんぜんをだいいちにかんがえるべきだ。$$, $$Quem é pai deve pensar em primeiro lugar na segurança dos filhos.$$),
    ('n1-grammar-184', $$医師たる者の責任は重い。$$, $$いしたるもののせきにんはおもい。$$, $$A responsabilidade de quem é médico é grande.$$),
    ('n1-grammar-184', $$リーダーたる人物には、決断力が必要だ。$$, $$リーダーたるじんぶつには、けつだんりょくがひつようだ。$$, $$Uma pessoa na condição de líder precisa ter capacidade de decisão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$政治家____、国民のために働くべきだ。$$, $$Quem é político deve trabalhar pelo povo.$$),
        (2, $$学生____、勉強を第一にすべきだ。$$, $$Quem é estudante deve colocar os estudos em primeiro lugar.$$),
        (3, $$プロ____、言い訳をしてはいけない。$$, $$Quem é profissional não deve dar desculpas.$$),
        (4, $$警察官____者が、法律を破るとは。$$, $$Que alguém na condição de policial quebre a lei...$$),
        (5, $$社長____、社員の生活を守らなければならない。$$, $$Quem é presidente deve proteger a vida dos funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たるもの$$),
        (1, $$たる者$$),
        (2, $$たるもの$$),
        (2, $$たる者$$),
        (3, $$たるもの$$),
        (3, $$たる者$$),
        (4, $$たる$$),
        (5, $$たるもの$$),
        (5, $$たる者$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
