-- n1-grammar-119 — 〜にまつわる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-119',
    'grammar',
    'N1',
    $$〜にまつわる$$,
    $$ni matsuwaru$$,
    $$Relacionado a / Ligado a / Sobre$$,
    $$にまつわる indica que algo está ligado a um tema, geralmente histórias, lendas, mistérios ou lembranças. Equivale a "relacionado a" ou "ligado a".

Por exemplo, "uma lenda ligada a este templo" ou "histórias sobre fantasmas".

É uma expressão um pouco formal, comum em textos e narrativas.$$,
    $$Costuma vir com palavras como 話, 伝説, 噂, エピソード e 謎.

É parecido com に関する, mas にまつわる é usado para histórias e coisas que envolvem mistério ou interesse.$$,
    $$Substantivo + にまつわる + Substantivo$$,
    $$にまつわる$$,
    $$にまつわる$$,
    ARRAY['に', 'まつわる']::text[],
    ARRAY['にまつわる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-119', $$この寺にまつわる伝説を聞いた。$$, $$このてらにまつわるでんせつをきいた。$$, $$Ouvi uma lenda ligada a este templo.$$),
    ('n1-grammar-119', $$この町には、幽霊にまつわる話が多い。$$, $$このまちには、ゆうれいにまつわるはなしがおおい。$$, $$Nesta cidade há muitas histórias sobre fantasmas.$$),
    ('n1-grammar-119', $$その絵にまつわる謎はまだ解けていない。$$, $$そのえにまつわるなぞはまだとけていない。$$, $$O mistério ligado a esse quadro ainda não foi resolvido.$$),
    ('n1-grammar-119', $$祖父から戦争にまつわる話を聞いた。$$, $$そふからせんそうにまつわるはなしをきいた。$$, $$Ouvi do meu avô histórias relacionadas à guerra.$$),
    ('n1-grammar-119', $$お金にまつわるトラブルは多い。$$, $$おかねにまつわるトラブルはおおい。$$, $$Há muitos problemas relacionados a dinheiro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この城____歴史を調べている。$$, $$Estou pesquisando a história ligada a este castelo.$$),
        (2, $$その歌手____うわさが広まった。$$, $$Espalharam-se boatos sobre esse cantor.$$),
        (3, $$桜____言い伝えが残っている。$$, $$Ainda existe uma lenda ligada às cerejeiras.$$),
        (4, $$食べ物____思い出を話してください。$$, $$Conte uma lembrança relacionada a comida.$$),
        (5, $$この宝石____不思議な話がある。$$, $$Existe uma história misteriosa ligada a esta joia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にまつわる$$),
        (2, $$にまつわる$$),
        (3, $$にまつわる$$),
        (4, $$にまつわる$$),
        (5, $$にまつわる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
