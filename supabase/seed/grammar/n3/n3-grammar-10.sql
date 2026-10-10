-- n3-grammar-10 — 〜ばかりでなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-10',
    'grammar',
    'N3',
    $$〜ばかりでなく$$,
    $$bakari de naku$$,
    $$Não só... mas também / Além de$$,
    $$ばかりでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio ou esperado, e a segunda acrescenta outro, muitas vezes com も.

Por exemplo, "ele fala não só inglês, mas também chinês" ou "esta loja não só é barata, como também é gostosa".

É mais formal que だけでなく, que tem o mesmo sentido. Por isso, aparece muito em textos escritos, discursos e explicações.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.$$,
    $$だけでなく é mais comum na conversa. ばかりでなく soa um pouco mais formal.

No nível N2, aparece ばかりか, com sentido parecido, mas mais enfático e às vezes com surpresa.

A segunda parte costuma ter も, reforçando a ideia de "também".$$,
    $$Substantivo + ばかりでなく、 + … + も
Verbo / Adjetivo い (forma simples) + ばかりでなく
Adjetivo な + な + ばかりでなく

Variação: ばかりではなく$$,
    $$ばかりでなく$$,
    $$ばかりでなく|ばかりではなく$$,
    ARRAY['ばかり', 'で', 'なく']::text[],
    ARRAY['ばかりでなく', 'ばかりではなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-10', $$彼は英語ばかりでなく、中国語も話せる。$$, $$かれはえいごばかりでなく、ちゅうごくごもはなせる。$$, $$Ele fala não só inglês, mas também chinês.$$),
    ('n3-grammar-10', $$この店は安いばかりでなく、おいしい。$$, $$このみせはやすいばかりでなく、おいしい。$$, $$Esta loja não só é barata, como também é gostosa.$$),
    ('n3-grammar-10', $$子供ばかりでなく、大人も楽しめる映画だ。$$, $$こどもばかりでなく、おとなもたのしめるえいがだ。$$, $$É um filme que não só as crianças, mas também os adultos podem aproveitar.$$),
    ('n3-grammar-10', $$雨ばかりでなく、風も強くなってきた。$$, $$あめばかりでなく、かぜもつよくなってきた。$$, $$Não só a chuva, mas também o vento ficou mais forte.$$),
    ('n3-grammar-10', $$彼女は歌が上手なばかりでなく、ダンスも上手だ。$$, $$かのじょはうたがじょうずなばかりでなく、ダンスもじょうずだ。$$, $$Ela não só canta bem, como também dança bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このアニメは日本____、外国でも人気がある。$$, $$Este anime é popular não só no Japão, mas também no exterior.$$),
        (2, $$この薬は頭痛____、熱にも効く。$$, $$Este remédio funciona não só para dor de cabeça, mas também para febre.$$),
        (3, $$彼は勉強ができる____、スポーツも得意だ。$$, $$Ele não só vai bem nos estudos, como também é bom em esportes.$$),
        (4, $$野菜____、果物も食べましょう。$$, $$Vamos comer não só verduras, mas também frutas.$$),
        (5, $$父は平日____、週末も働いている。$$, $$Meu pai trabalha não só nos dias úteis, mas também nos fins de semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりでなく$$),
        (1, $$ばかりではなく$$),
        (2, $$ばかりでなく$$),
        (2, $$ばかりではなく$$),
        (3, $$ばかりでなく$$),
        (3, $$ばかりではなく$$),
        (4, $$ばかりでなく$$),
        (4, $$ばかりではなく$$),
        (5, $$ばかりでなく$$),
        (5, $$ばかりではなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
