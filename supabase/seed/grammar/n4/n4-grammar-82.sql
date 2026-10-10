-- n4-grammar-82 — 〜そうに・〜そうな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-82',
    'grammar',
    'N4',
    $$〜そうに・〜そうな$$,
    $$sou ni / sou na$$,
    $$Parecendo / Com cara de / Que parece$$,
    $$そうに e そうな são formas da そうだ de aparência usadas para modificar outras palavras.

そうな vem antes de um substantivo e descreve como a coisa ou a pessoa parece. Equivale a "que parece..." ou "com cara de...". Por exemplo, "uma maçã que parece gostosa" ou "um rosto com cara de sono".

そうに vem antes de um verbo e descreve o modo como alguém faz algo, segundo a aparência. Equivale a "parecendo..." ou "com cara de...". Por exemplo, "as crianças brincam parecendo se divertir".

Isso acontece porque そう funciona como um adjetivo な: recebe な antes de substantivos e に antes de verbos.

A formação é a mesma de そうだ de aparência: verbos sem ます, adjetivos い sem い e adjetivos な sem な.$$,
    $$そうに é muito usado para descrever emoções de outras pessoas a partir da aparência, como alegria, tristeza e sono, já que em japonês não se afirma diretamente o sentimento dos outros.

A expressão 気持ちよさそうに, "parecendo estar confortável", é comum para descrever animais e pessoas relaxando.

Com verbos, そうな descreve algo prestes a acontecer, como "um céu que parece que vai chover".$$,
    $$Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうな + Substantivo
Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうに + Verbo

Exceções: いい → よさそうな / よさそうに; ない → なさそうな / なさそうに$$,
    $$そうな$$,
    $$そうに|そうな$$,
    ARRAY['そう', 'に', 'な']::text[],
    ARRAY['そうに', 'そうな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-82', $$子供たちが楽しそうに遊んでいます。$$, $$こどもたちがたのしそうにあそんでいます。$$, $$As crianças estão brincando, parecendo se divertir muito.$$),
    ('n4-grammar-82', $$おいしそうなりんごですね。$$, $$おいしそうなりんごですね。$$, $$Que maçã com cara de gostosa!$$),
    ('n4-grammar-82', $$彼は眠そうな顔をしている。$$, $$かれはねむそうなかおをしている。$$, $$Ele está com cara de sono.$$),
    ('n4-grammar-82', $$彼女はうれしそうに笑った。$$, $$かのじょはうれしそうにわらった。$$, $$Ela sorriu com cara de felicidade.$$),
    ('n4-grammar-82', $$今日は雨が降りそうな空だ。$$, $$きょうはあめがふりそうなそらだ。$$, $$Hoje o céu está com cara de chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は寂し____顔をしていた。$$, $$Ele estava com uma cara triste.$$),
        (2, $$猫が気持ちよさ____寝ている。$$, $$O gato está dormindo, parecendo muito confortável.$$),
        (3, $$それは高____時計ですね。$$, $$Esse relógio parece caro, hein.$$),
        (4, $$子供がおいし____ご飯を食べている。$$, $$A criança está comendo com cara de quem está adorando.$$),
        (5, $$彼女は今にも泣き出し____声で話した。$$, $$Ela falou com uma voz de quem ia começar a chorar a qualquer momento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうな$$),
        (2, $$そうに$$),
        (3, $$そうな$$),
        (4, $$そうに$$),
        (5, $$そうな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
