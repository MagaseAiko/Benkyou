-- n3-grammar-186 — 〜ないわけにはいかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-186',
    'grammar',
    'N3',
    $$〜ないわけにはいかない$$,
    $$nai wake ni wa ikanai$$,
    $$Não ter como não / Ser obrigado a / Ter que$$,
    $$ないわけにはいかない é usado para dizer que, por razões sociais, morais ou de responsabilidade, a pessoa não pode deixar de fazer algo. Equivale a "não tenho como não", "sou obrigado a" ou "tenho que".

É uma dupla negação: "não fazer não é possível". O resultado é uma obrigação, muitas vezes contra a vontade da pessoa, mas aceita por senso de dever.

Por exemplo, "eu prometi, então não tenho como não ir" ou "o professor pediu, então tenho que ajudar".

A diferença em relação a なければならない é o motivo. なければならない é uma obrigação geral. ないわけにはいかない destaca que, considerando a situação e as pessoas envolvidas, não seria aceitável deixar de fazer.$$,
    $$É muito comum em situações sociais, como casamentos, funerais e compromissos de trabalho.

ないわけにもいかない, com も, mostra que a pessoa está num dilema: não quer fazer, mas também não pode deixar de fazer.

Compare com わけにはいかない (sem ない), que significa "não posso fazer".$$,
    $$Verbo na forma ない + わけにはいかない
Verbo na forma ない + わけにはいきません (educado)

Variação: ないわけにもいかない$$,
    $$ないわけにはいかない$$,
    $$ないわけにはいかない|ないわけにはいきません|ないわけにもいかない$$,
    ARRAY['ない', 'わけ', 'には', 'いかない']::text[],
    ARRAY['ないわけにはいかない', 'ないわけにはいきません', 'ないわけにもいかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-186', $$約束したから、行かないわけにはいかない。$$, $$やくそくしたから、いかないわけにはいかない。$$, $$Eu prometi, então não tenho como não ir.$$),
    ('n3-grammar-186', $$明日は試験だから、勉強しないわけにはいかない。$$, $$あしたはしけんだから、べんきょうしないわけにはいかない。$$, $$Amanhã tem prova, então não tenho como não estudar.$$),
    ('n3-grammar-186', $$先生に頼まれたので、手伝わないわけにはいかない。$$, $$せんせいにたのまれたので、てつだわないわけにはいかない。$$, $$O professor me pediu, então tenho que ajudar.$$),
    ('n3-grammar-186', $$社長が出席するので、私も出ないわけにはいきません。$$, $$しゃちょうがしゅっせきするので、わたしもでないわけにはいきません。$$, $$O presidente vai comparecer, então eu também sou obrigado a ir.$$),
    ('n3-grammar-186', $$親友の結婚式なので、行かないわけにはいかない。$$, $$しんゆうのけっこんしきなので、いかないわけにはいかない。$$, $$É o casamento do meu melhor amigo, então não tenho como não ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大事な会議なので、出席し____。$$, $$É uma reunião importante, então tenho que comparecer.$$),
        (2, $$親が心配しているので、連絡し____。$$, $$Meus pais estão preocupados, então não tenho como não entrar em contato.$$),
        (3, $$迷惑をかけたので、謝ら____。$$, $$Causei transtorno, então sou obrigado a pedir desculpas.$$),
        (4, $$お世話になった人なので、お礼を言わ____。$$, $$É uma pessoa que me ajudou muito, então tenho que agradecer.$$),
        (5, $$雨でも仕事なので、行か____。$$, $$Mesmo com chuva, é trabalho, então não tenho como não ir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないわけにはいかない$$),
        (1, $$ないわけにはいきません$$),
        (2, $$ないわけにはいかない$$),
        (2, $$ないわけにはいきません$$),
        (3, $$ないわけにはいかない$$),
        (3, $$ないわけにはいきません$$),
        (4, $$ないわけにはいかない$$),
        (4, $$ないわけにはいきません$$),
        (5, $$ないわけにはいかない$$),
        (5, $$ないわけにはいきません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
