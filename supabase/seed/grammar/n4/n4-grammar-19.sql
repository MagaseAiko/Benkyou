-- n4-grammar-19 — 〜はずだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-19',
    'grammar',
    'N4',
    $$〜はずだ$$,
    $$hazu da$$,
    $$Deve / Deveria / Era para$$,
    $$はずだ é usado para dizer que algo deve ser verdade, com base em informações, lógica ou conhecimento. Equivale a "deve", "deveria" ou "era para".

A diferença em relação a だろう e かもしれない é a confiança. はずだ mostra que quem fala tem um motivo concreto para acreditar naquilo: um horário marcado, um fato conhecido, uma lógica clara.

Ele é muito usado para expectativas baseadas em fatos, como "ele já deve ter chegado, porque saiu cedo".

No passado, はずだった indica algo que era esperado, mas não aconteceu. E com のに, はずなのに mostra surpresa ou frustração quando a realidade foi diferente do esperado.

はず funciona como um substantivo, então se liga como tal: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.$$,
    $$はずだ não expressa obrigação moral. Para "você deveria fazer isso" no sentido de dever, o japonês usa べきだ ou ほうがいい.

A forma negativa はずがない significa "não tem como", e é bem forte. Já ないはずだ significa "não deve ser" e é mais neutra.

Quando você mesmo não lembra direito, はずだ também serve para dizer "tenho certeza de que fiz isso", como ao procurar algo que tinha guardado.$$,
    $$Verbo (forma simples) + はずだ / はずです
Adjetivo い + はずだ
Adjetivo な + な + はずだ
Substantivo + の + はずだ

Passado (era para, mas não foi): はずだった / はずでした
Contraste: はずなのに$$,
    $$はずだ$$,
    $$はずだ|はずです|はずだった|はずでした|はずなのに|はずの$$,
    ARRAY['はず', 'だ']::text[],
    ARRAY['はずだ', 'はずです', 'はずだった', 'はずでした', 'はずなのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-19', $$田中さんはもう家に着いたはずです。$$, $$たなかさんはもういえについたはずです。$$, $$O Tanaka já deve ter chegado em casa.$$),
    ('n4-grammar-19', $$彼は日本に十年住んでいたから、日本語が上手なはずだ。$$, $$かれはにほんにじゅうねんすんでいたから、にほんごがじょうずなはずだ。$$, $$Ele morou dez anos no Japão, então deve falar japonês bem.$$),
    ('n4-grammar-19', $$会議は三時からのはずです。$$, $$かいぎはさんじからのはずです。$$, $$A reunião deve ser a partir das três.$$),
    ('n4-grammar-19', $$かぎはかばんに入れたはずなのに、ない。$$, $$かぎはかばんにいれたはずなのに、ない。$$, $$Eu tinha certeza de que coloquei a chave na bolsa, mas ela não está lá.$$),
    ('n4-grammar-19', $$今日は休みのはずだったが、急に仕事が入った。$$, $$きょうはやすみのはずだったが、きゅうにしごとがはいった。$$, $$Era para hoje ser folga, mas de repente surgiu trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$手紙は昨日出したから、明日には届く____。$$, $$Mandei a carta ontem, então deve chegar amanhã.$$),
        (2, $$彼は毎日練習しているから、上手な____。$$, $$Ele treina todo dia, então deve ser bom.$$),
        (3, $$店は十時に開く____ですが、まだ閉まっています。$$, $$Era para a loja abrir às dez, mas ainda está fechada.$$),
        (4, $$この薬を飲めば、熱が下がる____。$$, $$Se tomar este remédio, a febre deve baixar.$$),
        (5, $$確かに机の上に置いた____なのに、見つからない。$$, $$Tenho certeza de que deixei em cima da mesa, mas não encontro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はずです$$),
        (1, $$はずだ$$),
        (2, $$はずです$$),
        (2, $$はずだ$$),
        (3, $$はず$$),
        (4, $$はずです$$),
        (4, $$はずだ$$),
        (5, $$はず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
