-- n2-grammar-25 — 〜げ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-25',
    'grammar',
    'N2',
    $$〜げ$$,
    $$ge$$,
    $$Com ar de / Parecendo / Com jeito de$$,
    $$げ é um sufixo que indica a aparência ou a impressão de um sentimento ou estado, a partir do que se observa. Equivale a "com ar de", "parecendo" ou "com jeito de".

Ele vem depois de adjetivos い (sem い), de alguns adjetivos な e da forma たい de verbos (sem い). Por exemplo, 寂しげ (com ar de tristeza), 楽しげ (parecendo se divertir), 言いたげ (com cara de quem quer dizer algo).

O resultado funciona como um adjetivo な: げな antes de substantivos, げに antes de verbos e げだ no fim da frase.

O sentido é parecido com そう (aparência), mas げ soa mais literário e é muito usado em textos, romances e descrições de expressões e emoções.$$,
    $$いい vira よさげ, e ない vira なさげ, como em 自信なさげ (com cara de inseguro).

Expressões como 自信ありげ (com ar de confiante) e 意味ありげ (com ar misterioso) são muito usadas.

Na fala do dia a dia, そう é mais comum que げ.$$,
    $$Adjetivo い sem い + げ (寂しげ / 楽しげ / 悲しげ)
Adjetivo な + げ (不安げ / 満足げ / 得意げ)
Verbo たい sem い + げ (言いたげ)
〜げな + Substantivo / 〜げに + Verbo / 〜げだ$$,
    $$げ$$,
    $$げな|げに|げだ|げです$$,
    ARRAY['げ']::text[],
    ARRAY['げ', 'げな', 'げに', 'げだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-25', $$彼女は寂しげな顔をしていた。$$, $$かのじょはさびしげなかおをしていた。$$, $$Ela estava com um ar triste.$$),
    ('n2-grammar-25', $$子供たちは楽しげに遊んでいる。$$, $$こどもたちはたのしげにあそんでいる。$$, $$As crianças estão brincando, parecendo se divertir.$$),
    ('n2-grammar-25', $$彼は何か言いたげだった。$$, $$かれはなにかいいたげだった。$$, $$Ele estava com cara de quem queria dizer algo.$$),
    ('n2-grammar-25', $$彼は自信ありげな態度で話した。$$, $$かれはじしんありげなたいどではなした。$$, $$Ele falou com um ar confiante.$$),
    ('n2-grammar-25', $$不安げな表情で、彼女は待っていた。$$, $$ふあんげなひょうじょうで、かのじょはまっていた。$$, $$Ela esperava com uma expressão de ansiedade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は悲し____な目で私を見た。$$, $$Ele me olhou com um olhar triste.$$),
        (2, $$料理を食べて、子供は満足____に笑った。$$, $$A criança comeu e sorriu, parecendo satisfeita.$$),
        (3, $$彼女は何か言いた____な顔をしていた。$$, $$Ela estava com cara de quem queria dizer alguma coisa.$$),
        (4, $$一人で留守番している犬が寂し____に鳴いている。$$, $$O cachorro, sozinho em casa, está latindo com um ar triste.$$),
        (5, $$彼は得意____な顔で自分の作品を見せた。$$, $$Ele mostrou o próprio trabalho com cara de orgulhoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$げ$$),
        (2, $$げ$$),
        (3, $$げ$$),
        (4, $$げ$$),
        (5, $$げ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
