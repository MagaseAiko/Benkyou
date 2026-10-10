-- n5-grammar-55 — 〜のが好き
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-55',
    'grammar',
    'N5',
    $$〜のが好き$$,
    $$no ga suki$$,
    $$Gostar de (fazer)$$,
    $$のが好き é usado para dizer que alguém gosta de fazer alguma coisa. Equivale a "gostar de" + ação.

好き é um adjetivo な, e não um verbo. Por isso, a coisa de que se gosta é marcada com が. Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo: "o ato de ler", "o ato de nadar".

A pessoa que gosta costuma vir com は. Para reforçar, usa-se 大好き, que significa "adorar".

O negativo segue a regra dos adjetivos な: のが好きじゃない ou のが好きではありません. No passado, のが好きでした ou のが好きだった.$$,
    $$Em frases negativas ou de contraste, é comum trocar が por は, como em のは好きじゃない, para destacar que é aquela ação específica que a pessoa não gosta.

Um erro muito comum é usar o verbo direto antes de 好き, sem の. O verbo precisa virar substantivo primeiro.

A forma こと também pode transformar verbos em substantivos, mas com 好き, o mais natural no dia a dia é の.$$,
    $$Verbo na forma de dicionário + のが + 好き + です / だ
Verbo na forma de dicionário + のが + 大好き + です / だ
Pessoa + は + Verbo + のが好き
Verbo + のが好きな + Substantivo

Negativo: のが好きじゃない / のが好きではありません
Passado: のが好きでした / のが好きだった$$,
    $$のが好き$$,
    $$のが好き|のがすき|のが大好き|のがだいすき$$,
    ARRAY['の', 'が', '好き']::text[],
    ARRAY['のが好き', 'のがすき', 'のが大好き', 'のが好きです', 'のが好きだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-55', $$私は本を読むのが好きです。$$, $$わたしはほんをよむのがすきです。$$, $$Eu gosto de ler livros.$$),
    ('n5-grammar-55', $$弟はゲームをするのが大好きです。$$, $$おとうとはゲームをするのがだいすきです。$$, $$Meu irmão mais novo adora jogar videogame.$$),
    ('n5-grammar-55', $$週末に公園を歩くのが好きです。$$, $$しゅうまつにこうえんをあるくのがすきです。$$, $$Gosto de caminhar no parque no fim de semana.$$),
    ('n5-grammar-55', $$子供のころ、絵を描くのが好きでした。$$, $$こどものころ、えをかくのがすきでした。$$, $$Quando eu era criança, gostava de desenhar.$$),
    ('n5-grammar-55', $$彼女は友達と話すのが好きな人です。$$, $$かのじょはともだちとはなすのがすきなひとです。$$, $$Ela é uma pessoa que gosta de conversar com os amigos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は音楽を聞く____です。$$, $$Eu gosto de ouvir música.$$),
        (2, $$母は花を育てる____です。$$, $$Minha mãe gosta de cultivar flores.$$),
        (3, $$子供のころ、川で泳ぐ____でした。$$, $$Quando eu era criança, gostava de nadar no rio.$$),
        (4, $$犬と散歩する____ですか。$$, $$Você gosta de passear com o cachorro?$$),
        (5, $$日本の歌を歌う____人は多いです。$$, $$Tem muitas pessoas que gostam de cantar músicas japonesas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが好き$$),
        (1, $$のがすき$$),
        (1, $$のが大好き$$),
        (1, $$のがだいすき$$),
        (2, $$のが好き$$),
        (2, $$のがすき$$),
        (2, $$のが大好き$$),
        (2, $$のがだいすき$$),
        (3, $$のが好き$$),
        (3, $$のがすき$$),
        (3, $$のが大好き$$),
        (3, $$のがだいすき$$),
        (4, $$のが好き$$),
        (4, $$のがすき$$),
        (5, $$のが好きな$$),
        (5, $$のがすきな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
