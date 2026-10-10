-- n5-grammar-22 — 〜か〜か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-22',
    'grammar',
    'N5',
    $$〜か〜か$$,
    $$ka ~ ka$$,
    $$Ou / Se... ou...$$,
    $$か também é usado para apresentar opções, com o sentido de "ou". Quando você coloca か entre duas coisas, mostra que é uma ou outra.

Com substantivos, a forma mais simples é A か B. O segundo か, depois de B, é opcional nesse caso e aparece mais quando se quer deixar bem claro que são alternativas.

Com verbos, a estrutura com dois か é muito comum para expressar dúvida entre duas possibilidades, como "se vai ou não vai". Nesse caso, junta-se o verbo afirmativo e o negativo, cada um seguido de か.

Essa construção aparece muito com verbos como decidir, saber, escolher e perguntar.$$,
    $$A construção com か é diferente de や e と. と junta todas as coisas ("A e B"), や dá exemplos ("A, B e outras coisas"), e か mostra que é uma das opções.

Na pergunta indireta com duas opções, o tom é de dúvida. Por isso, ela aparece com frequência ao falar de decisões que ainda não foram tomadas.

Com substantivos, também é muito comum a forma どちらか, que significa "um dos dois".$$,
    $$Substantivo A + か + Substantivo B
Substantivo A + か + Substantivo B + か
Verbo A + か + Verbo B + か
Verbo (forma simples) + か + Verbo (forma ない) + か (se... ou não)$$,
    $$か$$,
    $$か$$,
    ARRAY['か']::text[],
    ARRAY['か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-22', $$月曜日か火曜日に来てください。$$, $$げつようびかかようびにきてください。$$, $$Venha na segunda ou na terça, por favor.$$),
    ('n5-grammar-22', $$コーヒーか紅茶、どちらがいいですか。$$, $$コーヒーかこうちゃ、どちらがいいですか。$$, $$Café ou chá, qual você prefere?$$),
    ('n5-grammar-22', $$いつも電車かバスで学校に行きます。$$, $$いつもでんしゃかバスでがっこうにいきます。$$, $$Sempre vou para a escola de trem ou de ônibus.$$),
    ('n5-grammar-22', $$パーティーに行くか行かないか、まだ決めていません。$$, $$パーティーにいくかいかないか、まだきめていません。$$, $$Ainda não decidi se vou à festa ou não.$$),
    ('n5-grammar-22', $$肉か魚か選んでください。$$, $$にくかさかなかえらんでください。$$, $$Escolha carne ou peixe, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$赤____青のペンを貸してください。$$, $$Me empresta uma caneta vermelha ou azul, por favor.$$),
        (2, $$夏休みは海____山に行きたいです。$$, $$Nas férias de verão, quero ir para a praia ou para a montanha.$$),
        (3, $$晩ご飯はラーメン____カレーにしましょう。$$, $$Vamos jantar ramen ou curry.$$),
        (4, $$その話が本当____うそか、わかりません。$$, $$Não sei se essa história é verdade ou mentira.$$),
        (5, $$彼が来る____来ないか、誰も知りません。$$, $$Ninguém sabe se ele vem ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か$$),
        (2, $$か$$),
        (3, $$か$$),
        (4, $$か$$),
        (5, $$か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
