-- n3-grammar-13 — 別に〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-13',
    'grammar',
    'N3',
    $$別に〜ない$$,
    $$betsu ni ~ nai$$,
    $$Não especialmente / Não em particular / Nada demais$$,
    $$別に〜ない é usado para dizer que algo não é especial, não tem nada de mais ou não é bem assim. Equivale a "não especialmente", "não em particular" ou "nada demais".

別に vem antes de uma frase negativa e suaviza ou minimiza a situação. Por exemplo, "não estou especialmente bravo" ou "não tenho pressa nenhuma".

Sozinho, como resposta curta, 別に significa "nada" ou "não, nada especial". Mas, dependendo do tom, essa resposta curta pode soar fria, desinteressada ou até rude.

Também é muito usado com わけではない, formando 別に〜わけではない, para negar uma interpretação: "não é que eu não goste...".$$,
    $$Responder só 別に a uma pergunta pode passar a impressão de má vontade. Em situações educadas, é melhor dar uma resposta completa.

別に também aparece em frases como 別にいい ("tanto faz", "não precisa").

Sem a negação, 別に significa "separadamente", como em 別に払う (pagar separadamente).$$,
    $$別に + Verbo / Adjetivo negativo
別に + 〜わけではない (não é que...)
別に (resposta curta: nada / não especialmente)

Escrita: 別に / べつに$$,
    $$別に$$,
    $$別に|べつに$$,
    ARRAY['別に', 'ない']::text[],
    ARRAY['別に', 'べつに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-13', $$「どうしたの？」「別に何でもないよ。」$$, $$「どうしたの？」「べつになんでもないよ。」$$, $$"O que foi?" "Nada demais."$$),
    ('n3-grammar-13', $$別に急いでいないので、ゆっくりでいいですよ。$$, $$べつにいそいでいないので、ゆっくりでいいですよ。$$, $$Não estou com pressa, pode ir com calma.$$),
    ('n3-grammar-13', $$別に怒っていません。$$, $$べつにおこっていません。$$, $$Não estou bravo, não.$$),
    ('n3-grammar-13', $$私は別に肉が嫌いなわけではない。$$, $$わたしはべつににくがきらいなわけではない。$$, $$Não é que eu não goste de carne.$$),
    ('n3-grammar-13', $$「何か欲しいものある？」「別に。」$$, $$「なにかほしいものある？」「べつに。」$$, $$"Quer alguma coisa?" "Nada em especial."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____困っていないから、心配しないで。$$, $$Não estou com nenhum problema, então não se preocupe.$$),
        (2, $$「何かあったの？」「いや、____何もないよ。」$$, $$"Aconteceu alguma coisa?" "Não, nada demais."$$),
        (3, $$____行きたくないわけじゃない。$$, $$Não é que eu não queira ir.$$),
        (4, $$みんなは褒めていたけど、その映画は____おもしろくなかった。$$, $$Todo mundo elogiou, mas esse filme não foi nada de especial.$$),
        (5, $$「何か質問は？」「____ありません。」$$, $$"Alguma pergunta?" "Nenhuma em especial."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$別に$$),
        (1, $$べつに$$),
        (2, $$別に$$),
        (2, $$べつに$$),
        (3, $$別に$$),
        (3, $$べつに$$),
        (4, $$別に$$),
        (4, $$べつに$$),
        (5, $$別に$$),
        (5, $$べつに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
