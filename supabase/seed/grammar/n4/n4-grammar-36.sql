-- n4-grammar-36 — 〜ことができる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-36',
    'grammar',
    'N4',
    $$〜ことができる$$,
    $$koto ga dekiru$$,
    $$Poder / Conseguir / Saber (fazer)$$,
    $$ことができる é usado para dizer que alguém é capaz de fazer algo ou que algo é possível. Equivale a "poder", "conseguir" ou "saber fazer".

A estrutura junta o verbo na forma de dicionário com こと, que o transforma em substantivo, e できる, que significa "ser possível". A ideia literal é "fazer isso é possível".

Ela expressa tanto habilidade (saber tocar piano) quanto possibilidade (ser permitido tirar fotos em um lugar).

O sentido é o mesmo da forma potencial (話せる, 食べられる), mas ことができる soa um pouco mais formal e é muito comum em textos, regras e explicações.$$,
    $$Na conversa do dia a dia, a forma potencial é mais curta e natural. ことができる aparece mais em textos, avisos e situações formais.

ことができました expressa a alegria de ter conseguido algo depois de esforço.

Para substantivos, a estrutura é mais simples: Substantivo + ができる.$$,
    $$Verbo na forma de dicionário + ことができる
Verbo na forma de dicionário + ことができます (educado)

Negativo: ことができない / ことができません
Passado: ことができた / ことができました
Passado negativo: ことができなかった / ことができませんでした$$,
    $$ことができる$$,
    $$ことができる|ことができます|ことができない|ことができません|ことができた|ことができました|ことができなかった$$,
    ARRAY['こと', 'が', 'できる']::text[],
    ARRAY['ことができる', 'ことができます', 'ことができない', 'ことができません', 'ことができた', 'ことができました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-36', $$私はピアノを弾くことができます。$$, $$わたしはピアノをひくことができます。$$, $$Eu sei tocar piano.$$),
    ('n4-grammar-36', $$ここで写真を撮ることができますか。$$, $$ここでしゃしんをとることができますか。$$, $$É possível tirar fotos aqui?$$),
    ('n4-grammar-36', $$この図書館では、本を二週間借りることができる。$$, $$このとしょかんでは、ほんをにしゅうかんかりることができる。$$, $$Nesta biblioteca, é possível pegar livros emprestados por duas semanas.$$),
    ('n4-grammar-36', $$足が痛くて、走ることができません。$$, $$あしがいたくて、はしることができません。$$, $$Estou com dor no pé e não consigo correr.$$),
    ('n4-grammar-36', $$やっと日本語で手紙を書くことができました。$$, $$やっとにほんごでてがみをかくことができました。$$, $$Finalmente consegui escrever uma carta em japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は五か国語を話す____。$$, $$Ele sabe falar cinco idiomas.$$),
        (2, $$このホテルでは、無料でインターネットを使う____。$$, $$Neste hotel, é possível usar a internet de graça.$$),
        (3, $$昨日は熱があって、学校に行く____。$$, $$Ontem eu estava com febre e não consegui ir à escola.$$),
        (4, $$このカードで、電車に乗る____か。$$, $$É possível pegar o trem com este cartão?$$),
        (5, $$一生懸命練習して、試合に勝つ____。$$, $$Treinei muito e consegui vencer a partida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことができます$$),
        (1, $$ことができる$$),
        (2, $$ことができます$$),
        (2, $$ことができる$$),
        (3, $$ことができませんでした$$),
        (3, $$ことができなかった$$),
        (4, $$ことができます$$),
        (5, $$ことができました$$),
        (5, $$ことができた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
