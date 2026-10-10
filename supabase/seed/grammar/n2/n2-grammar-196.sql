-- n2-grammar-196 — 〜にかけては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-196',
    'grammar',
    'N2',
    $$〜にかけては$$,
    $$ni kakete wa$$,
    $$Quando se trata de / Em matéria de / No que diz respeito a$$,
    $$にかけては indica uma área em que alguém tem muita habilidade ou é o melhor. Equivale a "quando se trata de" ou "em matéria de".

A segunda parte costuma elogiar a capacidade de alguém, dizendo que ninguém é melhor naquilo. Por exemplo, "quando se trata de cozinhar, ninguém supera minha mãe".

É usado para falar de habilidades e qualidades positivas.$$,
    $$É parecido com に関しては, mas にかけては é usado para destacar uma habilidade especial.

A segunda parte costuma ter expressões como 誰にも負けない ou 右に出る者はいない.$$,
    $$Substantivo (área / habilidade) + にかけては + Avaliação positiva$$,
    $$にかけては$$,
    $$にかけては|にかけても$$,
    ARRAY['に', 'かけて', 'は']::text[],
    ARRAY['にかけては', 'にかけても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-196', $$料理にかけては、母に勝てる人はいない。$$, $$りょうりにかけては、ははにかてるひとはいない。$$, $$Quando se trata de cozinhar, ninguém supera minha mãe.$$),
    ('n2-grammar-196', $$彼は数学にかけては、クラスで一番だ。$$, $$かれはすうがくにかけては、クラスでいちばんだ。$$, $$Em matéria de matemática, ele é o melhor da turma.$$),
    ('n2-grammar-196', $$速さにかけては、誰にも負けない。$$, $$はやさにかけては、だれにもまけない。$$, $$No que diz respeito à velocidade, não perco para ninguém.$$),
    ('n2-grammar-196', $$彼女は語学にかけては天才だ。$$, $$かのじょはごがくにかけてはてんさいだ。$$, $$Quando se trata de idiomas, ela é um gênio.$$),
    ('n2-grammar-196', $$この店はサービスの質にかけては、どこにも負けない。$$, $$このみせはサービスのしつにかけては、どこにもまけない。$$, $$Em matéria de qualidade de atendimento, esta loja não perde para nenhuma.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$歌____、彼の右に出る者はいない。$$, $$Quando se trata de cantar, ninguém é melhor que ele.$$),
        (2, $$パソコンの知識____、彼女が一番詳しい。$$, $$Em matéria de computadores, ela é quem mais entende.$$),
        (3, $$サッカー____、誰にも負けない自信がある。$$, $$Quando se trata de futebol, tenho certeza de que não perco para ninguém.$$),
        (4, $$記憶力____、祖父はすごい。$$, $$No que diz respeito à memória, meu avô é impressionante.$$),
        (5, $$この会社は技術力____、世界でトップクラスだ。$$, $$Em matéria de tecnologia, esta empresa está entre as melhores do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-196', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけては$$),
        (2, $$にかけては$$),
        (3, $$にかけては$$),
        (4, $$にかけては$$),
        (5, $$にかけては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
