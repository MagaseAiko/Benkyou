-- n1-grammar-148 — 〜を限りに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-148',
    'grammar',
    'N1',
    $$〜を限りに$$,
    $$wo kagiri ni$$,
    $$A partir de / Até / Com... como último$$,
    $$を限りに indica que algo termina em um determinado momento, e depois disso não continua mais. Equivale a "a partir de... não mais" ou "até".

Costuma vir com palavras de tempo, como hoje, este mês ou este ano. Por exemplo, "com o dia de hoje, paro de fumar".

Também aparece em 声を限りに, que significa "com toda a força da voz".$$,
    $$Expressões comuns são 今日を限りに, 今回を限りに e 本日を限りに.

É parecido com をもって, que também é formal.$$,
    $$Substantivo (tempo) + を限りに
声を限りに + Verbo$$,
    $$を限りに$$,
    $$を限りに|をかぎりに$$,
    ARRAY['を', '限り', 'に']::text[],
    ARRAY['を限りに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-148', $$今日を限りに、たばこをやめる。$$, $$きょうをかぎりに、たばこをやめる。$$, $$Com o dia de hoje, paro de fumar.$$),
    ('n1-grammar-148', $$今月を限りに、この店は閉店します。$$, $$こんげつをかぎりに、このみせはへいてんします。$$, $$Esta loja fecha ao fim deste mês.$$),
    ('n1-grammar-148', $$彼は今シーズンを限りに引退する。$$, $$かれはこんシーズンをかぎりにいんたいする。$$, $$Ele vai se aposentar com o fim desta temporada.$$),
    ('n1-grammar-148', $$声を限りに助けを求めた。$$, $$こえをかぎりにたすけをもとめた。$$, $$Pediu socorro com toda a força da voz.$$),
    ('n1-grammar-148', $$今回を限りに、もう二度と遅刻しません。$$, $$こんかいをかぎりに、もうにどとちこくしません。$$, $$A partir de agora, nunca mais vou me atrasar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$本日____、このサービスは終了いたします。$$, $$Com o dia de hoje, este serviço será encerrado.$$),
        (2, $$今年____、この大会は中止になる。$$, $$Este campeonato será encerrado com o fim deste ano.$$),
        (3, $$子供たちは声____応援した。$$, $$As crianças torceram com toda a força da voz.$$),
        (4, $$今夜____、お酒をやめることにした。$$, $$Decidi parar de beber a partir desta noite.$$),
        (5, $$この試合____、彼はチームを去る。$$, $$Com esta partida, ele deixa o time.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-148', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を限りに$$),
        (1, $$をかぎりに$$),
        (2, $$を限りに$$),
        (2, $$をかぎりに$$),
        (3, $$を限りに$$),
        (3, $$をかぎりに$$),
        (4, $$を限りに$$),
        (4, $$をかぎりに$$),
        (5, $$を限りに$$),
        (5, $$をかぎりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
