-- n2-grammar-126 — 〜を問わず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-126',
    'grammar',
    'N2',
    $$〜を問わず$$,
    $$wo towazu$$,
    $$Independentemente de / Sem distinção de / Seja qual for$$,
    $$を問わず indica que algo vale para todos, sem levar em conta uma diferença. Equivale a "independentemente de" ou "sem distinção de".

Costuma vir com palavras que indicam variação, como idade, sexo, nacionalidade, experiência e estação, ou com pares opostos, como "dia e noite". Por exemplo, "procuramos funcionários sem distinção de idade".

É uma expressão formal, muito usada em anúncios e avisos.$$,
    $$É muito parecido com に関わらず.

Também aparece como は問わない, com o sentido de "não importa".

Pares comuns são 昼夜を問わず, 男女を問わず e 経験の有無を問わず.$$,
    $$Substantivo (diferença / tipo) + を問わず
Substantivo + Substantivo (opostos) + を問わず$$,
    $$を問わず$$,
    $$を問わず|をとわず|は問わない$$,
    ARRAY['を', '問わず']::text[],
    ARRAY['を問わず', 'は問わない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-126', $$年齢を問わず、誰でも応募できます。$$, $$ねんれいをとわず、だれでもおうぼできます。$$, $$Qualquer pessoa pode se inscrever, independentemente da idade.$$),
    ('n2-grammar-126', $$この祭りは国内外を問わず、多くの人が訪れる。$$, $$このまつりはこくないがいをとわず、おおくのひとがおとずれる。$$, $$Muitas pessoas, do país e do exterior, visitam este festival.$$),
    ('n2-grammar-126', $$このスポーツは男女を問わず人気がある。$$, $$このスポーツはだんじょをとわずにんきがある。$$, $$Este esporte é popular entre homens e mulheres.$$),
    ('n2-grammar-126', $$経験の有無を問わず、歓迎します。$$, $$けいけんのうむをとわず、かんげいします。$$, $$Damos boas-vindas, com ou sem experiência.$$),
    ('n2-grammar-126', $$この病院は昼夜を問わず、患者を受け入れている。$$, $$このびょういんはちゅうやをとわず、かんじゃをうけいれている。$$, $$Este hospital recebe pacientes de dia e de noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$国籍____、参加できます。$$, $$É possível participar independentemente da nacionalidade.$$),
        (2, $$このアプリは季節____使える。$$, $$Este aplicativo pode ser usado em qualquer estação.$$),
        (3, $$学歴____、能力のある人を採用する。$$, $$Contratamos pessoas capacitadas sem distinção de escolaridade.$$),
        (4, $$晴雨____、イベントは行います。$$, $$O evento será realizado com sol ou chuva.$$),
        (5, $$プロ、アマ____、誰でも出場できる大会だ。$$, $$É um campeonato em que qualquer um pode competir, profissional ou amador.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を問わず$$),
        (1, $$をとわず$$),
        (2, $$を問わず$$),
        (2, $$をとわず$$),
        (3, $$を問わず$$),
        (3, $$をとわず$$),
        (4, $$を問わず$$),
        (4, $$をとわず$$),
        (5, $$を問わず$$),
        (5, $$をとわず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
