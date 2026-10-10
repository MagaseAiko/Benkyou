-- n1-grammar-39 — いかなる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-39',
    'grammar',
    'N1',
    $$いかなる$$,
    $$ikanaru$$,
    $$Qualquer / Que tipo de / Seja qual for$$,
    $$いかなる é uma forma formal de どんな. Equivale a "qualquer", "que tipo de" ou "seja qual for".

Costuma vir antes de substantivos e junto com expressões como でも, であれ ou a negação, reforçando que não há exceção. Por exemplo, "em qualquer situação, mantenha a calma" ou "não há motivo algum que justifique isso".

É usada em textos formais, regras, discursos e notícias.$$,
    $$É bem mais formal que どんな.

Expressões comuns são いかなる場合も, いかなる理由があっても e いかなる困難にも.$$,
    $$いかなる + Substantivo + でも / であれ / であろうと
いかなる + Substantivo + も + Frase negativa$$,
    $$いかなる$$,
    $$いかなる$$,
    ARRAY['いかなる']::text[],
    ARRAY['いかなる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-39', $$いかなる場合でも、冷静に行動してください。$$, $$いかなるばあいでも、れいせいにこうどうしてください。$$, $$Em qualquer situação, aja com calma.$$),
    ('n1-grammar-39', $$いかなる理由があっても、暴力は許されない。$$, $$いかなるりゆうがあっても、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n1-grammar-39', $$彼はいかなる困難にも負けなかった。$$, $$かれはいかなるこんなんにもまけなかった。$$, $$Ele não se rendeu a dificuldade alguma.$$),
    ('n1-grammar-39', $$いかなる人であれ、法律は守らなければならない。$$, $$いかなるひとであれ、ほうりつはまもらなければならない。$$, $$Seja quem for, é preciso respeitar a lei.$$),
    ('n1-grammar-39', $$いかなる質問にもお答えします。$$, $$いかなるしつもんにもおこたえします。$$, $$Responderemos a qualquer pergunta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____状況でも、あきらめてはいけない。$$, $$Em qualquer situação, não se deve desistir.$$),
        (2, $$____事情があろうと、約束は守るべきだ。$$, $$Sejam quais forem as circunstâncias, deve-se cumprir a promessa.$$),
        (3, $$当社は____責任も負いません。$$, $$Nossa empresa não assume responsabilidade alguma.$$),
        (4, $$____方法を使っても、彼を説得するのは無理だ。$$, $$Seja qual for o método, é impossível convencê-lo.$$),
        (5, $$____時も、笑顔を忘れないでほしい。$$, $$Quero que você nunca esqueça de sorrir, em qualquer momento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかなる$$),
        (2, $$いかなる$$),
        (3, $$いかなる$$),
        (4, $$いかなる$$),
        (5, $$いかなる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
