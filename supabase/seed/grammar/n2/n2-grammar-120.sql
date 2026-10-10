-- n2-grammar-120 — 〜抜きにして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-120',
    'grammar',
    'N2',
    $$〜抜きにして$$,
    $$nuki ni shite$$,
    $$Sem / Deixando de lado / Sem levar em conta$$,
    $$抜きにして indica que algo é feito sem um elemento que normalmente estaria presente. Equivale a "sem" ou "deixando de lado".

Por exemplo, "deixando as formalidades de lado, vamos conversar à vontade".

Também aparece na forma 抜きにしては〜ない, que significa que algo não é possível sem aquele elemento. Por exemplo, "não dá para falar da história do Japão sem falar de Kyoto".$$,
    $$A forma 抜きで é mais simples e informal, como 朝ご飯抜きで.

Expressões comuns são 冗談は抜きにして e 堅い話は抜きにして.$$,
    $$Substantivo + を抜きにして / は抜きにして
Substantivo + 抜きで
Substantivo + を抜きにしては + Frase negativa$$,
    $$抜きにして$$,
    $$抜きにして|抜きで|抜きに|ぬきにして$$,
    ARRAY['抜き', 'に', 'して']::text[],
    ARRAY['抜きにして', 'を抜きにして', '抜きで', '抜きにしては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-120', $$冗談は抜きにして、本当の話をしよう。$$, $$じょうだんはぬきにして、ほんとうのはなしをしよう。$$, $$Deixando as brincadeiras de lado, vamos falar sério.$$),
    ('n2-grammar-120', $$堅い話は抜きにして、今日は楽しみましょう。$$, $$かたいはなしはぬきにして、きょうはたのしみましょう。$$, $$Deixando os assuntos sérios de lado, vamos nos divertir hoje.$$),
    ('n2-grammar-120', $$彼の協力を抜きにしては、この計画は成功しなかった。$$, $$かれのきょうりょくをぬきにしては、このけいかくはせいこうしなかった。$$, $$Sem a cooperação dele, este plano não teria dado certo.$$),
    ('n2-grammar-120', $$今朝は朝ご飯抜きで会社に来た。$$, $$けさはあさごはんぬきでかいしゃにきた。$$, $$Hoje de manhã vim para o trabalho sem tomar café.$$),
    ('n2-grammar-120', $$値段を抜きにして考えれば、この車が一番いい。$$, $$ねだんをぬきにしてかんがえれば、このくるまがいちばんいい。$$, $$Sem levar em conta o preço, este carro é o melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$挨拶は____、さっそく始めましょう。$$, $$Deixando os cumprimentos de lado, vamos começar logo.$$),
        (2, $$お世辞は____、正直な意見を聞かせてください。$$, $$Sem elogios, me diga sua opinião sincera.$$),
        (3, $$この町の歴史は、お寺を____は語れない。$$, $$Não dá para falar da história desta cidade sem falar dos templos.$$),
        (4, $$わさび____お寿司をください。$$, $$Me dá um sushi sem wasabi, por favor.$$),
        (5, $$仕事の話は____、ゆっくり飲もう。$$, $$Deixando o trabalho de lado, vamos beber com calma.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$抜きにして$$),
        (1, $$ぬきにして$$),
        (2, $$抜きにして$$),
        (2, $$ぬきにして$$),
        (3, $$抜きにして$$),
        (3, $$ぬきにして$$),
        (4, $$抜きで$$),
        (5, $$抜きにして$$),
        (5, $$ぬきにして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
