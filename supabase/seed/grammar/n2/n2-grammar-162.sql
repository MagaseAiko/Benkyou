-- n2-grammar-162 — 〜てはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-162',
    'grammar',
    'N2',
    $$〜てはいられない$$,
    $$te wa irarenai$$,
    $$Não dá para ficar / Não posso continuar / Não há tempo para$$,
    $$てはいられない indica que a pessoa não pode continuar em um estado ou fazendo algo, por causa da situação. Equivale a "não dá para ficar..." ou "não posso continuar...".

Muitas vezes há uma urgência ou um motivo que obriga a pessoa a mudar de atitude. Por exemplo, "o prazo está chegando, não dá para ficar parado".

Mostra a vontade de agir ou a pressão da situação.$$,
    $$Uma expressão comum é じっとしてはいられない, "não dá para ficar parado".

É parecido com てばかりはいられない, que destaca que a pessoa só fazia aquilo.

Na fala, aparece como てらんない.$$,
    $$Verbo (forma て) + はいられない
Verbo (forma て) + もいられない$$,
    $$てはいられない$$,
    $$てはいられない|ではいられない|てもいられない|てはいられません|ではいられません$$,
    ARRAY['て', 'は', 'いられない']::text[],
    ARRAY['てはいられない', 'ではいられない', 'てもいられない', 'てはいられません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-162', $$締め切りが近いので、休んではいられない。$$, $$しめきりがちかいので、やすんではいられない。$$, $$O prazo está chegando, não dá para ficar descansando.$$),
    ('n2-grammar-162', $$子供が病気なのに、じっとしてはいられない。$$, $$こどもがびょうきなのに、じっとしてはいられない。$$, $$Meu filho está doente, não dá para ficar parado.$$),
    ('n2-grammar-162', $$もう時間がないから、迷ってはいられない。$$, $$もうじかんがないから、まよってはいられない。$$, $$Já não há tempo, não dá para ficar hesitando.$$),
    ('n2-grammar-162', $$こんなところで負けてはいられません。$$, $$こんなところでまけてはいられません。$$, $$Não posso perder num lugar como este.$$),
    ('n2-grammar-162', $$心配で、いてもたってもいられない。$$, $$しんぱいで、いてもたってもいられない。$$, $$Estou tão preocupado que não consigo ficar quieto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試合は明日だ。のんびりし____。$$, $$A partida é amanhã. Não dá para ficar de bobeira.$$),
        (2, $$みんなが頑張っているのに、私だけ寝____。$$, $$Todos estão se esforçando, não dá para só eu ficar dormindo.$$),
        (3, $$もう大人なのだから、親に甘え____。$$, $$Já sou adulto, então não dá para continuar dependendo dos meus pais.$$),
        (4, $$ライバルが追いついてきた。止まっ____。$$, $$O rival está alcançando. Não dá para parar.$$),
        (5, $$こんなに忙しいときに、遊ん____。$$, $$Num momento tão corrido, não dá para ficar brincando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはいられない$$),
        (1, $$てはいられません$$),
        (2, $$てはいられない$$),
        (2, $$てはいられません$$),
        (3, $$てはいられない$$),
        (3, $$てはいられません$$),
        (4, $$てはいられない$$),
        (4, $$てはいられません$$),
        (5, $$ではいられない$$),
        (5, $$ではいられません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
