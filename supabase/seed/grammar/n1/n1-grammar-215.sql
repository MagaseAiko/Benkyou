-- n1-grammar-215 — 〜ときたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-215',
    'grammar',
    'N1',
    $$〜ときたら$$,
    $$to kitara$$,
    $$Quanto a / Falando de / Esse aí$$,
    $$ときたら apresenta uma pessoa ou coisa como tema, geralmente para criticar ou reclamar. Equivale a "quanto a..." ou "falando de...".

O tom é de irritação, desaprovação ou desânimo. Por exemplo, "quanto ao meu marido, não ajuda em nada em casa".

É uma expressão coloquial.$$,
    $$Costuma ser usado com pessoas próximas, como família, colegas ou vizinhos.

É parecido com といったら e は, mas ときたら sempre tem tom negativo.$$,
    $$Substantivo + ときたら + Crítica / Reclamação$$,
    $$ときたら$$,
    $$ときたら$$,
    ARRAY['と', 'きたら']::text[],
    ARRAY['ときたら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-215', $$うちの夫ときたら、家事を全然手伝わない。$$, $$うちのおっとときたら、かじをぜんぜんてつだわない。$$, $$Quanto ao meu marido, não ajuda em nada nas tarefas de casa.$$),
    ('n1-grammar-215', $$最近の若者ときたら、挨拶もできない。$$, $$さいきんのわかものときたら、あいさつもできない。$$, $$Os jovens de hoje nem sabem cumprimentar.$$),
    ('n1-grammar-215', $$この部屋ときたら、狭くて暗い。$$, $$このへやときたら、せまくてくらい。$$, $$Este quarto é pequeno e escuro.$$),
    ('n1-grammar-215', $$弟ときたら、ゲームばかりしている。$$, $$おとうとときたら、ゲームばかりしている。$$, $$Quanto ao meu irmão, só fica jogando videogame.$$),
    ('n1-grammar-215', $$あの店のサービスときたら、ひどいものだ。$$, $$あのみせのサービスときたら、ひどいものだ。$$, $$O atendimento daquela loja é horrível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$隣の犬____、一日中ほえている。$$, $$Quanto ao cachorro do vizinho, late o dia inteiro.$$),
        (2, $$うちの息子____、勉強もしないで遊んでばかりだ。$$, $$Quanto ao meu filho, não estuda e só fica brincando.$$),
        (3, $$今年の夏の暑さ____、我慢できない。$$, $$O calor deste verão é insuportável.$$),
        (4, $$あの政治家____、嘘ばかりつく。$$, $$Quanto àquele político, só conta mentiras.$$),
        (5, $$この電車____、毎日遅れる。$$, $$Esse trem aí atrasa todos os dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-215', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ときたら$$),
        (2, $$ときたら$$),
        (3, $$ときたら$$),
        (4, $$ときたら$$),
        (5, $$ときたら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
