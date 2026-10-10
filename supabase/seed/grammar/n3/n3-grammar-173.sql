-- n3-grammar-173 — 〜よりも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-173',
    'grammar',
    'N3',
    $$〜よりも$$,
    $$yori mo$$,
    $$Mais do que / Do que (enfático)$$,
    $$よりも é a forma enfática de より. Ela marca o ponto de comparação, como "do que", mas com mais força.

Ela é usada em comparações comuns, como "gosto mais de peixe do que de carne", e principalmente em expressões com palavras interrogativas, que formam superlativos:
• 何よりも: "mais do que tudo", "acima de tudo".
• 誰よりも: "mais do que qualquer pessoa".
• どこよりも: "mais do que qualquer lugar".
• いつよりも: "mais do que nunca".

Também aparece com expressões de expectativa, como 思ったよりも (do que eu pensava) e 予想よりも (do que o previsto).

O も dá ênfase, deixando a comparação mais forte e expressiva.$$,
    $$何よりも健康が大切だ ("acima de tudo, a saúde é o mais importante") é uma frase muito comum.

よりも é usado da mesma forma que より; a diferença é apenas a ênfase.

Em cartas e mensagens, 誰よりも ("mais do que ninguém") aparece em frases afetivas.$$,
    $$A + よりも + B + の方が / が + Adjetivo
何よりも / 誰よりも / どこよりも + Adjetivo / Verbo
思ったよりも / 予想よりも + Adjetivo$$,
    $$よりも$$,
    $$よりも$$,
    ARRAY['より', 'も']::text[],
    ARRAY['よりも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-173', $$私は肉よりも魚が好きだ。$$, $$わたしはにくよりもさかながすきだ。$$, $$Gosto mais de peixe do que de carne.$$),
    ('n3-grammar-173', $$何よりも健康が大切だ。$$, $$なによりもけんこうがたいせつだ。$$, $$Acima de tudo, a saúde é o mais importante.$$),
    ('n3-grammar-173', $$彼は誰よりも早く会社に来た。$$, $$かれはだれよりもはやくかいしゃにきた。$$, $$Ele chegou à empresa mais cedo do que todo mundo.$$),
    ('n3-grammar-173', $$去年よりも今年のほうが暑い。$$, $$きょねんよりもことしのほうがあつい。$$, $$Este ano está mais quente do que o ano passado.$$),
    ('n3-grammar-173', $$試験は思ったよりも簡単だった。$$, $$しけんはおもったよりもかんたんだった。$$, $$A prova foi mais fácil do que eu pensava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母は誰____料理が上手だ。$$, $$Minha mãe cozinha melhor do que qualquer pessoa.$$),
        (2, $$何____家族が大切です。$$, $$Acima de tudo, a família é o mais importante.$$),
        (3, $$私は夏____冬が好きだ。$$, $$Eu gosto mais do inverno do que do verão.$$),
        (4, $$電車____バスのほうが安い。$$, $$O ônibus é mais barato do que o trem.$$),
        (5, $$イベントには予想____多くの人が来た。$$, $$Vieram mais pessoas ao evento do que o previsto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よりも$$),
        (2, $$よりも$$),
        (3, $$よりも$$),
        (4, $$よりも$$),
        (5, $$よりも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
