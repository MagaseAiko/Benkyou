-- n1-grammar-201 — 〜といい〜といい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-201',
    'grammar',
    'N1',
    $$〜といい〜といい$$,
    $$to ii ~ to ii$$,
    $$Tanto... quanto / Seja... seja / Em todos os aspectos$$,
    $$といい〜といい serve para dar dois exemplos e mostrar que, em todos os aspectos, a avaliação é a mesma. Equivale a "tanto... quanto" ou "seja... seja".

A pessoa avalia algo de forma geral, destacando dois pontos. Pode ser elogio ou crítica. Por exemplo, "tanto o sabor quanto o preço, este restaurante é perfeito".

É uma expressão um pouco formal.$$,
    $$A avaliação no final vale para o todo, não só para os dois exemplos.

É parecido com も〜も, mas といい〜といい destaca que os exemplos representam o conjunto.$$,
    $$Substantivo + といい + Substantivo + といい + Avaliação$$,
    $$といい〜といい$$,
    $$といい$$,
    ARRAY['と', 'いい']::text[],
    ARRAY['といい〜といい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-201', $$味といい値段といい、この店は最高だ。$$, $$あじといいねだんといい、このみせはさいこうだ。$$, $$Tanto no sabor quanto no preço, esta loja é excelente.$$),
    ('n1-grammar-201', $$デザインといい色といい、このドレスは素敵だ。$$, $$デザインといいいろといい、このドレスはすてきだ。$$, $$Seja no design, seja na cor, este vestido é lindo.$$),
    ('n1-grammar-201', $$顔といい声といい、彼は父親にそっくりだ。$$, $$かおといいこえといい、かれはちちおやにそっくりだ。$$, $$Tanto no rosto quanto na voz, ele é igualzinho ao pai.$$),
    ('n1-grammar-201', $$態度といい言葉遣いといい、彼は失礼だ。$$, $$たいどといいことばづかいといい、かれはしつれいだ。$$, $$Tanto na atitude quanto no jeito de falar, ele é mal-educado.$$),
    ('n1-grammar-201', $$景色といい料理といい、この旅館は文句なしだ。$$, $$けしきといいりょうりといい、このりょかんはもんくなしだ。$$, $$Seja pela paisagem, seja pela comida, esta pousada é impecável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$性格____能力といい、彼女はリーダーにふさわしい。$$, $$Tanto pela personalidade quanto pela capacidade, ela é adequada para ser líder.$$),
        (2, $$この部屋は広さといい明るさ____、申し分ない。$$, $$Tanto no tamanho quanto na luminosidade, este quarto é impecável.$$),
        (3, $$服装____髪型といい、彼は目立つ。$$, $$Seja pela roupa, seja pelo cabelo, ele chama a atenção.$$),
        (4, $$ストーリーといい演技____、素晴らしい映画だった。$$, $$Tanto na história quanto na atuação, foi um filme excelente.$$),
        (5, $$天気____会場といい、最高のイベントになった。$$, $$Tanto pelo tempo quanto pelo local, o evento foi excelente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-201', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といい$$),
        (2, $$といい$$),
        (3, $$といい$$),
        (4, $$といい$$),
        (5, $$といい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
