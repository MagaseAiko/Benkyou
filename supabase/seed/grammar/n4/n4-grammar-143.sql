-- n4-grammar-143 — 命令形
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-143',
    'grammar',
    'N4',
    $$命令形$$,
    $$meireikei$$,
    $$Imperativo / Faça! (ordem direta)$$,
    $$命令形 é a forma imperativa dos verbos. Ela expressa uma ordem direta e forte, como "faça!", "vá!", "pare!".

Por ser muito direta, essa forma soa rude em conversas comuns. Ela aparece em situações específicas: emergências, esportes e torcidas, ordens de superiores para subordinados em contextos rígidos, placas de trânsito, falas masculinas muito informais, citações e personagens de mangá e anime.

Um uso positivo e comum é na torcida, como 頑張れ! ("vamos lá!", "força!").

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e". No grupo 2, troca-se る por ろ. Os irregulares ficam しろ (de する) e 来い (こい, de 来る).$$,
    $$Para ordens mais suaves, usa-se なさい (pais e professores) ou てください (educado).

Em placas de trânsito, 止まれ ("pare") é um exemplo famoso de imperativo.

Mulheres e pessoas em situações educadas raramente usam o imperativo na fala do dia a dia, exceto em citações ou torcidas.$$,
    $$Grupo 1: último som "u" → "e" (行く → 行け / 待つ → 待て / 頑張る → 頑張れ)
Grupo 2: troque る por ろ (食べる → 食べろ / 起きる → 起きろ)
Irregulares: する → しろ (escrito: せよ) / 来る → 来い (こい)$$,
    $$命令形$$,
    $$ろ！|ろ。|け！|け。|れ！|れ。|め！|め。|げ！|げ。|せ！|せ。|べ！|べ。|て！|て。|い！|い。$$,
    ARRAY['え', 'ろ']::text[],
    ARRAY['け', 'れ', 'め', 'ろ', 'しろ', '来い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-143', $$もう八時だぞ。早く起きろ！$$, $$もうはちじだぞ。はやくおきろ！$$, $$Já são oito horas! Levanta logo!$$),
    ('n4-grammar-143', $$あと少しだ。頑張れ！$$, $$あとすこしだ。がんばれ！$$, $$Falta pouco. Força!$$),
    ('n4-grammar-143', $$交差点の前に、止まれ。$$, $$こうさてんのまえに、とまれ。$$, $$Pare antes do cruzamento.$$),
    ('n4-grammar-143', $$危ないから、ここへ来い！$$, $$あぶないから、ここへこい！$$, $$É perigoso, venha para cá!$$),
    ('n4-grammar-143', $$「火事だ！逃げろ！」と彼は叫んだ。$$, $$「かじだ！にげろ！」とかれはさけんだ。$$, $$"É fogo! Corram!", ele gritou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れるぞ。もっと速く走____！$$, $$Vamos nos atrasar! Corra mais rápido!$$),
        (2, $$うるさい。静かにし____！$$, $$Que barulho! Fique quieto!$$),
        (3, $$危ない！逃げ____！$$, $$Perigo! Fuja!$$),
        (4, $$時間がない。早く来____！$$, $$Não temos tempo. Venha logo!$$),
        (5, $$最後まで頑張____！$$, $$Força até o fim!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$れ$$),
        (2, $$ろ$$),
        (3, $$ろ$$),
        (4, $$い$$),
        (5, $$れ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
