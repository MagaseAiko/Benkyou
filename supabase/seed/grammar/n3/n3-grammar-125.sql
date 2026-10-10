-- n3-grammar-125 — 〜てごらん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-125',
    'grammar',
    'N3',
    $$〜てごらん$$,
    $$te goran$$,
    $$Experimente / Tente / Veja só$$,
    $$てごらん é usado para convidar ou incentivar alguém a experimentar algo. Equivale a "experimente", "tente" ou "veja só".

Ele vem de ご覧, a forma respeitosa de 見る, mas aqui funciona como uma versão gentil de てみなさい. A ideia é "faça e veja como é".

É usado principalmente por pessoas mais velhas ou em posição superior, falando com crianças, alunos ou pessoas mais novas. Por exemplo, pais com filhos ou professores com alunos.

O tom é gentil, carinhoso e encorajador.

Com superiores, não se usa てごらん. Nesses casos, a forma respeitosa é てご覧ください ou てみてください.$$,
    $$てごらん soa paternal ou maternal. Usá-lo com adultos que não são próximos pode parecer condescendente.

見てごらん ("olhe só") é muito comum para chamar a atenção de uma criança para algo interessante.

A forma ごらん sozinha, como em ほら、ごらん, significa "olha!".$$,
    $$Verbo na forma て + ごらん
Verbo na forma て + ごらんなさい (um pouco mais formal)

Para superiores: Verbo て + ご覧ください / てみてください$$,
    $$てごらん$$,
    $$てごらん|でごらん$$,
    ARRAY['て', 'ごらん']::text[],
    ARRAY['てごらん', 'でごらん', 'てごらんなさい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-125', $$このケーキ、おいしいから食べてごらん。$$, $$このケーキ、おいしいからたべてごらん。$$, $$Este bolo é gostoso, experimente.$$),
    ('n3-grammar-125', $$ちょっと窓の外を見てごらん。$$, $$ちょっとまどのそとをみてごらん。$$, $$Olhe só pela janela.$$),
    ('n3-grammar-125', $$難しくないから、自分でやってごらん。$$, $$むずかしくないから、じぶんでやってごらん。$$, $$Não é difícil, tente fazer sozinho.$$),
    ('n3-grammar-125', $$もう一度、ゆっくり言ってごらん。$$, $$もういちど、ゆっくりいってごらん。$$, $$Tente dizer mais uma vez, devagar.$$),
    ('n3-grammar-125', $$この本、おもしろいから読んでごらん。$$, $$このほん、おもしろいからよんでごらん。$$, $$Este livro é interessante, experimente ler.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$きっと似合うから、この服、着____。$$, $$Tenho certeza de que fica bem em você, experimente esta roupa.$$),
        (2, $$わからなかったら、先生に聞い____。$$, $$Se não entender, tente perguntar ao professor.$$),
        (3, $$空を見____。星がきれいだよ。$$, $$Olhe para o céu. As estrelas estão lindas.$$),
        (4, $$手伝わないから、一人で書い____。$$, $$Não vou ajudar, tente escrever sozinho.$$),
        (5, $$この歌、一緒に歌っ____。$$, $$Tente cantar esta música junto comigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てごらん$$),
        (2, $$てごらん$$),
        (3, $$てごらん$$),
        (4, $$てごらん$$),
        (5, $$てごらん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
