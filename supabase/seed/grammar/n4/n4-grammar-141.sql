-- n4-grammar-141 — 〜ようにしている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-141',
    'grammar',
    'N4',
    $$〜ようにしている$$,
    $$you ni shite iru$$,
    $$Procurar sempre / Esforçar-se para (manter um hábito)$$,
    $$ようにしている é usado para falar de um hábito que a pessoa se esforça para manter. Equivale a "procuro sempre..." ou "me esforço para...".

Ele vem de ようにする (esforçar-se para que algo aconteça), na forma ている. A ideia é um esforço contínuo, que faz parte da rotina, mas que nem sempre é perfeito.

Por exemplo, procurar beber bastante água, procurar dormir cedo ou procurar não comer doces demais.

Comparado a ことにしている, ようにしている soa mais flexível. ことにしている é uma regra fixa; ようにしている é um esforço, uma tentativa constante.

É muito usado ao falar de saúde, estudos e boas práticas do dia a dia.$$,
    $$Expressões como できるだけ e なるべく ("sempre que possível") combinam muito bem com ようにしている.

Para conselhos a outras pessoas, a forma ようにしてください é a mais natural.

ようにしている descreve o seu esforço; ようになった descreve uma mudança que já aconteceu.$$,
    $$Verbo na forma de dicionário + ようにしている
Verbo na forma ない + ようにしている

Educado: ようにしています$$,
    $$ようにしている$$,
    $$ようにしている|ようにしています$$,
    ARRAY['よう', 'に', 'している']::text[],
    ARRAY['ようにしている', 'ようにしています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-141', $$毎日水をたくさん飲むようにしています。$$, $$まいにちみずをたくさんのむようにしています。$$, $$Procuro beber bastante água todos os dias.$$),
    ('n4-grammar-141', $$できるだけ早く寝るようにしている。$$, $$できるだけはやくねるようにしている。$$, $$Procuro dormir o mais cedo possível.$$),
    ('n4-grammar-141', $$甘い物を食べすぎないようにしています。$$, $$あまいものをたべすぎないようにしています。$$, $$Procuro não comer doces demais.$$),
    ('n4-grammar-141', $$毎日少しでも日本語を話すようにしている。$$, $$まいにちすこしでもにほんごをはなすようにしている。$$, $$Procuro falar pelo menos um pouco de japonês todo dia.$$),
    ('n4-grammar-141', $$人の話を最後まで聞くようにしています。$$, $$ひとのはなしをさいごまできくようにしています。$$, $$Procuro sempre ouvir as pessoas até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝、野菜ジュースを飲む____。$$, $$Procuro tomar suco de verduras toda manhã.$$),
        (2, $$駅まではなるべく歩く____。$$, $$Procuro ir a pé até a estação sempre que possível.$$),
        (3, $$夜遅く食べない____。$$, $$Procuro não comer tarde da noite.$$),
        (4, $$授業の前に予習する____。$$, $$Procuro estudar a matéria antes da aula.$$),
        (5, $$会議では、必ず意見を言う____。$$, $$Nas reuniões, faço questão de sempre dar minha opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようにしています$$),
        (1, $$ようにしている$$),
        (2, $$ようにしています$$),
        (2, $$ようにしている$$),
        (3, $$ようにしています$$),
        (3, $$ようにしている$$),
        (4, $$ようにしています$$),
        (4, $$ようにしている$$),
        (5, $$ようにしています$$),
        (5, $$ようにしている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
