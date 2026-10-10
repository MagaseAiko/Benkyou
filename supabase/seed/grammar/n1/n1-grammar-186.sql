-- n1-grammar-186 — 〜てからというもの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-186',
    'grammar',
    'N1',
    $$〜てからというもの$$,
    $$te kara to iu mono$$,
    $$Desde que / Desde então / A partir do momento em que$$,
    $$てからというもの indica que, a partir de um acontecimento, a situação mudou e continua diferente até agora. Equivale a "desde que" ou "a partir do momento em que".

A pessoa destaca uma mudança grande e duradoura. Por exemplo, "desde que meu filho nasceu, minha vida mudou completamente".

É uma expressão um pouco formal e emotiva.$$,
    $$É parecido com て以来, mas てからというもの destaca mais a emoção e a mudança.

A segunda parte descreve um estado que continua, não uma ação única.$$,
    $$Verbo (forma て) + からというもの$$,
    $$てからというもの$$,
    $$てからというもの|でからというもの$$,
    ARRAY['て', 'から', 'という', 'もの']::text[],
    ARRAY['てからというもの', 'でからというもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-186', $$子供が生まれてからというもの、生活が一変した。$$, $$こどもがうまれてからというもの、せいかつがいっぺんした。$$, $$Desde que meu filho nasceu, minha vida mudou completamente.$$),
    ('n1-grammar-186', $$彼女に出会ってからというもの、毎日が楽しい。$$, $$かのじょにであってからというもの、まいにちがたのしい。$$, $$Desde que a conheci, todos os dias são divertidos.$$),
    ('n1-grammar-186', $$日本に来てからというもの、和食ばかり食べている。$$, $$にほんにきてからというもの、わしょくばかりたべている。$$, $$Desde que vim ao Japão, só como comida japonesa.$$),
    ('n1-grammar-186', $$犬を飼い始めてからというもの、毎朝散歩している。$$, $$いぬをかいはじめてからというもの、まいあささんぽしている。$$, $$Desde que comecei a ter um cachorro, caminho toda manhã.$$),
    ('n1-grammar-186', $$父が亡くなってからというもの、母は元気がない。$$, $$ちちがなくなってからというもの、はははげんきがない。$$, $$Desde que meu pai faleceu, minha mãe anda desanimada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たばこをやめ____、体の調子がいい。$$, $$Desde que parei de fumar, me sinto bem.$$),
        (2, $$スマホを買っ____、本を読まなくなった。$$, $$Desde que comprei um smartphone, parei de ler livros.$$),
        (3, $$あの事故があっ____、彼は車を運転しなくなった。$$, $$Desde aquele acidente, ele parou de dirigir.$$),
        (4, $$ヨガを始め____、よく眠れるようになった。$$, $$Desde que comecei a fazer ioga, passei a dormir bem.$$),
        (5, $$彼が転校し____、クラスが静かになった。$$, $$Desde que ele mudou de escola, a turma ficou quieta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てからというもの$$),
        (2, $$てからというもの$$),
        (3, $$てからというもの$$),
        (4, $$てからというもの$$),
        (5, $$てからというもの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
