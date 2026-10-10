-- n2-grammar-88 — 〜に限らず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-88',
    'grammar',
    'N2',
    $$〜に限らず$$,
    $$ni kagirazu$$,
    $$Não só / Não apenas / Não se limita a$$,
    $$に限らず indica que algo não se aplica apenas a um caso, mas a vários outros também. Equivale a "não só" ou "não apenas".

A pessoa dá um exemplo e depois amplia a ideia para um grupo maior. Por exemplo, "não só os jovens, mas também os idosos usam smartphones".

Depois de に限らず, costuma aparecer も ou palavras como みんな, どこでも ou いつでも.$$,
    $$É parecido com だけでなく e のみならず, mas に限らず é mais formal que だけでなく.

Não é o mesmo que に限る, que significa "o melhor é".$$,
    $$Substantivo + に限らず + Frase (com も / みんな / 誰でも)$$,
    $$に限らず$$,
    $$に限らず|にかぎらず$$,
    ARRAY['に', '限らず']::text[],
    ARRAY['に限らず', 'にかぎらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-88', $$若者に限らず、お年寄りもスマホを使っている。$$, $$わかものにかぎらず、おとしよりもスマホをつかっている。$$, $$Não só os jovens, mas também os idosos usam smartphone.$$),
    ('n2-grammar-88', $$この店は週末に限らず、いつも混んでいる。$$, $$このみせはしゅうまつにかぎらず、いつもこんでいる。$$, $$Esta loja não fica cheia só no fim de semana, está sempre lotada.$$),
    ('n2-grammar-88', $$日本に限らず、多くの国で少子化が問題になっている。$$, $$にほんにかぎらず、おおくのくにでしょうしかがもんだいになっている。$$, $$Não apenas no Japão, mas em muitos países a baixa natalidade é um problema.$$),
    ('n2-grammar-88', $$このゲームは子供に限らず、大人にも人気がある。$$, $$このゲームはこどもにかぎらず、おとなにもにんきがある。$$, $$Este jogo é popular não só entre crianças, mas também entre adultos.$$),
    ('n2-grammar-88', $$料理に限らず、彼女は何でも上手だ。$$, $$りょうりにかぎらず、かのじょはなんでもじょうずだ。$$, $$Não só na cozinha, ela é boa em tudo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この公園は休日____、平日も人が多い。$$, $$Este parque não tem muita gente só nos feriados, nos dias úteis também.$$),
        (2, $$男性____、女性もこの仕事に応募できる。$$, $$Não apenas homens, mulheres também podem se candidatar a este trabalho.$$),
        (3, $$東京____、大都市はどこも家賃が高い。$$, $$Não só em Tóquio, em todas as grandes cidades o aluguel é caro.$$),
        (4, $$スポーツ____、彼は音楽も得意だ。$$, $$Não só nos esportes, ele também é bom em música.$$),
        (5, $$この問題は学生____、誰にでも起こりうる。$$, $$Este problema não se limita a estudantes, pode acontecer com qualquer pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限らず$$),
        (1, $$にかぎらず$$),
        (2, $$に限らず$$),
        (2, $$にかぎらず$$),
        (3, $$に限らず$$),
        (3, $$にかぎらず$$),
        (4, $$に限らず$$),
        (4, $$にかぎらず$$),
        (5, $$に限らず$$),
        (5, $$にかぎらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
