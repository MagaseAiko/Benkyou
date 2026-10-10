-- n1-grammar-248 — 〜ずじまい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-248',
    'grammar',
    'N1',
    $$〜ずじまい$$,
    $$zu jimai$$,
    $$Acabar não / Ficar sem / Nunca chegar a$$,
    $$ずじまい indica que a pessoa queria fazer algo, mas no fim acabou não fazendo, e a oportunidade passou. Equivale a "acabar não..." ou "nunca chegar a".

Muitas vezes há arrependimento. Por exemplo, "fui a Kyoto, mas acabei não visitando o templo" ou "nunca cheguei a dizer o que sentia".

A forma ずじまいだ ou ずじまいになる é a mais comum.$$,
    $$Atenção à forma de する, que vira せずじまい.

É parecido com ないままだった, mas ずじまい destaca o arrependimento.$$,
    $$Verbo (forma ない sem ない) + ずじまい
する → せずじまい$$,
    $$ずじまい$$,
    $$ずじまい$$,
    ARRAY['ず', 'じまい']::text[],
    ARRAY['ずじまい', 'ずじまいだ', 'ずじまいになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-248', $$京都に行ったのに、金閣寺は見ずじまいだった。$$, $$きょうとにいったのに、きんかくじはみずじまいだった。$$, $$Fui a Kyoto, mas acabei não vendo o Kinkaku-ji.$$),
    ('n1-grammar-248', $$彼女に気持ちを伝えずじまいだった。$$, $$かのじょにきもちをつたえずじまいだった。$$, $$Nunca cheguei a dizer a ela o que sentia.$$),
    ('n1-grammar-248', $$買った本を、結局読まずじまいになった。$$, $$かったほんを、けっきょくよまずじまいになった。$$, $$Acabei nunca lendo o livro que comprei.$$),
    ('n1-grammar-248', $$忙しくて、彼に会わずじまいで帰国した。$$, $$いそがしくて、かれにあわずじまいできこくした。$$, $$Estava tão ocupado que voltei para o meu país sem chegar a encontrá-lo.$$),
    ('n1-grammar-248', $$名前を聞かずじまいで、別れてしまった。$$, $$なまえをきかずじまいで、わかれてしまった。$$, $$Nos despedimos sem que eu chegasse a perguntar o nome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$せっかく買った服を、一度も着____だった。$$, $$Acabei nunca usando a roupa que comprei.$$),
        (2, $$祖父に本当のことを言わ____だった。$$, $$Nunca cheguei a contar a verdade ao meu avô.$$),
        (3, $$旅行中、雨で富士山は見え____だった。$$, $$Durante a viagem, por causa da chuva, acabei não vendo o monte Fuji.$$),
        (4, $$質問しようと思ったが、結局せ____だった。$$, $$Pensei em fazer uma pergunta, mas acabei não fazendo.$$),
        (5, $$お礼を言わ____で、引っ越してしまった。$$, $$Me mudei sem chegar a agradecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-248', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずじまい$$),
        (2, $$ずじまい$$),
        (3, $$ずじまい$$),
        (4, $$ずじまい$$),
        (5, $$ずじまい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
