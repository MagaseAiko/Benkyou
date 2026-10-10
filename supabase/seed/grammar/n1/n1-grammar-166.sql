-- n1-grammar-166 — さもないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-166',
    'grammar',
    'N1',
    $$さもないと$$,
    $$samonai to$$,
    $$Senão / Caso contrário / Do contrário$$,
    $$さもないと indica que, se uma ação não for feita, haverá uma consequência negativa. Equivale a "senão" ou "caso contrário".

A primeira parte costuma ser um conselho ou uma ordem, e a segunda mostra o que vai acontecer se não for seguido. Por exemplo, "corra, senão vai perder o trem".

A forma さもなければ tem o mesmo sentido e é um pouco mais formal.$$,
    $$É parecido com そうしないと e でないと.

さもないと é mais coloquial, e さもなければ é mais formal.$$,
    $$Frase (conselho / ordem, com ponto final) + さもないと + Consequência negativa
Frase (com ponto final) + さもなければ + Consequência negativa$$,
    $$さもないと$$,
    $$さもないと|さもなければ|さもなくば$$,
    ARRAY['さも', 'ない', 'と']::text[],
    ARRAY['さもないと', 'さもなければ', 'さもなくば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-166', $$急ぎなさい。さもないと、電車に遅れるよ。$$, $$いそぎなさい。さもないと、でんしゃにおくれるよ。$$, $$Corra. Senão, vai perder o trem.$$),
    ('n1-grammar-166', $$早く寝なさい。さもないと、明日起きられないよ。$$, $$はやくねなさい。さもないと、あしたおきられないよ。$$, $$Vá dormir cedo. Caso contrário, não vai conseguir acordar amanhã.$$),
    ('n1-grammar-166', $$しっかり勉強しなさい。さもなければ、合格できない。$$, $$しっかりべんきょうしなさい。さもなければ、ごうかくできない。$$, $$Estude direito. Do contrário, não vai passar.$$),
    ('n1-grammar-166', $$傘を持っていきなさい。さもないと、ぬれるよ。$$, $$かさをもっていきなさい。さもないと、ぬれるよ。$$, $$Leve o guarda-chuva. Senão, vai se molhar.$$),
    ('n1-grammar-166', $$今すぐ謝りなさい。さもないと、許さない。$$, $$いますぐあやまりなさい。さもないと、ゆるさない。$$, $$Peça desculpas agora. Senão, não te perdoo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲みなさい。____、熱が下がらないよ。$$, $$Tome o remédio. Senão, a febre não vai baixar.$$),
        (2, $$ちゃんと食べなさい。____、大きくなれないよ。$$, $$Coma direito. Caso contrário, não vai crescer.$$),
        (3, $$お金を返してください。____、警察に連絡します。$$, $$Devolva o dinheiro. Do contrário, chamarei a polícia.$$),
        (4, $$早く予約しなさい。____、席がなくなるよ。$$, $$Faça a reserva logo. Senão, os lugares vão acabar.$$),
        (5, $$ゆっくり話してください。____、わかりません。$$, $$Fale devagar, por favor. Caso contrário, não entendo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さもないと$$),
        (1, $$さもなければ$$),
        (2, $$さもないと$$),
        (2, $$さもなければ$$),
        (3, $$さもないと$$),
        (3, $$さもなければ$$),
        (4, $$さもないと$$),
        (4, $$さもなければ$$),
        (5, $$さもないと$$),
        (5, $$さもなければ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
