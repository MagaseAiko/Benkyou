-- n4-grammar-135 — 〜ていただく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-135',
    'grammar',
    'N4',
    $$〜ていただく$$,
    $$te itadaku$$,
    $$Receber (o favor de) (humilde) / Ter a honra de$$,
    $$ていただく é a forma humilde de てもらう. Ela é usada quando quem fala recebe uma ação de alguém que merece respeito, como um professor, um superior ou um cliente.

いただく é a forma humilde de もらう (receber). Assim, ていただく significa "recebi de alguém respeitado o favor de...".

A pessoa que fez a ação é marcada com に. Quem fala é quem recebe, e geralmente não aparece na frase.

É muito usada para agradecer e para relatar favores recebidos em situações formais, como no trabalho e na escola.

Na forma ていただいて、ありがとうございます, ela expressa um agradecimento muito educado.$$,
    $$Para traduzir, muitas vezes é mais natural inverter a frase: 先生に直していただいた vira "o professor corrigiu para mim".

Em textos de negócios, a forma させていただく (fazer com a permissão de alguém) aparece muito, às vezes até em excesso.

Com pessoas próximas, a forma comum てもらう é suficiente.$$,
    $$Pessoa respeitada + に + Verbo na forma て + いただく

Passado: ていただいた / ていただきました
Agradecimento: 〜ていただいて、ありがとうございます
Pedido: ていただけませんか$$,
    $$ていただく$$,
    $$ていただ|でいただ$$,
    ARRAY['て', 'いただく']::text[],
    ARRAY['ていただく', 'ていただいた', 'ていただきました', 'ていただいて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-135', $$先生に作文を直していただきました。$$, $$せんせいにさくぶんをなおしていただきました。$$, $$O professor corrigiu minha redação.$$),
    ('n4-grammar-135', $$部長に駅まで送っていただいた。$$, $$ぶちょうにえきまでおくっていただいた。$$, $$O gerente me levou até a estação.$$),
    ('n4-grammar-135', $$田中先生に日本語を教えていただいています。$$, $$たなかせんせいににほんごをおしえていただいています。$$, $$O professor Tanaka está me ensinando japonês.$$),
    ('n4-grammar-135', $$お客様に、アンケートに答えていただきました。$$, $$おきゃくさまに、アンケートにこたえていただきました。$$, $$Os clientes responderam ao questionário.$$),
    ('n4-grammar-135', $$社長に褒めていただいて、うれしかったです。$$, $$しゃちょうにほめていただいて、うれしかったです。$$, $$Fiquei feliz por ter sido elogiado pelo presidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生に推薦状を書い____。$$, $$O professor escreveu uma carta de recomendação para mim.$$),
        (2, $$課長に仕事を手伝っ____。$$, $$O chefe de seção me ajudou no trabalho.$$),
        (3, $$お忙しいところ、来____、ありがとうございます。$$, $$Obrigado por ter vindo, mesmo estando tão ocupado.$$),
        (4, $$先輩にいいレストランを教え____。$$, $$O veterano me indicou um bom restaurante.$$),
        (5, $$先生に私の作文を読ん____。$$, $$O professor leu a minha redação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていただきました$$),
        (2, $$ていただきました$$),
        (3, $$ていただいて$$),
        (4, $$ていただきました$$),
        (5, $$でいただきました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
