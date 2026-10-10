-- n2-grammar-08 — ちっとも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-08',
    'grammar',
    'N2',
    $$ちっとも〜ない$$,
    $$chittomo ~ nai$$,
    $$Nem um pouco / Nada / Absolutamente nada$$,
    $$ちっとも〜ない é usado para negar algo completamente, com ênfase. Equivale a "nem um pouco", "nada" ou "absolutamente nada".

ちっとも vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. O sentido é igual a 全然〜ない e 少しも〜ない.

A diferença é o tom: ちっとも é mais coloquial e costuma carregar um sentimento de frustração, reclamação ou decepção. Por exemplo, "estudei, mas não entendi nada" ou "ela não me dá notícias, nem um pouco".

Por ser casual, ちっとも é mais usado na fala do que na escrita formal.$$,
    $$Comparando: 全然〜ない é o mais comum; 少しも〜ない é um pouco mais formal; ちっとも〜ない é casual e emotivo.

ちっとも não é usado em frases afirmativas.

Muitas vezes aparece com のに, reforçando a frustração: 頑張っているのに、ちっとも上手にならない.$$,
    $$ちっとも + Verbo na forma negativa
ちっとも + Adjetivo い sem い + くない
ちっとも + Adjetivo な / Substantivo + じゃない$$,
    $$ちっとも$$,
    $$ちっとも$$,
    ARRAY['ちっとも', 'ない']::text[],
    ARRAY['ちっとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-08', $$彼の話はちっともおもしろくない。$$, $$かれのはなしはちっともおもしろくない。$$, $$A história dele não tem graça nenhuma.$$),
    ('n2-grammar-08', $$勉強したのに、ちっともわからなかった。$$, $$べんきょうしたのに、ちっともわからなかった。$$, $$Estudei, mas não entendi absolutamente nada.$$),
    ('n2-grammar-08', $$最近、ちっとも雨が降らない。$$, $$さいきん、ちっともあめがふらない。$$, $$Ultimamente não tem chovido nada.$$),
    ('n2-grammar-08', $$彼女はちっとも連絡をくれない。$$, $$かのじょはちっともれんらくをくれない。$$, $$Ela não me dá notícias, nem um pouco.$$),
    ('n2-grammar-08', $$このダイエットはちっとも効果がない。$$, $$このダイエットはちっともこうかがない。$$, $$Esta dieta não tem efeito nenhum.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日練習しているのに、____上手にならない。$$, $$Pratico todo dia, mas não melhoro nem um pouco.$$),
        (2, $$彼は____人の話を聞かない。$$, $$Ele não escuta nada do que os outros dizem.$$),
        (3, $$暖房をつけても、この部屋は____暖かくならない。$$, $$Mesmo com o aquecedor ligado, este quarto não esquenta nem um pouco.$$),
        (4, $$ずっと待っていたのに、バスは____来なかった。$$, $$Esperei muito tempo, mas o ônibus não apareceu de jeito nenhum.$$),
        (5, $$疲れていて、映画が____楽しめなかった。$$, $$Estava cansado e não consegui aproveitar o filme nem um pouco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ちっとも$$),
        (2, $$ちっとも$$),
        (3, $$ちっとも$$),
        (4, $$ちっとも$$),
        (5, $$ちっとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
