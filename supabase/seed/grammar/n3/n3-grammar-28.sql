-- n3-grammar-28 — 〜ほど（程度）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-28',
    'grammar',
    'N3',
    $$〜ほど（程度）$$,
    $$hodo (teido)$$,
    $$A ponto de / Tanto que / Cerca de$$,
    $$ほど é usado para indicar o grau ou a intensidade de algo, comparando com um exemplo extremo. Equivale a "a ponto de" ou "tanto que".

A parte antes de ほど mostra um exemplo do quanto aquilo é intenso. Por exemplo, "estava tão triste que queria chorar" ou "está tão frio que a respiração fica branca".

Muitas vezes, o exemplo é exagerado, como 死ぬほど (a ponto de morrer), usado para dar ênfase.

Depois de números e quantidades, ほど significa "cerca de" ou "aproximadamente", como em "cerca de dez minutos". Nesse uso, ele é parecido com ぐらい, mas um pouco mais formal.$$,
    $$ほど e くらい têm sentidos muito parecidos para grau. ほど soa um pouco mais formal e é mais comum na escrita.

Expressões como 死ぬほど, 泣きたいほど e 信じられないほど são muito usadas para exagerar.

Na forma negativa, ほど〜ない indica comparação: "não é tão... quanto".$$,
    $$Verbo (forma simples) + ほど + Adjetivo / Verbo
Adjetivo い + ほど
Adjetivo な + な + ほど
Substantivo + ほど
Número + ほど (cerca de)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ほど']::text[],
    ARRAY['ほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-28', $$泣きたいほど悲しかった。$$, $$なきたいほどかなしかった。$$, $$Estava tão triste que dava vontade de chorar.$$),
    ('n3-grammar-28', $$今日は死ぬほど疲れた。$$, $$きょうはしぬほどつかれた。$$, $$Hoje fiquei morto de cansaço.$$),
    ('n3-grammar-28', $$今日は息が白くなるほど寒い。$$, $$きょうはいきがしろくなるほどさむい。$$, $$Hoje está tão frio que a respiração fica branca.$$),
    ('n3-grammar-28', $$家から駅まで十分ほどかかります。$$, $$いえからえきまでじゅっぷんほどかかります。$$, $$De casa até a estação leva cerca de dez minutos.$$),
    ('n3-grammar-28', $$彼の料理は店で出せるほどおいしい。$$, $$かれのりょうりはみせでだせるほどおいしい。$$, $$A comida dele é tão gostosa que poderia ser servida num restaurante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹が痛くて、歩けない____だった。$$, $$Estava com tanta dor de barriga que não conseguia andar.$$),
        (2, $$今週は目が回る____忙しい。$$, $$Esta semana estou tão ocupado que fico tonto.$$),
        (3, $$駅で一時間____待ちました。$$, $$Esperei cerca de uma hora na estação.$$),
        (4, $$その知らせを聞いて、声が出ない____驚いた。$$, $$Fiquei tão surpreso com a notícia que perdi a voz.$$),
        (5, $$信じられない____、きれいな景色だった。$$, $$Era uma paisagem tão bonita que nem dava para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
