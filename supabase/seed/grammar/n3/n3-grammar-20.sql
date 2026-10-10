-- n3-grammar-20 — どんなに〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-20',
    'grammar',
    'N3',
    $$どんなに〜ても$$,
    $$donna ni ~ te mo$$,
    $$Por mais que / Não importa o quanto$$,
    $$どんなに〜ても é usado para dizer que o resultado não muda, por maior que seja o esforço ou a intensidade de algo. Equivale a "por mais que" ou "não importa o quanto".

どんなに vem no começo, indicando um grau extremo, e o verbo ou adjetivo vai para a forma ても.

A segunda parte pode mostrar determinação ("por mais ocupado que esteja, escrevo meu diário") ou frustração ("por mais que pratique, não melhoro").

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.$$,
    $$いくら〜ても tem o mesmo sentido e também é muito comum. いくら é usado com frequência para quantidades e esforço repetido.

A segunda parte não muda por causa da primeira. Por isso, frases com どんなに〜ても costumam expressar persistência ou impossibilidade.

Na escrita, também aparece たとえ〜ても, que destaca uma hipótese ("mesmo que").$$,
    $$どんなに + Verbo na forma て + も
どんなに + Adjetivo い sem い + くても
どんなに + Adjetivo な / Substantivo + でも$$,
    $$どんなに$$,
    $$どんなに$$,
    ARRAY['どんなに', 'ても']::text[],
    ARRAY['どんなに〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-20', $$どんなに忙しくても、毎日日記を書いています。$$, $$どんなにいそがしくても、まいにちにっきをかいています。$$, $$Por mais ocupado que eu esteja, escrevo meu diário todo dia.$$),
    ('n3-grammar-20', $$どんなに練習しても、上手にならない。$$, $$どんなにれんしゅうしても、じょうずにならない。$$, $$Por mais que eu pratique, não melhoro.$$),
    ('n3-grammar-20', $$どんなに高くても、この時計が欲しい。$$, $$どんなにたかくても、このとけいがほしい。$$, $$Por mais caro que seja, quero este relógio.$$),
    ('n3-grammar-20', $$どんなに疲れていても、彼は笑顔を忘れない。$$, $$どんなにつかれていても、かれはえがおをわすれない。$$, $$Por mais cansado que esteja, ele nunca deixa de sorrir.$$),
    ('n3-grammar-20', $$どんなに頼んでも、彼は許してくれなかった。$$, $$どんなにたのんでも、かれはゆるしてくれなかった。$$, $$Por mais que eu implorasse, ele não me perdoou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____雨が強くても、試合は行われます。$$, $$Por mais forte que seja a chuva, a partida será realizada.$$),
        (2, $$____勉強しても、この問題はわからない。$$, $$Por mais que eu estude, não entendo esta questão.$$),
        (3, $$____遠くても、会いに行きます。$$, $$Por mais longe que seja, vou te ver.$$),
        (4, $$____謝っても、彼女は許してくれない。$$, $$Por mais que eu peça desculpas, ela não me perdoa.$$),
        (5, $$____つらくても、あきらめないでください。$$, $$Por mais difícil que seja, não desista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どんなに$$),
        (2, $$どんなに$$),
        (3, $$どんなに$$),
        (4, $$どんなに$$),
        (5, $$どんなに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
