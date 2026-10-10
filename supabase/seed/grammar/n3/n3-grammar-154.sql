-- n3-grammar-154 — つい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-154',
    'grammar',
    'N3',
    $$つい$$,
    $$tsui$$,
    $$Sem querer / Acabar fazendo / Por impulso$$,
    $$つい é um advérbio que indica que a pessoa fez algo sem querer, por impulso, mesmo sabendo que não deveria. Equivale a "sem querer", "acabar fazendo" ou "por impulso".

Ele quase sempre aparece junto com てしまう, que reforça a ideia de algo feito sem controle ou com arrependimento.

Por exemplo, "estava tão gostoso que acabei comendo demais" ou "estava barato e comprei por impulso".

É muito usado para hábitos que a pessoa tenta evitar, mas não consegue, como ficar acordado até tarde, gastar demais ou falar o que não devia.$$,
    $$つい também aparece em つい先日 ("outro dia mesmo") e つい今 ("agora há pouco"), com sentido de tempo bem recente. É um uso diferente.

つい é parecido com 思わず (sem pensar), mas つい destaca mais a falta de autocontrole ou o hábito.

É uma forma natural de se justificar com leveza: "acabei fazendo, não resisti".$$,
    $$つい + Verbo na forma て + しまう
つい + Verbo na forma て + しまった (passado)$$,
    $$つい$$,
    $$つい$$,
    ARRAY['つい']::text[],
    ARRAY['つい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-154', $$おいしくて、つい食べすぎてしまった。$$, $$おいしくて、ついたべすぎてしまった。$$, $$Estava tão gostoso que acabei comendo demais.$$),
    ('n3-grammar-154', $$つい本当のことを言ってしまった。$$, $$ついほんとうのことをいってしまった。$$, $$Sem querer, acabei dizendo a verdade.$$),
    ('n3-grammar-154', $$面白くて、つい夜遅くまでテレビを見てしまう。$$, $$おもしろくて、ついよるおそくまでテレビをみてしまう。$$, $$É tão interessante que acabo vendo TV até tarde da noite.$$),
    ('n3-grammar-154', $$安かったので、つい買ってしまった。$$, $$やすかったので、ついかってしまった。$$, $$Estava barato e acabei comprando por impulso.$$),
    ('n3-grammar-154', $$つい昔の癖が出てしまった。$$, $$ついむかしのくせがでてしまった。$$, $$Sem querer, voltei ao meu velho hábito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れていて、電車で____寝てしまった。$$, $$Estava cansado e acabei dormindo no trem sem querer.$$),
        (2, $$腹が立って、____大きな声を出した。$$, $$Fiquei irritado e, sem querer, levantei a voz.$$),
        (3, $$ダイエット中なのに、____ケーキを食べてしまった。$$, $$Estou de dieta, mas acabei comendo bolo.$$),
        (4, $$友達との話が楽しくて、____時間を忘れてしまった。$$, $$A conversa com os amigos estava tão boa que acabei perdendo a noção do tempo.$$),
        (5, $$スマホを見ていて、____駅を乗り過ごしてしまった。$$, $$Estava olhando o celular e acabei passando da minha estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つい$$),
        (2, $$つい$$),
        (3, $$つい$$),
        (4, $$つい$$),
        (5, $$つい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
