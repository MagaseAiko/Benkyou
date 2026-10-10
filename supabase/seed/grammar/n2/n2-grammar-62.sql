-- n2-grammar-62 — 〜ならまだしも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-62',
    'grammar',
    'N2',
    $$〜ならまだしも$$,
    $$nara madashimo$$,
    $$Ainda se fosse / Se fosse até passava / Seria aceitável se$$,
    $$まだしも serve para comparar duas situações. A primeira seria até aceitável, mas a segunda, que é a real, não é. Equivale a "ainda se fosse..., tudo bem, mas...".

A pessoa mostra que a situação atual é pior ou mais difícil de aceitar do que a outra. Por exemplo, "se fosse uma vez, ainda passava, mas três vezes já é demais".

Costuma aparecer junto com なら ou ならまだしも, seguido de uma frase que expressa crítica ou dificuldade.$$,
    $$É parecido com ならともかく, mas まだしも tem um tom um pouco mais forte de insatisfação.

É uma expressão um pouco formal e aparece tanto na fala quanto na escrita.$$,
    $$Substantivo + ならまだしも、 + Situação real (inaceitável)
Verbo (forma simples) + ならまだしも、 + Situação real
Substantivo + は + まだしも、 + Situação real$$,
    $$まだしも$$,
    $$まだしも$$,
    ARRAY['まだ', 'しも']::text[],
    ARRAY['まだしも', 'ならまだしも', 'はまだしも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-62', $$一回ならまだしも、三回も遅刻するのは問題だ。$$, $$いっかいならまだしも、さんかいもちこくするのはもんだいだ。$$, $$Se fosse uma vez ainda passava, mas atrasar três vezes é um problema.$$),
    ('n2-grammar-62', $$子供ならまだしも、大人がそんなことをするなんて。$$, $$こどもならまだしも、おとながそんなことをするなんて。$$, $$Se fosse uma criança ainda vá lá, mas um adulto fazer uma coisa dessas...$$),
    ('n2-grammar-62', $$暑いのはまだしも、湿気がひどくて困る。$$, $$あついのはまだしも、しっけがひどくてこまる。$$, $$O calor ainda dá para aguentar, mas a umidade está terrível.$$),
    ('n2-grammar-62', $$知らなかったならまだしも、知っていて黙っていたのは許せない。$$, $$しらなかったならまだしも、しっていてだまっていたのはゆるせない。$$, $$Se ele não soubesse ainda passava, mas saber e ficar calado é imperdoável.$$),
    ('n2-grammar-62', $$一人ならまだしも、全員が間違えるとは。$$, $$ひとりならまだしも、ぜんいんがまちがえるとは。$$, $$Se fosse uma pessoa só ainda vá lá, mas todos errarem...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$少しなら____、こんなに高いのは無理だ。$$, $$Se fosse um pouco ainda passava, mas tão caro assim é impossível.$$),
        (2, $$雨なら____、台風の中で出かけるのは危ない。$$, $$Se fosse chuva ainda vá lá, mas sair no meio de um tufão é perigoso.$$),
        (3, $$初心者なら____、プロがこんなミスをするなんて。$$, $$Se fosse um iniciante ainda passava, mas um profissional cometer um erro desses...$$),
        (4, $$一日なら____、一週間も待てない。$$, $$Um dia ainda dava, mas não dá para esperar uma semana inteira.$$),
        (5, $$味は____、値段が高すぎる。$$, $$O sabor até que passa, mas o preço é alto demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まだしも$$),
        (2, $$まだしも$$),
        (3, $$まだしも$$),
        (4, $$まだしも$$),
        (5, $$まだしも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
