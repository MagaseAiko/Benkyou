-- n2-grammar-105 — 〜にしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-105',
    'grammar',
    'N2',
    $$〜にしても$$,
    $$ni shite mo$$,
    $$Mesmo que / Ainda assim / Mesmo para$$,
    $$にしても indica que, mesmo aceitando uma situação, existe algo que não combina ou que continua sendo um problema. Equivale a "mesmo que" ou "ainda assim".

A pessoa admite um fato, mas mostra sua insatisfação ou dúvida. Por exemplo, "mesmo que estivesse ocupado, podia ter avisado".

Também pode indicar um exemplo que representa um grupo, com o sentido de "mesmo para...". Por exemplo, "mesmo para mim, isso é difícil".$$,
    $$É parecido com にせよ e にしろ, mas にしても é mais comum na fala.

A expressão それにしても aparece no começo de frase com o sentido de "mesmo assim" ou "de qualquer forma".$$,
    $$Verbo (forma simples) + にしても
Adjetivo い + にしても
Adjetivo な / Substantivo + (である) + にしても$$,
    $$にしても$$,
    $$にしても$$,
    ARRAY['に', 'しても']::text[],
    ARRAY['にしても', 'それにしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-105', $$忙しかったにしても、連絡くらいできたはずだ。$$, $$いそがしかったにしても、れんらくくらいできたはずだ。$$, $$Mesmo ocupado, você podia pelo menos ter avisado.$$),
    ('n2-grammar-105', $$冗談にしても、言っていいことと悪いことがある。$$, $$じょうだんにしても、いっていいこととわるいことがある。$$, $$Mesmo sendo brincadeira, há coisas que se pode e não se pode dizer.$$),
    ('n2-grammar-105', $$安いにしても、この品質ではだめだ。$$, $$やすいにしても、このひんしつではだめだ。$$, $$Mesmo sendo barato, com esta qualidade não serve.$$),
    ('n2-grammar-105', $$私にしても、この問題は難しい。$$, $$わたしにしても、このもんだいはむずかしい。$$, $$Mesmo para mim, este problema é difícil.$$),
    ('n2-grammar-105', $$遅れるにしても、一言言ってほしかった。$$, $$おくれるにしても、ひとこといってほしかった。$$, $$Mesmo que fosse se atrasar, queria que tivesse avisado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のいたずら____、ひどすぎる。$$, $$Mesmo sendo travessura de criança, passou dos limites.$$),
        (2, $$初めて____、こんなミスはしないだろう。$$, $$Mesmo sendo a primeira vez, ninguém cometeria um erro desses.$$),
        (3, $$行かない____、返事はしておこう。$$, $$Mesmo que não vá, vou pelo menos responder.$$),
        (4, $$高い____、これは買う価値がある。$$, $$Mesmo sendo caro, vale a pena comprar.$$),
        (5, $$急いでいた____、走らないで。$$, $$Mesmo com pressa, não corra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしても$$),
        (2, $$にしても$$),
        (3, $$にしても$$),
        (4, $$にしても$$),
        (5, $$にしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
