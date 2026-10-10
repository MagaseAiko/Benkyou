-- n1-grammar-219 — ともすれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-219',
    'grammar',
    'N1',
    $$ともすれば$$,
    $$tomo sureba$$,
    $$Tendência a / Facilmente / Às vezes acaba$$,
    $$ともすれば indica que algo tende a acontecer facilmente, geralmente algo negativo. Equivale a "facilmente" ou "tendência a".

A pessoa mostra que, se não tomar cuidado, aquilo acaba acontecendo. Por exemplo, "as pessoas tendem a esquecer o que é importante".

Costuma vir junto com がちだ ou しやすい no fim da frase.$$,
    $$A forma ともすると tem o mesmo sentido.

É uma expressão formal, comum na escrita.$$,
    $$ともすれば + Frase + がちだ / しやすい
ともすると + Frase$$,
    $$ともすれば$$,
    $$ともすれば|ともすると$$,
    ARRAY['とも', 'すれば']::text[],
    ARRAY['ともすれば', 'ともすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-219', $$忙しいと、ともすれば家族のことを忘れがちだ。$$, $$いそがしいと、ともすればかぞくのことをわすれがちだ。$$, $$Quando se está ocupado, há a tendência de esquecer a família.$$),
    ('n1-grammar-219', $$人はともすれば、楽な方へ流されやすい。$$, $$ひとはともすれば、らくなほうへながされやすい。$$, $$As pessoas tendem facilmente a ir pelo caminho mais fácil.$$),
    ('n1-grammar-219', $$ともすると、自分の意見ばかり言ってしまう。$$, $$ともすると、じぶんのいけんばかりいってしまう。$$, $$Às vezes acabo falando só da minha opinião.$$),
    ('n1-grammar-219', $$若いころは、ともすれば無理をしがちだ。$$, $$わかいころは、ともすればむりをしがちだ。$$, $$Quando se é jovem, há a tendência de se forçar demais.$$),
    ('n1-grammar-219', $$ともすれば、大切なことを見失ってしまう。$$, $$ともすれば、たいせつなことをみうしなってしまう。$$, $$Facilmente acabamos perdendo de vista o que é importante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冬は、____運動不足になりがちだ。$$, $$No inverno, há a tendência de faltar exercício.$$),
        (2, $$____、人は他人と自分を比べてしまう。$$, $$As pessoas facilmente acabam se comparando com os outros.$$),
        (3, $$一人暮らしだと、____食事が偏りがちだ。$$, $$Morando sozinho, há a tendência de ter uma alimentação desequilibrada.$$),
        (4, $$慣れてくると、____注意が足りなくなる。$$, $$Quando a gente se acostuma, facilmente a atenção diminui.$$),
        (5, $$試験前は、____夜更かししがちだ。$$, $$Antes das provas, há a tendência de ficar acordado até tarde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-219', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともすれば$$),
        (1, $$ともすると$$),
        (2, $$ともすれば$$),
        (2, $$ともすると$$),
        (3, $$ともすれば$$),
        (3, $$ともすると$$),
        (4, $$ともすれば$$),
        (4, $$ともすると$$),
        (5, $$ともすれば$$),
        (5, $$ともすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
