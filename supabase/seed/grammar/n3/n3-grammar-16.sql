-- n3-grammar-16 — 〜だけ（限度）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-16',
    'grammar',
    'N3',
    $$〜だけ（限度）$$,
    $$dake (gendo)$$,
    $$O máximo possível / Tudo o que / Tanto quanto$$,
    $$No N3, だけ aparece com o sentido de limite máximo, indicando "tudo o que é possível" ou "tanto quanto se quiser". É diferente do だけ do N5, que significa "só".

Os usos mais comuns são:
• できるだけ: "o máximo possível", "sempre que possível".
• 好きなだけ / 〜たいだけ: "o quanto quiser".
• Verbo + だけ + mesmo verbo: "fazer tudo o que dá", como em やるだけやった (fiz tudo o que podia).
• Verbo potencial + だけ: "tudo o que é possível", como em 持てるだけ (tudo o que dá para carregar).

Com の, だけ pode vir antes de um substantivo: 持てるだけの荷物.

A ideia comum é chegar ao limite: fazer ou aproveitar tudo até onde é possível ou desejado.$$,
    $$できるだけ e なるべく têm sentido parecido. できるだけ soa um pouco mais enfático.

A expressão やるだけやってみる significa "tentar dar o máximo de si" e é muito usada antes de desafios.

Esse uso de だけ é positivo ou neutro, sem a ideia de "só isso" do N5.$$,
    $$できるだけ + Verbo / Advérbio
好きな / Verbo たい + だけ + Verbo
Verbo (dicionário) + だけ + Verbo (passado)
Verbo potencial + だけ (の + Substantivo)$$,
    $$だけ$$,
    $$だけ$$,
    ARRAY['だけ']::text[],
    ARRAY['だけ', 'できるだけ', '好きなだけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-16', $$明日は、できるだけ早く来てください。$$, $$あしたは、できるだけはやくきてください。$$, $$Amanhã, venha o mais cedo possível.$$),
    ('n3-grammar-16', $$好きなだけ食べていいですよ。$$, $$すきなだけたべていいですよ。$$, $$Pode comer o quanto quiser.$$),
    ('n3-grammar-16', $$やるだけやったから、後悔はない。$$, $$やるだけやったから、こうかいはない。$$, $$Fiz tudo o que podia, então não tenho arrependimentos.$$),
    ('n3-grammar-16', $$地震のとき、持てるだけの荷物を持って逃げた。$$, $$じしんのとき、もてるだけのにもつをもってにげた。$$, $$No terremoto, fugi levando toda a bagagem que conseguia carregar.$$),
    ('n3-grammar-16', $$言いたいだけ言って、彼は帰ってしまった。$$, $$いいたいだけいって、かれはかえってしまった。$$, $$Ele disse tudo o que queria e foi embora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$できる____毎日運動するようにしています。$$, $$Procuro fazer exercício todo dia, sempre que possível.$$),
        (2, $$欲しい____持っていってください。$$, $$Leve o quanto quiser.$$),
        (3, $$結果はわからないけど、やれる____やってみよう。$$, $$Não sei o resultado, mas vamos fazer tudo o que der.$$),
        (4, $$考えられる____の方法を試した。$$, $$Tentei todos os métodos possíveis.$$),
        (5, $$泣きたい____泣いたら、すっきりした。$$, $$Chorei o quanto quis e me senti aliviado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけ$$),
        (2, $$だけ$$),
        (3, $$だけ$$),
        (4, $$だけ$$),
        (5, $$だけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
