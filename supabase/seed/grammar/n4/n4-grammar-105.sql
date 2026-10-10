-- n4-grammar-105 — 〜ているところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-105',
    'grammar',
    'N4',
    $$〜ているところ$$,
    $$te iru tokoro$$,
    $$Estar fazendo (neste momento) / Estar no meio de$$,
    $$ているところ é usado para dizer que uma ação está acontecendo exatamente agora, e que a pessoa está no meio dela. Equivale a "estou fazendo isso neste momento" ou "estou no meio de...".

Ele junta a forma ている com ところ, que significa "ponto" ou "momento". A ideia é "estou no ponto de estar fazendo isso".

Comparado a ている, ているところ destaca mais o momento atual e a ideia de que a ação ainda não terminou. É muito usado para explicar por que você não pode fazer outra coisa agora, ou para responder perguntas sobre o andamento de algo.

Também é usado para atividades em andamento por um período, como estar procurando emprego.$$,
    $$ているところ completa o trio com ところ: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

É uma forma educada de pedir que alguém espere, explicando que você está ocupado com algo naquele momento.

Na fala casual, também se ouve てるところ.$$,
    $$Verbo na forma て + いるところ + です / だ
今 + Verbo て + いるところです$$,
    $$ているところ$$,
    $$ているところ|でいるところ$$,
    ARRAY['ている', 'ところ']::text[],
    ARRAY['ているところ', 'でいるところ', 'てるところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-105', $$今、ご飯を食べているところです。$$, $$いま、ごはんをたべているところです。$$, $$Estou comendo agora.$$),
    ('n4-grammar-105', $$母は今、電話をしているところだ。$$, $$はははいま、でんわをしているところだ。$$, $$Minha mãe está ao telefone neste momento.$$),
    ('n4-grammar-105', $$今、その問題について考えているところです。$$, $$いま、そのもんだいについてかんがえているところです。$$, $$Estou pensando nesse problema agora.$$),
    ('n4-grammar-105', $$「宿題は？」「今やっているところ。」$$, $$「しゅくだいは？」「いまやっているところ。」$$, $$"E a lição?" "Estou fazendo agora."$$),
    ('n4-grammar-105', $$兄は今、新しい仕事を探しているところです。$$, $$あにはいま、あたらしいしごとをさがしているところです。$$, $$Meu irmão mais velho está procurando um novo emprego no momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今、メールを書い____です。$$, $$Estou escrevendo um e-mail agora.$$),
        (2, $$「もしもし、今大丈夫？」「ごめん、今運転し____なんだ。」$$, $$"Alô, pode falar agora?" "Desculpa, estou dirigindo agora."$$),
        (3, $$今、駅に向かっ____です。$$, $$Estou indo para a estação agora.$$),
        (4, $$弟は今、お風呂に入っ____。$$, $$Meu irmão mais novo está no banho agora.$$),
        (5, $$今、資料を読ん____ですから、少し待ってください。$$, $$Estou lendo os documentos agora, então espere um pouco, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ているところ$$),
        (2, $$ているところ$$),
        (3, $$ているところ$$),
        (4, $$ているところです$$),
        (4, $$ているところだ$$),
        (5, $$でいるところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
