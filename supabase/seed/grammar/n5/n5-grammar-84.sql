-- n5-grammar-84 — ここ・そこ・あそこ・どこ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-84',
    'grammar',
    'N5',
    $$ここ・そこ・あそこ・どこ$$,
    $$koko / soko / asoko / doko$$,
    $$Aqui / Aí / Lá / Onde$$,
    $$ここ, そこ, あそこ e どこ são palavras para indicar lugares. Elas seguem a mesma lógica de distância de これ, それ e あれ.

• ここ: o lugar onde está quem fala ("aqui").
• そこ: o lugar perto de quem ouve ("aí").
• あそこ: um lugar longe dos dois ("lá", "ali").
• どこ: a pergunta "onde?".

Elas funcionam como substantivos e podem receber partículas como に, で, へ, を e は.

Quando quem fala e quem ouve estão no mesmo lugar, ここ indica o lugar onde os dois estão, そこ indica um lugar um pouco afastado, e あそこ indica um lugar mais distante.$$,
    $$Em situações educadas, como em lojas e recepções, usa-se こちら, そちら, あちら e どちら no lugar de ここ, そこ, あそこ e どこ.

そこ também pode indicar um lugar que acabou de ser mencionado na conversa, mesmo que não esteja fisicamente perto do ouvinte.

Note que a forma "lá" é あそこ, e não あこ. É a única irregular do grupo.$$,
    $$ここ / そこ / あそこ / どこ + は / が / に / で / へ / を
Substantivo + は + ここ / そこ / あそこ / どこ + です

ここ: perto de quem fala
そこ: perto de quem ouve
あそこ: longe dos dois
どこ: onde$$,
    $$ここ$$,
    $$ここ|そこ|あそこ|どこ$$,
    ARRAY['ここ', 'そこ', 'あそこ', 'どこ']::text[],
    ARRAY['ここ', 'そこ', 'あそこ', 'どこ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-84', $$ここは私の部屋です。$$, $$ここはわたしのへやです。$$, $$Aqui é o meu quarto.$$),
    ('n5-grammar-84', $$すみません、トイレはどこですか。$$, $$すみません、トイレはどこですか。$$, $$Com licença, onde fica o banheiro?$$),
    ('n5-grammar-84', $$あそこに銀行があります。$$, $$あそこにぎんこうがあります。$$, $$Ali tem um banco.$$),
    ('n5-grammar-84', $$どうぞ、そこに座ってください。$$, $$どうぞ、そこにすわってください。$$, $$Por favor, sente-se aí.$$),
    ('n5-grammar-84', $$「駅はどこですか。」「あそこです。」$$, $$「えきはどこですか。」「あそこです。」$$, $$"Onde fica a estação?" "É lá."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、出口は____ですか。$$, $$Com licença, onde fica a saída?$$),
        (2, $$私たちが今いる____は、昔、学校でした。$$, $$Este lugar onde estamos agora antigamente era uma escola.$$),
        (3, $$遠くに白い建物が見えるでしょう。____が私の会社です。$$, $$Dá para ver um prédio branco ao longe, né? Lá é a minha empresa.$$),
        (4, $$「私の眼鏡、知らない？」「あなたの足の下、____にあるよ。」$$, $$"Você viu meus óculos?" "Estão aí, debaixo do seu pé."$$),
        (5, $$夏休みは____へ行きたいですか。$$, $$Aonde você quer ir nas férias de verão?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どこ$$),
        (2, $$ここ$$),
        (3, $$あそこ$$),
        (4, $$そこ$$),
        (5, $$どこ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
