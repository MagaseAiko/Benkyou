-- n3-grammar-133 — 〜ても始まらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-133',
    'grammar',
    'N3',
    $$〜ても始まらない$$,
    $$te mo hajimaranai$$,
    $$Não adianta / Não leva a nada$$,
    $$ても始まらない é usado para dizer que fazer algo não serve para nada, porque não vai mudar a situação. Equivale a "não adianta" ou "não leva a nada".

A ideia literal é "mesmo fazendo isso, nada começa", ou seja, a ação não leva a nenhum avanço.

É muito usado com ações como chorar, reclamar, se arrepender ou ficar preocupado sozinho. O tom é de conselho ou consolo, incentivando a pessoa a parar e fazer algo mais útil.

Por exemplo, "não adianta se arrepender agora" ou "não adianta ficar se preocupando sozinho, vamos pedir conselho".

O sentido é muito parecido com てもしょうがない.$$,
    $$A expressão 今さら〜ても始まらない ("a esta altura, não adianta...") é muito comum.

Comparado a てもしょうがない, ても始まらない destaca que a ação não leva a nenhum progresso.

Muitas vezes, a frase continua com uma sugestão positiva, como "vamos pensar no próximo passo".$$,
    $$Verbo na forma て + も始まらない
Verbo na forma て + も始まりません (educado)

Escrita: 始まらない / はじまらない$$,
    $$ても始まらない$$,
    $$ても始まらない|でも始まらない|てもはじまらない|でもはじまらない|ても始まりません|でも始まりません$$,
    ARRAY['ても', '始まらない']::text[],
    ARRAY['ても始まらない', 'でも始まらない', 'ても始まりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-133', $$今さら後悔しても始まらない。$$, $$いまさらこうかいしてもはじまらない。$$, $$A esta altura, não adianta se arrepender.$$),
    ('n3-grammar-133', $$泣いても始まらないよ。次を頑張ろう。$$, $$ないてもはじまらないよ。つぎをがんばろう。$$, $$Não adianta chorar. Vamos nos esforçar na próxima.$$),
    ('n3-grammar-133', $$ここで文句を言っても始まらない。$$, $$ここでもんくをいってもはじまらない。$$, $$Não adianta reclamar aqui.$$),
    ('n3-grammar-133', $$一人で悩んでも始まらないから、相談しよう。$$, $$ひとりでなやんでもはじまらないから、そうだんしよう。$$, $$Não adianta ficar se preocupando sozinho, vamos pedir conselho.$$),
    ('n3-grammar-133', $$過去のことを気にしても始まりません。$$, $$かこのことをきにしてもはじまりません。$$, $$Não adianta se preocupar com o passado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$終わったことを考え____。$$, $$Não adianta pensar no que já passou.$$),
        (2, $$怒っ____から、落ち着いて。$$, $$Não adianta ficar bravo, então se acalme.$$),
        (3, $$一人で悩ん____よ。$$, $$Não adianta ficar se preocupando sozinho.$$),
        (4, $$今さら謝っ____。$$, $$A esta altura, não adianta pedir desculpas.$$),
        (5, $$ここで待っ____から、探しに行こう。$$, $$Não adianta ficar esperando aqui, vamos procurar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても始まらない$$),
        (1, $$ても始まりません$$),
        (2, $$ても始まらない$$),
        (3, $$でも始まらない$$),
        (4, $$ても始まらない$$),
        (4, $$ても始まりません$$),
        (5, $$ても始まらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
