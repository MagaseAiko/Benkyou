-- n3-grammar-163 — 〜は別として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-163',
    'grammar',
    'N3',
    $$〜は別として$$,
    $$wa betsu to shite$$,
    $$Deixando de lado / Sem contar / Independentemente de$$,
    $$は別として é usado para deixar de lado um aspecto da questão, para focar em outro. Equivale a "deixando de lado", "sem contar" ou "independentemente de".

A primeira parte indica o que não vai ser considerado agora (o preço, o resultado, os gostos pessoais). A segunda parte traz o ponto principal. Por exemplo, "deixando o preço de lado, o design é bom" ou "independentemente do resultado, você se esforçou muito".

Também é comum com かどうか ou palavras interrogativas: "se ele vem ou não, à parte, vamos nos preparar".

A forma は別にして tem o mesmo sentido.$$,
    $$は別として é parecido com はともかく (N2), que também deixa algo de lado. はともかく soa um pouco mais casual.

Com pessoas, 〜は別として significa "exceto fulano": 専門家は別として ("a não ser os especialistas").

É útil para avaliar algo de forma justa, separando os aspectos.$$,
    $$Substantivo + は別として、 + Ponto principal
Frase + かどうか + は別として、 + …
Palavra interrogativa + … + か + は別として

Variação: は別にして$$,
    $$は別として$$,
    $$は別として|は別にして|はべつとして$$,
    ARRAY['は', '別', 'として']::text[],
    ARRAY['は別として', 'は別にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-163', $$値段は別として、このデザインはいい。$$, $$ねだんはべつとして、このデザインはいい。$$, $$Deixando o preço de lado, este design é bom.$$),
    ('n3-grammar-163', $$結果は別として、よく頑張った。$$, $$けっかはべつとして、よくがんばった。$$, $$Independentemente do resultado, você se esforçou muito.$$),
    ('n3-grammar-163', $$好き嫌いは別として、栄養のために食べなさい。$$, $$すききらいはべつとして、えいようのためにたべなさい。$$, $$Gostando ou não, coma pela nutrição.$$),
    ('n3-grammar-163', $$冗談は別として、本当にありがとう。$$, $$じょうだんはべつとして、ほんとうにありがとう。$$, $$Brincadeiras à parte, muito obrigado mesmo.$$),
    ('n3-grammar-163', $$彼が来るかどうかは別として、準備をしておこう。$$, $$かれがくるかどうかはべつとして、じゅんびをしておこう。$$, $$Se ele vem ou não, à parte, vamos deixar tudo preparado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$味____、この店は雰囲気がいい。$$, $$Deixando o sabor de lado, esta loja tem um ambiente bom.$$),
        (2, $$勝ち負け____、楽しい試合だった。$$, $$Ganhando ou perdendo, foi uma partida divertida.$$),
        (3, $$上手か下手か____、彼はいつも楽しそうに歌う。$$, $$Bem ou mal, ele sempre canta parecendo se divertir.$$),
        (4, $$費用____、まず旅行の計画を立てよう。$$, $$Deixando os custos de lado, vamos primeiro planejar a viagem.$$),
        (5, $$専門家____、一般の人には難しい内容だ。$$, $$A não ser os especialistas, é um conteúdo difícil para o público em geral.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は別として$$),
        (1, $$は別にして$$),
        (2, $$は別として$$),
        (2, $$は別にして$$),
        (3, $$は別として$$),
        (3, $$は別にして$$),
        (4, $$は別として$$),
        (4, $$は別にして$$),
        (5, $$は別として$$),
        (5, $$は別にして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
