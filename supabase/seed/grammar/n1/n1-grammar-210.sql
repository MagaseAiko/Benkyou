-- n1-grammar-210 — 〜ときている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-210',
    'grammar',
    'N1',
    $$〜ときている$$,
    $$to kite iru$$,
    $$E ainda por cima / E para completar / Sendo ainda$$,
    $$ときている apresenta uma característica especial que, somada a outras, leva a uma conclusão. Equivale a "e ainda por cima" ou "e para completar".

Pode ser usado para elogiar ou criticar. Por exemplo, "o restaurante é gostoso e ainda por cima barato, então vive cheio".

É uma expressão coloquial e enfática.$$,
    $$A segunda parte costuma ser uma conclusão natural, como 人気があるのも当然だ.

Na fala, aparece como ときてる.$$,
    $$Frase (forma simples) + ときている
Substantivo / Adjetivo な + ときている$$,
    $$ときている$$,
    $$ときている|ときてる|ときています$$,
    ARRAY['と', 'きて', 'いる']::text[],
    ARRAY['ときている', 'ときてる', 'ときています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-210', $$この店は安くておいしいときているから、いつも混んでいる。$$, $$このみせはやすくておいしいときているから、いつもこんでいる。$$, $$Esta loja é barata e ainda por cima gostosa, então vive cheia.$$),
    ('n1-grammar-210', $$彼は頭がよくて、ハンサムときている。もてるのも当然だ。$$, $$かれはあたまがよくて、ハンサムときている。もてるのもとうぜんだ。$$, $$Ele é inteligente e ainda por cima bonito. É natural que faça sucesso.$$),
    ('n1-grammar-210', $$給料は安いし、残業も多いときている。辞めたくなるよ。$$, $$きゅうりょうはやすいし、ざんぎょうもおおいときている。やめたくなるよ。$$, $$O salário é baixo e ainda por cima tem muita hora extra. Dá vontade de sair.$$),
    ('n1-grammar-210', $$この部屋は狭いうえに、駅から遠いときている。$$, $$このへやはせまいうえに、えきからとおいときている。$$, $$Este quarto é pequeno e, para completar, longe da estação.$$),
    ('n1-grammar-210', $$あの子はかわいくて、性格もいいときてる。$$, $$あのこはかわいくて、せいかくもいいときてる。$$, $$Essa menina é bonita e ainda por cima tem um ótimo caráter.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は燃費がよくて、値段も安い____。$$, $$Este carro é econômico e ainda por cima barato.$$),
        (2, $$雨が降っているうえに、風も強い____。$$, $$Está chovendo e, para completar, o vento está forte.$$),
        (3, $$彼女は美人で、料理も上手____。$$, $$Ela é bonita e ainda por cima cozinha bem.$$),
        (4, $$この仕事はきついうえに、給料も安い____。$$, $$Este trabalho é pesado e, para completar, o salário é baixo.$$),
        (5, $$あのホテルは景色がよくて、温泉もある____。$$, $$Aquele hotel tem uma vista bonita e ainda por cima tem fonte termal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-210', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ときている$$),
        (1, $$ときてる$$),
        (2, $$ときている$$),
        (2, $$ときてる$$),
        (3, $$ときている$$),
        (3, $$ときてる$$),
        (4, $$ときている$$),
        (4, $$ときてる$$),
        (5, $$ときている$$),
        (5, $$ときてる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
