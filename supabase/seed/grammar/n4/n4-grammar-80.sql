-- n4-grammar-80 — 〜そうだ（伝聞）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-80',
    'grammar',
    'N4',
    $$〜そうだ（伝聞）$$,
    $$sou da (denbun)$$,
    $$Dizem que / Ouvi dizer que$$,
    $$Nesse uso, そうだ serve para repassar uma informação que a pessoa ouviu ou leu em algum lugar. Equivale a "dizem que" ou "ouvi dizer que".

Quem fala não está dando a própria opinião: está apenas transmitindo o que outra fonte disse, como a previsão do tempo, uma notícia ou um amigo.

É comum indicar a fonte no começo da frase, com によると ("segundo...") ou の話では ("pelo que... disse").

そうだ vem depois da forma simples completa. Com substantivos e adjetivos な, é preciso colocar だ antes: 静かだそうだ, 医者だそうだ.

Não confunda com そうだ de aparência (様態), que significa "parece que vai..." e se liga de outra forma ao verbo e ao adjetivo.$$,
    $$A diferença entre as duas そうだ está na ligação: na de hearsay, usa-se a forma completa, como 降るそうだ (dizem que vai chover); na de aparência, usa-se a base do verbo, como 降りそうだ (parece que vai chover).

そうだ de hearsay não se conjuga no passado nem no negativo: o tempo e a negação ficam na parte antes de そうだ.

らしい também repassa informação, mas acrescenta um pouco de suposição de quem fala.$$,
    $$Verbo (forma simples) + そうだ / そうです
Adjetivo い + そうだ
Adjetivo な + だ + そうだ
Substantivo + だ + そうだ

Fonte: 〜によると / 〜の話では$$,
    $$そうだ$$,
    $$そうだ|そうです$$,
    ARRAY['そう', 'だ']::text[],
    ARRAY['そうだ', 'そうです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-80', $$天気予報によると、明日は雨が降るそうです。$$, $$てんきよほうによると、あしたはあめがふるそうです。$$, $$Segundo a previsão do tempo, dizem que vai chover amanhã.$$),
    ('n4-grammar-80', $$田中さんは来月結婚するそうだ。$$, $$たなかさんはらいげつけっこんするそうだ。$$, $$Ouvi dizer que o Tanaka vai se casar no mês que vem.$$),
    ('n4-grammar-80', $$あのレストランはとてもおいしいそうです。$$, $$あのレストランはとてもおいしいそうです。$$, $$Dizem que aquele restaurante é muito gostoso.$$),
    ('n4-grammar-80', $$ニュースによると、昨日大きな地震があったそうだ。$$, $$ニュースによると、きのうおおきなじしんがあったそうだ。$$, $$Segundo o noticiário, ontem houve um grande terremoto.$$),
    ('n4-grammar-80', $$彼の話では、その町はとても静かだそうです。$$, $$かれのはなしでは、そのまちはとてもしずかだそうです。$$, $$Pelo que ele disse, essa cidade é muito tranquila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新聞によると、来年から電車の料金が上がる____。$$, $$Segundo o jornal, a tarifa do trem vai subir a partir do ano que vem.$$),
        (2, $$友達の話では、あの映画はおもしろい____。$$, $$Pelo que meu amigo disse, aquele filme é interessante.$$),
        (3, $$先生は来週休む____。$$, $$Dizem que o professor vai faltar semana que vem.$$),
        (4, $$山田さんのお父さんは医者だ____。$$, $$Dizem que o pai do Yamada é médico.$$),
        (5, $$友達によると、昨日のテストは難しかった____です。$$, $$Segundo meu amigo, a prova de ontem foi difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうです$$),
        (1, $$そうだ$$),
        (2, $$そうです$$),
        (2, $$そうだ$$),
        (3, $$そうです$$),
        (3, $$そうだ$$),
        (4, $$そうです$$),
        (4, $$そうだ$$),
        (5, $$そう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
