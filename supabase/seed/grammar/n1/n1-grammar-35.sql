-- n1-grammar-35 — 〜ほうがましだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-35',
    'grammar',
    'N1',
    $$〜ほうがましだ$$,
    $$hou ga mashi da$$,
    $$Seria melhor / Antes / Prefiro$$,
    $$ほうがましだ indica que, entre duas opções ruins, uma é um pouco menos ruim. Equivale a "seria melhor" ou "antes...".

A pessoa não acha a opção boa, mas a considera mais aceitável que a outra. Por exemplo, "antes ficar sozinho do que trabalhar com ele".

Muitas vezes vem junto com くらいなら, como "se for para..., antes...".$$,
    $$ましだ significa "menos ruim", não "bom".

É parecido com ほうがいい, mas ほうがましだ mostra que as duas opções são ruins.$$,
    $$Verbo (forma dicionário / forma た) + ほうがましだ
Substantivo + の + ほうがましだ
〜くらいなら、〜ほうがましだ$$,
    $$ほうがましだ$$,
    $$ほうがましだ|ほうがまし|方がまし$$,
    ARRAY['ほう', 'が', 'まし', 'だ']::text[],
    ARRAY['ほうがましだ', 'ほうがましです', '方がましだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-35', $$彼と一緒に働くくらいなら、一人でやるほうがましだ。$$, $$かれといっしょにはたらくくらいなら、ひとりでやるほうがましだ。$$, $$Se for para trabalhar com ele, antes fazer sozinho.$$),
    ('n1-grammar-35', $$こんなにまずいなら、食べないほうがましだ。$$, $$こんなにまずいなら、たべないほうがましだ。$$, $$Se é tão ruim assim, seria melhor não comer.$$),
    ('n1-grammar-35', $$嘘をつくより、本当のことを言ったほうがましだ。$$, $$うそをつくより、ほんとうのことをいったほうがましだ。$$, $$Seria melhor dizer a verdade do que mentir.$$),
    ('n1-grammar-35', $$満員電車に乗るより、歩いたほうがましです。$$, $$まんいんでんしゃにのるより、あるいたほうがましです。$$, $$Prefiro andar a pegar um trem lotado.$$),
    ('n1-grammar-35', $$こんな仕事なら、辞めたほうがましだ。$$, $$こんなしごとなら、やめたほうがましだ。$$, $$Se o trabalho é assim, seria melhor sair.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$謝るくらいなら、黙っている____。$$, $$Se for para pedir desculpas, antes ficar calado.$$),
        (2, $$こんな店で食べるより、家で作った____。$$, $$Seria melhor cozinhar em casa do que comer numa loja dessas.$$),
        (3, $$二時間待つより、別の店に行く____。$$, $$Seria melhor ir a outra loja do que esperar duas horas.$$),
        (4, $$あんな人に頼むくらいなら、自分でする____。$$, $$Se for para pedir a uma pessoa daquelas, prefiro fazer eu mesmo.$$),
        (5, $$中途半端にやるより、やらない____。$$, $$Seria melhor não fazer do que fazer pela metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうがましだ$$),
        (1, $$方がましだ$$),
        (2, $$ほうがましだ$$),
        (2, $$方がましだ$$),
        (3, $$ほうがましだ$$),
        (3, $$方がましだ$$),
        (4, $$ほうがましだ$$),
        (4, $$方がましだ$$),
        (5, $$ほうがましだ$$),
        (5, $$方がましだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
