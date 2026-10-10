-- n3-grammar-31 — いくら〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-31',
    'grammar',
    'N3',
    $$いくら〜ても$$,
    $$ikura ~ te mo$$,
    $$Por mais que / Não importa quanto$$,
    $$いくら〜ても é usado para dizer que, por mais que algo aconteça ou seja feito, o resultado não muda. Equivale a "por mais que" ou "não importa quanto".

いくら, que normalmente significa "quanto", aqui indica um grau ou uma quantidade sem limite. O verbo ou adjetivo vai para a forma ても.

A segunda parte mostra que o resultado continua o mesmo. Pode ser algo negativo, como uma frustração ("por mais que eu chame, ninguém responde"), ou uma determinação ("por mais caro que seja, quero").

É muito parecido com どんなに〜ても. いくら costuma destacar quantidade e repetição, como esforço repetido ou dinheiro, enquanto どんなに destaca a intensidade de um estado.$$,
    $$Com dinheiro, いくら〜ても aparece em frases como いくらお金があっても ("por mais dinheiro que se tenha").

A segunda parte geralmente expressa um resultado que não muda, então frases com いくら〜ても costumam ter tom de resignação, crítica ou persistência.

Sem ても, いくら sozinho continua significando "quanto (custa)".$$,
    $$いくら + Verbo na forma て + も
いくら + Adjetivo い sem い + くても
いくら + Adjetivo な / Substantivo + でも$$,
    $$いくら$$,
    $$いくら$$,
    ARRAY['いくら', 'ても']::text[],
    ARRAY['いくら〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-31', $$彼はいくら食べても太らない。$$, $$かれはいくらたべてもふとらない。$$, $$Por mais que ele coma, não engorda.$$),
    ('n3-grammar-31', $$いくら呼んでも、返事がない。$$, $$いくらよんでも、へんじがない。$$, $$Por mais que eu chame, ninguém responde.$$),
    ('n3-grammar-31', $$いくら高くても、この車が欲しい。$$, $$いくらたかくても、このくるまがほしい。$$, $$Por mais caro que seja, quero este carro.$$),
    ('n3-grammar-31', $$いくら説明しても、彼はわかってくれなかった。$$, $$いくらせつめいしても、かれはわかってくれなかった。$$, $$Por mais que eu explicasse, ele não entendeu.$$),
    ('n3-grammar-31', $$いくら忙しくても、朝ご飯は食べたほうがいい。$$, $$いくらいそがしくても、あさごはんはたべたほうがいい。$$, $$Por mais ocupado que esteja, é melhor tomar café da manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____練習しても、上手にならない。$$, $$Por mais que eu pratique, não melhoro.$$),
        (2, $$____探しても、鍵が見つからない。$$, $$Por mais que eu procure, não acho a chave.$$),
        (3, $$____寒くても、彼は毎朝走る。$$, $$Por mais frio que esteja, ele corre toda manhã.$$),
        (4, $$____お金があっても、幸せとは限らない。$$, $$Por mais dinheiro que se tenha, isso não garante a felicidade.$$),
        (5, $$____電話しても、つながらない。$$, $$Por mais que eu ligue, a ligação não completa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いくら$$),
        (2, $$いくら$$),
        (3, $$いくら$$),
        (4, $$いくら$$),
        (5, $$いくら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
