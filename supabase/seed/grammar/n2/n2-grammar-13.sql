-- n2-grammar-13 — 〜だけは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-13',
    'grammar',
    'N2',
    $$〜だけは$$,
    $$dake wa$$,
    $$Pelo menos / Ao menos isso / Só isso (não)$$,
    $$だけは é usado para destacar uma única coisa como exceção ou como o mínimo garantido. Equivale a "pelo menos", "ao menos isso" ou "só isso".

Ele tem alguns usos principais:
• Destacar a única qualidade positiva: "ele não vai bem nos estudos, mas pelo menos é bom em esportes".
• Pedir ou proibir algo com ênfase: "isso, pelo menos, não esqueça" ou "só mentir eu não perdoo".
• Garantir o mínimo: "não sei o resultado, mas pelo menos fiz tudo o que podia" (やるだけはやった).

A ideia é: "o resto pode ser como for, mas isso aqui é diferente".$$,
    $$だけは é diferente de だけ (só). だけは destaca uma exceção em contraste com o resto.

Em pedidos, これだけはお願いします significa "pelo menos isto, por favor".

A forma やるだけはやった é comum para mostrar que a pessoa deu o seu máximo.$$,
    $$Substantivo + だけは + Frase
これ / それ + だけは + Pedido / Proibição
Verbo + だけは + Verbo (pelo menos fazer o máximo)
Verbo + ことだけは + Frase$$,
    $$だけは$$,
    $$だけは$$,
    ARRAY['だけ', 'は']::text[],
    ARRAY['だけは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-13', $$これだけは忘れないでください。$$, $$これだけはわすれないでください。$$, $$Isso, pelo menos, não esqueça.$$),
    ('n2-grammar-13', $$彼は勉強はできないが、スポーツだけは得意だ。$$, $$かれはべんきょうはできないが、スポーツだけはとくいだ。$$, $$Ele não vai bem nos estudos, mas pelo menos é bom em esportes.$$),
    ('n2-grammar-13', $$お金はないが、時間だけはある。$$, $$おかねはないが、じかんだけはある。$$, $$Não tenho dinheiro, mas tempo, pelo menos, eu tenho.$$),
    ('n2-grammar-13', $$試験の結果はわからないが、やるだけはやった。$$, $$しけんのけっかはわからないが、やるだけはやった。$$, $$Não sei o resultado da prova, mas pelo menos fiz tudo o que podia.$$),
    ('n2-grammar-13', $$嘘をつくことだけは許せない。$$, $$うそをつくことだけはゆるせない。$$, $$Só mentir eu não perdoo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理は苦手だが、カレー____作れる。$$, $$Não sou bom na cozinha, mas curry, pelo menos, eu sei fazer.$$),
        (2, $$このこと____誰にも言わないで。$$, $$Isso, pelo menos, não conte a ninguém.$$),
        (3, $$体力はないけど、元気____ある。$$, $$Não tenho muita força física, mas pelo menos tenho energia.$$),
        (4, $$他のことはいいが、遅刻____しないでください。$$, $$O resto tudo bem, mas atrasos, pelo menos, não admito.$$),
        (5, $$できることはやった。準備____十分した。$$, $$Fiz o que pude. A preparação, pelo menos, foi suficiente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけは$$),
        (2, $$だけは$$),
        (3, $$だけは$$),
        (4, $$だけは$$),
        (5, $$だけは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
