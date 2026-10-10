-- n3-grammar-126 — 〜てはじめて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-126',
    'grammar',
    'N3',
    $$〜てはじめて$$,
    $$te hajimete$$,
    $$Só depois de / Somente quando$$,
    $$てはじめて é usado para dizer que só depois de uma experiência a pessoa percebeu, entendeu ou conseguiu algo. Equivale a "só depois de" ou "somente quando".

Ele junta a forma て do verbo com はじめて (pela primeira vez). A ideia é que, antes daquela experiência, a pessoa não tinha percebido aquilo.

Muitas vezes, a frase expressa uma reflexão ou um aprendizado de vida. Por exemplo, "só depois de ficar doente entendi a importância da saúde" ou "só quando me tornei pai entendi os sentimentos dos meus pais".

A segunda parte costuma ter verbos como わかる, 気づく, 知る e 実感する.$$,
    $$A segunda parte não costuma ser uma vontade ou um pedido. Ela descreve algo que a pessoa passou a entender ou conseguir.

É muito comum em redações e discursos sobre experiências pessoais.

A ideia de "só depois de perder, se dá valor" aparece com frequência, como em 失って初めて.$$,
    $$Verbo na forma て + はじめて、 + Percepção / Compreensão
Verbo na forma て + はじめて + Verbo potencial

Escrita: てはじめて / て初めて$$,
    $$てはじめて$$,
    $$てはじめて|て初めて|ではじめて|で初めて$$,
    ARRAY['て', 'はじめて']::text[],
    ARRAY['てはじめて', 'て初めて', 'ではじめて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-126', $$病気になってはじめて、健康の大切さがわかった。$$, $$びょうきになってはじめて、けんこうのたいせつさがわかった。$$, $$Só depois de ficar doente entendi a importância da saúde.$$),
    ('n3-grammar-126', $$親になってはじめて、親の気持ちがわかった。$$, $$おやになってはじめて、おやのきもちがわかった。$$, $$Só quando me tornei pai entendi os sentimentos dos meus pais.$$),
    ('n3-grammar-126', $$外国に住んではじめて、自分の国のよさに気づいた。$$, $$がいこくにすんではじめて、じぶんのくにのよさにきづいた。$$, $$Só depois de morar no exterior percebi as qualidades do meu país.$$),
    ('n3-grammar-126', $$実際にやってみてはじめて、難しさがわかる。$$, $$じっさいにやってみてはじめて、むずかしさがわかる。$$, $$Só quando se tenta de verdade é que se entende a dificuldade.$$),
    ('n3-grammar-126', $$失って初めて、その大切さを知った。$$, $$うしなってはじめて、そのたいせつさをしった。$$, $$Só depois de perder conheci o valor daquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしをし____、家族のありがたさがわかった。$$, $$Só depois de morar sozinho entendi o valor da família.$$),
        (2, $$働い____、お金の大切さを知った。$$, $$Só depois de trabalhar conheci o valor do dinheiro.$$),
        (3, $$自分で料理を作っ____、母の苦労がわかった。$$, $$Só quando cozinhei sozinho entendi o esforço da minha mãe.$$),
        (4, $$日本に来____、日本の文化をよく知った。$$, $$Só depois de vir ao Japão conheci bem a cultura japonesa.$$),
        (5, $$ゆっくり話し合っ____、彼の考えがわかった。$$, $$Só depois de conversar com calma entendi o que ele pensava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはじめて$$),
        (1, $$て初めて$$),
        (2, $$てはじめて$$),
        (2, $$て初めて$$),
        (3, $$てはじめて$$),
        (3, $$て初めて$$),
        (4, $$てはじめて$$),
        (4, $$て初めて$$),
        (5, $$てはじめて$$),
        (5, $$て初めて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
