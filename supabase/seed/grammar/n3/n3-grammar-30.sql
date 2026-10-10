-- n3-grammar-30 — 一度に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-30',
    'grammar',
    'N3',
    $$一度に$$,
    $$ichido ni$$,
    $$De uma vez / Ao mesmo tempo / Tudo junto$$,
    $$一度に significa "de uma vez" ou "ao mesmo tempo". Ele indica que várias coisas acontecem ou são feitas juntas, em uma única ocasião, em vez de aos poucos.

Por exemplo, comer muito de uma vez, fazer duas coisas ao mesmo tempo ou receber vários trabalhos de uma só vez.

Também é usado para falar de capacidade, como "este elevador leva dez pessoas de uma vez".

Muitas vezes, aparece em conselhos ou avisos, indicando que fazer tudo de uma vez não é bom: "é melhor não tentar decorar tudo de uma vez".$$,
    $$Não confunda 一度に (de uma vez) com 一度 (uma vez, alguma vez), como em 一度行ってみたい.

Expressões parecidas são 同時に (ao mesmo tempo, mais formal) e 一気に (de uma vez só, com força e rapidez).

Em regras de uso, como em elevadores e brinquedos, 一度に aparece para indicar a capacidade máxima.$$,
    $$一度に + Verbo
一度に + Quantidade + Verbo

Escrita: 一度に / いちどに$$,
    $$一度に$$,
    $$一度に|いちどに$$,
    ARRAY['一度', 'に']::text[],
    ARRAY['一度に', 'いちどに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-30', $$一度にたくさん食べると、体によくない。$$, $$いちどにたくさんたべると、からだによくない。$$, $$Comer muito de uma vez não faz bem para o corpo.$$),
    ('n3-grammar-30', $$一度に二つのことはできません。$$, $$いちどにふたつのことはできません。$$, $$Não consigo fazer duas coisas ao mesmo tempo.$$),
    ('n3-grammar-30', $$仕事が一度に来て、大変だった。$$, $$しごとがいちどにきて、たいへんだった。$$, $$O trabalho veio todo de uma vez, e foi difícil.$$),
    ('n3-grammar-30', $$このエレベーターは一度に十人乗れます。$$, $$このエレベーターはいちどにじゅうにんのれます。$$, $$Este elevador leva dez pessoas de uma vez.$$),
    ('n3-grammar-30', $$単語を一度に覚えようとしないほうがいい。$$, $$たんごをいちどにおぼえようとしないほうがいい。$$, $$É melhor não tentar decorar as palavras todas de uma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____全部の荷物は運べない。$$, $$Não dá para carregar toda a bagagem de uma vez.$$),
        (2, $$このバスは____五十人乗ることができる。$$, $$Este ônibus pode levar cinquenta pessoas de uma vez.$$),
        (3, $$いろいろな問題が____起きて、困った。$$, $$Vários problemas aconteceram ao mesmo tempo, e fiquei sem saber o que fazer.$$),
        (4, $$給料を____使ってしまった。$$, $$Acabei gastando o salário todo de uma vez.$$),
        (5, $$薬を____たくさん飲んではいけません。$$, $$Não se deve tomar muito remédio de uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一度に$$),
        (1, $$いちどに$$),
        (2, $$一度に$$),
        (2, $$いちどに$$),
        (3, $$一度に$$),
        (3, $$いちどに$$),
        (4, $$一度に$$),
        (4, $$いちどに$$),
        (5, $$一度に$$),
        (5, $$いちどに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
