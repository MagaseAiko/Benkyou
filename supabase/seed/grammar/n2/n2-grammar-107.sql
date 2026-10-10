-- n2-grammar-107 — 〜に相違ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-107',
    'grammar',
    'N2',
    $$〜に相違ない$$,
    $$ni soui nai$$,
    $$Sem dúvida / Com certeza / Não há dúvida de que$$,
    $$に相違ない expressa uma certeza forte, baseada em algum motivo. Equivale a "sem dúvida" ou "não há dúvida de que".

Tem o mesmo sentido de に違いない, mas é mais formal e mais usado na escrita, em documentos e em textos sérios.

Por exemplo, "o culpado é, sem dúvida, aquele homem".$$,
    $$Na fala do dia a dia, usa-se mais に違いない.

A forma に相違ありません é ainda mais formal, usada em declarações e documentos oficiais.$$,
    $$Verbo (forma simples) + に相違ない
Adjetivo い + に相違ない
Adjetivo な / Substantivo + に相違ない$$,
    $$に相違ない$$,
    $$に相違ない|に相違ありません|にそういない$$,
    ARRAY['に', '相違', 'ない']::text[],
    ARRAY['に相違ない', 'に相違ありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-107', $$犯人はあの男に相違ない。$$, $$はんにんはあのおとこにそういない。$$, $$O culpado é, sem dúvida, aquele homem.$$),
    ('n2-grammar-107', $$彼の話は本当に相違ない。$$, $$かれのはなしはほんとうにそういない。$$, $$Não há dúvida de que a história dele é verdadeira.$$),
    ('n2-grammar-107', $$この作品は有名な画家が描いたものに相違ない。$$, $$このさくひんはゆうめいながかがかいたものにそういない。$$, $$Esta obra, sem dúvida, foi pintada por um pintor famoso.$$),
    ('n2-grammar-107', $$上記の内容に相違ありません。$$, $$じょうきのないようにそういありません。$$, $$O conteúdo acima está correto, sem dúvida.$$),
    ('n2-grammar-107', $$彼女は今ごろ心配しているに相違ない。$$, $$かのじょはいまごろしんぱいしているにそういない。$$, $$Com certeza ela está preocupada agora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この計画は成功する____。$$, $$Este plano, sem dúvida, vai dar certo.$$),
        (2, $$彼が書いた手紙____。$$, $$Não há dúvida de que é uma carta escrita por ele.$$),
        (3, $$あの店の料理はおいしい____。$$, $$A comida daquela loja com certeza é gostosa.$$),
        (4, $$彼は何かを隠している____。$$, $$Sem dúvida ele está escondendo alguma coisa.$$),
        (5, $$これは事実____。$$, $$Isto, sem dúvida, é um fato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に相違ない$$),
        (1, $$に相違ありません$$),
        (2, $$に相違ない$$),
        (2, $$に相違ありません$$),
        (3, $$に相違ない$$),
        (3, $$に相違ありません$$),
        (4, $$に相違ない$$),
        (4, $$に相違ありません$$),
        (5, $$に相違ない$$),
        (5, $$に相違ありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
