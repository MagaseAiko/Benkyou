-- n1-grammar-67 — 〜くらいなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-67',
    'grammar',
    'N1',
    $$〜くらいなら$$,
    $$kurai nara$$,
    $$Se for para / Antes de / Em vez de$$,
    $$くらいなら indica que uma opção é tão ruim que a pessoa prefere outra, mesmo que também não seja ideal. Equivale a "se for para..., prefiro..." ou "em vez de...".

A primeira parte mostra a opção que a pessoa rejeita totalmente, e a segunda mostra a escolha preferida. Por exemplo, "se for para pedir ajuda a ele, prefiro fazer sozinho".

A segunda parte costuma terminar com ほうがいい, ほうがましだ ou um desejo.$$,
    $$ぐらいなら tem o mesmo sentido.

Muitas vezes a primeira parte é algo que a pessoa odeia fazer.$$,
    $$Verbo (forma dicionário) + くらいなら + ほうがいい / ほうがましだ
Verbo (forma dicionário) + ぐらいなら$$,
    $$くらいなら$$,
    $$くらいなら|ぐらいなら$$,
    ARRAY['くらい', 'なら']::text[],
    ARRAY['くらいなら', 'ぐらいなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-67', $$彼に頼むくらいなら、自分でやったほうがいい。$$, $$かれにたのむくらいなら、じぶんでやったほうがいい。$$, $$Se for para pedir a ele, é melhor fazer sozinho.$$),
    ('n1-grammar-67', $$こんなまずい物を食べるくらいなら、何も食べないほうがましだ。$$, $$こんなまずいものをたべるくらいなら、なにもたべないほうがましだ。$$, $$Em vez de comer uma coisa ruim dessas, prefiro não comer nada.$$),
    ('n1-grammar-67', $$途中でやめるぐらいなら、最初からやらないほうがいい。$$, $$とちゅうでやめるぐらいなら、さいしょからやらないほうがいい。$$, $$Se for para desistir no meio, é melhor nem começar.$$),
    ('n1-grammar-67', $$後悔するくらいなら、今やってみよう。$$, $$こうかいするくらいなら、いまやってみよう。$$, $$Em vez de se arrepender depois, vamos tentar agora.$$),
    ('n1-grammar-67', $$満員電車に乗るくらいなら、一時間歩いたほうがいい。$$, $$まんいんでんしゃにのるくらいなら、いちじかんあるいたほうがいい。$$, $$Se for para pegar um trem lotado, prefiro andar uma hora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$嘘をつく____、本当のことを言ったほうがいい。$$, $$Em vez de mentir, é melhor dizer a verdade.$$),
        (2, $$あんな会社で働く____、辞めたほうがましだ。$$, $$Se for para trabalhar numa empresa daquelas, prefiro sair.$$),
        (3, $$借金する____、旅行をあきらめる。$$, $$Se for para fazer dívida, desisto da viagem.$$),
        (4, $$文句を言う____、自分でやりなさい。$$, $$Em vez de reclamar, faça você mesmo.$$),
        (5, $$毎日悩む____、思い切って相談してみたら。$$, $$Em vez de ficar se angustiando todo dia, por que não tenta conversar com alguém?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらいなら$$),
        (1, $$ぐらいなら$$),
        (2, $$くらいなら$$),
        (2, $$ぐらいなら$$),
        (3, $$くらいなら$$),
        (3, $$ぐらいなら$$),
        (4, $$くらいなら$$),
        (4, $$ぐらいなら$$),
        (5, $$くらいなら$$),
        (5, $$ぐらいなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
