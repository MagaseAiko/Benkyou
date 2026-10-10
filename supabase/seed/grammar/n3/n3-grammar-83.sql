-- n3-grammar-83 — 〜にしては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-83',
    'grammar',
    'N3',
    $$〜にしては$$,
    $$ni shite wa$$,
    $$Para (alguém que é...) / Considerando que$$,
    $$にしては é usado para dizer que algo é diferente do que se esperaria, considerando uma condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa ("para um estrangeiro", "para a primeira vez", "para outubro"). A segunda parte mostra que a realidade foi diferente dessa expectativa.

Por exemplo, "para um estrangeiro, ele fala japonês muito bem" ou "para outubro, hoje está quente".

O resultado pode ser positivo (um elogio) ou negativo (uma decepção). O importante é o contraste com o que seria normal.

Ele vem depois de substantivos e da forma simples de verbos.$$,
    $$A diferença entre にしては e にしても: にしては mostra surpresa porque o resultado foi diferente do esperado; にしても admite algo e mantém uma opinião ou crítica.

Elogios com にしては podem soar condescendentes se a condição for sensível, como idade ou nacionalidade. Use com cuidado.

Com expressões de quantidade, にしては também funciona: "para um preço de mil ienes, é muito bom".$$,
    $$Substantivo + にしては + Avaliação inesperada
Verbo (forma simples) + にしては + Avaliação inesperada$$,
    $$にしては$$,
    $$にしては$$,
    ARRAY['に', 'しては']::text[],
    ARRAY['にしては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-83', $$彼は外国人にしては、日本語がとても上手だ。$$, $$かれはがいこくじんにしては、にほんごがとてもじょうずだ。$$, $$Para um estrangeiro, ele fala japonês muito bem.$$),
    ('n3-grammar-83', $$初めてにしては、よくできましたね。$$, $$はじめてにしては、よくできましたね。$$, $$Para a primeira vez, você se saiu muito bem.$$),
    ('n3-grammar-83', $$この店は駅前にしては、値段が安い。$$, $$このみせはえきまえにしては、ねだんがやすい。$$, $$Para uma loja em frente à estação, os preços são baratos.$$),
    ('n3-grammar-83', $$十月にしては、今日は暑い。$$, $$じゅうがつにしては、きょうはあつい。$$, $$Para outubro, hoje está quente.$$),
    ('n3-grammar-83', $$小学生にしては、難しい言葉を知っている。$$, $$しょうがくせいにしては、むずかしいことばをしっている。$$, $$Para um aluno do primário, ele conhece palavras difíceis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、よく食べますね。$$, $$Para uma criança, você come bastante, hein.$$),
        (2, $$夏____、涼しい日が続いている。$$, $$Para o verão, os dias têm sido frescos.$$),
        (3, $$初心者____、上手ですね。$$, $$Para um iniciante, você é bom, hein.$$),
        (4, $$有名なレストラン____、あまりおいしくなかった。$$, $$Para um restaurante famoso, não era muito gostoso.$$),
        (5, $$一生懸命勉強した____、点数が悪かった。$$, $$Considerando que estudei muito, a nota foi ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしては$$),
        (2, $$にしては$$),
        (3, $$にしては$$),
        (4, $$にしては$$),
        (5, $$にしては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
