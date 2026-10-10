-- n1-grammar-36 — 〜放題
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-36',
    'grammar',
    'N1',
    $$〜放題$$,
    $$houdai$$,
    $$À vontade / Sem limite / Do jeito que quiser$$,
    $$放題 indica que algo é feito livremente, sem limite. Equivale a "à vontade" ou "sem limite".

Tem dois usos. O primeiro é positivo, como em 食べ放題 e 飲み放題, que significam "coma à vontade" e "beba à vontade" em restaurantes.

O segundo é negativo e indica que algo foi deixado sem controle, como "deixar o jardim abandonado" ou "fazer o que bem entende".$$,
    $$Expressões comuns são 食べ放題, 飲み放題, 言いたい放題, やりたい放題 e 荒れ放題.

No uso negativo, mostra crítica à falta de controle.$$,
    $$Verbo (forma ます sem ます) + 放題
Adjetivo な / Substantivo + 放題
Verbo (forma たい) + 放題$$,
    $$放題$$,
    $$放題|ほうだい$$,
    ARRAY['放題']::text[],
    ARRAY['放題', '食べ放題', 'やりたい放題']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-36', $$この店は二千円で食べ放題だ。$$, $$このみせはにせんえんでたべほうだいだ。$$, $$Nesta loja, por dois mil ienes, você come à vontade.$$),
    ('n1-grammar-36', $$彼は言いたい放題言って帰った。$$, $$かれはいいたいほうだいいってかえった。$$, $$Ele disse tudo o que quis e foi embora.$$),
    ('n1-grammar-36', $$庭は荒れ放題になっている。$$, $$にわはあれほうだいになっている。$$, $$O jardim está completamente abandonado.$$),
    ('n1-grammar-36', $$子供たちはやりたい放題だ。$$, $$こどもたちはやりたいほうだいだ。$$, $$As crianças fazem o que bem entendem.$$),
    ('n1-grammar-36', $$このプランは飲み放題がついている。$$, $$このプランはのみほうだいがついている。$$, $$Este plano inclui bebida à vontade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ケーキが食べ____の店に行った。$$, $$Fui a uma loja de bolo à vontade.$$),
        (2, $$彼女は髪を伸び____にしている。$$, $$Ela deixa o cabelo crescer sem cuidar.$$),
        (3, $$親がいないので、子供はしたい____だ。$$, $$Como os pais não estão, a criança faz o que quer.$$),
        (4, $$このアプリは月千円で音楽が聴き____だ。$$, $$Com este aplicativo, por mil ienes por mês, dá para ouvir música à vontade.$$),
        (5, $$ネットで言いたい____書く人がいる。$$, $$Tem gente que escreve na internet tudo o que bem entende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$放題$$),
        (2, $$放題$$),
        (3, $$放題$$),
        (4, $$放題$$),
        (5, $$放題$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
