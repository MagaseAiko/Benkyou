-- n3-grammar-108 — 〜しかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-108',
    'grammar',
    'N3',
    $$〜しかない$$,
    $$shika nai$$,
    $$Não ter outra opção a não ser / Só resta$$,
    $$しかない, depois de um verbo na forma de dicionário, indica que não existe outra opção: aquela é a única coisa que se pode fazer. Equivale a "não há outra opção a não ser" ou "só resta".

A ideia vem de しか〜ない ("só"), aplicada a ações. Ou seja, "só fazer isso é possível".

Ela costuma aparecer em situações difíceis, quando a pessoa aceita a realidade com resignação ou determinação. Por exemplo, "não tem trem, então o jeito é voltar a pé" ou "se chegamos até aqui, só resta nos esforçar".

No passado, しかなかった significa "não tive outra opção a não ser...".$$,
    $$Com substantivos, しか〜ない tem o sentido comum de "só": 千円しかない (só tenho mil ienes). Com verbos na forma de dicionário, o sentido é "não há outra opção".

ほかない tem o mesmo sentido, mas soa mais formal e escrito.

A frase やるしかない ("o jeito é fazer") é muito usada para se motivar diante de um desafio.$$,
    $$Verbo na forma de dicionário + しかない
Verbo + しかありません (educado)
Verbo + しかなかった (não tive outra opção)$$,
    $$しかない$$,
    $$しかない|しかありません|しかなかった$$,
    ARRAY['しか', 'ない']::text[],
    ARRAY['しかない', 'しかありません', 'しかなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-108', $$電車がないので、歩いて帰るしかない。$$, $$でんしゃがないので、あるいてかえるしかない。$$, $$Não tem trem, então o jeito é voltar a pé.$$),
    ('n3-grammar-108', $$誰も手伝ってくれないなら、一人でやるしかない。$$, $$だれもてつだってくれないなら、ひとりでやるしかない。$$, $$Se ninguém vai me ajudar, só resta fazer sozinho.$$),
    ('n3-grammar-108', $$約束したのだから、行くしかありません。$$, $$やくそくしたのだから、いくしかありません。$$, $$Eu prometi, então não tenho outra opção a não ser ir.$$),
    ('n3-grammar-108', $$お金がないので、あきらめるしかなかった。$$, $$おかねがないので、あきらめるしかなかった。$$, $$Como não tinha dinheiro, não tive outra opção a não ser desistir.$$),
    ('n3-grammar-108', $$ここまで来たら、もう頑張るしかない。$$, $$ここまできたら、もうがんばるしかない。$$, $$Já que chegamos até aqui, só resta nos esforçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨がやまないので、待つ____。$$, $$A chuva não para, então o jeito é esperar.$$),
        (2, $$薬がないなら、病院に行く____。$$, $$Se não tem remédio, só resta ir ao hospital.$$),
        (3, $$間違えたのは私だから、謝る____。$$, $$Quem errou fui eu, então só resta pedir desculpas.$$),
        (4, $$昨日は終電を逃したので、タクシーで帰る____。$$, $$Ontem perdi o último trem, então não tive outra opção a não ser voltar de táxi.$$),
        (5, $$試験に合格するには、勉強する____。$$, $$Para passar na prova, não há outra opção a não ser estudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しかない$$),
        (1, $$しかありません$$),
        (2, $$しかない$$),
        (2, $$しかありません$$),
        (3, $$しかない$$),
        (3, $$しかありません$$),
        (4, $$しかなかった$$),
        (5, $$しかない$$),
        (5, $$しかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
