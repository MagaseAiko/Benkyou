-- n1-grammar-110 — 〜に至っても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-110',
    'grammar',
    'N1',
    $$〜に至っても$$,
    $$ni itatte mo$$,
    $$Mesmo chegando a / Mesmo depois de / Mesmo a esta altura$$,
    $$に至っても indica que, mesmo depois de uma situação chegar a um ponto grave, alguém continua sem agir ou sem mudar. Equivale a "mesmo chegando a" ou "mesmo a esta altura".

O tom é de crítica ou espanto. Por exemplo, "mesmo depois de chegar a este ponto, ele não admite o erro".

É uma expressão formal.$$,
    $$Expressões comuns são この期に至っても e ここに至っても.

É parecido com になっても, mas に至っても destaca que a situação é extrema.$$,
    $$Substantivo + に至っても
Verbo (forma dicionário) + に至っても
この期に至っても$$,
    $$に至っても$$,
    $$に至っても|にいたっても$$,
    ARRAY['に', '至って', 'も']::text[],
    ARRAY['に至っても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-110', $$この期に至っても、彼は自分の非を認めない。$$, $$このごにいたっても、かれはじぶんのひをみとめない。$$, $$Mesmo a esta altura, ele não admite o próprio erro.$$),
    ('n1-grammar-110', $$事故が起きるに至っても、会社は対策をとらなかった。$$, $$じこがおきるにいたっても、かいしゃはたいさくをとらなかった。$$, $$Mesmo depois de ocorrer um acidente, a empresa não tomou medidas.$$),
    ('n1-grammar-110', $$死者が出るに至っても、政府は動かなかった。$$, $$ししゃがでるにいたっても、せいふはうごかなかった。$$, $$Mesmo chegando a haver mortos, o governo não agiu.$$),
    ('n1-grammar-110', $$ここに至っても、まだ反対する人がいる。$$, $$ここにいたっても、まだはんたいするひとがいる。$$, $$Mesmo chegando a este ponto, ainda há quem seja contra.$$),
    ('n1-grammar-110', $$倒産するに至っても、社長は責任をとらなかった。$$, $$とうさんするにいたっても、しゃちょうはせきにんをとらなかった。$$, $$Mesmo depois da falência, o presidente não assumiu a responsabilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この期____、言い訳ばかりしている。$$, $$Mesmo a esta altura, ele só dá desculpas.$$),
        (2, $$病気が悪化する____、彼は病院に行かなかった。$$, $$Mesmo com a doença piorando, ele não foi ao hospital.$$),
        (3, $$被害が広がる____、対策は遅れたままだ。$$, $$Mesmo com os danos se espalhando, as medidas continuam atrasadas.$$),
        (4, $$ここ____、彼はまだ夢をあきらめていない。$$, $$Mesmo chegando a este ponto, ele ainda não desistiu do sonho.$$),
        (5, $$試合に負ける____、監督は作戦を変えなかった。$$, $$Mesmo depois de perder a partida, o técnico não mudou a estratégia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至っても$$),
        (1, $$にいたっても$$),
        (2, $$に至っても$$),
        (2, $$にいたっても$$),
        (3, $$に至っても$$),
        (3, $$にいたっても$$),
        (4, $$に至っても$$),
        (4, $$にいたっても$$),
        (5, $$に至っても$$),
        (5, $$にいたっても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
