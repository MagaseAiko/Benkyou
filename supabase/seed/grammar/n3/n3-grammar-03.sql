-- n3-grammar-03 — あまりにも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-03',
    'grammar',
    'N3',
    $$あまりにも$$,
    $$amari ni mo$$,
    $$Demais / Excessivamente / Tão... que$$,
    $$あまりにも é um advérbio que indica que algo está além do normal, em um grau excessivo. Equivale a "demais", "excessivamente" ou "tão... que".

Ele vem antes de adjetivos e de outras expressões de grau, intensificando-as muito. Muitas vezes, a frase continua mostrando a consequência desse excesso, como não conseguir comprar algo caro demais.

O tom costuma ser de surpresa, crítica ou espanto, mas também pode expressar admiração, como uma paisagem tão bonita que deixa a pessoa sem palavras.

A forma あまりに, sem も, tem o mesmo sentido e é um pouco menos enfática.$$,
    $$あまりにも é mais forte que とても. とても é neutro ("muito"); あまりにも indica que passou do ponto.

Também pode aparecer com verbos que indicam grau, como あまりにも違う (é diferente demais).

Na fala, あまりにも pode soar dramático, por isso aparece muito em reclamações e reações de surpresa.$$,
    $$あまりにも + Adjetivo
あまりにも + Adjetivo + て、 + Consequência
あまりにも + Substantivo / Adjetivo な + だ

Variação: あまりに$$,
    $$あまりにも$$,
    $$あまりにも|あまりに$$,
    ARRAY['あまりにも']::text[],
    ARRAY['あまりにも', 'あまりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-03', $$この問題はあまりにも難しい。$$, $$このもんだいはあまりにもむずかしい。$$, $$Esta questão é difícil demais.$$),
    ('n3-grammar-03', $$値段があまりにも高くて、買えなかった。$$, $$ねだんがあまりにもたかくて、かえなかった。$$, $$O preço era alto demais, e não consegui comprar.$$),
    ('n3-grammar-03', $$あまりにも疲れていて、すぐ寝てしまった。$$, $$あまりにもつかれていて、すぐねてしまった。$$, $$Estava tão cansado que dormi na hora.$$),
    ('n3-grammar-03', $$彼の話はあまりにもおかしくて、みんな笑った。$$, $$かれのはなしはあまりにもおかしくて、みんなわらった。$$, $$A história dele era tão engraçada que todos riram.$$),
    ('n3-grammar-03', $$その知らせはあまりにも突然だった。$$, $$そのしらせはあまりにもとつぜんだった。$$, $$Essa notícia foi repentina demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は____暑くて、外に出たくない。$$, $$Hoje está quente demais, não quero sair.$$),
        (2, $$宿題が____多くて、終わらない。$$, $$A lição é tanta que não termina.$$),
        (3, $$山の上の景色が____きれいで、言葉が出なかった。$$, $$A paisagem no alto da montanha era tão bonita que fiquei sem palavras.$$),
        (4, $$客に対する彼の態度は____失礼だ。$$, $$A atitude dele com os clientes é mal-educada demais.$$),
        (5, $$その映画が____悲しくて、泣いてしまった。$$, $$Esse filme era tão triste que acabei chorando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまりにも$$),
        (1, $$あまりに$$),
        (2, $$あまりにも$$),
        (2, $$あまりに$$),
        (3, $$あまりにも$$),
        (3, $$あまりに$$),
        (4, $$あまりにも$$),
        (4, $$あまりに$$),
        (5, $$あまりにも$$),
        (5, $$あまりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
