-- n1-grammar-117 — 〜にかまけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-117',
    'grammar',
    'N1',
    $$〜にかまけて$$,
    $$ni kamakete$$,
    $$Absorvido por / Ocupado demais com / Por causa de$$,
    $$にかまけて indica que alguém está tão ocupado ou envolvido com algo que acaba deixando de lado outras coisas importantes. Equivale a "absorvido por" ou "ocupado demais com".

A segunda parte mostra o que foi negligenciado. Por exemplo, "absorvido pelo trabalho, deixou a família de lado".

O tom costuma ser de arrependimento ou crítica.$$,
    $$Expressões comuns são 仕事にかまけて, 忙しさにかまけて e 遊びにかまけて.

A segunda parte costuma ter verbos como 忘れる, 怠る ou しない.$$,
    $$Substantivo + にかまけて + Frase (algo negligenciado)$$,
    $$にかまけて$$,
    $$にかまけて$$,
    ARRAY['に', 'かまけて']::text[],
    ARRAY['にかまけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-117', $$仕事にかまけて、家族との時間を大切にしなかった。$$, $$しごとにかまけて、かぞくとのじかんをたいせつにしなかった。$$, $$Absorvido pelo trabalho, não dei valor ao tempo com a família.$$),
    ('n1-grammar-117', $$忙しさにかまけて、友達に連絡していない。$$, $$いそがしさにかまけて、ともだちにれんらくしていない。$$, $$Ocupado demais, não tenho falado com meus amigos.$$),
    ('n1-grammar-117', $$遊びにかまけて、勉強を怠った。$$, $$あそびにかまけて、べんきょうをおこたった。$$, $$Absorvido pela diversão, deixei os estudos de lado.$$),
    ('n1-grammar-117', $$子育てにかまけて、自分のことを後回しにしてきた。$$, $$こそだてにかまけて、じぶんのことをあとまわしにしてきた。$$, $$Ocupada demais com os filhos, fui deixando a mim mesma para depois.$$),
    ('n1-grammar-117', $$趣味にかまけて、部屋の掃除をしていない。$$, $$しゅみにかまけて、へやのそうじをしていない。$$, $$Absorvido pelo hobby, não tenho limpado o quarto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ゲーム____、宿題を忘れた。$$, $$Absorvido pelo videogame, esqueci a lição de casa.$$),
        (2, $$忙しさ____、健康診断を受けていない。$$, $$Ocupado demais, não tenho feito exames de saúde.$$),
        (3, $$恋愛____、仕事がおろそかになった。$$, $$Absorvido pelo namoro, acabei descuidando do trabalho.$$),
        (4, $$毎日の生活____、夢をあきらめかけていた。$$, $$Ocupado demais com o dia a dia, estava quase desistindo do sonho.$$),
        (5, $$仕事____、親孝行をしなかった。$$, $$Absorvido pelo trabalho, não cuidei dos meus pais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかまけて$$),
        (2, $$にかまけて$$),
        (3, $$にかまけて$$),
        (4, $$にかまけて$$),
        (5, $$にかまけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
