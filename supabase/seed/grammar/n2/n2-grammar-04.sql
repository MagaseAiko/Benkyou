-- n2-grammar-04 — 〜ばかりだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-04',
    'grammar',
    'N2',
    $$〜ばかりだ$$,
    $$bakari da$$,
    $$Só piorar / Só aumentar / Cada vez mais$$,
    $$ばかりだ, depois de um verbo de mudança na forma de dicionário, indica que uma situação muda continuamente em uma única direção, quase sempre para pior. Equivale a "só piora", "só aumenta" ou "fica cada vez mais...".

Por exemplo, "a doença só piora" ou "os preços só sobem, e o salário não aumenta".

O sentido é muito parecido com 一方だ (N3). As duas formas indicam uma tendência que não para. ばかりだ costuma ter um tom ainda mais negativo e preocupado.

Ela é usada com verbos como 悪くなる, 増える, 減る, 上がる e 下がる.

Na forma ばかりで, liga a tendência a uma consequência negativa.$$,
    $$ばかりだ, nesse sentido, quase nunca é usado para mudanças positivas. Para algo bom que só aumenta, prefira 一方だ ou ていく.

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.

Em notícias sobre economia e meio ambiente, essa estrutura aparece com frequência.$$,
    $$Verbo de mudança (forma de dicionário) + ばかりだ / ばかりです
Verbo de mudança + ばかりで、 + Consequência
Passado: ばかりだった$$,
    $$ばかりだ$$,
    $$ばかりだ|ばかりです|ばかりで$$,
    ARRAY['ばかり', 'だ']::text[],
    ARRAY['ばかりだ', 'ばかりです', 'ばかりで', 'ばかりだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-04', $$祖父の病気は悪くなるばかりだ。$$, $$そふのびょうきはわるくなるばかりだ。$$, $$A doença do meu avô só piora.$$),
    ('n2-grammar-04', $$物価は上がるばかりで、給料は上がらない。$$, $$ぶっかはあがるばかりで、きゅうりょうはあがらない。$$, $$Os preços só sobem, e o salário não aumenta.$$),
    ('n2-grammar-04', $$彼との関係は悪化するばかりだ。$$, $$かれとのかんけいはあっかするばかりだ。$$, $$A relação com ele só piora.$$),
    ('n2-grammar-04', $$この町の人口は減るばかりです。$$, $$このまちのじんこうはへるばかりです。$$, $$A população desta cidade só diminui.$$),
    ('n2-grammar-04', $$カードを使いすぎて、借金は増えるばかりだった。$$, $$カードをつかいすぎて、しゃっきんはふえるばかりだった。$$, $$Usei demais o cartão, e a dívida só aumentava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜になって、雨は強くなる____。$$, $$À noite, a chuva só fica mais forte.$$),
        (2, $$仕事は増える____で、休めない。$$, $$O trabalho só aumenta, e não consigo descansar.$$),
        (3, $$最近、彼の成績は下がる____。$$, $$Ultimamente, as notas dele só caem.$$),
        (4, $$一人で考えていると、心配は大きくなる____です。$$, $$Quando penso sozinho, a preocupação só aumenta.$$),
        (5, $$けんかの後、二人の関係は悪くなる____だった。$$, $$Depois da briga, a relação dos dois só piorava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりだ$$),
        (1, $$ばかりです$$),
        (2, $$ばかり$$),
        (3, $$ばかりだ$$),
        (3, $$ばかりです$$),
        (4, $$ばかり$$),
        (5, $$ばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
