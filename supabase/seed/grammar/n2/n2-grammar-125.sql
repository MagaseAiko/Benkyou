-- n2-grammar-125 — 〜を除いて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-125',
    'grammar',
    'N2',
    $$〜を除いて$$,
    $$wo nozoite$$,
    $$Exceto / Com exceção de / Tirando$$,
    $$を除いて indica uma exceção. Equivale a "exceto", "com exceção de" ou "tirando".

A pessoa diz que algo vale para todos ou para tudo, menos para aquele item. Por exemplo, "a loja abre todos os dias, exceto domingo".

É uma expressão um pouco formal, usada tanto na fala quanto na escrita.$$,
    $$É parecido com 以外, mas を除いて é mais formal.

A forma を除けば significa "tirando isso", e muitas vezes mostra que o resto é bom.$$,
    $$Substantivo + を除いて / を除き
Substantivo + を除けば$$,
    $$を除いて$$,
    $$を除いて|を除き|を除けば|をのぞいて$$,
    ARRAY['を', '除いて']::text[],
    ARRAY['を除いて', 'を除き', 'を除けば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-125', $$この店は日曜日を除いて、毎日営業している。$$, $$このみせはにちようびをのぞいて、まいにちえいぎょうしている。$$, $$Esta loja abre todos os dias, exceto domingo.$$),
    ('n2-grammar-125', $$彼を除いて、全員が賛成した。$$, $$かれをのぞいて、ぜんいんがさんせいした。$$, $$Todos concordaram, com exceção dele.$$),
    ('n2-grammar-125', $$一部の地域を除き、晴れるでしょう。$$, $$いちぶのちいきをのぞき、はれるでしょう。$$, $$Com exceção de algumas regiões, o tempo deve ficar ensolarado.$$),
    ('n2-grammar-125', $$値段を除けば、このホテルは最高だ。$$, $$ねだんをのぞけば、このホテルはさいこうだ。$$, $$Tirando o preço, este hotel é ótimo.$$),
    ('n2-grammar-125', $$祝日を除いて、授業があります。$$, $$しゅくじつをのぞいて、じゅぎょうがあります。$$, $$Há aulas, exceto nos feriados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、入場料は千円です。$$, $$Exceto para crianças, a entrada custa mil ienes.$$),
        (2, $$数学____、どの科目も得意だ。$$, $$Sou bom em todas as matérias, exceto matemática.$$),
        (3, $$この部分____、レポートはよく書けている。$$, $$Tirando esta parte, o relatório está bem escrito.$$),
        (4, $$一人____、全員が時間通りに来た。$$, $$Com exceção de uma pessoa, todos chegaram no horário.$$),
        (5, $$年末年始____、休まず営業します。$$, $$Funcionaremos sem folga, exceto no fim e início de ano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を除いて$$),
        (1, $$を除き$$),
        (1, $$をのぞいて$$),
        (2, $$を除いて$$),
        (2, $$を除き$$),
        (2, $$をのぞいて$$),
        (3, $$を除いて$$),
        (3, $$を除き$$),
        (3, $$を除けば$$),
        (3, $$をのぞいて$$),
        (4, $$を除いて$$),
        (4, $$を除き$$),
        (4, $$をのぞいて$$),
        (5, $$を除いて$$),
        (5, $$を除き$$),
        (5, $$をのぞいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
