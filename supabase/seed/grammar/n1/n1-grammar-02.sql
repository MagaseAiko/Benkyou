-- n1-grammar-02 — あくまでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-02',
    'grammar',
    'N1',
    $$あくまでも$$,
    $$akumademo$$,
    $$Até o fim / Absolutamente / Apenas$$,
    $$あくまでも tem dois usos principais.

O primeiro indica que alguém mantém uma atitude até o fim, sem mudar. Equivale a "até o fim" ou "absolutamente". Por exemplo, "ele insistiu até o fim que era inocente".

O segundo serve para limitar ou esclarecer uma afirmação, com o sentido de "apenas" ou "simplesmente". Por exemplo, "isto é apenas a minha opinião pessoal".$$,
    $$A forma あくまで tem o mesmo sentido.

No segundo uso, é comum em frases como あくまでも参考です e あくまでも個人的な意見です.$$,
    $$あくまでも + Verbo (insistir / manter)
あくまでも + Substantivo + だ / です (limitação)$$,
    $$あくまでも$$,
    $$あくまでも|あくまで$$,
    ARRAY['あくまでも']::text[],
    ARRAY['あくまでも', 'あくまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-02', $$彼はあくまでも無実を主張した。$$, $$かれはあくまでもむじつをしゅちょうした。$$, $$Ele insistiu até o fim que era inocente.$$),
    ('n1-grammar-02', $$これはあくまでも私の個人的な意見です。$$, $$これはあくまでもわたしのこじんてきないけんです。$$, $$Isto é apenas a minha opinião pessoal.$$),
    ('n1-grammar-02', $$あくまで参考として聞いてください。$$, $$あくまでさんこうとしてきいてください。$$, $$Ouça apenas como referência.$$),
    ('n1-grammar-02', $$彼女はあくまでも自分のやり方を変えなかった。$$, $$かのじょはあくまでもじぶんのやりかたをかえなかった。$$, $$Ela não mudou seu jeito de fazer as coisas de forma alguma.$$),
    ('n1-grammar-02', $$この数字はあくまでも予想です。$$, $$このすうじはあくまでもよそうです。$$, $$Estes números são apenas uma previsão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____反対の立場を貫いた。$$, $$Ele manteve a posição contrária até o fim.$$),
        (2, $$これは____仮の計画です。$$, $$Este é apenas um plano provisório.$$),
        (3, $$私は____自分の夢を追い続ける。$$, $$Vou continuar perseguindo meu sonho até o fim.$$),
        (4, $$今の話は____うわさに過ぎない。$$, $$O que acabei de contar não passa de um boato.$$),
        (5, $$____冷静に話し合いましょう。$$, $$Vamos conversar com calma, de qualquer jeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あくまでも$$),
        (1, $$あくまで$$),
        (2, $$あくまでも$$),
        (2, $$あくまで$$),
        (3, $$あくまでも$$),
        (3, $$あくまで$$),
        (4, $$あくまでも$$),
        (4, $$あくまで$$),
        (5, $$あくまでも$$),
        (5, $$あくまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
