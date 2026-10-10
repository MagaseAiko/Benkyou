-- n4-grammar-40 — 急に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-40',
    'grammar',
    'N4',
    $$急に$$,
    $$kyuu ni$$,
    $$De repente / Repentinamente / Sem aviso$$,
    $$急に é um advérbio que significa "de repente". Ele indica que algo aconteceu de forma súbita, sem aviso, ou que uma mudança foi muito rápida.

Ele vem antes do verbo ou da expressão que descreve a mudança. É muito usado com fenômenos do tempo, mudanças de estado, imprevistos e reações inesperadas.

A palavra vem do adjetivo な 急 (súbito, urgente). Com に, ela vira advérbio.

Comparado a 突然, que também significa "de repente", 急に é mais comum na conversa e destaca a rapidez da mudança. 突然 soa um pouco mais formal e destaca o elemento de surpresa.$$,
    $$急 também aparece em palavras como 急ぐ (apressar-se), 急行 (trem expresso) e 急用 (assunto urgente). A ideia comum é velocidade ou urgência.

Combinações muito frequentes são 急に雨が降る, 急に寒くなる e 急に用事ができる.

急に também combina bem com 出す, que reforça a ideia de algo que começou de repente.$$,
    $$急に + Verbo
急に + Adjetivo + なる

Escrita: 急に / きゅうに$$,
    $$急に$$,
    $$急に|きゅうに$$,
    ARRAY['急', 'に']::text[],
    ARRAY['急に', 'きゅうに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-40', $$急に雨が降ってきました。$$, $$きゅうにあめがふってきました。$$, $$De repente, começou a chover.$$),
    ('n4-grammar-40', $$前の車が急に止まった。$$, $$まえのくるまがきゅうにとまった。$$, $$O carro da frente parou de repente.$$),
    ('n4-grammar-40', $$急に用事ができて、行けなくなりました。$$, $$きゅうにようじができて、いけなくなりました。$$, $$Surgiu um compromisso de repente, e não vou poder ir.$$),
    ('n4-grammar-40', $$彼女は急に泣き出した。$$, $$かのじょはきゅうになきだした。$$, $$Ela começou a chorar de repente.$$),
    ('n4-grammar-40', $$急に寒くなったので、風邪をひいてしまった。$$, $$きゅうにさむくなったので、かぜをひいてしまった。$$, $$Esfriou de repente, e acabei pegando um resfriado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____電気が消えました。$$, $$De repente, a luz apagou.$$),
        (2, $$子供が____道に飛び出した。$$, $$A criança saiu correndo para a rua de repente.$$),
        (3, $$食事の後、____お腹が痛くなりました。$$, $$Depois da refeição, de repente fiquei com dor de barriga.$$),
        (4, $$彼は____会社をやめた。$$, $$Ele saiu da empresa de repente.$$),
        (5, $$午後から天気が____悪くなりました。$$, $$A partir da tarde, o tempo piorou de repente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$急に$$),
        (1, $$きゅうに$$),
        (2, $$急に$$),
        (2, $$きゅうに$$),
        (3, $$急に$$),
        (3, $$きゅうに$$),
        (4, $$急に$$),
        (4, $$きゅうに$$),
        (5, $$急に$$),
        (5, $$きゅうに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
