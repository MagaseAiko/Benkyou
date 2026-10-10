-- n2-grammar-179 — 〜つつ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-179',
    'grammar',
    'N2',
    $$〜つつ$$,
    $$tsutsu$$,
    $$Enquanto / Embora / Mesmo$$,
    $$つつ tem dois usos principais.

O primeiro indica que duas ações acontecem ao mesmo tempo. Equivale a "enquanto". É uma forma mais formal de ながら. Por exemplo, "pensando no futuro, escolhi o trabalho".

O segundo, muitas vezes como つつも, indica contraste. Equivale a "embora" ou "mesmo". A pessoa sabe ou sente algo, mas faz o contrário. Por exemplo, "embora saiba que faz mal, continuo fumando".$$,
    $$No primeiro uso, o sujeito das duas ações é o mesmo.

No segundo uso, expressões comuns são 悪いと知りつつ, 思いつつ e 言いつつ.

É mais formal que ながら e aparece mais na escrita.$$,
    $$Verbo (forma ます sem ます) + つつ
Verbo (forma ます sem ます) + つつも$$,
    $$つつ$$,
    $$つつ$$,
    ARRAY['つつ']::text[],
    ARRAY['つつ', 'つつも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-179', $$体に悪いと知りつつ、たばこをやめられない。$$, $$からだにわるいとしりつつ、たばこをやめられない。$$, $$Embora saiba que faz mal, não consigo parar de fumar.$$),
    ('n2-grammar-179', $$将来のことを考えつつ、仕事を選んだ。$$, $$しょうらいのことをかんがえつつ、しごとをえらんだ。$$, $$Escolhi o trabalho pensando no futuro.$$),
    ('n2-grammar-179', $$早く寝ようと思いつつも、つい夜更かししてしまう。$$, $$はやくねようとおもいつつも、ついよふかししてしまう。$$, $$Embora pense em dormir cedo, acabo ficando acordado até tarde.$$),
    ('n2-grammar-179', $$景色を楽しみつつ、山道を歩いた。$$, $$けしきをたのしみつつ、やまみちをあるいた。$$, $$Caminhei pela trilha enquanto apreciava a paisagem.$$),
    ('n2-grammar-179', $$悪いと思いつつ、彼の手紙を読んでしまった。$$, $$わるいとおもいつつ、かれのてがみをよんでしまった。$$, $$Mesmo achando errado, acabei lendo a carta dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いけないと知り____、うそをついてしまった。$$, $$Mesmo sabendo que não devia, acabei mentindo.$$),
        (2, $$音楽を聞き____、勉強する。$$, $$Estudo enquanto ouço música.$$),
        (3, $$やせたいと思い____、ケーキを食べてしまう。$$, $$Embora queira emagrecer, acabo comendo bolo.$$),
        (4, $$みんなの意見を聞き____、計画を進める。$$, $$Vamos avançar com o plano ouvindo a opinião de todos.$$),
        (5, $$返事をしなければと思い____、まだ書いていない。$$, $$Embora pense que preciso responder, ainda não escrevi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つつ$$),
        (1, $$つつも$$),
        (2, $$つつ$$),
        (3, $$つつ$$),
        (3, $$つつも$$),
        (4, $$つつ$$),
        (5, $$つつ$$),
        (5, $$つつも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
