-- n3-grammar-06 — 〜ばよかった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-06',
    'grammar',
    'N3',
    $$〜ばよかった$$,
    $$ba yokatta$$,
    $$Devia ter / Teria sido bom / Quem dera$$,
    $$ばよかった é usado para expressar arrependimento por algo que a pessoa fez ou deixou de fazer no passado. Equivale a "devia ter feito" ou "teria sido bom se...".

Ele junta a forma condicional ば com よかった, o passado de いい. A ideia literal é "se eu tivesse feito isso, teria sido bom".

Com o verbo afirmativo, indica arrependimento por não ter feito algo: "devia ter estudado mais". Com o verbo negativo (なければよかった), indica arrependimento por ter feito algo: "não devia ter dito aquilo".

Com のに no final, ばよかったのに expressa pena ou leve crítica sobre a ação de outra pessoa, como "você devia ter vindo, foi divertido".$$,
    $$たらよかった tem o mesmo sentido e também é muito usado na conversa.

O oposto, para expressar alívio, é てよかった (que bom que fiz).

ばよかった aparece muito em reflexões e conversas sobre erros, e é uma forma natural de mostrar arrependimento.$$,
    $$Verbo na forma condicional ば + よかった (devia ter feito)
Verbo na forma ない → なければよかった (não devia ter feito)
Verbo ば + よかったのに (pena / crítica a outra pessoa)

Educado: ばよかったです$$,
    $$ばよかった$$,
    $$ばよかった$$,
    ARRAY['ば', 'よかった']::text[],
    ARRAY['ばよかった', 'ばよかったです', 'ばよかったのに', 'なければよかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-06', $$試験に落ちた。もっと勉強すればよかった。$$, $$しけんにおちた。もっとべんきょうすればよかった。$$, $$Fui reprovado. Devia ter estudado mais.$$),
    ('n3-grammar-06', $$雨が降ってきた。傘を持ってくればよかった。$$, $$あめがふってきた。かさをもってくればよかった。$$, $$Começou a chover. Devia ter trazido o guarda-chuva.$$),
    ('n3-grammar-06', $$あんなこと言わなければよかった。$$, $$あんなこといわなければよかった。$$, $$Não devia ter dito aquilo.$$),
    ('n3-grammar-06', $$もっと早く家を出ればよかったです。$$, $$もっとはやくいえをでればよかったです。$$, $$Devia ter saído de casa mais cedo.$$),
    ('n3-grammar-06', $$君も来ればよかったのに。楽しかったよ。$$, $$きみもくればよかったのに。たのしかったよ。$$, $$Você devia ter vindo. Foi divertido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊した。目覚ましをかけれ____。$$, $$Dormi demais. Devia ter colocado o despertador.$$),
        (2, $$この服は高すぎた。買わなけれ____。$$, $$Esta roupa foi cara demais. Não devia ter comprado.$$),
        (3, $$風邪がひどくなった。もっと早く病院に行け____。$$, $$O resfriado piorou. Devia ter ido ao hospital mais cedo.$$),
        (4, $$わからないところを、先生に聞いておけ____。$$, $$Devia ter perguntado ao professor as partes que não entendi.$$),
        (5, $$君も来れ____のに。$$, $$Você devia ter vindo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばよかった$$),
        (2, $$ばよかった$$),
        (3, $$ばよかった$$),
        (4, $$ばよかった$$),
        (5, $$ばよかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
