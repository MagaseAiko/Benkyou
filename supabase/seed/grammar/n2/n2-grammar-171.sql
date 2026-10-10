-- n2-grammar-171 — 〜と考えられる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-171',
    'grammar',
    'N2',
    $$〜と考えられる$$,
    $$to kangaerareru$$,
    $$Acredita-se que / Pode-se considerar que / É provável que$$,
    $$と考えられる expressa uma opinião ou conclusão de forma objetiva, como se fosse uma avaliação geral e não só pessoal. Equivale a "acredita-se que" ou "pode-se considerar que".

É muito usado em textos acadêmicos, relatórios, notícias e análises. Por exemplo, "acredita-se que a causa do acidente foi descuido".

A forma passiva de 考える dá um tom mais neutro e menos pessoal.$$,
    $$É parecido com と思われる, que também é usado em textos formais.

と考えられる dá a ideia de uma conclusão baseada em lógica ou dados.$$,
    $$Frase (forma simples) + と考えられる
Substantivo / Adjetivo な + だ + と考えられる$$,
    $$と考えられる$$,
    $$と考えられる|と考えられます|と考えられて|とかんがえられる$$,
    ARRAY['と', '考えられる']::text[],
    ARRAY['と考えられる', 'と考えられます', 'と考えられている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-171', $$事故の原因は不注意だと考えられる。$$, $$じこのげんいんはふちゅういだとかんがえられる。$$, $$Acredita-se que a causa do acidente foi descuido.$$),
    ('n2-grammar-171', $$この遺跡は千年前のものと考えられている。$$, $$このいせきはせんねんまえのものとかんがえられている。$$, $$Acredita-se que estas ruínas são de mil anos atrás.$$),
    ('n2-grammar-171', $$今後、高齢者はさらに増えると考えられます。$$, $$こんご、こうれいしゃはさらにふえるとかんがえられます。$$, $$É provável que o número de idosos aumente ainda mais no futuro.$$),
    ('n2-grammar-171', $$この結果から、薬の効果があると考えられる。$$, $$このけっかから、くすりのこうかがあるとかんがえられる。$$, $$A partir deste resultado, pode-se considerar que o remédio faz efeito.$$),
    ('n2-grammar-171', $$犯人はまだ近くにいると考えられる。$$, $$はんにんはまだちかくにいるとかんがえられる。$$, $$Acredita-se que o culpado ainda está por perto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$景気はゆっくり回復する____。$$, $$É provável que a economia se recupere aos poucos.$$),
        (2, $$この病気の原因はストレスだ____。$$, $$Acredita-se que a causa desta doença é o estresse.$$),
        (3, $$火事は電気の故障によるもの____。$$, $$Acredita-se que o incêndio foi causado por uma falha elétrica.$$),
        (4, $$この絵は有名な画家が描いた____。$$, $$Pode-se considerar que este quadro foi pintado por um pintor famoso.$$),
        (5, $$人口は今後減っていく____。$$, $$É provável que a população diminua daqui em diante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と考えられる$$),
        (1, $$と考えられます$$),
        (2, $$と考えられる$$),
        (2, $$と考えられます$$),
        (3, $$と考えられる$$),
        (3, $$と考えられます$$),
        (4, $$と考えられる$$),
        (4, $$と考えられます$$),
        (5, $$と考えられる$$),
        (5, $$と考えられます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
