-- n2-grammar-67 — 〜も当然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-67',
    'grammar',
    'N2',
    $$〜も当然だ$$,
    $$mo touzen da$$,
    $$É natural que / Não é de admirar que / É óbvio que$$,
    $$も当然だ indica que um resultado ou reação é totalmente esperado diante da situação. Equivale a "é natural que" ou "não é de admirar que".

A primeira parte da frase costuma explicar o motivo, e depois vem a conclusão de que o resultado faz sentido. Por exemplo, "ele estudou tanto, então é natural que tenha passado".

A forma のも当然だ é a mais usada, porque transforma a ação em um substantivo antes de も.$$,
    $$É parecido com のも無理はない e のももっともだ.

Na fala, também aparece como のも当たり前だ.

O tom pode ser de compreensão ou de crítica, dependendo da situação.$$,
    $$Verbo (forma simples) + のも当然だ
Adjetivo い + のも当然だ
Adjetivo な + な + のも当然だ$$,
    $$も当然だ$$,
    $$も当然|もとうぜん$$,
    ARRAY['も', '当然', 'だ']::text[],
    ARRAY['も当然だ', 'のも当然だ', 'も当然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-67', $$毎日練習したのだから、優勝したのも当然だ。$$, $$まいにちれんしゅうしたのだから、ゆうしょうしたのもとうぜんだ。$$, $$Ele treinou todo dia, então é natural que tenha vencido.$$),
    ('n2-grammar-67', $$あんなにひどいことを言われたら、怒るのも当然だ。$$, $$あんなにひどいことをいわれたら、おこるのもとうぜんだ。$$, $$Ouvindo uma coisa tão horrível, é natural ficar com raiva.$$),
    ('n2-grammar-67', $$一晩中起きていたから、眠いのも当然だ。$$, $$ひとばんじゅうおきていたから、ねむいのもとうぜんだ。$$, $$Fiquei acordado a noite toda, então é óbvio que estou com sono.$$),
    ('n2-grammar-67', $$彼は嘘をついたのだから、信用されないのも当然だ。$$, $$かれはうそをついたのだから、しんようされないのもとうぜんだ。$$, $$Ele mentiu, então não é de admirar que não confiem nele.$$),
    ('n2-grammar-67', $$こんなに安いのだから、人気があるのも当然です。$$, $$こんなにやすいのだから、にんきがあるのもとうぜんです。$$, $$Sendo tão barato assim, é natural que seja popular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何も食べていないなら、お腹がすくの____。$$, $$Se você não comeu nada, é natural estar com fome.$$),
        (2, $$あれだけ働けば、疲れるの____。$$, $$Trabalhando tanto assim, é natural ficar cansado.$$),
        (3, $$約束を破ったのだから、彼女が怒るの____。$$, $$Você quebrou a promessa, então é natural que ela fique brava.$$),
        (4, $$駅に近いので、家賃が高いの____。$$, $$Fica perto da estação, então é natural que o aluguel seja caro.$$),
        (5, $$勉強しなかったんだから、落ちたの____。$$, $$Você não estudou, então é óbvio que reprovou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も当然だ$$),
        (1, $$も当然です$$),
        (2, $$も当然だ$$),
        (2, $$も当然です$$),
        (3, $$も当然だ$$),
        (3, $$も当然です$$),
        (4, $$も当然だ$$),
        (4, $$も当然です$$),
        (5, $$も当然だ$$),
        (5, $$も当然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
