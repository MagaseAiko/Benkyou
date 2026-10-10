-- n3-grammar-184 — 〜ほかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-184',
    'grammar',
    'N3',
    $$〜ほかない$$,
    $$hoka nai$$,
    $$Não ter outra opção a não ser / Só resta / O jeito é$$,
    $$ほかない é usado para dizer que não existe outra opção: aquela é a única coisa possível de fazer. Equivale a "não há outra opção a não ser", "só resta" ou "o jeito é".

ほか significa "outro", "além disso". A ideia literal é "não há outra coisa além disso".

O sentido é praticamente o mesmo de しかない, mas ほかない soa mais formal e escrito. É comum em textos, notícias e situações sérias.

A situação costuma ser difícil, e a pessoa aceita a única saída com resignação. Por exemplo, "o trem parou, então só resta voltar a pé".

As formas ほかはない e ほかありません também são usadas.$$,
    $$Na conversa do dia a dia, しかない é mais comum. ほかない aparece mais em textos formais.

Uma forma ainda mais formal é よりほかない, que aparece no N2.

Assim como しかない, ほかない também pode expressar determinação: やるほかない (o jeito é encarar).$$,
    $$Verbo na forma de dicionário + ほかない
Verbo + ほかはない
Verbo + ほかありません (educado)

Escrita: ほかない / 外ない$$,
    $$ほかない$$,
    $$ほかない|ほかありません|ほかはない|外ない$$,
    ARRAY['ほか', 'ない']::text[],
    ARRAY['ほかない', 'ほかはない', 'ほかありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-184', $$電車が止まったので、歩いて帰るほかない。$$, $$でんしゃがとまったので、あるいてかえるほかない。$$, $$O trem parou, então só resta voltar a pé.$$),
    ('n3-grammar-184', $$誰も手伝ってくれないので、一人でやるほかない。$$, $$だれもてつだってくれないので、ひとりでやるほかない。$$, $$Ninguém vai me ajudar, então o jeito é fazer sozinho.$$),
    ('n3-grammar-184', $$会議で決まったことなので、従うほかありません。$$, $$かいぎできまったことなので、したがうほかありません。$$, $$Foi decidido na reunião, então não há outra opção a não ser seguir.$$),
    ('n3-grammar-184', $$薬が効かないなら、手術するほかない。$$, $$くすりがきかないなら、しゅじゅつするほかない。$$, $$Se o remédio não funcionar, não há outra opção a não ser operar.$$),
    ('n3-grammar-184', $$ここまで来たら、やるほかはない。$$, $$ここまできたら、やるほかはない。$$, $$Já que chegamos até aqui, só resta fazer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$最終バスが行ってしまったので、タクシーで行く____。$$, $$O último ônibus já foi, então só resta ir de táxi.$$),
        (2, $$雨がやまないから、ここで待つ____。$$, $$A chuva não para, então o jeito é esperar aqui.$$),
        (3, $$自分が悪いのだから、謝る____。$$, $$A culpa é minha, então só resta pedir desculpas.$$),
        (4, $$道がわからないので、人に聞く____。$$, $$Não sei o caminho, então o jeito é perguntar a alguém.$$),
        (5, $$会社の決定だから、受け入れる____。$$, $$É uma decisão da empresa, então não há outra opção a não ser aceitar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほかない$$),
        (1, $$ほかありません$$),
        (2, $$ほかない$$),
        (2, $$ほかありません$$),
        (3, $$ほかない$$),
        (3, $$ほかありません$$),
        (4, $$ほかない$$),
        (4, $$ほかありません$$),
        (5, $$ほかない$$),
        (5, $$ほかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
