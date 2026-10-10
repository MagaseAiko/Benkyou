-- n1-grammar-250 — 〜ゆえに / 〜がゆえに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-250',
    'grammar',
    'N1',
    $$〜ゆえに / 〜がゆえに$$,
    $$yue ni / ga yue ni$$,
    $$Por causa de / Por ser / Justamente porque$$,
    $$ゆえに e がゆえに indicam a causa ou o motivo de algo, de forma muito formal. Equivalem a "por causa de" ou "por ser".

São usados principalmente na escrita, em textos acadêmicos, discursos e textos literários. Por exemplo, "justamente por ser jovem, ele comete erros".

A forma ゆえの vem antes de substantivos.$$,
    $$É uma forma antiga e formal de から e ので.

No começo da frase, ゆえに significa "portanto", como em lógica e matemática.$$,
    $$Verbo / Adjetivo (forma simples) + (が)ゆえに
Substantivo + (である) + がゆえに
Substantivo + ゆえの + Substantivo$$,
    $$ゆえに$$,
    $$ゆえに|ゆえの|ゆえ|故に$$,
    ARRAY['ゆえ', 'に']::text[],
    ARRAY['ゆえに', 'がゆえに', 'ゆえの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-250', $$若いがゆえに、失敗することもある。$$, $$わかいがゆえに、しっぱいすることもある。$$, $$Justamente por ser jovem, às vezes se erra.$$),
    ('n1-grammar-250', $$彼は正直であるがゆえに、損をすることが多い。$$, $$かれはしょうじきであるがゆえに、そんをすることがおおい。$$, $$Por ser honesto, ele muitas vezes sai perdendo.$$),
    ('n1-grammar-250', $$貧しさゆえに、学校に行けない子供がいる。$$, $$まずしさゆえに、がっこうにいけないこどもがいる。$$, $$Há crianças que não podem ir à escola por causa da pobreza.$$),
    ('n1-grammar-250', $$それは若さゆえの過ちだった。$$, $$それはわかさゆえのあやまちだった。$$, $$Aquilo foi um erro por causa da juventude.$$),
    ('n1-grammar-250', $$愛するがゆえに、彼女は彼と別れた。$$, $$あいするがゆえに、かのじょはかれとわかれた。$$, $$Justamente por amá-lo, ela terminou com ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$経験が少ない____、判断を誤った。$$, $$Por ter pouca experiência, errou no julgamento.$$),
        (2, $$有名である____、彼には自由がない。$$, $$Justamente por ser famoso, ele não tem liberdade.$$),
        (3, $$病気____、仕事を辞めざるを得なかった。$$, $$Por causa da doença, ele foi obrigado a deixar o trabalho.$$),
        (4, $$それは親の愛情____の厳しさだった。$$, $$Aquela rigidez era por causa do amor dos pais.$$),
        (5, $$便利である____、使いすぎてしまう。$$, $$Justamente por ser prático, acabamos usando demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-250', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がゆえに$$),
        (1, $$ゆえに$$),
        (2, $$がゆえに$$),
        (2, $$ゆえに$$),
        (3, $$ゆえに$$),
        (4, $$ゆえ$$),
        (5, $$がゆえに$$),
        (5, $$ゆえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
