-- n1-grammar-192 — 〜てもどうにもならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-192',
    'grammar',
    'N1',
    $$〜てもどうにもならない$$,
    $$te mo dou nimo naranai$$,
    $$Não adianta / Não muda nada / Não resolve$$,
    $$てもどうにもならない indica que, mesmo fazendo algo, a situação não vai mudar ou melhorar. Equivale a "não adianta" ou "não muda nada".

A pessoa mostra resignação diante de algo que não pode ser resolvido. Por exemplo, "não adianta se arrepender agora".

É uma expressão comum na fala.$$,
    $$É parecido com ても仕方がない e ても無駄だ.

A expressão どうにもならない sozinha significa "não há nada a fazer".$$,
    $$Verbo (forma て) + もどうにもならない
Adjetivo い (sem い) + くてもどうにもならない$$,
    $$てもどうにもならない$$,
    $$てもどうにもならない|でもどうにもならない|てもどうにもなりません|でもどうにもなりません|てもどうにもならなかった|でもどうにもならなかった$$,
    ARRAY['て', 'も', 'どうにも', 'ならない']::text[],
    ARRAY['てもどうにもならない', 'でもどうにもならない', 'てもどうにもなりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-192', $$今さら後悔してもどうにもならない。$$, $$いまさらこうかいしてもどうにもならない。$$, $$Não adianta se arrepender agora.$$),
    ('n1-grammar-192', $$一人で悩んでもどうにもならないよ。$$, $$ひとりでなやんでもどうにもならないよ。$$, $$Não adianta se angustiar sozinho.$$),
    ('n1-grammar-192', $$泣いてもどうにもならないから、次のことを考えよう。$$, $$ないてもどうにもならないから、つぎのことをかんがえよう。$$, $$Chorar não muda nada, então vamos pensar no próximo passo.$$),
    ('n1-grammar-192', $$文句を言ってもどうにもなりません。$$, $$もんくをいってもどうにもなりません。$$, $$Reclamar não resolve nada.$$),
    ('n1-grammar-192', $$急いでもどうにもならなかった。$$, $$いそいでもどうにもならなかった。$$, $$Mesmo correndo, não adiantou nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$過ぎたことを考え____。$$, $$Não adianta pensar no que já passou.$$),
        (2, $$怒っ____、問題は解決しない。$$, $$Ficar bravo não adianta, o problema não se resolve.$$),
        (3, $$今から急い____。$$, $$Correr agora não adianta.$$),
        (4, $$心配し____から、今日はもう寝よう。$$, $$Preocupar-se não muda nada, então vamos dormir.$$),
        (5, $$いくら頼ん____。彼は決めたら変えない。$$, $$Por mais que peça, não adianta. Quando ele decide, não muda.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-192', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもどうにもならない$$),
        (1, $$てもどうにもなりません$$),
        (2, $$てもどうにもならないし$$),
        (3, $$でもどうにもならない$$),
        (3, $$でもどうにもなりません$$),
        (4, $$てもどうにもならない$$),
        (5, $$でもどうにもならない$$),
        (5, $$でもどうにもなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
