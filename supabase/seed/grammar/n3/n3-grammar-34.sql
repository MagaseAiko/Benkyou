-- n3-grammar-34 — 〜じゃない（確認・驚き）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-34',
    'grammar',
    'N3',
    $$〜じゃない（確認・驚き）$$,
    $$ja nai (kakunin / odoroki)$$,
    $$Não é? / Ora mas é... / Não acha?$$,
    $$No N3, じゃない aparece no final da frase não como negação, mas como uma forma de afirmar algo com ênfase, buscar concordância ou expressar surpresa. Equivale a "não é?", "ora, mas é..." ou "não acha?".

Com entonação subindo, じゃない? pede confirmação, como "aquele ali não é o Tanaka?".

Com entonação descendo, じゃない expressa surpresa ou elogio inesperado, como "nossa, mas está gostoso!", ou uma leve repreensão, como "eu não disse?".

Também aparece em いいじゃない, usado para incentivar ou convencer alguém: "que mal tem?", "vamos lá!".

Essa forma é neutra quanto ao gênero e muito usada no dia a dia, mais suave que じゃないか, que soa mais masculina.$$,
    $$O sentido depende muito da entonação. Na escrita, o contexto e o ponto de interrogação ajudam a entender.

じゃん, comum na região de Tóquio, é a versão mais casual e jovem.

Não confunda com じゃない de negação, como em 学生じゃない ("não é estudante"). Aqui, a frase é afirmativa na intenção.$$,
    $$Frase (forma simples) + じゃない (↓ surpresa / ênfase)
Frase (forma simples) + じゃない？ (↑ confirmação)
いいじゃない (incentivo)

Fala muito casual: じゃん$$,
    $$じゃない$$,
    $$じゃない|じゃん$$,
    ARRAY['じゃ', 'ない']::text[],
    ARRAY['じゃない', 'じゃない？', 'じゃん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-34', $$このケーキ、おいしいじゃない。$$, $$このケーキ、おいしいじゃない。$$, $$Nossa, este bolo está gostoso!$$),
    ('n3-grammar-34', $$あれ、田中さんじゃない？$$, $$あれ、たなかさんじゃない？$$, $$Ué, aquele não é o Tanaka?$$),
    ('n3-grammar-34', $$いいじゃない、一緒に行こうよ。$$, $$いいじゃない、いっしょにいこうよ。$$, $$Que mal tem? Vamos juntos!$$),
    ('n3-grammar-34', $$そんなこと、当たり前じゃない。$$, $$そんなこと、あたりまえじゃない。$$, $$Isso é óbvio, ora!$$),
    ('n3-grammar-34', $$だから言ったじゃない。$$, $$だからいったじゃない。$$, $$Eu não te disse?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その服、よく似合う____。$$, $$Essa roupa fica ótima em você, hein!$$),
        (2, $$もう十時____。早く寝なさい。$$, $$Já são dez horas, ora! Vá dormir.$$),
        (3, $$それ、私のペン____？$$, $$Essa não é a minha caneta?$$),
        (4, $$初めてなのに、上手に描けた____。$$, $$É a primeira vez e ficou bem desenhado, hein!$$),
        (5, $$約束したのに、来なかった____。$$, $$Você prometeu e não veio, ora!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃない$$),
        (1, $$じゃん$$),
        (2, $$じゃない$$),
        (2, $$じゃん$$),
        (3, $$じゃない$$),
        (4, $$じゃない$$),
        (4, $$じゃん$$),
        (5, $$じゃない$$),
        (5, $$じゃん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
