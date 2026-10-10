-- n2-grammar-149 — 少なくとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-149',
    'grammar',
    'N2',
    $$少なくとも$$,
    $$sukunaku tomo$$,
    $$Pelo menos / No mínimo / Ao menos$$,
    $$少なくとも indica o mínimo de algo, seja uma quantidade, um tempo ou um grau. Equivale a "pelo menos" ou "no mínimo".

Também pode limitar uma afirmação, com o sentido de "pelo menos no meu caso" ou "pelo menos isso é certo".

Por exemplo, "leva pelo menos uma hora" ou "pelo menos eu não acho isso".$$,
    $$É parecido com せめて, mas 少なくとも é mais objetivo. せめて expressa um desejo.

O oposto é 多くとも ou 多くても, que significa "no máximo".$$,
    $$少なくとも + Quantidade / Tempo
少なくとも + Frase$$,
    $$少なくとも$$,
    $$少なくとも|すくなくとも$$,
    ARRAY['少なく', 'とも']::text[],
    ARRAY['少なくとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-149', $$駅まで少なくとも三十分はかかる。$$, $$えきまですくなくともさんじゅっぷんはかかる。$$, $$Leva pelo menos trinta minutos até a estação.$$),
    ('n2-grammar-149', $$少なくとも一日に一回は運動しよう。$$, $$すくなくともいちにちにいっかいはうんどうしよう。$$, $$Vamos nos exercitar pelo menos uma vez por dia.$$),
    ('n2-grammar-149', $$この仕事には少なくとも三人必要だ。$$, $$このしごとにはすくなくともさんにんひつようだ。$$, $$Este trabalho precisa de no mínimo três pessoas.$$),
    ('n2-grammar-149', $$少なくとも私はそう思わない。$$, $$すくなくともわたしはそうおもわない。$$, $$Pelo menos eu não penso assim.$$),
    ('n2-grammar-149', $$少なくとも、彼は嘘をついていない。$$, $$すくなくとも、かれはうそをついていない。$$, $$Pelo menos uma coisa é certa: ele não está mentindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日____七時間は寝たほうがいい。$$, $$É melhor dormir pelo menos sete horas por dia.$$),
        (2, $$この家を買うには、____三千万円必要だ。$$, $$Para comprar esta casa, são necessários no mínimo trinta milhões de ienes.$$),
        (3, $$____、私の責任ではない。$$, $$Pelo menos não é culpa minha.$$),
        (4, $$パーティーには____五十人は来るだろう。$$, $$Pelo menos cinquenta pessoas devem vir à festa.$$),
        (5, $$____週に一度は家族に電話しなさい。$$, $$Ligue para a sua família pelo menos uma vez por semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$少なくとも$$),
        (1, $$すくなくとも$$),
        (2, $$少なくとも$$),
        (2, $$すくなくとも$$),
        (3, $$少なくとも$$),
        (3, $$すくなくとも$$),
        (4, $$少なくとも$$),
        (4, $$すくなくとも$$),
        (5, $$少なくとも$$),
        (5, $$すくなくとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
