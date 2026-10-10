-- n1-grammar-128 — 〜に足る / 〜に足りる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-128',
    'grammar',
    'N1',
    $$〜に足る / 〜に足りる$$,
    $$ni taru / ni tariru$$,
    $$Digno de / Suficiente para / Que merece$$,
    $$に足る e に足りる indicam que algo tem valor ou qualidade suficiente para merecer uma ação. Equivalem a "digno de" ou "que merece".

Costumam vir com verbos como confiar, respeitar, satisfazer ou acreditar. Por exemplo, "uma pessoa digna de confiança" ou "um resultado satisfatório".

É uma expressão formal, comum na escrita.$$,
    $$Expressões comuns são 信頼に足る, 尊敬に足る, 満足に足る e 信じるに足る.

É parecido com に値する.$$,
    $$Verbo (forma dicionário) + に足る + Substantivo
Substantivo + に足る + Substantivo$$,
    $$に足る$$,
    $$に足る|に足りる|にたる|にたりる$$,
    ARRAY['に', '足る']::text[],
    ARRAY['に足る', 'に足りる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-128', $$彼は信頼に足る人物だ。$$, $$かれはしんらいにたるじんぶつだ。$$, $$Ele é uma pessoa digna de confiança.$$),
    ('n1-grammar-128', $$満足に足る結果が出た。$$, $$まんぞくにたるけっかがでた。$$, $$Saiu um resultado satisfatório.$$),
    ('n1-grammar-128', $$この情報は信じるに足るものだ。$$, $$このじょうほうはしんじるにたるものだ。$$, $$Esta informação é digna de crédito.$$),
    ('n1-grammar-128', $$彼女は尊敬に足りる先輩だ。$$, $$かのじょはそんけいにたりるせんぱいだ。$$, $$Ela é uma veterana que merece respeito.$$),
    ('n1-grammar-128', $$証拠として十分に足る資料がそろった。$$, $$しょうことしてじゅうぶんにたるしりょうがそろった。$$, $$Reunimos material suficiente para servir de prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の言葉は信用する____ものだ。$$, $$As palavras dele merecem confiança.$$),
        (2, $$リーダーとして尊敬____人物だ。$$, $$É uma pessoa que merece respeito como líder.$$),
        (3, $$この研究は評価____内容だ。$$, $$Esta pesquisa tem um conteúdo digno de avaliação.$$),
        (4, $$任せる____人がいない。$$, $$Não há ninguém a quem se possa confiar a tarefa.$$),
        (5, $$読む____本を探している。$$, $$Estou procurando um livro que valha a pena ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に足る$$),
        (1, $$に足りる$$),
        (2, $$に足る$$),
        (2, $$に足りる$$),
        (3, $$に足る$$),
        (3, $$に足りる$$),
        (4, $$に足る$$),
        (4, $$に足りる$$),
        (5, $$に足る$$),
        (5, $$に足りる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
