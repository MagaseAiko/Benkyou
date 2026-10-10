-- n2-grammar-75 — 〜ものの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-75',
    'grammar',
    'N2',
    $$〜ものの$$,
    $$mono no$$,
    $$Embora / Apesar de / Mas$$,
    $$ものの serve para ligar duas ideias contrárias. Equivale a "embora" ou "apesar de".

A primeira parte reconhece um fato, e a segunda mostra que o resultado esperado não aconteceu. Por exemplo, "embora tenha comprado o livro, ainda não li".

É uma expressão um pouco formal, mais comum na escrita.$$,
    $$É parecido com けれども e のに, mas ものの não carrega tanta emoção de frustração como のに.

A forma とはいうものの significa "apesar de dizer isso".$$,
    $$Verbo (forma simples) + ものの
Adjetivo い + ものの
Adjetivo な + な / である + ものの
Substantivo + である + ものの$$,
    $$ものの$$,
    $$ものの$$,
    ARRAY['もの', 'の']::text[],
    ARRAY['ものの', 'とはいうものの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-75', $$本を買ったものの、まだ読んでいない。$$, $$ほんをかったものの、まだよんでいない。$$, $$Embora tenha comprado o livro, ainda não li.$$),
    ('n2-grammar-75', $$大学は出たものの、仕事が見つからない。$$, $$だいがくはでたものの、しごとがみつからない。$$, $$Apesar de ter me formado, não encontro emprego.$$),
    ('n2-grammar-75', $$習ってはいるものの、なかなか上手にならない。$$, $$ならってはいるものの、なかなかじょうずにならない。$$, $$Embora esteja fazendo aulas, não consigo melhorar.$$),
    ('n2-grammar-75', $$便利なものの、値段が高い。$$, $$べんりなものの、ねだんがたかい。$$, $$Embora seja prático, o preço é alto.$$),
    ('n2-grammar-75', $$春とはいうものの、まだ寒い日が続いている。$$, $$はるとはいうものの、まださむいひがつづいている。$$, $$Apesar de ser primavera, os dias continuam frios.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束はした____、行けるかどうかわからない。$$, $$Embora eu tenha prometido, não sei se vou poder ir.$$),
        (2, $$ジムに入会した____、一度も行っていない。$$, $$Embora tenha me inscrito na academia, não fui nenhuma vez.$$),
        (3, $$説明書を読んだ____、使い方がよくわからない。$$, $$Apesar de ter lido o manual, não entendo bem como usar.$$),
        (4, $$この部屋は広い____、駅から遠い。$$, $$Embora este quarto seja espaçoso, fica longe da estação.$$),
        (5, $$自信はない____、やってみることにした。$$, $$Embora não tenha confiança, resolvi tentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものの$$),
        (2, $$ものの$$),
        (3, $$ものの$$),
        (4, $$ものの$$),
        (5, $$ものの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
