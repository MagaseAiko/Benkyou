-- n2-grammar-47 — 〜から言うと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-47',
    'grammar',
    'N2',
    $$〜から言うと$$,
    $$kara iu to$$,
    $$Do ponto de vista de / Considerando / Em termos de$$,
    $$から言うと é usado para indicar a perspectiva, o critério ou o ponto de vista a partir do qual se faz um julgamento. Equivale a "do ponto de vista de", "considerando" ou "em termos de".

A primeira parte mostra o critério (a experiência, o preço, a posição de alguém, a capacidade), e a segunda apresenta a opinião ou conclusão baseada nesse critério.

Por exemplo, "pela minha experiência, este método é o melhor" ou "em termos de preço, este é mais vantajoso".

A expressão 結論から言うと significa "indo direto à conclusão" e é muito usada em apresentações e e-mails.

As formas から言えば e から言って têm o mesmo sentido.$$,
    $$Comparado a から見ると, から言うと destaca mais o critério usado para julgar, enquanto から見ると destaca o ponto de vista de alguém.

結論から言うと é uma forma muito comum de ir direto ao ponto em reuniões.

Na escrita, também aparece em hiragana: からいうと.$$,
    $$Substantivo (critério / ponto de vista) + から言うと / から言えば / から言って、 + Julgamento

Expressões comuns: 経験から言うと / 結論から言うと / 立場から言うと$$,
    $$から言うと$$,
    $$から言うと|からいうと|から言えば|からいえば|から言って|からいって$$,
    ARRAY['から', '言うと']::text[],
    ARRAY['から言うと', 'から言えば', 'から言って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-47', $$私の経験から言うと、この方法が一番いい。$$, $$わたしのけいけんからいうと、このほうほうがいちばんいい。$$, $$Pela minha experiência, este método é o melhor.$$),
    ('n2-grammar-47', $$値段から言えば、こちらのほうがお得だ。$$, $$ねだんからいえば、こちらのほうがおとくだ。$$, $$Em termos de preço, este é mais vantajoso.$$),
    ('n2-grammar-47', $$私の立場から言うと、賛成はできない。$$, $$わたしのたちばからいうと、さんせいはできない。$$, $$Da minha posição, não posso concordar.$$),
    ('n2-grammar-47', $$結論から言うと、計画は中止です。$$, $$けつろんからいうと、けいかくはちゅうしです。$$, $$Indo direto à conclusão, o plano está cancelado.$$),
    ('n2-grammar-47', $$実力から言って、彼が優勝するだろう。$$, $$じつりょくからいって、かれがゆうしょうするだろう。$$, $$Considerando a habilidade, ele deve ser o campeão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$結論____、この案に賛成です。$$, $$Indo direto à conclusão, sou a favor desta proposta.$$),
        (2, $$品質____、この商品が一番だ。$$, $$Em termos de qualidade, este produto é o melhor.$$),
        (3, $$教師の立場____、もっと勉強してほしい。$$, $$Do ponto de vista de professor, gostaria que estudassem mais.$$),
        (4, $$私の経験____、それは無理だ。$$, $$Pela minha experiência, isso é impossível.$$),
        (5, $$距離____、電車のほうが早い。$$, $$Considerando a distância, o trem é mais rápido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から言うと$$),
        (1, $$から言えば$$),
        (2, $$から言うと$$),
        (2, $$から言えば$$),
        (3, $$から言うと$$),
        (3, $$から言えば$$),
        (4, $$から言うと$$),
        (4, $$から言えば$$),
        (5, $$から言うと$$),
        (5, $$から言えば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
