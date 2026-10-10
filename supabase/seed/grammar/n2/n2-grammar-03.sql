-- n2-grammar-03 — 〜ばかり（数量）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-03',
    'grammar',
    'N2',
    $$〜ばかり（数量）$$,
    $$bakari (suuryou)$$,
    $$Cerca de / Mais ou menos / Uns$$,
    $$Depois de números e quantidades, ばかり indica uma quantidade aproximada. Equivale a "cerca de", "mais ou menos" ou "uns".

Por exemplo, "andei cerca de dez minutos" ou "tirei uns dias de folga".

É parecido com ぐらい e ほど, mas soa um pouco mais formal e literário.

Também aparece em expressões como 少しばかり, que significa "um pouquinho" e é usada com modéstia, como ao pedir algo emprestado ou ao oferecer um presente.

Esse uso é diferente do ばかり de "só" e do たばかり de "acabou de".$$,
    $$Na conversa do dia a dia, ぐらい é mais comum. ばかり com números soa mais escrito.

少しばかりですが ("é só uma lembrancinha") é uma frase humilde usada ao dar presentes.

O contexto mostra qual ばかり é: depois de números, é quantidade aproximada.$$,
    $$Número + Contador + ばかり
Número + Contador + ばかり + の + Substantivo
少しばかり (um pouquinho)$$,
    $$ばかり$$,
    $$ばかり$$,
    ARRAY['ばかり']::text[],
    ARRAY['ばかり', '少しばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-03', $$駅まで十分ばかり歩いた。$$, $$えきまでじゅっぷんばかりあるいた。$$, $$Andei cerca de dez minutos até a estação.$$),
    ('n2-grammar-03', $$一週間ばかり休みをもらった。$$, $$いっしゅうかんばかりやすみをもらった。$$, $$Tirei mais ou menos uma semana de folga.$$),
    ('n2-grammar-03', $$すまないが、千円ばかり貸してくれないか。$$, $$すまないが、せんえんばかりかしてくれないか。$$, $$Desculpe, mas você poderia me emprestar uns mil ienes?$$),
    ('n2-grammar-03', $$三日ばかり旅行に行ってきます。$$, $$みっかばかりりょこうにいってきます。$$, $$Vou viajar por uns três dias.$$),
    ('n2-grammar-03', $$会場には十人ばかりの人が集まった。$$, $$かいじょうにはじゅうにんばかりのひとがあつまった。$$, $$Cerca de dez pessoas se reuniram no local.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅で一時間____待った。$$, $$Esperei cerca de uma hora na estação.$$),
        (2, $$祖母は五日____入院していた。$$, $$Minha avó ficou internada por uns cinco dias.$$),
        (3, $$すみません、少し____お金を貸してください。$$, $$Desculpe, poderia me emprestar um pouquinho de dinheiro?$$),
        (4, $$説明会には二十人____の学生が参加した。$$, $$Cerca de vinte estudantes participaram da reunião informativa.$$),
        (5, $$去年、一か月____日本を旅行した。$$, $$No ano passado, viajei pelo Japão por cerca de um mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかり$$),
        (2, $$ばかり$$),
        (3, $$ばかり$$),
        (4, $$ばかり$$),
        (5, $$ばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
