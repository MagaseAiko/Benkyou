-- n3-grammar-181 — 〜ずにはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-181',
    'grammar',
    'N3',
    $$〜ずにはいられない$$,
    $$zu ni wa irarenai$$,
    $$Não conseguir deixar de / Não resistir a / Não ter como não$$,
    $$ずにはいられない é usado para dizer que a pessoa não consegue se controlar e acaba fazendo algo, por causa de um sentimento forte. Equivale a "não conseguir deixar de", "não resistir a" ou "não ter como não".

A estrutura é uma dupla negação: "não consigo ficar sem fazer". O resultado é uma ação quase involuntária, provocada por emoção, impulso ou situação.

Por exemplo, "vendo esse filme, não consegui deixar de chorar" ou "quando vejo um gato fofo, não resisto a fazer carinho".

Ela é formada com ずに (sem fazer) + はいられない (não consegue ficar). O verbo する vira せずにはいられない.

A forma ないではいられない tem o mesmo sentido e é um pouco mais falada.$$,
    $$O sujeito costuma ser quem fala. Para outras pessoas, acrescenta-se ようだ ou らしい.

É uma forma expressiva e um pouco literária, comum em relatos de emoções fortes.

Comparado a つい〜てしまう, ずにはいられない destaca que o impulso é forte demais para resistir.$$,
    $$Verbo na forma ない sem ない + ずにはいられない
する → せずにはいられない
Passado: ずにはいられなかった

Variação: ないではいられない$$,
    $$ずにはいられない$$,
    $$ずにはいられない|ないではいられない|ずにはいられなかった$$,
    ARRAY['ず', 'には', 'いられない']::text[],
    ARRAY['ずにはいられない', 'ずにはいられなかった', 'ないではいられない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-181', $$その映画を見て、泣かずにはいられなかった。$$, $$そのえいがをみて、なかずにはいられなかった。$$, $$Vendo esse filme, não consegui deixar de chorar.$$),
    ('n3-grammar-181', $$彼の話を聞くと、笑わずにはいられない。$$, $$かれのはなしをきくと、わらわずにはいられない。$$, $$Quando ouço as histórias dele, não tenho como não rir.$$),
    ('n3-grammar-181', $$かわいい猫を見ると、触らずにはいられない。$$, $$かわいいねこをみると、さわらずにはいられない。$$, $$Quando vejo um gato fofo, não resisto a fazer carinho.$$),
    ('n3-grammar-181', $$困っている人を見ると、助けずにはいられない。$$, $$こまっているひとをみると、たすけずにはいられない。$$, $$Quando vejo alguém em dificuldade, não consigo deixar de ajudar.$$),
    ('n3-grammar-181', $$おいしそうなケーキを見て、買わずにはいられなかった。$$, $$おいしそうなケーキをみて、かわずにはいられなかった。$$, $$Vi um bolo com cara de delicioso e não resisti a comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の話があまりにおかしくて、笑わ____。$$, $$A história dele era tão engraçada que não consegui deixar de rir.$$),
        (2, $$試験の結果が気になって、先生に聞か____。$$, $$Fico tão curioso com o resultado da prova que não resisto a perguntar ao professor.$$),
        (3, $$悲しい話を聞いて、泣か____。$$, $$Ouvi uma história triste e não consegui deixar de chorar.$$),
        (4, $$甘い物を見ると、食べ____。$$, $$Quando vejo doce, não resisto a comer.$$),
        (5, $$彼の失礼な態度に、一言言わ____。$$, $$Diante da atitude mal-educada dele, não pude deixar de dizer algo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずにはいられない$$),
        (1, $$ずにはいられなかった$$),
        (2, $$ずにはいられない$$),
        (3, $$ずにはいられなかった$$),
        (4, $$ずにはいられない$$),
        (5, $$ずにはいられなかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
