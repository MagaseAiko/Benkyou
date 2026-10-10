-- n5-grammar-38 — 〜ないで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-38',
    'grammar',
    'N5',
    $$〜ないで$$,
    $$naide$$,
    $$Sem / Sem fazer / Em vez de$$,
    $$ないで é usado para dizer que uma ação é feita sem fazer outra. Equivale a "sem" ou "sem fazer".

A estrutura liga dois verbos: o primeiro, na forma ない + で, mostra o que não foi feito; o segundo mostra o que foi feito, nessas condições.

Também pode indicar uma escolha, com o sentido de "em vez de": em vez de fazer A, a pessoa fez B.

O tempo da frase, presente ou passado, fica no último verbo. O verbo com ないで não muda.$$,
    $$ないで é diferente de なくて, que também liga frases, mas indica causa, como "por não ter feito, aconteceu algo". ないで indica o modo ou a escolha.

No final da frase, ないで sozinho vira um pedido informal, como "não faça isso". Esse uso é a forma curta de ないでください.

Na fala, a forma ずに tem o mesmo sentido de ないで, mas é mais formal e aparece em níveis seguintes.$$,
    $$Verbo na forma ない + で + Verbo
Verbo na forma ない + で、 + Verbo (em vez de)$$,
    $$ないで$$,
    $$ないで$$,
    ARRAY['ない', 'で']::text[],
    ARRAY['ないで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-38', $$朝ご飯を食べないで学校に行きました。$$, $$あさごはんをたべないでがっこうにいきました。$$, $$Fui para a escola sem tomar café da manhã.$$),
    ('n5-grammar-38', $$傘を持たないで出かけました。$$, $$かさをもたないででかけました。$$, $$Saí sem levar guarda-chuva.$$),
    ('n5-grammar-38', $$辞書を使わないで新聞を読みます。$$, $$じしょをつかわないでしんぶんをよみます。$$, $$Leio o jornal sem usar dicionário.$$),
    ('n5-grammar-38', $$昨日は寝ないで勉強しました。$$, $$きのうはねないでべんきょうしました。$$, $$Ontem estudei sem dormir.$$),
    ('n5-grammar-38', $$電車に乗らないで、歩いて帰りました。$$, $$でんしゃにのらないで、あるいてかえりました。$$, $$Em vez de pegar o trem, voltei a pé.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$砂糖を入れ____コーヒーを飲みます。$$, $$Tomo café sem colocar açúcar.$$),
        (2, $$昨日は宿題をし____寝ました。$$, $$Ontem dormi sem fazer a lição.$$),
        (3, $$手を洗わ____ご飯を食べてはいけません。$$, $$Não pode comer sem lavar as mãos.$$),
        (4, $$誰にも言わ____家を出ました。$$, $$Saí de casa sem dizer nada a ninguém.$$),
        (5, $$バスに乗ら____、自転車で行きました。$$, $$Em vez de pegar o ônibus, fui de bicicleta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないで$$),
        (2, $$ないで$$),
        (3, $$ないで$$),
        (4, $$ないで$$),
        (5, $$ないで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
