-- n5-grammar-58 — を
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-58',
    'grammar',
    'N5',
    $$を$$,
    $$wo / o$$,
    $$Marca o objeto direto / Por (percurso) / De (saída)$$,
    $$を é a partícula que marca o objeto direto, ou seja, aquilo que recebe a ação do verbo: o que se come, o que se lê, o que se compra.

Ela vem logo depois do objeto e antes do verbo. Como em japonês o verbo fica no final, を ajuda a mostrar claramente "o quê" está sendo feito.

を também tem um uso com verbos de movimento. Nesse caso, ela marca o espaço por onde a pessoa passa, como andar por um parque, atravessar uma rua ou virar em uma esquina.

Com verbos como 出る (sair) e 降りる (descer de um veículo), を marca o lugar de onde se sai.$$,
    $$A partícula を é escrita com o caractere を, mas é pronunciada "o" na fala comum. Ela quase só aparece como partícula.

Com verbos como 好き, ほしい, わかる e できる, o objeto é marcado com が, e não com を, porque essas palavras não são verbos de ação comuns.

Na fala muito casual, を costuma ser omitida, mas na escrita e em situações educadas ela deve aparecer.$$,
    $$Substantivo + を + Verbo transitivo
Lugar + を + Verbo de movimento (andar / passar / atravessar / virar)
Lugar + を + 出る / 降りる (lugar de onde se sai)$$,
    $$を$$,
    $$を$$,
    ARRAY['を']::text[],
    ARRAY['を']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-58', $$毎朝パンを食べます。$$, $$まいあさパンをたべます。$$, $$Como pão toda manhã.$$),
    ('n5-grammar-58', $$日本語を勉強しています。$$, $$にほんごをべんきょうしています。$$, $$Estou estudando japonês.$$),
    ('n5-grammar-58', $$昨日、公園を散歩しました。$$, $$きのう、こうえんをさんぽしました。$$, $$Ontem passeei pelo parque.$$),
    ('n5-grammar-58', $$次の角を右に曲がってください。$$, $$つぎのかどをみぎにまがってください。$$, $$Vire à direita na próxima esquina, por favor.$$),
    ('n5-grammar-58', $$毎朝八時に家を出ます。$$, $$まいあさはちじにいえをでます。$$, $$Saio de casa às oito toda manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩テレビ____見ます。$$, $$Vejo TV toda noite.$$),
        (2, $$昨日、友達に手紙____書きました。$$, $$Ontem escrevi uma carta para um amigo.$$),
        (3, $$この道____まっすぐ行ってください。$$, $$Siga reto por esta rua, por favor.$$),
        (4, $$次の駅で電車____降ります。$$, $$Vou descer do trem na próxima estação.$$),
        (5, $$子供たちが道____渡っています。$$, $$As crianças estão atravessando a rua.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を$$),
        (2, $$を$$),
        (3, $$を$$),
        (4, $$を$$),
        (5, $$を$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
