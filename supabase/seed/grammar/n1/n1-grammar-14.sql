-- n1-grammar-14 — 〜ぶる / 〜ぶって / 〜ぶった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-14',
    'grammar',
    'N1',
    $$〜ぶる / 〜ぶって / 〜ぶった$$,
    $$buru / butte / butta$$,
    $$Fingir ser / Bancar o / Dar uma de$$,
    $$ぶる indica que alguém finge ter uma qualidade ou age como se fosse algo que não é. Equivale a "fingir ser", "bancar o" ou "dar uma de".

O tom é de crítica, porque a pessoa age de forma falsa ou exagerada. Por exemplo, "bancar o inteligente" ou "fingir ser uma boa pessoa".

As formas ぶって e ぶった são as mais usadas.$$,
    $$Expressões comuns são 偉ぶる, いい子ぶる, 学者ぶる, 上品ぶる e もったいぶる.

É parecido com ふりをする, mas ぶる tem um tom mais crítico.$$,
    $$Substantivo / Adjetivo (raiz) + ぶる
Substantivo / Adjetivo (raiz) + ぶって + Verbo
Substantivo / Adjetivo (raiz) + ぶった + Substantivo$$,
    $$ぶる$$,
    $$ぶる|ぶって|ぶった|ぶらない$$,
    ARRAY['ぶる']::text[],
    ARRAY['ぶる', 'ぶって', 'ぶった', 'ぶらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-14', $$彼はいつも偉ぶっている。$$, $$かれはいつもえらぶっている。$$, $$Ele vive bancando o importante.$$),
    ('n1-grammar-14', $$先生の前でだけ、いい子ぶる。$$, $$せんせいのまえでだけ、いいこぶる。$$, $$Só na frente do professor ele dá uma de bonzinho.$$),
    ('n1-grammar-14', $$学者ぶった話し方が嫌いだ。$$, $$がくしゃぶったはなしかたがきらいだ。$$, $$Não gosto desse jeito de falar como se fosse um acadêmico.$$),
    ('n1-grammar-14', $$もったいぶらないで、早く教えてよ。$$, $$もったいぶらないで、はやくおしえてよ。$$, $$Não faça suspense, conte logo.$$),
    ('n1-grammar-14', $$彼女は上品ぶって、ゆっくり食べた。$$, $$かのじょはじょうひんぶって、ゆっくりたべた。$$, $$Ela comeu devagar, fingindo ser refinada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新人なのに、先輩____態度をとる。$$, $$Mesmo sendo novato, age como se fosse veterano.$$),
        (2, $$知らないのに、知っている____話すな。$$, $$Não fale como se soubesse se você não sabe.$$),
        (3, $$彼は金持ち____いるが、実はお金がない。$$, $$Ele banca o rico, mas na verdade não tem dinheiro.$$),
        (4, $$もったい____で、早く言いなさい。$$, $$Pare de fazer suspense e diga logo.$$),
        (5, $$いい人____のはやめたほうがいい。$$, $$É melhor parar de dar uma de boa pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶった$$),
        (2, $$ぶって$$),
        (3, $$ぶって$$),
        (4, $$ぶらない$$),
        (5, $$ぶる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
