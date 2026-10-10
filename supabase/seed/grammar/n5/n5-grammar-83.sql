-- n5-grammar-83 — これ・それ・あれ・どれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-83',
    'grammar',
    'N5',
    $$これ・それ・あれ・どれ$$,
    $$kore / sore / are / dore$$,
    $$Isto / Isso / Aquilo / Qual$$,
    $$これ, それ, あれ e どれ são pronomes usados para apontar coisas. Eles funcionam sozinhos, no lugar de um substantivo.

A escolha depende da distância entre a coisa, quem fala e quem ouve:
• これ: algo perto de quem fala ("isto").
• それ: algo perto de quem ouve ("isso").
• あれ: algo longe dos dois ("aquilo").
• どれ: a pergunta "qual?", usada para escolher entre três ou mais coisas.

Esses pronomes recebem partículas normalmente, como は, が e を.

それ também é usado para se referir a algo que o outro acabou de dizer, e あれ, para algo que os dois conhecem e lembram.$$,
    $$Esses pronomes fazem parte do sistema こ・そ・あ・ど, que aparece em várias palavras: この / その / あの / どの, ここ / そこ / あそこ / どこ e こちら / そちら / あちら / どちら.

Para escolher entre apenas duas coisas, usa-se どちら, e não どれ.

Para pessoas, usar これ ou あれ pode soar rude. O mais educado é この人, あの人 ou, de forma respeitosa, この方 e あの方.$$,
    $$これ / それ / あれ + は / が / を / も
どれ + が / を / ですか

これ: perto de quem fala
それ: perto de quem ouve
あれ: longe dos dois
どれ: qual (entre três ou mais)$$,
    $$これ$$,
    $$これ|それ|あれ|どれ$$,
    ARRAY['これ', 'それ', 'あれ', 'どれ']::text[],
    ARRAY['これ', 'それ', 'あれ', 'どれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-83', $$これは私のかばんです。$$, $$これはわたしのかばんです。$$, $$Esta é a minha bolsa.$$),
    ('n5-grammar-83', $$それは何ですか。$$, $$それはなんですか。$$, $$O que é isso?$$),
    ('n5-grammar-83', $$あれは東京タワーです。$$, $$あれはとうきょうタワーです。$$, $$Aquilo é a Torre de Tóquio.$$),
    ('n5-grammar-83', $$あなたの傘はどれですか。$$, $$あなたのかさはどれですか。$$, $$Qual é o seu guarda-chuva?$$),
    ('n5-grammar-83', $$すみません、それを見せてください。$$, $$すみません、それをみせてください。$$, $$Com licença, me mostre isso, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたの手にある____は何ですか。$$, $$O que é isso na sua mão?$$),
        (2, $$「田中さんの車は____ですか。」「あの白い車です。」$$, $$"Qual é o carro do Tanaka?" "É aquele carro branco."$$),
        (3, $$私の手の中の____は日本のお金です。$$, $$Isto aqui na minha mão é dinheiro japonês.$$),
        (4, $$遠くに見える____は富士山ですか。$$, $$Aquilo que se vê ao longe é o Monte Fuji?$$),
        (5, $$この中で、____が一番好きですか。$$, $$Destes aqui, qual você mais gosta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それ$$),
        (2, $$どれ$$),
        (3, $$これ$$),
        (4, $$あれ$$),
        (5, $$どれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
