-- n3-grammar-66 — 〜ないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-66',
    'grammar',
    'N3',
    $$〜ないと$$,
    $$nai to$$,
    $$Tenho que / Se não... / Senão$$,
    $$ないと tem dois usos principais.

O primeiro é condicional negativo: "se não fizer..., vai acontecer algo". A segunda parte mostra uma consequência, muitas vezes negativa, como um aviso. Por exemplo, "se não se apressar, vai se atrasar".

O segundo uso, muito comum na fala, é terminar a frase com ないと, deixando subentendido いけない. Assim, ないと sozinho significa "tenho que...". Por exemplo, "já tenho que ir embora" ou "tenho que dormir".

Ele é formado pela forma ない do verbo + と. É informal e muito usado entre amigos e família.$$,
    $$ないと sozinho no fim da frase é uma forma natural de lembrar a si mesmo de uma obrigação.

なきゃ e なくちゃ têm o mesmo sentido de "tenho que" e são igualmente casuais.

Em avisos, ないと〜よ dá um tom de alerta amigável.$$,
    $$Verbo na forma ない + と、 + Consequência (se não...)
Verbo na forma ない + と (fim de frase: tenho que...)
Verbo na forma ない + と + いけない (forma completa)

Variação casual: なきゃ$$,
    $$ないと$$,
    $$ないと|なきゃ$$,
    ARRAY['ない', 'と']::text[],
    ARRAY['ないと', 'ないといけない', 'なきゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-66', $$早くしないと、遅れるよ。$$, $$はやくしないと、おくれるよ。$$, $$Se não se apressar, vai se atrasar.$$),
    ('n3-grammar-66', $$あ、もう七時だ。帰らないと。$$, $$あ、もうしちじだ。かえらないと。$$, $$Ah, já são sete horas. Tenho que ir embora.$$),
    ('n3-grammar-66', $$ちゃんと勉強しないと、試験に落ちますよ。$$, $$ちゃんとべんきょうしないと、しけんにおちますよ。$$, $$Se não estudar direito, vai ser reprovado.$$),
    ('n3-grammar-66', $$傘を持っていかないと、濡れるよ。$$, $$かさをもっていかないと、ぬれるよ。$$, $$Se não levar o guarda-chuva, vai se molhar.$$),
    ('n3-grammar-66', $$明日は早いから、もう寝ないと。$$, $$あしたははやいから、もうねないと。$$, $$Amanhã acordo cedo, então tenho que ir dormir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$急が____、電車に間に合わない。$$, $$Se não me apressar, não chego a tempo para o trem.$$),
        (2, $$薬を飲ま____、治らないよ。$$, $$Se não tomar o remédio, não vai melhorar.$$),
        (3, $$もうこんな時間。帰ら____。$$, $$Já está tarde. Tenho que ir embora.$$),
        (4, $$ちゃんと食べ____、元気が出ないよ。$$, $$Se não comer direito, não vai ter energia.$$),
        (5, $$明日は旅行だ。準備をし____。$$, $$Amanhã é a viagem. Tenho que fazer as malas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないと$$),
        (2, $$ないと$$),
        (3, $$ないと$$),
        (3, $$なきゃ$$),
        (4, $$ないと$$),
        (5, $$ないと$$),
        (5, $$なきゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
