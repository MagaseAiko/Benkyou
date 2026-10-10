-- n3-grammar-135 — 〜てもしょうがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-135',
    'grammar',
    'N3',
    $$〜てもしょうがない$$,
    $$te mo shou ga nai$$,
    $$Não adianta / Não tem jeito / Não serve de nada$$,
    $$てもしょうがない é usado para dizer que fazer algo é inútil, porque não vai mudar a situação. Equivale a "não adianta", "não tem jeito" ou "não serve de nada".

しょうがない significa "não há jeito" ou "não há remédio". Assim, a estrutura diz "mesmo fazendo isso, não há jeito".

Ela é muito usada para consolar alguém ou para se resignar diante de algo que já aconteceu, como se arrepender, ficar bravo ou se preocupar.

O sentido é parecido com ても始まらない. A forma てもしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.$$,
    $$しょうがない sozinho é uma expressão muito comum, como "fazer o quê" ou "não tem jeito", aceitando a situação.

Não confunda com てしょうがない (sem も), que significa "muito", "demais" e expressa um sentimento forte.

A diferença é só o も: ても = "não adianta"; て = "demais".$$,
    $$Verbo na forma て + もしょうがない
Verbo na forma て + もしょうがありません (educado)

Variação: てもしかたがない / てもしかたない$$,
    $$てもしょうがない$$,
    $$てもしょうがない|でもしょうがない|てもしかたがない|でもしかたがない|てもしょうがありません$$,
    ARRAY['ても', 'しょうがない']::text[],
    ARRAY['てもしょうがない', 'てもしかたがない', 'てもしょうがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-135', $$今さら後悔してもしょうがない。$$, $$いまさらこうかいしてもしょうがない。$$, $$A esta altura, não adianta se arrepender.$$),
    ('n3-grammar-135', $$一人で悩んでもしょうがないよ。$$, $$ひとりでなやんでもしょうがないよ。$$, $$Não adianta ficar se preocupando sozinho.$$),
    ('n3-grammar-135', $$彼に文句を言ってもしょうがない。$$, $$かれにもんくをいってもしょうがない。$$, $$Não adianta reclamar com ele.$$),
    ('n3-grammar-135', $$もう終わったことだから、泣いてもしかたがない。$$, $$もうおわったことだから、ないてもしかたがない。$$, $$Já passou, então não adianta chorar.$$),
    ('n3-grammar-135', $$過ぎたことを考えてもしょうがありません。$$, $$すぎたことをかんがえてもしょうがありません。$$, $$Não adianta ficar pensando no que já passou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなことで怒っ____。$$, $$Não adianta ficar bravo por uma coisa dessas.$$),
        (2, $$今心配し____から、もう寝よう。$$, $$Não adianta se preocupar agora, então vamos dormir.$$),
        (3, $$電車はもう出たから、今から急い____。$$, $$O trem já saiu, então não adianta correr agora.$$),
        (4, $$彼を責め____。$$, $$Não adianta culpá-lo.$$),
        (5, $$天気のことは気にし____。$$, $$Não adianta se preocupar com o tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもしょうがない$$),
        (1, $$てもしかたがない$$),
        (2, $$てもしょうがない$$),
        (2, $$てもしかたがない$$),
        (3, $$でもしょうがない$$),
        (3, $$でもしかたがない$$),
        (4, $$てもしょうがない$$),
        (4, $$てもしかたがない$$),
        (5, $$てもしょうがない$$),
        (5, $$てもしかたがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
