-- n3-grammar-42 — 〜切れない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-42',
    'grammar',
    'N3',
    $$〜切れない$$,
    $$kirenai$$,
    $$Não conseguir (fazer) por completo / Não dar conta de$$,
    $$切れない, ligado a outro verbo, indica que não é possível fazer algo por completo, até o fim. Equivale a "não conseguir... tudo" ou "não dar conta de...".

A estrutura junta o verbo na forma ます sem ます com 切れない, a forma potencial negativa de 切る (que, nesse uso, significa "fazer até o fim").

O motivo costuma ser uma quantidade grande demais: comida demais para comer, estrelas demais para contar, livros demais para ler em um dia.

Também é usado com sentimentos, como em 待ち切れない (não aguentar esperar) e 言い切れない (não conseguir expressar tudo em palavras).$$,
    $$A forma afirmativa é 切れる (conseguir fazer até o fim), e a forma ativa é 切る (fazer até o fim).

数え切れない (incontável) é uma expressão muito usada para falar de grandes quantidades.

待ち切れない é comum para expressar ansiedade positiva, como esperar ansiosamente por uma viagem.$$,
    $$Verbo na forma ます sem ます + 切れない
Verbo sem ます + 切れません (educado)
Verbo sem ます + 切れなくて、 + …
Verbo sem ます + 切れない + ほど (tanto que não dá para...)

Escrita: 切れない / きれない$$,
    $$切れない$$,
    $$切れな|きれな|切れませ|きれませ$$,
    ARRAY['切れない']::text[],
    ARRAY['切れない', '切れません', 'きれない', '切れなくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-42', $$料理が多すぎて、食べ切れない。$$, $$りょうりがおおすぎて、たべきれない。$$, $$É comida demais, não consigo comer tudo.$$),
    ('n3-grammar-42', $$空の星が多すぎて、数え切れない。$$, $$そらのほしがおおすぎて、かぞえきれない。$$, $$As estrelas no céu são tantas que não dá para contar.$$),
    ('n3-grammar-42', $$待ち切れなくて、先に食べてしまった。$$, $$まちきれなくて、さきにたべてしまった。$$, $$Não aguentei esperar e acabei comendo antes.$$),
    ('n3-grammar-42', $$この感謝の気持ちは、言葉では言い切れない。$$, $$このかんしゃのきもちは、ことばではいいきれない。$$, $$Não consigo expressar em palavras toda essa gratidão.$$),
    ('n3-grammar-42', $$図書館には、一日では読み切れないほどの本がある。$$, $$としょかんには、いちにちではよみきれないほどのほんがある。$$, $$A biblioteca tem tantos livros que não daria para ler num dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなにたくさんの荷物は、一人では持ち____。$$, $$Tanta bagagem assim, sozinho, não dá para carregar.$$),
        (2, $$宿題が多すぎて、今日中にやり____。$$, $$A lição é tanta que não consigo terminar hoje.$$),
        (3, $$夏休みの旅行が楽しみで、待ち____。$$, $$Estou tão animado com a viagem de férias que não aguento esperar.$$),
        (4, $$皆さんへの感謝の気持ちは言い____。$$, $$Não consigo expressar toda a minha gratidão a vocês.$$),
        (5, $$このケーキは大きすぎて、一人では食べ____。$$, $$Este bolo é grande demais, sozinho não dá para comer tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切れない$$),
        (1, $$きれない$$),
        (1, $$切れません$$),
        (1, $$きれません$$),
        (2, $$切れない$$),
        (2, $$きれない$$),
        (2, $$切れません$$),
        (2, $$きれません$$),
        (3, $$切れない$$),
        (3, $$きれない$$),
        (3, $$切れません$$),
        (3, $$きれません$$),
        (4, $$切れない$$),
        (4, $$きれない$$),
        (4, $$切れません$$),
        (4, $$きれません$$),
        (5, $$切れない$$),
        (5, $$きれない$$),
        (5, $$切れません$$),
        (5, $$きれません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
