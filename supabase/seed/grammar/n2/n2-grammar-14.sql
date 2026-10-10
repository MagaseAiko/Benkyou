-- n2-grammar-14 — だって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-14',
    'grammar',
    'N2',
    $$だって$$,
    $$datte$$,
    $$Mas é que / Porque / Até mesmo / Também$$,
    $$だって é uma palavra casual com dois usos principais.

O primeiro, no começo da frase, é dar uma desculpa ou justificativa, como "mas é que..." ou "porque...". É muito comum em respostas a perguntas como "por quê?", principalmente entre crianças e pessoas próximas. Muitas vezes, a frase termina com もん ou もの, que reforçam o tom de justificativa.

O segundo, depois de substantivos, significa "até mesmo" ou "também", como uma forma casual de でも ou も. Por exemplo, "até uma criança entende isso" ou "eu também queria ir".

Com palavras interrogativas, como いつ e 誰, だって significa "qualquer": いつだって (a qualquer hora, sempre), 誰だって (qualquer pessoa).$$,
    $$だって no começo da frase pode soar infantil ou teimoso se usado demais.

Em situações formais, use でも ou なぜなら no lugar de だって.

Não confunda com たって (mesmo que), que vem depois de verbos na forma た.$$,
    $$だって、 + Justificativa + もん / もの (desculpa)
Substantivo + だって (até mesmo / também)
Palavra interrogativa + だって (qualquer: いつだって / 誰だって)$$,
    $$だって$$,
    $$だって$$,
    ARRAY['だって']::text[],
    ARRAY['だって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-14', $$だって、知らなかったんだもん。$$, $$だって、しらなかったんだもん。$$, $$Mas é que eu não sabia!$$),
    ('n2-grammar-14', $$そんなこと、子供だってわかる。$$, $$そんなこと、こどもだってわかる。$$, $$Uma coisa dessas, até uma criança entende.$$),
    ('n2-grammar-14', $$私だって、行きたかったよ。$$, $$わたしだって、いきたかったよ。$$, $$Eu também queria ir, sabia?$$),
    ('n2-grammar-14', $$「どうして食べないの？」「だって、おいしくないんだもん。」$$, $$「どうしてたべないの？」「だって、おいしくないんだもん。」$$, $$"Por que você não come?" "Porque não está gostoso!"$$),
    ('n2-grammar-14', $$いつだって、君の味方だよ。$$, $$いつだって、きみのみかただよ。$$, $$Sempre vou estar do seu lado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「なんで遅れたの？」「____、電車が止まったんだもん。」$$, $$"Por que você se atrasou?" "Mas é que o trem parou!"$$),
        (2, $$先生____、間違えることはある。$$, $$Até os professores às vezes erram.$$),
        (3, $$私____、そのくらいできるよ。$$, $$Até eu consigo fazer isso.$$),
        (4, $$誰____、失敗はする。$$, $$Qualquer pessoa erra.$$),
        (5, $$「早く寝なさい。」「____、まだ眠くないんだもん。」$$, $$"Vá dormir." "Mas é que ainda não estou com sono!"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だって$$),
        (2, $$だって$$),
        (3, $$だって$$),
        (4, $$だって$$),
        (5, $$だって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
