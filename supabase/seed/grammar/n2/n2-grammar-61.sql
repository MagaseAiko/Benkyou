-- n2-grammar-61 — 〜くせして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-61',
    'grammar',
    'N2',
    $$〜くせして$$,
    $$kuse shite$$,
    $$Apesar de / Mesmo sendo / Embora$$,
    $$くせして indica que alguém age de um jeito que não combina com a sua condição, posição ou com o que deveria fazer. Equivale a "apesar de" ou "mesmo sendo".

O tom é sempre de crítica, desprezo ou irritação. A pessoa que fala acha a atitude do outro inadequada. Por exemplo, "apesar de não saber nada, ele fica dando palpite".

É uma variação mais coloquial de くせに e aparece principalmente na fala.$$,
    $$O sujeito das duas partes da frase precisa ser o mesmo.

Não se usa para falar de si mesmo de forma positiva, porque a expressão carrega crítica.

くせして soa um pouco mais forte e mais informal que くせに.$$,
    $$Verbo (forma simples) + くせして
Adjetivo い + くせして
Adjetivo な + な + くせして
Substantivo + の + くせして$$,
    $$くせして$$,
    $$くせして$$,
    ARRAY['くせ', 'して']::text[],
    ARRAY['くせして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-61', $$何も知らないくせして、口を出すな。$$, $$なにもしらないくせして、くちをだすな。$$, $$Não se meta mesmo sem saber nada.$$),
    ('n2-grammar-61', $$子供のくせして、生意気なことを言う。$$, $$こどものくせして、なまいきなことをいう。$$, $$Mesmo sendo criança, fala coisas atrevidas.$$),
    ('n2-grammar-61', $$下手なくせして、いつも自慢している。$$, $$へたなくせして、いつもじまんしている。$$, $$Apesar de ser ruim nisso, vive se gabando.$$),
    ('n2-grammar-61', $$お金がないくせして、高い服ばかり買う。$$, $$おかねがないくせして、たかいふくばかりかう。$$, $$Apesar de não ter dinheiro, só compra roupas caras.$$),
    ('n2-grammar-61', $$自分は遅れたくせして、人には文句を言う。$$, $$じぶんはおくれたくせして、ひとにはもんくをいう。$$, $$Mesmo tendo se atrasado, reclama dos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束した____、彼は来なかった。$$, $$Apesar de ter prometido, ele não veio.$$),
        (2, $$男の____泣くなんて、と言われた。$$, $$Disseram que, mesmo sendo homem, ele estava chorando.$$),
        (3, $$わかっている____、知らないふりをする。$$, $$Mesmo sabendo, finge que não sabe.$$),
        (4, $$若い____、すぐに疲れたと言う。$$, $$Mesmo sendo jovem, logo diz que está cansado.$$),
        (5, $$新人の____、偉そうな態度だ。$$, $$Mesmo sendo novato, tem uma atitude arrogante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くせして$$),
        (2, $$くせして$$),
        (3, $$くせして$$),
        (4, $$くせして$$),
        (5, $$くせして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
