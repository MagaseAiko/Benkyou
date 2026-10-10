-- n3-grammar-63 — むしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-63',
    'grammar',
    'N3',
    $$むしろ$$,
    $$mushiro$$,
    $$Pelo contrário / Na verdade / Antes / Até$$,
    $$むしろ é usado para dizer que, entre duas opções ou interpretações, a segunda é mais verdadeira ou mais adequada. Equivale a "pelo contrário", "na verdade", "antes" ou "até".

Ele aparece quando a realidade é diferente do que se esperava, ou quando se corrige uma ideia. Por exemplo, "ele não ficou bravo. Pelo contrário, ficou feliz" ou "o remédio, em vez de ajudar, até piorou".

Também é usado em comparações, com より, para indicar preferência: "prefiro, na verdade, o inverno ao verão".

Com ではなく ou というより, むしろ corrige uma descrição: "não é algo ruim, é, na verdade, uma boa experiência".$$,
    $$むしろ é um pouco mais formal que どちらかというと, que também indica preferência suave.

Muitas vezes, むしろ surpreende o ouvinte, porque traz uma ideia oposta à esperada.

Em textos argumentativos, むしろ é usado para apresentar um ponto de vista diferente do senso comum.$$,
    $$A + より + むしろ + B + の方が + …
A + ではなく、 + むしろ + B
A + というより、 + むしろ + B
Frase 1 (com ponto final) + むしろ + Frase 2$$,
    $$むしろ$$,
    $$むしろ$$,
    ARRAY['むしろ']::text[],
    ARRAY['むしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-63', $$彼は怒っていなかった。むしろ喜んでいた。$$, $$かれはおこっていなかった。むしろよろこんでいた。$$, $$Ele não estava bravo. Pelo contrário, estava feliz.$$),
    ('n3-grammar-63', $$夏より、むしろ冬のほうが好きだ。$$, $$なつより、むしろふゆのほうがすきだ。$$, $$Na verdade, gosto mais do inverno do que do verão.$$),
    ('n3-grammar-63', $$薬を飲んだら、むしろ悪くなった。$$, $$くすりをのんだら、むしろわるくなった。$$, $$Tomei o remédio e, em vez de melhorar, até piorei.$$),
    ('n3-grammar-63', $$失敗は悪いことではなく、むしろいい経験だ。$$, $$しっぱいはわるいことではなく、むしろいいけいけんだ。$$, $$Errar não é algo ruim; pelo contrário, é uma boa experiência.$$),
    ('n3-grammar-63', $$彼は先生というより、むしろ友達のような存在だ。$$, $$かれはせんせいというより、むしろともだちのようなそんざいだ。$$, $$Ele é menos um professor e mais um amigo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大勢でいるより、一人でいるほうが、____楽だ。$$, $$Ficar sozinho é, na verdade, mais confortável do que estar com muita gente.$$),
        (2, $$この映画は子供より、____大人に人気がある。$$, $$Este filme é, na verdade, mais popular entre os adultos do que entre as crianças.$$),
        (3, $$休んだら、____疲れてしまった。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$),
        (4, $$彼の意見は反対ではなく、____賛成に近い。$$, $$A opinião dele não é contra; na verdade, está mais para a favor.$$),
        (5, $$都会より、____田舎に住みたい。$$, $$Na verdade, prefiro morar no interior do que na cidade grande.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$むしろ$$),
        (2, $$むしろ$$),
        (3, $$むしろ$$),
        (4, $$むしろ$$),
        (5, $$むしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
