-- n2-grammar-176 — 〜ところを見ると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-176',
    'grammar',
    'N2',
    $$〜ところを見ると$$,
    $$tokoro wo miru to$$,
    $$A julgar por / Pelo visto / Já que$$,
    $$ところを見ると indica que a pessoa faz uma suposição com base em algo que observou. Equivale a "a julgar por" ou "pelo visto".

A primeira parte é o fato observado, e a segunda é a conclusão provável. A frase costuma terminar com らしい, ようだ, だろう ou に違いない. Por exemplo, "a julgar pelo sorriso dela, deve ter passado na prova".

É uma expressão de dedução baseada em evidências.$$,
    $$É parecido com からすると e ことから, mas ところを見ると se baseia em algo visto diretamente.

A forma ところを見れば tem o mesmo sentido.$$,
    $$Verbo (forma simples) + ところを見ると + Suposição
Adjetivo い + ところを見ると + Suposição
Adjetivo な + な + ところを見ると + Suposição$$,
    $$ところを見ると$$,
    $$ところを見ると|ところをみると|ところを見れば$$,
    ARRAY['ところ', 'を', '見る', 'と']::text[],
    ARRAY['ところを見ると', 'ところをみると', 'ところを見れば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-176', $$彼女が笑っているところを見ると、試験に合格したらしい。$$, $$かのじょがわらっているところをみると、しけんにごうかくしたらしい。$$, $$A julgar pelo sorriso dela, parece que passou na prova.$$),
    ('n2-grammar-176', $$電気がついていないところを見ると、誰もいないようだ。$$, $$でんきがついていないところをみると、だれもいないようだ。$$, $$Pelo visto, como a luz está apagada, não tem ninguém.$$),
    ('n2-grammar-176', $$毎日来るところを見ると、この店が気に入ったのだろう。$$, $$まいにちくるところをみると、このみせがきにいったのだろう。$$, $$Já que vem todo dia, deve ter gostado desta loja.$$),
    ('n2-grammar-176', $$何も言わないところを見ると、怒っているに違いない。$$, $$なにもいわないところをみると、おこっているにちがいない。$$, $$A julgar pelo silêncio, com certeza está bravo.$$),
    ('n2-grammar-176', $$道がぬれているところを見ると、雨が降ったようだ。$$, $$みちがぬれているところをみると、あめがふったようだ。$$, $$A julgar pela rua molhada, parece que choveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たくさん食べている____、おいしいのだろう。$$, $$Já que está comendo bastante, deve estar gostoso.$$),
        (2, $$彼が急いでいる____、約束があるらしい。$$, $$A julgar pela pressa dele, parece que tem um compromisso.$$),
        (3, $$行列ができている____、人気の店なのだろう。$$, $$A julgar pela fila, deve ser uma loja popular.$$),
        (4, $$返事が来ない____、忙しいようだ。$$, $$Pelo visto, como a resposta não chega, deve estar ocupado.$$),
        (5, $$彼女が元気な____、病気は治ったらしい。$$, $$A julgar pela disposição dela, parece que a doença sarou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところを見ると$$),
        (1, $$ところをみると$$),
        (2, $$ところを見ると$$),
        (2, $$ところをみると$$),
        (3, $$ところを見ると$$),
        (3, $$ところをみると$$),
        (4, $$ところを見ると$$),
        (4, $$ところをみると$$),
        (5, $$ところを見ると$$),
        (5, $$ところをみると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
