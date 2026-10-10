-- n1-grammar-56 — 〜きっての
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-56',
    'grammar',
    'N1',
    $$〜きっての$$,
    $$kitte no$$,
    $$O melhor de / O número um de / O mais... de todo$$,
    $$きっての indica que alguém ou algo é o melhor ou o mais destacado dentro de um grupo ou lugar. Equivale a "o melhor de" ou "o número um de".

Costuma vir depois de nomes de lugares ou grupos, como empresa, cidade, país ou escola. Por exemplo, "o melhor talento da empresa" ou "o maior especialista do país".

É uma expressão formal, usada para elogiar.$$,
    $$É usado principalmente com qualidades positivas.

É parecido com 一番の e 随一の.$$,
    $$Substantivo (grupo / lugar) + きっての + Substantivo (pessoa / coisa)$$,
    $$きっての$$,
    $$きっての$$,
    ARRAY['きって', 'の']::text[],
    ARRAY['きっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-56', $$彼は社内きっての優秀な社員だ。$$, $$かれはしゃないきってのゆうしゅうなしゃいんだ。$$, $$Ele é o funcionário mais competente de toda a empresa.$$),
    ('n1-grammar-56', $$彼女は町きっての美人だ。$$, $$かのじょはまちきってのびじんだ。$$, $$Ela é a mulher mais bonita da cidade.$$),
    ('n1-grammar-56', $$この店は東京きっての人気店だ。$$, $$このみせはとうきょうきってのにんきてんだ。$$, $$Esta é a loja mais popular de Tóquio.$$),
    ('n1-grammar-56', $$彼は日本きっての研究者として知られている。$$, $$かれはにほんきってのけんきゅうしゃとしてしられている。$$, $$Ele é conhecido como o maior pesquisador do Japão.$$),
    ('n1-grammar-56', $$学校きっての秀才が東京大学に合格した。$$, $$がっこうきってのしゅうさいがとうきょうだいがくにごうかくした。$$, $$O melhor aluno da escola passou na Universidade de Tóquio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はクラス____スポーツマンだ。$$, $$Ele é o melhor atleta da turma.$$),
        (2, $$この寺は京都____名所だ。$$, $$Este templo é o ponto turístico número um de Kyoto.$$),
        (3, $$彼女は業界____実力者だ。$$, $$Ela é a pessoa mais influente do setor.$$),
        (4, $$この温泉は県内____人気を誇る。$$, $$Esta fonte termal é a mais popular da província.$$),
        (5, $$彼はチーム____ストライカーだ。$$, $$Ele é o melhor atacante do time.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きっての$$),
        (2, $$きっての$$),
        (3, $$きっての$$),
        (4, $$きっての$$),
        (5, $$きっての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
