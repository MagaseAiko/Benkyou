-- n4-grammar-73 — 〜させられる（使役受身）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-73',
    'grammar',
    'N4',
    $$〜させられる（使役受身）$$,
    $$saserareru (shieki ukemi)$$,
    $$Ser obrigado a / Ser forçado a$$,
    $$させられる é a forma causativa-passiva. Ela é usada para dizer que alguém foi obrigado a fazer algo que não queria. Equivale a "ser obrigado a" ou "ser forçado a".

Ela junta duas ideias: o causativo (fazer alguém fazer algo) e o passivo (sofrer a ação de alguém). O resultado é: "alguém me fez fazer isso", com o foco em quem foi obrigado.

A pessoa que obrigou é marcada com に, e quem foi obrigado costuma ser o sujeito, muitas vezes oculto. O tom costuma ser de incômodo, reclamação ou memória desagradável.

Nos verbos do grupo 1, existe uma forma curta muito usada: troca-se せられる por される, como em 待たされる e 飲まされる. Essa forma curta não é usada com verbos terminados em す.$$,
    $$A forma curta される é mais comum na fala. Por exemplo, 待たされる é muito mais frequente do que 待たせられる.

Essa forma aparece muito em reclamações sobre trabalho, escola e infância.

Às vezes, させられる também expressa um sentimento provocado sem querer, como em 考えさせられる (fazer refletir), com sentido positivo.$$,
    $$Grupo 1: último som "u" → "a" + せられる / される (待つ → 待たせられる / 待たされる)
Grupo 1 terminados em す: só せられる (話す → 話させられる)
Grupo 2: tire る + させられる (食べる → 食べさせられる)
Irregulares: する → させられる / 来る → 来させられる (こさせられる)

Pessoa que obriga + に + Verbo causativo-passivo$$,
    $$させられる$$,
    $$させられ|せられ|かされ|がされ|たされ|まされ|らされ|わされ|ばされ$$,
    ARRAY['させ', 'られる']::text[],
    ARRAY['させられる', 'させられた', 'される', 'された']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-73', $$子供のころ、母に野菜を食べさせられました。$$, $$こどものころ、ははにやさいをたべさせられました。$$, $$Quando criança, minha mãe me obrigava a comer verdura.$$),
    ('n4-grammar-73', $$駅で一時間も待たされた。$$, $$えきでいちじかんもまたされた。$$, $$Me fizeram esperar uma hora inteira na estação.$$),
    ('n4-grammar-73', $$飲み会で、部長にお酒を飲まされました。$$, $$のみかいで、ぶちょうにおさけをのまされました。$$, $$Na confraternização, o gerente me fez beber.$$),
    ('n4-grammar-73', $$先生にみんなの前で歌を歌わされた。$$, $$せんせいにみんなのまえでうたをうたわされた。$$, $$O professor me fez cantar na frente de todo mundo.$$),
    ('n4-grammar-73', $$毎日、遅くまで残業させられている。$$, $$まいにち、おそくまでざんぎょうさせられている。$$, $$Todo dia sou obrigado a fazer hora extra até tarde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころ、毎日ピアノを練習さ____。$$, $$Quando criança, eu era obrigado a praticar piano todo dia.$$),
        (2, $$レストランで三十分も待____。$$, $$No restaurante, me fizeram esperar trinta minutos inteiros.$$),
        (3, $$先輩に重い荷物を持____。$$, $$O veterano me fez carregar uma bagagem pesada.$$),
        (4, $$授業で、作文をみんなの前で読ま____。$$, $$Na aula, me fizeram ler a redação na frente de todos.$$),
        (5, $$嫌いなのに、毎朝牛乳を飲____。$$, $$Mesmo eu não gostando, me fazem tomar leite toda manhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せられました$$),
        (1, $$せられた$$),
        (2, $$たされました$$),
        (2, $$たされた$$),
        (3, $$たされました$$),
        (3, $$たされた$$),
        (4, $$されました$$),
        (4, $$された$$),
        (5, $$まされます$$),
        (5, $$まされる$$),
        (5, $$まされました$$),
        (5, $$まされた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
