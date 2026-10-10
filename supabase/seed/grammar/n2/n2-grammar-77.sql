-- n2-grammar-77 — もう少しで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-77',
    'grammar',
    'N2',
    $$もう少しで$$,
    $$mou sukoshi de$$,
    $$Por pouco / Quase / Faltou pouco para$$,
    $$もう少しで indica que algo quase aconteceu, mas no fim não aconteceu. Equivale a "por pouco" ou "quase".

Geralmente vem junto com ところだった, mostrando que a pessoa escapou de uma situação ruim por pouco. Por exemplo, "quase perdi o trem".

Também pode indicar que falta pouco para algo acontecer no futuro, com o sentido de "daqui a pouco" ou "já está quase".$$,
    $$É parecido com 危うく e あやうく, mas もう少しで é mais comum na fala.

Também aparece como もうちょっとで, que é mais informal.$$,
    $$もう少しで + Verbo (forma dicionário) + ところだった
もう少しで + Verbo (forma dicionário / Substantivo) (falta pouco)$$,
    $$もう少しで$$,
    $$もう少しで|もうすこしで|もうちょっとで$$,
    ARRAY['もう', '少し', 'で']::text[],
    ARRAY['もう少しで', 'もうちょっとで', 'もう少しで〜ところだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-77', $$もう少しで電車に乗り遅れるところだった。$$, $$もうすこしででんしゃにのりおくれるところだった。$$, $$Por pouco não perdi o trem.$$),
    ('n2-grammar-77', $$もう少しで車にひかれるところだった。$$, $$もうすこしでくるまにひかれるところだった。$$, $$Por pouco não fui atropelado por um carro.$$),
    ('n2-grammar-77', $$もう少しで宿題が終わる。$$, $$もうすこしでしゅくだいがおわる。$$, $$Falta pouco para terminar a lição de casa.$$),
    ('n2-grammar-77', $$もうちょっとで優勝できたのに。$$, $$もうちょっとでゆうしょうできたのに。$$, $$Faltou pouco para eu vencer.$$),
    ('n2-grammar-77', $$もう少しで夏休みだ。$$, $$もうすこしでなつやすみだ。$$, $$Já estão quase chegando as férias de verão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____大事な書類を捨てるところだった。$$, $$Por pouco não joguei fora um documento importante.$$),
        (2, $$____試験に遅れるところだった。$$, $$Quase me atrasei para a prova.$$),
        (3, $$____階段から落ちるところだった。$$, $$Por pouco não caí da escada.$$),
        (4, $$____この仕事も終わります。$$, $$Falta pouco para este trabalho também terminar.$$),
        (5, $$____彼女の誕生日だ。$$, $$Já está quase no aniversário dela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もう少しで$$),
        (1, $$もうすこしで$$),
        (1, $$もうちょっとで$$),
        (2, $$もう少しで$$),
        (2, $$もうすこしで$$),
        (2, $$もうちょっとで$$),
        (3, $$もう少しで$$),
        (3, $$もうすこしで$$),
        (3, $$もうちょっとで$$),
        (4, $$もう少しで$$),
        (4, $$もうすこしで$$),
        (4, $$もうちょっとで$$),
        (5, $$もう少しで$$),
        (5, $$もうすこしで$$),
        (5, $$もうちょっとで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
