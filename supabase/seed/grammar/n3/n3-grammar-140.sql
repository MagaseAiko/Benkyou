-- n3-grammar-140 — 〜というのは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-140',
    'grammar',
    'N3',
    $$〜というのは$$,
    $$to iu no wa$$,
    $$O que se chama de... é / Significa / Quanto a$$,
    $$というのは é usado para apresentar uma palavra, uma expressão ou uma ideia que vai ser explicada, definida ou comentada. Equivale a "o que se chama de... é", "... significa" ou "quanto a...".

O uso mais comum é definir palavras e conceitos. A frase costuma terminar com ことです ou という意味です. Por exemplo, "tsundoku é comprar livros e não ler".

Também é usado para pedir ou dar explicações sobre algo que alguém disse, como "é verdade que você não pode ir amanhã?" (literalmente, "isso de você não poder ir, é verdade?").

Na fala, というのは costuma virar っていうのは. Em textos formais, também aparece とは, com o mesmo sentido.$$,
    $$Para perguntar o significado de uma palavra, 〜というのは何ですか ou 〜って何ですか são muito úteis.

Em textos acadêmicos e dicionários, とは é a forma mais comum: 「花見」とは….

というのは também pode introduzir um motivo no começo de uma frase, com sentido de "é que...", num uso mais avançado.$$,
    $$Palavra / Expressão + というのは、 + Definição + ことだ / という意味だ
Frase (forma simples) + というのは、 + Comentário / Pergunta

Fala casual: っていうのは
Formal: 〜とは$$,
    $$というのは$$,
    $$というのは|っていうのは|とは$$,
    ARRAY['という', 'の', 'は']::text[],
    ARRAY['というのは', 'っていうのは', 'とは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-140', $$「積読」というのは、本を買って読まないことです。$$, $$「つんどく」というのは、ほんをかってよまないことです。$$, $$"Tsundoku" é comprar livros e não ler.$$),
    ('n3-grammar-140', $$親友というのは、何でも話せる友達のことだ。$$, $$しんゆうというのは、なんでもはなせるともだちのことだ。$$, $$Melhor amigo é aquele com quem se pode falar sobre tudo.$$),
    ('n3-grammar-140', $$明日行けないというのは、本当ですか。$$, $$あしたいけないというのは、ほんとうですか。$$, $$É verdade que você não pode ir amanhã?$$),
    ('n3-grammar-140', $$彼が来ないというのは、何か理由があるのだろう。$$, $$かれがこないというのは、なにかりゆうがあるのだろう。$$, $$Se ele não vem, deve haver algum motivo.$$),
    ('n3-grammar-140', $$「JR」というのは、日本の鉄道会社のことです。$$, $$「ジェイアール」というのは、にほんのてつどうがいしゃのことです。$$, $$"JR" é uma companhia ferroviária japonesa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「花見」____、桜を見ながら食事をすることです。$$, $$"Hanami" é comer e beber enquanto se admiram as cerejeiras.$$),
        (2, $$彼女が結婚した____、本当ですか。$$, $$É verdade que ela se casou?$$),
        (3, $$「お疲れ様」____、仕事の後にする挨拶です。$$, $$"Otsukaresama" é um cumprimento usado depois do trabalho.$$),
        (4, $$外国に留学する____、簡単なことではない。$$, $$Fazer intercâmbio no exterior não é algo simples.$$),
        (5, $$自由____、何でもしていいという意味ではない。$$, $$Liberdade não significa poder fazer qualquer coisa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というのは$$),
        (2, $$というのは$$),
        (3, $$というのは$$),
        (4, $$というのは$$),
        (5, $$というのは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
