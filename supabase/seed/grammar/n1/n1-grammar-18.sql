-- n1-grammar-18 — 〜であれ / 〜であろうと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-18',
    'grammar',
    'N1',
    $$〜であれ / 〜であろうと$$,
    $$de are / de arou to$$,
    $$Seja qual for / Mesmo que seja / Não importa se$$,
    $$であれ e であろうと indicam que, seja qual for a situação, o resultado ou a conclusão não muda. Equivale a "seja qual for" ou "mesmo que seja".

Costumam vir com palavras interrogativas, como 誰, 何 e どんな, ou com substantivos. Por exemplo, "seja quem for, regras são regras" ou "mesmo que seja criança, tem que pedir desculpas".

É uma expressão formal.$$,
    $$É parecido com でも, mas であれ é mais formal.

A forma であっても tem um sentido muito próximo.$$,
    $$Substantivo + であれ / であろうと
Palavra interrogativa + であれ / であろうと$$,
    $$であれ$$,
    $$であれ|であろうと|であろうが$$,
    ARRAY['で', 'あれ']::text[],
    ARRAY['であれ', 'であろうと', 'であろうが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-18', $$誰であれ、ルールは守らなければならない。$$, $$だれであれ、ルールはまもらなければならない。$$, $$Seja quem for, é preciso seguir as regras.$$),
    ('n1-grammar-18', $$子供であろうと、悪いことをしたら謝るべきだ。$$, $$こどもであろうと、わるいことをしたらあやまるべきだ。$$, $$Mesmo que seja criança, se fez algo errado, deve pedir desculpas.$$),
    ('n1-grammar-18', $$どんな理由であれ、暴力は許されない。$$, $$どんなりゆうであれ、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n1-grammar-18', $$仕事が何であろうと、一生懸命やることが大切だ。$$, $$しごとがなんであろうと、いっしょうけんめいやることがたいせつだ。$$, $$Não importa qual seja o trabalho, o importante é se dedicar.$$),
    ('n1-grammar-18', $$たとえ社長であれ、間違いは間違いだ。$$, $$たとえしゃちょうであれ、まちがいはまちがいだ。$$, $$Mesmo que seja o presidente, erro é erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$相手が誰____、態度を変えるべきではない。$$, $$Seja quem for o outro, não se deve mudar de atitude.$$),
        (2, $$どんな結果____、受け入れるつもりだ。$$, $$Seja qual for o resultado, pretendo aceitar.$$),
        (3, $$たとえ冗談____、言ってはいけないことがある。$$, $$Mesmo que seja brincadeira, há coisas que não se deve dizer.$$),
        (4, $$理由が何____、遅刻は遅刻だ。$$, $$Não importa o motivo, atraso é atraso.$$),
        (5, $$プロ____、失敗することはある。$$, $$Mesmo um profissional às vezes erra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$であれ$$),
        (1, $$であろうと$$),
        (1, $$であろうが$$),
        (2, $$であれ$$),
        (2, $$であろうと$$),
        (2, $$であろうが$$),
        (3, $$であれ$$),
        (3, $$であろうと$$),
        (3, $$であろうが$$),
        (4, $$であれ$$),
        (4, $$であろうと$$),
        (4, $$であろうが$$),
        (5, $$であれ$$),
        (5, $$であろうと$$),
        (5, $$であろうが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
