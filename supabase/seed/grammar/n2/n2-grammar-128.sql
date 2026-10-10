-- n2-grammar-128 — おまけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-128',
    'grammar',
    'N2',
    $$おまけに$$,
    $$omake ni$$,
    $$Além disso / E ainda por cima / Para piorar$$,
    $$おまけに serve para acrescentar mais uma informação do mesmo tipo, geralmente reforçando a ideia anterior. Equivale a "além disso" ou "e ainda por cima".

É muito usado para listar coisas ruins, com o sentido de "para piorar". Por exemplo, "estava frio e, para piorar, começou a chover". Também pode ser usado com coisas boas.

É uma expressão coloquial, comum na fala.$$,
    $$É parecido com その上 e それに, mas おまけに é mais coloquial e emocional.

Muitas vezes aparece junto com し na frase anterior.$$,
    $$Frase (com ponto final) + おまけに + Frase
Frase + し、おまけに + Frase$$,
    $$おまけに$$,
    $$おまけに$$,
    ARRAY['おまけ', 'に']::text[],
    ARRAY['おまけに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-128', $$今日は寒いし、おまけに雨も降ってきた。$$, $$きょうはさむいし、おまけにあめもふってきた。$$, $$Hoje está frio e, para piorar, começou a chover.$$),
    ('n2-grammar-128', $$この店は安くて、おまけに量も多い。$$, $$このみせはやすくて、おまけにりょうもおおい。$$, $$Esta loja é barata e, além disso, as porções são grandes.$$),
    ('n2-grammar-128', $$道に迷って、おまけに財布もなくした。$$, $$みちにまよって、おまけにさいふもなくした。$$, $$Me perdi e, ainda por cima, perdi a carteira.$$),
    ('n2-grammar-128', $$彼は頭がいい。おまけに性格もいい。$$, $$かれはあたまがいい。おまけにせいかくもいい。$$, $$Ele é inteligente. Além disso, tem um ótimo caráter.$$),
    ('n2-grammar-128', $$寝坊して、おまけに電車も遅れた。$$, $$ねぼうして、おまけにでんしゃもおくれた。$$, $$Dormi demais e, para piorar, o trem atrasou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は狭いし、____日当たりも悪い。$$, $$Este quarto é pequeno e, para piorar, pega pouco sol.$$),
        (2, $$彼女は美人で、____料理も上手だ。$$, $$Ela é bonita e, além disso, cozinha bem.$$),
        (3, $$熱が出て、____咳も止まらない。$$, $$Tive febre e, ainda por cima, a tosse não para.$$),
        (4, $$このパソコンは軽いし、____安い。$$, $$Este computador é leve e, além disso, barato.$$),
        (5, $$試験に落ちて、____彼女にも振られた。$$, $$Reprovei na prova e, para piorar, levei um fora da namorada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おまけに$$),
        (2, $$おまけに$$),
        (3, $$おまけに$$),
        (4, $$おまけに$$),
        (5, $$おまけに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
