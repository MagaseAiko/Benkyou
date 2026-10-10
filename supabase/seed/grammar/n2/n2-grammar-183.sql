-- n2-grammar-183 — 〜はともかく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-183',
    'grammar',
    'N2',
    $$〜はともかく$$,
    $$wa tomokaku$$,
    $$Deixando de lado / Independentemente de / Seja como for$$,
    $$はともかく indica que a pessoa deixa de lado um assunto, por enquanto, para falar de algo mais importante. Equivale a "deixando de lado" ou "independentemente de".

A primeira parte é algo que não importa tanto no momento, e a segunda é o ponto principal. Por exemplo, "o preço à parte, o design é ótimo".

A forma はともかくとして tem o mesmo sentido.$$,
    $$É parecido com はさておき e は別として.

Muitas vezes aparece com pares como 結果はともかく ou 見た目はともかく.$$,
    $$Substantivo + はともかく(として)、 + Frase principal
Frase + かどうか + はともかく$$,
    $$はともかく$$,
    $$はともかく$$,
    ARRAY['は', 'ともかく']::text[],
    ARRAY['はともかく', 'はともかくとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-183', $$値段はともかく、デザインがいい。$$, $$ねだんはともかく、デザインがいい。$$, $$Deixando o preço de lado, o design é ótimo.$$),
    ('n2-grammar-183', $$結果はともかく、よく頑張った。$$, $$けっかはともかく、よくがんばった。$$, $$Independentemente do resultado, você se esforçou muito.$$),
    ('n2-grammar-183', $$見た目はともかく、味はおいしい。$$, $$みためはともかく、あじはおいしい。$$, $$A aparência à parte, o sabor é gostoso.$$),
    ('n2-grammar-183', $$行くかどうかはともかくとして、話だけは聞いておこう。$$, $$いくかどうかはともかくとして、はなしだけはきいておこう。$$, $$Indo ou não, vamos pelo menos ouvir a proposta.$$),
    ('n2-grammar-183', $$冗談はともかく、本題に入りましょう。$$, $$じょうだんはともかく、ほんだいにはいりましょう。$$, $$Deixando as brincadeiras de lado, vamos ao assunto principal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勝ち負け____、楽しい試合だった。$$, $$Independentemente de ganhar ou perder, foi uma partida divertida.$$),
        (2, $$他の人____、私は反対だ。$$, $$Os outros eu não sei, mas eu sou contra.$$),
        (3, $$昼____、夜は寒くなる。$$, $$De dia nem tanto, mas à noite esfria.$$),
        (4, $$費用____、まず計画を立てよう。$$, $$Deixando os custos de lado, vamos primeiro fazer um plano.$$),
        (5, $$できるかどうか____、やってみることが大切だ。$$, $$Conseguindo ou não, o importante é tentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はともかく$$),
        (1, $$はともかくとして$$),
        (2, $$はともかく$$),
        (2, $$はともかくとして$$),
        (3, $$はともかく$$),
        (3, $$はともかくとして$$),
        (4, $$はともかく$$),
        (4, $$はともかくとして$$),
        (5, $$はともかく$$),
        (5, $$はともかくとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
