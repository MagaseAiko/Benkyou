-- n2-grammar-17 — 〜どころか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-17',
    'grammar',
    'N2',
    $$〜どころか$$,
    $$dokoro ka$$,
    $$Longe de / Muito pelo contrário / Nem sequer$$,
    $$どころか é usado para dizer que a realidade é muito diferente do esperado, geralmente o oposto ou algo ainda mais extremo. Equivale a "longe de", "muito pelo contrário" ou "nem sequer".

Ele tem dois usos principais.

O primeiro é contradizer a expectativa, mostrando o oposto: "longe de pedir desculpas, ele ficou bravo" ou "a chuva, longe de parar, ficou ainda mais forte".

O segundo é intensificar uma negação: "não sei escrever nem hiragana, quanto mais kanji" (漢字どころか、ひらがなも書けない). A coisa mais difícil vem antes de どころか, e a mais simples, depois.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.$$,
    $$どころか expressa surpresa ou frustração porque a realidade foi o contrário do esperado.

Compare com どころではない, que indica que algo está fora de questão por causa da situação.

É muito usado em conversas e textos para enfatizar contrastes fortes.$$,
    $$Substantivo + どころか、 + Oposto / Algo mais extremo
Verbo / Adjetivo (forma simples) + どころか
A + どころか、 + B + も / さえ + Negativo (nem B, quanto mais A)$$,
    $$どころか$$,
    $$どころか$$,
    ARRAY['どころ', 'か']::text[],
    ARRAY['どころか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-17', $$彼は謝るどころか、怒り出した。$$, $$かれはあやまるどころか、おこりだした。$$, $$Longe de pedir desculpas, ele começou a ficar bravo.$$),
    ('n2-grammar-17', $$雨はやむどころか、ますます強くなった。$$, $$あめはやむどころか、ますますつよくなった。$$, $$A chuva, longe de parar, ficou cada vez mais forte.$$),
    ('n2-grammar-17', $$今月は貯金どころか、借金がある。$$, $$こんげつはちょきんどころか、しゃっきんがある。$$, $$Este mês, longe de economizar, estou com dívidas.$$),
    ('n2-grammar-17', $$彼は漢字どころか、ひらがなも書けない。$$, $$かれはかんじどころか、ひらがなもかけない。$$, $$Ele não sabe escrever nem hiragana, quanto mais kanji.$$),
    ('n2-grammar-17', $$薬を飲んだら、よくなるどころか悪くなった。$$, $$くすりをのんだら、よくなるどころかわるくなった。$$, $$Tomei o remédio e, muito pelo contrário, piorei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は手伝う____、邪魔ばかりする。$$, $$Longe de ajudar, ele só atrapalha.$$),
        (2, $$彼は英語____、日本語も話せない。$$, $$Ele não fala nem japonês, quanto mais inglês.$$),
        (3, $$ダイエットをしたのに、痩せる____、太ってしまった。$$, $$Fiz dieta e, longe de emagrecer, acabei engordando.$$),
        (4, $$親切にしたのに、感謝される____、怒られた。$$, $$Fui gentil e, muito pelo contrário de ser agradecido, levei bronca.$$),
        (5, $$最近は休み____、毎日残業している。$$, $$Ultimamente, longe de ter folga, faço hora extra todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どころか$$),
        (2, $$どころか$$),
        (3, $$どころか$$),
        (4, $$どころか$$),
        (5, $$どころか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
