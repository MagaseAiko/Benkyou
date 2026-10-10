-- n2-grammar-144 — それにしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-144',
    'grammar',
    'N2',
    $$それにしても$$,
    $$sore ni shite mo$$,
    $$Mesmo assim / Ainda assim / De qualquer forma$$,
    $$それにしても serve para mostrar que, mesmo aceitando o que foi dito, a pessoa ainda acha algo surpreendente, estranho ou exagerado. Equivale a "mesmo assim" ou "ainda assim".

Por exemplo, "sei que é verão, mas mesmo assim está quente demais".

Também é usado para mudar de assunto de forma natural, voltando a algo que estava na cabeça da pessoa, com o sentido de "de qualquer forma" ou "falando nisso".$$,
    $$É comum na fala, especialmente para expressar surpresa ou reclamação.

É parecido com それにしたって, que é mais coloquial.$$,
    $$Frase + それにしても、 + Opinião / Surpresa
それにしても、 + Novo assunto$$,
    $$それにしても$$,
    $$それにしても$$,
    ARRAY['それ', 'に', 'しても']::text[],
    ARRAY['それにしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-144', $$夏だとはいえ、それにしても暑すぎる。$$, $$なつだとはいえ、それにしてもあつすぎる。$$, $$Sei que é verão, mas mesmo assim está quente demais.$$),
    ('n2-grammar-144', $$忙しいのはわかるが、それにしても連絡が遅い。$$, $$いそがしいのはわかるが、それにしてもれんらくがおそい。$$, $$Entendo que esteja ocupado, mas ainda assim o contato está demorando.$$),
    ('n2-grammar-144', $$それにしても、彼はどこに行ったんだろう。$$, $$それにしても、かれはどこにいったんだろう。$$, $$De qualquer forma, para onde será que ele foi?$$),
    ('n2-grammar-144', $$安いと聞いていたけど、それにしても安いね。$$, $$やすいときいていたけど、それにしてもやすいね。$$, $$Tinha ouvido falar que era barato, mas mesmo assim é barato demais.$$),
    ('n2-grammar-144', $$それにしても、今日は人が多いね。$$, $$それにしても、きょうはひとがおおいね。$$, $$De qualquer forma, hoje tem muita gente, né?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供だから仕方ないけど、____うるさい。$$, $$É criança, então não tem jeito, mas mesmo assim é barulhento demais.$$),
        (2, $$____、あの映画は面白かったね。$$, $$De qualquer forma, aquele filme foi divertido, né?$$),
        (3, $$人気の店だとは聞いていたが、____すごい行列だ。$$, $$Tinha ouvido que era uma loja popular, mas ainda assim que fila enorme.$$),
        (4, $$初心者とはいえ、____ひどいミスだ。$$, $$Mesmo sendo iniciante, ainda assim é um erro feio.$$),
        (5, $$____、彼女はいつ帰ってくるのかな。$$, $$De qualquer forma, quando será que ela volta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それにしても$$),
        (2, $$それにしても$$),
        (3, $$それにしても$$),
        (4, $$それにしても$$),
        (5, $$それにしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
