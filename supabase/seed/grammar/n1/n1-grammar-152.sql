-- n1-grammar-152 — 〜を禁じ得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-152',
    'grammar',
    'N1',
    $$〜を禁じ得ない$$,
    $$wo kinjienai$$,
    $$Não conseguir conter / Não poder deixar de sentir / Ser impossível evitar$$,
    $$を禁じ得ない indica que a pessoa não consegue controlar um sentimento forte que surge naturalmente. Equivale a "não conseguir conter" ou "não poder deixar de sentir".

Costuma vir com palavras de emoção, como raiva, lágrimas, surpresa, simpatia ou indignação. Por exemplo, "não consegui conter as lágrimas".

É uma expressão muito formal, usada em discursos e textos.$$,
    $$Expressões comuns são 涙を禁じ得ない, 怒りを禁じ得ない, 同情を禁じ得ない e 驚きを禁じ得ない.

É mais formal que ずにはいられない.$$,
    $$Substantivo (sentimento) + を禁じ得ない$$,
    $$を禁じ得ない$$,
    $$を禁じ得ない|を禁じえない|を禁じ得なかった|を禁じ得ません$$,
    ARRAY['を', '禁じ得ない']::text[],
    ARRAY['を禁じ得ない', 'を禁じ得なかった', 'を禁じ得ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-152', $$被害者の話を聞いて、涙を禁じ得なかった。$$, $$ひがいしゃのはなしをきいて、なみだをきんじえなかった。$$, $$Ouvindo a história da vítima, não consegui conter as lágrimas.$$),
    ('n1-grammar-152', $$政府の対応には、怒りを禁じ得ない。$$, $$せいふのたいおうには、いかりをきんじえない。$$, $$Não consigo conter a raiva diante da resposta do governo.$$),
    ('n1-grammar-152', $$彼の不幸には、同情を禁じ得ない。$$, $$かれのふこうには、どうじょうをきんじえない。$$, $$Não posso deixar de sentir pena da desgraça dele.$$),
    ('n1-grammar-152', $$その結果には、驚きを禁じ得ません。$$, $$そのけっかには、おどろきをきんじえません。$$, $$É impossível não se surpreender com esse resultado.$$),
    ('n1-grammar-152', $$事件の真相を知り、憤りを禁じ得なかった。$$, $$じけんのしんそうをしり、いきどおりをきんじえなかった。$$, $$Ao saber a verdade do caso, não consegui conter a indignação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の努力には、感動____。$$, $$Não consigo deixar de me emocionar com o esforço dela.$$),
        (2, $$この判決には、疑問____。$$, $$Não posso deixar de questionar esta sentença.$$),
        (3, $$戦争の写真を見て、悲しみ____。$$, $$Vendo as fotos da guerra, não consegui conter a tristeza.$$),
        (4, $$あまりの無責任さに、失望____。$$, $$Não posso deixar de me decepcionar com tamanha irresponsabilidade.$$),
        (5, $$子供たちの笑顔に、喜び____。$$, $$Não consigo conter a alegria com o sorriso das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を禁じ得ない$$),
        (1, $$を禁じえない$$),
        (1, $$を禁じ得ません$$),
        (2, $$を禁じ得ない$$),
        (2, $$を禁じえない$$),
        (2, $$を禁じ得ません$$),
        (3, $$を禁じ得なかった$$),
        (4, $$を禁じ得ない$$),
        (4, $$を禁じえない$$),
        (4, $$を禁じ得ません$$),
        (5, $$を禁じ得ない$$),
        (5, $$を禁じえない$$),
        (5, $$を禁じ得ません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
