-- n4-grammar-16 — 〜がる・〜がっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-16',
    'grammar',
    'N4',
    $$〜がる・〜がっている$$,
    $$garu / gatte iru$$,
    $$Mostrar (sentimento) / Parecer sentir / Querer (outra pessoa)$$,
    $$がる é usado para descrever os sentimentos ou desejos de outra pessoa a partir do que ela demonstra. Equivale a "mostrar que sente", "parecer sentir".

Em japonês, sentimentos como querer, ter medo, achar ruim ou sentir saudade são considerados internos. Só a própria pessoa pode afirmar o que sente. Por isso, para falar do sentimento de outra pessoa, o japonês usa がる, que descreve o comportamento visível.

Para formar, tira-se o い do adjetivo e acrescenta-se がる. Com たい e ほしい, formam-se たがる e ほしがる, para dizer o que outra pessoa quer.

Quando se fala de um estado no momento, usa-se がっている. Quando se fala de uma tendência geral, usa-se がる.

Como がる vira um verbo de ação, o objeto passa a ser marcado com を.$$,
    $$Usar がる para falar de si mesmo é estranho, exceto ao se descrever de fora, como numa história.

Falar de superiores com がる pode soar desrespeitoso, porque descreve o comportamento deles como algo observado. Nesses casos, é melhor usar formas como そうだ ou citar o que eles disseram.

Na negativa, がらない indica que a pessoa não demonstra aquele sentimento, como uma criança que não tem medo de algo.$$,
    $$Adjetivo de sentimento sem い + がる
Adjetivo な + がる (嫌がる)
ほしい → ほしがる
Verbo sem ます + たい → たがる

Estado atual: がっている
Tendência geral: がる

Objeto: Substantivo + を + 〜がる$$,
    $$がる$$,
    $$がる|がって|がった|がります|がりました|がらない$$,
    ARRAY['がる']::text[],
    ARRAY['がる', 'がっている', 'がります', 'がった', 'たがる', 'ほしがる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-16', $$弟は新しいゲームを欲しがっています。$$, $$おとうとはあたらしいゲームをほしがっています。$$, $$Meu irmão mais novo está querendo um jogo novo.$$),
    ('n4-grammar-16', $$子供が注射を怖がっている。$$, $$こどもがちゅうしゃをこわがっている。$$, $$A criança está com medo da injeção.$$),
    ('n4-grammar-16', $$妹は一人で留守番をするのを嫌がった。$$, $$いもうとはひとりでるすばんをするのをいやがった。$$, $$Minha irmã mais nova não quis ficar sozinha em casa.$$),
    ('n4-grammar-16', $$犬が外に出たがっています。$$, $$いぬがそとにでたがっています。$$, $$O cachorro está querendo sair.$$),
    ('n4-grammar-16', $$彼は本当は寂しがっているのかもしれない。$$, $$かれはほんとうはさびしがっているのかもしれない。$$, $$Talvez ele, na verdade, esteja se sentindo sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$娘はかわいい服を欲し____います。$$, $$Minha filha está querendo roupas bonitinhas.$$),
        (2, $$子供たちは暗い所を怖____。$$, $$As crianças têm medo de lugares escuros.$$),
        (3, $$うちの猫は水を嫌____。$$, $$Nosso gato não gosta de água.$$),
        (4, $$弟はアメリカに行き____います。$$, $$Meu irmão mais novo está querendo ir para os Estados Unidos.$$),
        (5, $$友達が引っ越して、息子は寂し____いる。$$, $$Um amigo se mudou, e meu filho está se sentindo sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がって$$),
        (2, $$がります$$),
        (2, $$がる$$),
        (3, $$がります$$),
        (3, $$がる$$),
        (4, $$たがって$$),
        (5, $$がって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
