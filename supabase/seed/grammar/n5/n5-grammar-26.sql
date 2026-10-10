-- n5-grammar-26 — 〜けれども
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-26',
    'grammar',
    'N5',
    $$〜けれども$$,
    $$keredomo$$,
    $$Mas / Porém / Embora / No entanto$$,
    $$けれども tem o mesmo significado de けど: liga duas ideias que se contrastam, como "mas" ou "embora". A diferença está no tom.

けれども é a forma completa e soa mais educada e cuidadosa. Por isso, combina bem com a forma です e ます, com situações de trabalho, conversas com pessoas mais velhas e textos escritos.

Ele pode ficar no final da primeira parte da frase, ligando as duas ideias, ou no começo de uma nova frase, com o sentido de "no entanto".

Assim como けど, けれども também pode suavizar pedidos e perguntas, deixando a frase mais delicada.$$,
    $$As três formas, けれども, けれど e けど, são a mesma palavra em níveis diferentes de formalidade. Conhecer as três ajuda a reconhecer o tom de quem fala.

Na escrita muito formal, como relatórios e jornais, é comum usar が ou しかし no lugar de けれども.

Começar a frase com けれども soa um pouco mais formal e literário do que começar com でも.$$,
    $$Frase (forma educada ou simples) + けれども + Frase
Substantivo / Adjetivo な + です / だ + けれども + Frase
Frase 1 (com ponto final) + けれども、 + Frase 2

Do mais formal ao mais informal: けれども → けれど → けど$$,
    $$けれども$$,
    $$けれども|けれど$$,
    ARRAY['けれども']::text[],
    ARRAY['けれども', 'けれど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-26', $$一生懸命練習したけれども、試合に負けました。$$, $$いっしょうけんめいれんしゅうしたけれども、しあいにまけました。$$, $$Treinei muito, mas perdi a partida.$$),
    ('n5-grammar-26', $$この服はきれいですけれども、少し高いです。$$, $$このふくはきれいですけれども、すこしたかいです。$$, $$Esta roupa é bonita, mas é um pouco cara.$$),
    ('n5-grammar-26', $$雪が降っていますけれども、学校は休みになりません。$$, $$ゆきがふっていますけれども、がっこうはやすみになりません。$$, $$Está nevando, mas as aulas não vão ser canceladas.$$),
    ('n5-grammar-26', $$説明を聞いた。けれども、よくわからなかった。$$, $$せつめいをきいた。けれども、よくわからなかった。$$, $$Ouvi a explicação. No entanto, não entendi bem.$$),
    ('n5-grammar-26', $$すみませんけれども、もう少しゆっくり話してください。$$, $$すみませんけれども、もうすこしゆっくりはなしてください。$$, $$Desculpe, mas fale um pouco mais devagar, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何度も電話しました____、彼は出ませんでした。$$, $$Liguei várias vezes, mas ele não atendeu.$$),
        (2, $$この料理は見た目は普通です____、とてもおいしいです。$$, $$Esta comida tem aparência comum, mas é muito gostosa.$$),
        (3, $$部屋は狭いです____、明るくて気持ちがいいです。$$, $$O quarto é pequeno, mas é claro e agradável.$$),
        (4, $$頑張りました。____、合格できませんでした。$$, $$Me esforcei. No entanto, não consegui passar.$$),
        (5, $$失礼です____、どちら様ですか。$$, $$Desculpe, mas quem é o senhor?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けれども$$),
        (1, $$けれど$$),
        (2, $$けれども$$),
        (2, $$けれど$$),
        (3, $$けれども$$),
        (3, $$けれど$$),
        (4, $$けれども$$),
        (4, $$けれど$$),
        (5, $$けれども$$),
        (5, $$けれど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
