-- n2-grammar-141 — その上
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-141',
    'grammar',
    'N2',
    $$その上$$,
    $$sono ue$$,
    $$Além disso / Ainda por cima / Somado a isso$$,
    $$その上 serve para acrescentar uma informação a algo que já foi dito. Equivale a "além disso" ou "ainda por cima".

As duas informações costumam ter o mesmo sentido, ambas boas ou ambas ruins. Por exemplo, "o quarto é espaçoso e, além disso, tem uma vista linda".

É um pouco mais formal que それに e おまけに.$$,
    $$É parecido com しかも, mas その上 é mais usado para somar informações do mesmo tipo.

Na escrita, também aparece como そのうえ, em hiragana.$$,
    $$Frase (com ponto final) + その上 + Frase
Frase + て / で、その上 + Frase$$,
    $$その上$$,
    $$その上|そのうえ$$,
    ARRAY['その', '上']::text[],
    ARRAY['その上', 'そのうえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-141', $$この部屋は広い。その上、景色もきれいだ。$$, $$このへやはひろい。そのうえ、けしきもきれいだ。$$, $$Este quarto é espaçoso. Além disso, a vista é linda.$$),
    ('n2-grammar-141', $$道に迷って、その上雨まで降ってきた。$$, $$みちにまよって、そのうえあめまでふってきた。$$, $$Me perdi e, ainda por cima, começou a chover.$$),
    ('n2-grammar-141', $$彼は親切で、その上とても面白い。$$, $$かれはしんせつで、そのうえとてもおもしろい。$$, $$Ele é gentil e, além disso, muito engraçado.$$),
    ('n2-grammar-141', $$給料が安い。その上、残業も多い。$$, $$きゅうりょうがやすい。そのうえ、ざんぎょうもおおい。$$, $$O salário é baixo. Além disso, há muita hora extra.$$),
    ('n2-grammar-141', $$ごちそうになって、その上お土産までもらった。$$, $$ごちそうになって、そのうえおみやげまでもらった。$$, $$Me ofereceram um banquete e, ainda por cima, ganhei um presente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は燃費がいい。____、デザインもいい。$$, $$Este carro é econômico. Além disso, o design é bonito.$$),
        (2, $$風邪をひいて、____熱も出た。$$, $$Peguei um resfriado e, ainda por cima, tive febre.$$),
        (3, $$彼女は頭がいい。____、努力家だ。$$, $$Ela é inteligente. Além disso, é muito esforçada.$$),
        (4, $$この店は安くて、____店員も親切だ。$$, $$Esta loja é barata e, além disso, os atendentes são gentis.$$),
        (5, $$仕事をなくした。____、家賃も払えない。$$, $$Perdi o emprego. Ainda por cima, não consigo pagar o aluguel.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$その上$$),
        (1, $$そのうえ$$),
        (2, $$その上$$),
        (2, $$そのうえ$$),
        (3, $$その上$$),
        (3, $$そのうえ$$),
        (4, $$その上$$),
        (4, $$そのうえ$$),
        (5, $$その上$$),
        (5, $$そのうえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
