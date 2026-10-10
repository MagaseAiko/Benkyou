-- n1-grammar-58 — 〜こそあれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-58',
    'grammar',
    'N1',
    $$〜こそあれ$$,
    $$koso are$$,
    $$Embora haja / Pode até ter... mas / Apesar de$$,
    $$こそあれ reconhece que algo existe, mas mostra que o contrário não existe. Equivale a "pode até ter..., mas não..." ou "embora haja...".

A primeira parte admite um aspecto, e a segunda nega outro. Por exemplo, "pode até haver diferença de grau, mas todos têm preocupações" ou "há elogios, mas não há críticas".

É uma expressão formal e literária.$$,
    $$Costuma aparecer com 差こそあれ, 程度の差こそあれ e 感謝こそすれ.

É parecido com ことはあっても〜ない.$$,
    $$Substantivo + こそあれ + Frase negativa
Adjetivo な (sem な) + でこそあれ$$,
    $$こそあれ$$,
    $$こそあれ$$,
    ARRAY['こそ', 'あれ']::text[],
    ARRAY['こそあれ', 'でこそあれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-58', $$程度の差こそあれ、誰にでも悩みはある。$$, $$ていどのさこそあれ、だれにでもなやみはある。$$, $$Pode até haver diferença de grau, mas todo mundo tem preocupações.$$),
    ('n1-grammar-58', $$彼には感謝こそあれ、恨みはない。$$, $$かれにはかんしゃこそあれ、うらみはない。$$, $$Por ele sinto gratidão, mas nenhum rancor.$$),
    ('n1-grammar-58', $$形の違いこそあれ、どれも同じ機能だ。$$, $$かたちのちがいこそあれ、どれもおなじきのうだ。$$, $$Embora haja diferença de formato, todos têm a mesma função.$$),
    ('n1-grammar-58', $$苦労こそあれ、後悔はしていない。$$, $$くろうこそあれ、こうかいはしていない。$$, $$Pode até ter havido dificuldades, mas não me arrependo.$$),
    ('n1-grammar-58', $$この仕事は大変でこそあれ、嫌ではない。$$, $$このしごとはたいへんでこそあれ、いやではない。$$, $$Este trabalho pode até ser difícil, mas não é desagradável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大小の差____、どの国にも問題はある。$$, $$Pode até haver diferença de tamanho, mas todo país tem problemas.$$),
        (2, $$彼女には尊敬____、嫉妬はない。$$, $$Por ela tenho respeito, mas não inveja.$$),
        (3, $$貧乏で____、心は豊かだ。$$, $$Pode até ser pobre, mas o coração é rico.$$),
        (4, $$時間の差____、いつかは誰でも年をとる。$$, $$Pode até haver diferença de tempo, mas todos um dia envelhecem.$$),
        (5, $$厳しさ____、先生は優しい人だった。$$, $$Embora fosse rígido, o professor era uma pessoa gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそあれ$$),
        (2, $$こそあれ$$),
        (3, $$こそあれ$$),
        (4, $$こそあれ$$),
        (5, $$こそあれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
