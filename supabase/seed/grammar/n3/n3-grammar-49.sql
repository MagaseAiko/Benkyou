-- n3-grammar-49 — 〜ことから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-49',
    'grammar',
    'N3',
    $$〜ことから$$,
    $$koto kara$$,
    $$Por causa de / Pelo fato de / A partir do fato de$$,
    $$ことから é usado para indicar a origem, o motivo ou a base de uma conclusão. Equivale a "por causa de", "pelo fato de" ou "a partir do fato de".

Ele tem três usos principais:
• Origem de um nome: explicar por que algo se chama assim, como uma cidade que recebeu um nome porque dela se vê o Monte Fuji.
• Base para uma conclusão: a partir de um fato observado, chega-se a uma dedução, como concluir que choveu porque a rua está molhada.
• Ponto de partida de uma consequência: algo pequeno que levou a um resultado maior, como um erro pequeno que virou um grande problema.

A frase antes de ことから fica na forma simples. Com adjetivos な, usa-se な ou である, e com substantivos, である.

É um pouco formal e aparece muito em textos explicativos.$$,
    $$Comparado a から ou ので, ことから destaca que o motivo é um fato objetivo, observável.

É muito usado para explicar a origem de nomes de lugares, apelidos e expressões.

Em textos de investigação ou dedução, ことから〜と考えられる ("a partir disso, pode-se pensar que...") é comum.$$,
    $$Verbo / Adjetivo い (forma simples) + ことから
Adjetivo な + な / である + ことから
Substantivo + である + ことから

… + ことから、 + 〜と呼ばれる / 〜がわかる / 〜になった$$,
    $$ことから$$,
    $$ことから$$,
    ARRAY['こと', 'から']::text[],
    ARRAY['ことから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-49', $$富士山が見えることから、この町は「富士見」と呼ばれている。$$, $$ふじさんがみえることから、このまちは「ふじみ」とよばれている。$$, $$Como dá para ver o Monte Fuji, esta cidade é chamada de "Fujimi".$$),
    ('n3-grammar-49', $$道が濡れていることから、雨が降ったとわかる。$$, $$みちがぬれていることから、あめがふったとわかる。$$, $$Pelo fato de a rua estar molhada, dá para saber que choveu.$$),
    ('n3-grammar-49', $$彼は足が速いことから、「チーター」というあだ名がついた。$$, $$かれはあしがはやいことから、「チーター」というあだながついた。$$, $$Por ser rápido, ele ganhou o apelido de "Guepardo".$$),
    ('n3-grammar-49', $$小さなミスをしたことから、大きな問題になった。$$, $$ちいさなミスをしたことから、おおきなもんだいになった。$$, $$A partir de um pequeno erro, virou um grande problema.$$),
    ('n3-grammar-49', $$顔が似ていることから、二人は兄弟だと思われた。$$, $$かおがにていることから、ふたりはきょうだいだとおもわれた。$$, $$Por terem rostos parecidos, os dois foram confundidos com irmãos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$星がよく見える____、この丘は人気がある。$$, $$Por dar para ver bem as estrelas, esta colina é popular.$$),
        (2, $$指紋が残っていた____、犯人がわかった。$$, $$A partir das impressões digitais deixadas, descobriram o culpado.$$),
        (3, $$形が鶴に似ている____、その池は「鶴池」と呼ばれている。$$, $$Por ter a forma parecida com um grou, esse lago é chamado de "Lago do Grou".$$),
        (4, $$窓が開いていた____、泥棒が入ったと考えられる。$$, $$Pelo fato de a janela estar aberta, acredita-se que um ladrão entrou.$$),
        (5, $$小さなけんかをした____、二人は口をきかなくなった。$$, $$A partir de uma briguinha, os dois pararam de se falar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことから$$),
        (2, $$ことから$$),
        (3, $$ことから$$),
        (4, $$ことから$$),
        (5, $$ことから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
