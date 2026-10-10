-- n5-grammar-04 — 〜だろう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-04',
    'grammar',
    'N5',
    $$〜だろう$$,
    $$darou$$,
    $$Provavelmente / Deve ser / Acho que / Não é?$$,
    $$だろう é usado quando a pessoa fala de algo que ela acredita ser verdade, mas sem ter certeza absoluta. É uma suposição: "provavelmente", "deve ser".

Ele fica no final da frase e funciona com verbos, adjetivos e substantivos. É a versão simples e informal de でしょう. Por isso aparece muito em conversas entre amigos, em pensamentos e em textos neutros, como notícias escritas e redações.

Além da suposição, だろう também pode ser usado com entonação de pergunta para pedir confirmação, como "não é?" ou "eu não disse?". Nesse uso, quem fala espera que o outro concorde.

Na fala, esse uso de confirmação é comum principalmente entre homens. Em situações educadas, o normal é usar でしょう.$$,
    $$É muito comum combinar だろう com たぶん ou きっと, que reforçam o grau de certeza da suposição.

A expressão だろうと思う é uma forma natural de dar opinião com um pouco de cautela.

A forma reduzida だろ soa bem informal e, às vezes, até um pouco brusca. Evite com pessoas mais velhas ou desconhecidos.

Com substantivos e adjetivos な, não se usa だ antes de だろう: diz-se 学生だろう, nunca 学生だだろう.$$,
    $$Verbo na forma simples + だろう
Verbo na forma ない + だろう
Verbo na forma た + だろう
Adjetivo い + だろう
Adjetivo な (sem な) + だろう
Substantivo + だろう

Forma educada: でしょう
Forma reduzida na fala: だろ$$,
    $$だろう$$,
    $$だろう|だろ$$,
    ARRAY['だろう']::text[],
    ARRAY['だろう', 'だろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-04', $$明日は雨が降るだろう。$$, $$あしたはあめがふるだろう。$$, $$Amanhã provavelmente vai chover.$$),
    ('n5-grammar-04', $$田中さんはもう家に帰っただろう。$$, $$たなかさんはもういえにかえっただろう。$$, $$O Tanaka já deve ter voltado para casa.$$),
    ('n5-grammar-04', $$この問題は難しくないだろう。$$, $$このもんだいはむずかしくないだろう。$$, $$Esta questão provavelmente não é difícil.$$),
    ('n5-grammar-04', $$あの店は高いだろうと思います。$$, $$あのみせはたかいだろうとおもいます。$$, $$Acho que aquela loja deve ser cara.$$),
    ('n5-grammar-04', $$ほら、言っただろう。$$, $$ほら、いっただろう。$$, $$Viu? Eu não te disse?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今夜は寒くなる____。$$, $$Hoje à noite provavelmente vai esfriar.$$),
        (2, $$彼はたぶん来ない____。$$, $$Ele provavelmente não vem.$$),
        (3, $$あの人は学生____。$$, $$Aquela pessoa deve ser estudante.$$),
        (4, $$駅まで歩いて十分ぐらい____と思う。$$, $$Acho que até a estação deve dar uns dez minutos a pé.$$),
        (5, $$宿題、もう終わった____？$$, $$Você já terminou a lição, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だろう$$),
        (2, $$だろう$$),
        (3, $$だろう$$),
        (4, $$だろう$$),
        (5, $$だろう$$),
        (5, $$だろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
