-- n1-grammar-55 — 〜切りがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-55',
    'grammar',
    'N1',
    $$〜切りがない$$,
    $$kiri ga nai$$,
    $$Não tem fim / Seria interminável / Não acaba nunca$$,
    $$切りがない indica que algo não tem fim, porque há muitas coisas ou porque a ação pode continuar para sempre. Equivale a "não tem fim" ou "seria interminável".

Muitas vezes vem com たら ou ば, como "se for falar, não tem fim". Por exemplo, "se for reclamar, não acaba nunca".

É uma expressão comum na fala.$$,
    $$Também é escrito きりがない.

Expressões comuns são 言い出したら切りがない, 数えたら切りがない e 上を見たら切りがない.$$,
    $$Verbo (forma たら / ば) + 切りがない
Substantivo + は + 切りがない$$,
    $$切りがない$$,
    $$切りがない|きりがない|切りがありません|きりがありません$$,
    ARRAY['切り', 'が', 'ない']::text[],
    ARRAY['切りがない', 'きりがない', '切りがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-55', $$文句を言い出したら切りがない。$$, $$もんくをいいだしたらきりがない。$$, $$Se começar a reclamar, não tem fim.$$),
    ('n1-grammar-55', $$欲しいものを数えたら切りがない。$$, $$ほしいものをかぞえたらきりがない。$$, $$Se for contar o que eu quero, seria interminável.$$),
    ('n1-grammar-55', $$上を見たらきりがないから、今の生活に満足しよう。$$, $$うえをみたらきりがないから、いまのせいかつにまんぞくしよう。$$, $$Se olhar para cima, não acaba nunca, então vamos ficar satisfeitos com a vida atual.$$),
    ('n1-grammar-55', $$心配し始めたら切りがない。$$, $$しんぱいしはじめたらきりがない。$$, $$Se começar a se preocupar, não tem fim.$$),
    ('n1-grammar-55', $$この仕事は、やってもやっても切りがない。$$, $$このしごとは、やってもやってもきりがない。$$, $$Este trabalho, por mais que eu faça, não acaba nunca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の欠点を挙げたら____。$$, $$Se for listar os defeitos dele, não tem fim.$$),
        (2, $$細かいことを気にしたら____。$$, $$Se ligar para os detalhes, não acaba nunca.$$),
        (3, $$思い出を話し始めたら____。$$, $$Se começar a contar as lembranças, seria interminável.$$),
        (4, $$掃除をしても、子供がすぐ散らかすので____。$$, $$Mesmo limpando, as crianças bagunçam logo, então não tem fim.$$),
        (5, $$比べたら____から、自分のペースで頑張ろう。$$, $$Se ficar comparando, não acaba nunca, então vamos nos esforçar no próprio ritmo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切りがない$$),
        (1, $$きりがない$$),
        (1, $$切りがありません$$),
        (2, $$切りがない$$),
        (2, $$きりがない$$),
        (2, $$切りがありません$$),
        (3, $$切りがない$$),
        (3, $$きりがない$$),
        (3, $$切りがありません$$),
        (4, $$切りがない$$),
        (4, $$きりがない$$),
        (4, $$切りがありません$$),
        (5, $$切りがない$$),
        (5, $$きりがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
