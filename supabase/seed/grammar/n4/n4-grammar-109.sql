-- n4-grammar-109 — 〜という
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-109',
    'grammar',
    'N4',
    $$〜という$$,
    $$to iu$$,
    $$Chamado / De nome / Que diz que$$,
    $$という é usado para dar o nome de algo ou para explicar o conteúdo de algo. Equivale a "chamado", "de nome" ou "que diz que".

O primeiro uso é apresentar nomes de pessoas, lugares, lojas, filmes e coisas que o ouvinte pode não conhecer. Por exemplo, "uma loja chamada Sakura".

O segundo uso é explicar o conteúdo de uma informação, como uma notícia, um boato ou uma ideia. Por exemplo, "a história de que ele vai sair da empresa".

Também aparece em perguntas como 何という〜ですか, para perguntar o nome de algo.

Na fala casual, という costuma virar っていう.$$,
    $$Quando o nome é desconhecido para o ouvinte, usar という é mais natural do que apresentar o nome direto.

Na forma escrita, quando という tem sentido de "chamado" ou de explicação, costuma ser escrito em hiragana.

A pergunta これは日本語で何といいますか, "como se diz isso em japonês?", é uma das frases mais úteis para estudantes.$$,
    $$Nome + という + Substantivo (chamado...)
Frase (forma simples) + という + Substantivo (話 / 噂 / ニュース)
何 + という + Substantivo + ですか

Fala casual: っていう
Escrita: という / と言う$$,
    $$という$$,
    $$という|と言う|っていう$$,
    ARRAY['と', 'いう']::text[],
    ARRAY['という', 'と言う', 'っていう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-109', $$「さくら」という店を知っていますか。$$, $$「さくら」というみせをしっていますか。$$, $$Você conhece uma loja chamada "Sakura"?$$),
    ('n4-grammar-109', $$田中という人から電話がありました。$$, $$たなかというひとからでんわがありました。$$, $$Uma pessoa chamada Tanaka ligou.$$),
    ('n4-grammar-109', $$これは何という花ですか。$$, $$これはなんというはなですか。$$, $$Como se chama esta flor?$$),
    ('n4-grammar-109', $$北海道の小樽という町に行きました。$$, $$ほっかいどうのおたるというまちにいきました。$$, $$Fui a uma cidade chamada Otaru, em Hokkaido.$$),
    ('n4-grammar-109', $$彼が会社をやめるという話を聞きました。$$, $$かれがかいしゃをやめるというはなしをききました。$$, $$Ouvi a história de que ele vai sair da empresa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「となりのトトロ」____映画を見たことがありますか。$$, $$Você já viu o filme chamado "Meu Amigo Totoro"?$$),
        (2, $$受付に山田____方がいらっしゃっています。$$, $$Há uma pessoa chamada Yamada na recepção.$$),
        (3, $$これは日本語で何____んですか。$$, $$Como se diz isso em japonês?$$),
        (4, $$来月、駅前に新しい店ができる____うわさがある。$$, $$Há um boato de que vai abrir uma loja nova em frente à estação no mês que vem.$$),
        (5, $$鈴木____先生を探しています。$$, $$Estou procurando um professor chamado Suzuki.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$という$$),
        (2, $$という$$),
        (3, $$という$$),
        (3, $$と言う$$),
        (4, $$という$$),
        (5, $$という$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
