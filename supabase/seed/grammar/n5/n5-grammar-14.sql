-- n5-grammar-14 — 〜がいます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-14',
    'grammar',
    'N5',
    $$〜がいます$$,
    $$ga imasu$$,
    $$Ter / Haver / Estar (seres vivos)$$,
    $$がいます é usado para dizer que um ser vivo existe ou está em algum lugar. Equivale a "tem", "há" ou "está".

O verbo いる é usado para pessoas e animais, ou seja, seres que se movem por conta própria. Para objetos e plantas, usa-se ある.

Além de indicar onde alguém está, いる também serve para dizer que você tem alguém na sua vida, como irmãos, filhos, amigos, namorado ou um animal de estimação.

O lugar onde o ser vivo está é marcado com に. A pessoa ou o animal é marcado com が quando a informação é nova.$$,
    $$Às vezes a escolha entre いる e ある depende de como a coisa é vista. Um táxi ou ônibus parado com motorista, esperando passageiros, costuma ser tratado com いる, porque a ideia é de alguém ali.

Robôs e personagens também podem ser tratados com いる quando são vistos como "seres".

Quando se diz quantas pessoas há, o número costuma vir entre が e います, com contadores como 人.$$,
    $$Lugar + に + Ser vivo + がいます
Pessoa + (に) は + Ser vivo + がいます (ter família, amigos, animais)

Negativo: がいません
Passado: がいました
Passado negativo: がいませんでした

Informal: がいる / がいない / がいた / がいなかった$$,
    $$いる$$,
    $$がいます|がいません|がいました|がいませんでした|がいる|がいた|がいない|がいなかった$$,
    ARRAY['が', 'いる']::text[],
    ARRAY['がいます', 'がいません', 'がいました', 'がいませんでした', 'がいる', 'がいない', 'がいた', 'がいなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-14', $$公園に子供がいます。$$, $$こうえんにこどもがいます。$$, $$Tem crianças no parque.$$),
    ('n5-grammar-14', $$私には姉がいます。$$, $$わたしにはあねがいます。$$, $$Eu tenho uma irmã mais velha.$$),
    ('n5-grammar-14', $$木の上に鳥がいます。$$, $$きのうえにとりがいます。$$, $$Tem um pássaro em cima da árvore.$$),
    ('n5-grammar-14', $$教室に先生がいません。$$, $$きょうしつにせんせいがいません。$$, $$O professor não está na sala de aula.$$),
    ('n5-grammar-14', $$昔、この家には猫がいました。$$, $$むかし、このいえにはねこがいました。$$, $$Antigamente, havia um gato nesta casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$池に魚____。$$, $$Tem peixes no lago.$$),
        (2, $$私は兄弟____。$$, $$Eu não tenho irmãos.$$),
        (3, $$部屋に誰____か。$$, $$Tem alguém no quarto?$$),
        (4, $$昨日、庭に大きい犬____。$$, $$Ontem havia um cachorro grande no quintal.$$),
        (5, $$駅の前にタクシー____。$$, $$Tem táxis em frente à estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がいます$$),
        (1, $$がいる$$),
        (2, $$がいません$$),
        (2, $$がいない$$),
        (3, $$がいます$$),
        (4, $$がいました$$),
        (4, $$がいた$$),
        (5, $$がいます$$),
        (5, $$がいる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
