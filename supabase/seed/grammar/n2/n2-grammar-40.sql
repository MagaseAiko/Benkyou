-- n2-grammar-40 — 〜かと思ったら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-40',
    'grammar',
    'N2',
    $$〜かと思ったら$$,
    $$ka to omottara$$,
    $$Mal... e já / Quando parecia que... de repente$$,
    $$かと思ったら é usado para dizer que, logo depois de algo acontecer, aconteceu outra coisa inesperada, muitas vezes o oposto. Equivale a "mal... e já..." ou "quando parecia que..., de repente...".

A primeira parte descreve uma ação ou mudança, e a segunda mostra algo que veio imediatamente depois, de forma surpreendente. Por exemplo, "mal começou a chover e já parou" ou "a criança mal chorou e já está rindo".

A ideia é de mudança rápida e inesperada. Por isso, ela é usada para descrever situações que surpreendem quem fala.

As formas かと思うと e かと思えば têm sentido parecido. かと思えば também pode mostrar alternância: "às vezes está quente, de repente fica frio".

Ela vem depois do verbo na forma た, e a segunda parte é um fato observado, não uma ação de quem fala.$$,
    $$Essa estrutura não é usada para as próprias ações de quem fala, porque descreve algo observado com surpresa.

Também existe o uso かと思ったら com o sentido de "eu achava que..., mas na verdade...", como em 誰かと思ったら、君か ("achei que fosse outra pessoa, mas era você").

É muito comum em descrições de crianças, do tempo e de comportamentos imprevisíveis.$$,
    $$Verbo na forma た + かと思ったら、 + Mudança inesperada
Verbo na forma た + かと思うと、 + …
Verbo / Adjetivo + かと思えば、 + … (alternância)$$,
    $$かと思ったら$$,
    $$かと思ったら|かと思うと|かと思えば$$,
    ARRAY['か', 'と', '思ったら']::text[],
    ARRAY['かと思ったら', 'かと思うと', 'かと思えば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-40', $$雨が降ったかと思ったら、すぐにやんだ。$$, $$あめがふったかとおもったら、すぐにやんだ。$$, $$Mal começou a chover e já parou.$$),
    ('n2-grammar-40', $$子供は泣いたかと思ったら、もう笑っている。$$, $$こどもはないたかとおもったら、もうわらっている。$$, $$A criança mal chorou e já está rindo.$$),
    ('n2-grammar-40', $$彼は帰ったかと思ったら、またすぐ戻ってきた。$$, $$かれはかえったかとおもったら、またすぐもどってきた。$$, $$Quando parecia que ele tinha ido embora, voltou logo em seguida.$$),
    ('n2-grammar-40', $$静かになったかと思うと、また騒ぎ始めた。$$, $$しずかになったかとおもうと、またさわぎはじめた。$$, $$Mal ficou quieto e já começou a fazer barulho de novo.$$),
    ('n2-grammar-40', $$最近の天気は、暑いかと思えば、急に寒くなる。$$, $$さいきんのてんきは、あついかとおもえば、きゅうにさむくなる。$$, $$Ultimamente o tempo está assim: parece quente e, de repente, esfria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雷が鳴った____、大雨が降り出した。$$, $$Mal trovejou e já começou uma chuva forte.$$),
        (2, $$彼女は来た____、すぐに帰った。$$, $$Ela mal chegou e já foi embora.$$),
        (3, $$晴れた____、また曇ってきた。$$, $$Mal abriu o sol e já voltou a ficar nublado.$$),
        (4, $$赤ちゃんは寝た____、すぐ起きた。$$, $$O bebê mal dormiu e já acordou.$$),
        (5, $$彼は座った____、また立ち上がった。$$, $$Ele mal se sentou e já se levantou de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かと思ったら$$),
        (1, $$かと思うと$$),
        (2, $$かと思ったら$$),
        (2, $$かと思うと$$),
        (3, $$かと思ったら$$),
        (3, $$かと思うと$$),
        (4, $$かと思ったら$$),
        (4, $$かと思うと$$),
        (5, $$かと思ったら$$),
        (5, $$かと思うと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
