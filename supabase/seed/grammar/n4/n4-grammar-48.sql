-- n4-grammar-48 — 〜な（禁止）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-48',
    'grammar',
    'N4',
    $$〜な（禁止）$$,
    $$na (kinshi)$$,
    $$Não faça! / Proibido$$,
    $$な, depois do verbo na forma de dicionário, forma uma proibição forte e direta. Equivale a "não faça!" ou "proibido".

É uma ordem negativa, sem nenhuma suavização. Por isso, soa muito forte e até rude em conversas comuns.

Ela aparece em situações específicas: placas e avisos curtos, ordens de pais para filhos em momentos de perigo, falas entre amigos homens muito próximos, treinadores e esportes, e em citações de ordens dentro de frases.

Na fala educada, a forma correta de pedir que alguém não faça algo é ないでください.$$,
    $$Não confunda essa な com a partícula なあ, de emoção, nem com o な dos adjetivos. Aqui ela vem logo depois do verbo na forma de dicionário.

Em placas, é comum ver frases curtas como 入るな ou 触るな, que soam como avisos claros e diretos.

O oposto, a ordem afirmativa forte, é a forma imperativa (命令形), como 行け ou 食べろ.$$,
    $$Verbo na forma de dicionário + な

Mais suave (informal): Verbo na forma de dicionário + なよ
Educado: Verbo na forma ない + でください$$,
    $$な$$,
    $$るな|うな|くな|ぐな|すな|つな|ぬな|ぶな|むな$$,
    ARRAY['な']::text[],
    ARRAY['な', 'なよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-48', $$ここで泳ぐな。$$, $$ここでおよぐな。$$, $$Não nade aqui!$$),
    ('n4-grammar-48', $$危ないから、触るな。$$, $$あぶないから、さわるな。$$, $$É perigoso, não toque!$$),
    ('n4-grammar-48', $$大丈夫だから、心配するな。$$, $$だいじょうぶだから、しんぱいするな。$$, $$Está tudo bem, não se preocupe.$$),
    ('n4-grammar-48', $$「廊下を走るな」と先生に言われた。$$, $$「ろうかをはしるな」とせんせいにいわれた。$$, $$O professor me disse: "Não corra no corredor!"$$),
    ('n4-grammar-48', $$最後まで、絶対に諦めるな。$$, $$さいごまで、ぜったいにあきらめるな。$$, $$Nunca desista até o fim!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$うるさい。大きい声を出す____。$$, $$Que barulho! Não grite!$$),
        (2, $$看板に「芝生に入る____」と書いてある。$$, $$Na placa está escrito "Proibido pisar na grama".$$),
        (3, $$もう泣く____。大丈夫だから。$$, $$Pare de chorar. Está tudo bem.$$),
        (4, $$この部屋には入る____と言われました。$$, $$Me disseram para não entrar neste quarto.$$),
        (5, $$明日の約束、忘れる____よ。$$, $$Não esqueça o compromisso de amanhã, hein!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$な$$),
        (2, $$な$$),
        (3, $$な$$),
        (4, $$な$$),
        (5, $$な$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
