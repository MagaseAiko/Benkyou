-- n1-grammar-111 — 〜に至っては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-111',
    'grammar',
    'N1',
    $$〜に至っては$$,
    $$ni itatte wa$$,
    $$Quanto a / No caso de / Então já$$,
    $$に至っては apresenta um exemplo extremo dentro de um grupo, geralmente negativo. Equivale a "quanto a..." ou "no caso de..., então já".

A pessoa fala de vários casos e destaca o pior ou o mais surpreendente. Por exemplo, "todos se atrasaram, e no caso dele, nem apareceu".

É uma expressão formal, com tom de crítica ou espanto.$$,
    $$Costuma aparecer depois de uma frase que fala de um grupo em geral.

É parecido com なんて e に関しては, mas に至っては destaca o caso mais extremo.$$,
    $$Substantivo + に至っては + Exemplo extremo$$,
    $$に至っては$$,
    $$に至っては|にいたっては$$,
    ARRAY['に', '至って', 'は']::text[],
    ARRAY['に至っては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-111', $$みんな遅刻したが、田中さんに至っては来なかった。$$, $$みんなちこくしたが、たなかさんにいたってはこなかった。$$, $$Todos se atrasaram, e o Tanaka então nem apareceu.$$),
    ('n1-grammar-111', $$家族はみんな料理が苦手で、父に至ってはお湯も沸かせない。$$, $$かぞくはみんなりょうりがにがてで、ちちにいたってはおゆもわかせない。$$, $$Ninguém na família sabe cozinhar, e meu pai então nem sabe ferver água.$$),
    ('n1-grammar-111', $$この町は不便だ。バスに至っては一日に二本しかない。$$, $$このまちはふべんだ。バスにいたってはいちにちににほんしかない。$$, $$Esta cidade é inconveniente. Quanto ao ônibus, só passam dois por dia.$$),
    ('n1-grammar-111', $$今年は雨が少なく、八月に至っては一度も降らなかった。$$, $$ことしはあめがすくなく、はちがつにいたってはいちどもふらなかった。$$, $$Este ano choveu pouco, e em agosto então não choveu nenhuma vez.$$),
    ('n1-grammar-111', $$社員の多くが反対し、部長に至っては辞表を出した。$$, $$しゃいんのおおくがはんたいし、ぶちょうにいたってはじひょうをだした。$$, $$Muitos funcionários foram contra, e o gerente chegou a pedir demissão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$クラスの成績は悪く、彼____零点だった。$$, $$As notas da turma foram ruins, e ele então tirou zero.$$),
        (2, $$最近の若者は本を読まない。新聞____全く読まない。$$, $$Os jovens de hoje não leem livros. Quanto aos jornais, não leem nada.$$),
        (3, $$この店は高い。コーヒー____一杯二千円だ。$$, $$Esta loja é cara. O café então custa dois mil ienes a xícara.$$),
        (4, $$兄弟はみんな背が高く、弟____二メートルもある。$$, $$Os irmãos são todos altos, e o caçula chega a ter dois metros.$$),
        (5, $$参加者は少なく、二日目____三人だけだった。$$, $$Havia poucos participantes, e no segundo dia então só três.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至っては$$),
        (1, $$にいたっては$$),
        (2, $$に至っては$$),
        (2, $$にいたっては$$),
        (3, $$に至っては$$),
        (3, $$にいたっては$$),
        (4, $$に至っては$$),
        (4, $$にいたっては$$),
        (5, $$に至っては$$),
        (5, $$にいたっては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
