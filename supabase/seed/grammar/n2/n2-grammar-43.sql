-- n2-grammar-43 — 〜限り
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-43',
    'grammar',
    'N2',
    $$〜限り$$,
    $$kagiri$$,
    $$Enquanto / Na medida em que / Até onde / A menos que$$,
    $$限り tem vários usos, todos ligados à ideia de "limite".

• Enquanto uma condição durar: "enquanto eu tiver saúde, quero continuar trabalhando".
• Até onde vai o conhecimento ou a percepção: "até onde eu sei, ele não mente".
• O máximo possível: できる限り (o máximo possível), 時間が許す限り (enquanto o tempo permitir).
• Com a forma ない, "a menos que": "a menos que chova, a partida será realizada". Nesse uso, ない限り indica a única condição que mudaria o resultado.

Ele vem depois da forma simples de verbos, de adjetivos い, de adjetivos な com な ou である, e de substantivos com である ou の.$$,
    $$私の知る限り ("até onde eu sei") é uma expressão muito útil para dar informações com cautela.

限り também aparece em 今日限り (só hoje, a partir de hoje não mais) e 一回限り (uma única vez).

Comparado a うちは, 限り soa mais formal e mais firme.$$,
    $$Verbo / Adjetivo (forma simples) + 限り (enquanto)
知っている / 覚えている / 見た + 限り (até onde)
できる + 限り (o máximo possível)
Verbo na forma ない + 限り (a menos que)

Escrita: 限り / かぎり$$,
    $$限り$$,
    $$限り|かぎり$$,
    ARRAY['限り']::text[],
    ARRAY['限り', 'かぎり', 'ない限り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-43', $$体が元気な限り、働き続けたい。$$, $$からだがげんきなかぎり、はたらきつづけたい。$$, $$Enquanto eu tiver saúde, quero continuar trabalhando.$$),
    ('n2-grammar-43', $$私が知っている限り、彼はうそをつかない。$$, $$わたしがしっているかぎり、かれはうそをつかない。$$, $$Até onde eu sei, ele não mente.$$),
    ('n2-grammar-43', $$できる限り早く返事をください。$$, $$できるかぎりはやくへんじをください。$$, $$Responda o mais rápido possível, por favor.$$),
    ('n2-grammar-43', $$雨が降らない限り、試合は行われる。$$, $$あめがふらないかぎり、しあいはおこなわれる。$$, $$A menos que chova, a partida será realizada.$$),
    ('n2-grammar-43', $$努力しない限り、成功はない。$$, $$どりょくしないかぎり、せいこうはない。$$, $$Sem esforço, não há sucesso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私が覚えている____、彼は一度も遅刻したことがない。$$, $$Até onde eu me lembro, ele nunca se atrasou.$$),
        (2, $$生きている____、夢をあきらめない。$$, $$Enquanto eu viver, não vou desistir do meu sonho.$$),
        (3, $$結果はともかく、できる____のことはした。$$, $$Independentemente do resultado, fiz tudo o que era possível.$$),
        (4, $$彼が謝らない____、許さない。$$, $$A menos que ele peça desculpas, não vou perdoar.$$),
        (5, $$時間が許す____、お手伝いします。$$, $$Enquanto o tempo permitir, vou ajudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$限り$$),
        (1, $$かぎり$$),
        (2, $$限り$$),
        (2, $$かぎり$$),
        (3, $$限り$$),
        (3, $$かぎり$$),
        (4, $$限り$$),
        (4, $$かぎり$$),
        (5, $$限り$$),
        (5, $$かぎり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
