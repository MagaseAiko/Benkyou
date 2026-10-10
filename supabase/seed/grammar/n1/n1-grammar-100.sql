-- n1-grammar-100 — 〜なりに / 〜なりの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-100',
    'grammar',
    'N1',
    $$〜なりに / 〜なりの$$,
    $$nari ni / nari no$$,
    $$Do seu jeito / À sua maneira / Dentro das suas possibilidades$$,
    $$なりに e なりの indicam que algo é feito de acordo com as próprias capacidades ou condições, mesmo que sejam limitadas. Equivalem a "do seu jeito" ou "à sua maneira".

A pessoa reconhece que há limites, mas valoriza o esforço feito dentro deles. Por exemplo, "as crianças pensam do jeito delas" ou "fiz o melhor que pude, à minha maneira".

なりの vem antes de substantivos, e なりに funciona como advérbio.$$,
    $$Expressões comuns são 自分なりに, 子供なりに, 私なりの考え e それなりに.

それなりに significa "de certa forma" ou "razoavelmente".$$,
    $$Substantivo + なりに + Verbo
Substantivo + なりの + Substantivo
Verbo / Adjetivo (forma simples) + なりに$$,
    $$なりに$$,
    $$なりに|なりの$$,
    ARRAY['なり', 'に']::text[],
    ARRAY['なりに', 'なりの', 'それなりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-100', $$子供は子供なりに、いろいろ考えている。$$, $$こどもはこどもなりに、いろいろかんがえている。$$, $$As crianças pensam em muitas coisas, do jeito delas.$$),
    ('n1-grammar-100', $$自分なりに一生懸命頑張った。$$, $$じぶんなりにいっしょうけんめいがんばった。$$, $$Me esforcei ao máximo, à minha maneira.$$),
    ('n1-grammar-100', $$これは私なりの考えです。$$, $$これはわたしなりのかんがえです。$$, $$Esta é a minha opinião, do meu jeito.$$),
    ('n1-grammar-100', $$お金がないなりに、楽しく暮らしている。$$, $$おかねがないなりに、たのしくくらしている。$$, $$Mesmo sem dinheiro, vivo feliz dentro das minhas possibilidades.$$),
    ('n1-grammar-100', $$この店はそれなりにおいしい。$$, $$このみせはそれなりにおいしい。$$, $$Esta loja é razoavelmente gostosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は彼____努力している。$$, $$Ele se esforça à maneira dele.$$),
        (2, $$初心者には初心者____楽しみ方がある。$$, $$Os iniciantes têm o seu próprio jeito de se divertir.$$),
        (3, $$自分____調べてみたが、よくわからなかった。$$, $$Pesquisei do meu jeito, mas não entendi bem.$$),
        (4, $$狭い部屋だが、それ____快適だ。$$, $$É um quarto pequeno, mas razoavelmente confortável.$$),
        (5, $$彼女には彼女____理由があるのだろう。$$, $$Ela deve ter os seus próprios motivos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なりに$$),
        (2, $$なりの$$),
        (3, $$なりに$$),
        (4, $$なりに$$),
        (5, $$なりの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
