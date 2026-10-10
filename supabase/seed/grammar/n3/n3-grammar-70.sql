-- n3-grammar-70 — なるべく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-70',
    'grammar',
    'N3',
    $$なるべく$$,
    $$narubeku$$,
    $$Na medida do possível / O máximo possível / Sempre que possível$$,
    $$なるべく é um advérbio que significa "na medida do possível" ou "sempre que possível". Ele indica que a pessoa vai tentar fazer algo, dentro das suas possibilidades.

É muito usado em pedidos ("venha o mais cedo possível"), conselhos ("é melhor, sempre que possível, não ficar acordado até tarde") e hábitos ("procuro, sempre que possível, comer verdura").

Combina muito bem com ようにする e ようにしている, que expressam esforço para manter um hábito.

なるべく é um pouco mais suave e menos enfático que できるだけ, que tem o mesmo sentido.$$,
    $$なるべく e できるだけ podem ser trocados na maioria dos casos.

Em pedidos educados, なるべく deixa o pedido mais flexível, sem pressionar a outra pessoa.

なるべく早く ("o mais cedo possível") é uma das combinações mais comuns, principalmente em e-mails de trabalho.$$,
    $$なるべく + Verbo / Advérbio / Adjetivo
なるべく + Verbo + ようにする / ようにしている
なるべく + Verbo + てください (pedido)$$,
    $$なるべく$$,
    $$なるべく$$,
    ARRAY['なるべく']::text[],
    ARRAY['なるべく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-70', $$明日はなるべく早く来てください。$$, $$あしたはなるべくはやくきてください。$$, $$Amanhã, venha o mais cedo possível.$$),
    ('n3-grammar-70', $$健康のために、なるべく野菜を食べるようにしている。$$, $$けんこうのために、なるべくやさいをたべるようにしている。$$, $$Pela saúde, procuro comer verdura sempre que possível.$$),
    ('n3-grammar-70', $$なるべく夜遅くまで起きていないほうがいい。$$, $$なるべくよるおそくまでおきていないほうがいい。$$, $$É melhor, na medida do possível, não ficar acordado até tarde.$$),
    ('n3-grammar-70', $$お返事はなるべく今日中にお願いします。$$, $$おへんじはなるべくきょうじゅうにおねがいします。$$, $$Peço que responda, se possível, ainda hoje.$$),
    ('n3-grammar-70', $$今月はなるべくお金を使わないようにしています。$$, $$こんげつはなるべくおかねをつかわないようにしています。$$, $$Este mês, procuro gastar o mínimo possível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康のために、____階段を使うようにしている。$$, $$Pela saúde, procuro usar a escada sempre que possível.$$),
        (2, $$旅行の荷物は____少なくしてください。$$, $$Leve a menor bagagem possível na viagem.$$),
        (3, $$____早く返事をください。$$, $$Me responda o mais rápido possível, por favor.$$),
        (4, $$授業では、____日本語で話すようにしています。$$, $$Nas aulas, procuro falar em japonês sempre que possível.$$),
        (5, $$甘い物は____食べないようにしている。$$, $$Procuro, na medida do possível, não comer doces.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なるべく$$),
        (2, $$なるべく$$),
        (3, $$なるべく$$),
        (4, $$なるべく$$),
        (5, $$なるべく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
