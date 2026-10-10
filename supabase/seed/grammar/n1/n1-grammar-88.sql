-- n1-grammar-88 — 〜ながらに / 〜ながらの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-88',
    'grammar',
    'N1',
    $$〜ながらに / 〜ながらの$$,
    $$nagara ni / nagara no$$,
    $$Desde / Ainda em / Tal como$$,
    $$ながらに e ながらの indicam que um estado continua igual, sem mudanças. Equivalem a "desde", "ainda em" ou "tal como".

Aparecem em expressões fixas. Por exemplo, 生まれながらに significa "desde o nascimento", 涙ながらに significa "em lágrimas", e 昔ながらの significa "tal como antigamente".

ながらの vem antes de substantivos, e ながらに funciona como advérbio.$$,
    $$Só funciona com algumas palavras fixas, como 生まれながら, 涙ながら, 昔ながら, いながらにして e 居ながら.

Não se confunde com ながら de "enquanto".$$,
    $$Substantivo / Verbo (forma ます sem ます) + ながらに + Verbo
Substantivo / Verbo (forma ます sem ます) + ながらの + Substantivo$$,
    $$ながらに$$,
    $$ながらに|ながらの|ながら$$,
    ARRAY['ながら', 'に']::text[],
    ARRAY['ながらに', 'ながらの', 'ながらにして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-88', $$彼は生まれながらに音楽の才能があった。$$, $$かれはうまれながらにおんがくのさいのうがあった。$$, $$Ele tinha talento para música desde o nascimento.$$),
    ('n1-grammar-88', $$この町には昔ながらの町並みが残っている。$$, $$このまちにはむかしながらのまちなみがのこっている。$$, $$Nesta cidade, ainda resta uma paisagem urbana tal como antigamente.$$),
    ('n1-grammar-88', $$彼女は涙ながらに事故の様子を語った。$$, $$かのじょはなみだながらにじこのようすをかたった。$$, $$Ela contou em lágrimas como foi o acidente.$$),
    ('n1-grammar-88', $$インターネットで、家にいながらにして買い物ができる。$$, $$インターネットで、いえにいながらにしてかいものができる。$$, $$Com a internet, dá para fazer compras sem sair de casa.$$),
    ('n1-grammar-88', $$昔ながらの製法で作られたしょうゆだ。$$, $$むかしながらのせいほうでつくられたしょうゆだ。$$, $$É um shoyu feito com o método tradicional de antigamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この店は昔____味を守っている。$$, $$Esta loja mantém o sabor tal como antigamente.$$),
        (2, $$彼女は涙____別れを告げた。$$, $$Ela se despediu em lágrimas.$$),
        (3, $$人は生まれ____平等である。$$, $$As pessoas são iguais desde o nascimento.$$),
        (4, $$昔____祭りが今も続いている。$$, $$Um festival tal como antigamente continua até hoje.$$),
        (5, $$家にい____、世界中の人と話せる。$$, $$Sem sair de casa, dá para conversar com pessoas do mundo todo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながらの$$),
        (2, $$ながらに$$),
        (3, $$ながらに$$),
        (4, $$ながらの$$),
        (5, $$ながらにして$$),
        (5, $$ながらに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
