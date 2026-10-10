-- n4-grammar-145 — 疑問詞＋も〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-145',
    'grammar',
    'N4',
    $$疑問詞＋も〜ない$$,
    $$gimonshi + mo ~ nai$$,
    $$Nada / Ninguém / Nenhum lugar / Nenhum$$,
    $$Quando uma palavra interrogativa recebe も e o verbo fica na forma negativa, a frase expressa uma negação total. Equivale a "nada", "ninguém", "nenhum lugar" ou "nenhum".

• 何も〜ない: nada.
• 誰も〜ない: ninguém.
• どこにも / どこへも〜ない: nenhum lugar.
• どれも〜ない: nenhum (entre várias opções).

O verbo precisa estar sempre na forma negativa. Por exemplo, "não comi nada", "não tem ninguém", "não fui a lugar nenhum".

Com partículas como に, へ e と, elas ficam entre a palavra interrogativa e も: 誰にも, どこにも, 誰とも.

Isso é diferente de 疑問詞+か, que indica algo indefinido em frases afirmativas ("algo", "alguém").$$,
    $$いつも não segue esse padrão: いつも significa "sempre", e não "nunca". Para "nunca", usa-se 一度も〜ない ou 決して〜ない.

Em frases afirmativas, どれも e 誰も também podem significar "todos", como em どれもおいしい (todos são gostosos).

A resposta curta 何も significa "nada", e é muito comum em conversas.$$,
    $$何も + Verbo negativo (nada)
誰も + Verbo negativo (ninguém)
どこにも / どこへも + Verbo negativo (nenhum lugar)
どれも + Adjetivo / Verbo negativo (nenhum)
誰にも / 誰とも + Verbo negativo$$,
    $$何も$$,
    $$何も|誰も|どこにも|どこへも|どこも|どれも|なにも|だれも|一度も|誰にも|誰とも|だれにも$$,
    ARRAY['何', 'も', 'ない']::text[],
    ARRAY['何も', '誰も', 'どこにも', 'どこへも', 'どれも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-145', $$今日は忙しくて、何も食べていません。$$, $$きょうはいそがしくて、なにもたべていません。$$, $$Hoje estive ocupado e não comi nada.$$),
    ('n4-grammar-145', $$教室には誰もいない。$$, $$きょうしつにはだれもいない。$$, $$Não tem ninguém na sala de aula.$$),
    ('n4-grammar-145', $$週末はどこにも行きませんでした。$$, $$しゅうまつはどこにもいきませんでした。$$, $$No fim de semana, não fui a lugar nenhum.$$),
    ('n4-grammar-145', $$この中のどれも好きじゃない。$$, $$このなかのどれもすきじゃない。$$, $$Não gosto de nenhum destes.$$),
    ('n4-grammar-145', $$彼のことは誰にも言わないで。$$, $$かれのことはだれにもいわないで。$$, $$Não conte para ninguém sobre ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に____ありません。$$, $$Não tem nada na geladeira.$$),
        (2, $$この部屋には____いません。$$, $$Não tem ninguém neste quarto.$$),
        (3, $$昨日は____行かないで、家にいました。$$, $$Ontem não fui a lugar nenhum e fiquei em casa.$$),
        (4, $$彼は____言わないで帰った。$$, $$Ele foi embora sem dizer nada.$$),
        (5, $$この店の料理は、____おいしくない。$$, $$Nenhum prato deste restaurante é gostoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何も$$),
        (1, $$なにも$$),
        (2, $$誰も$$),
        (2, $$だれも$$),
        (3, $$どこにも$$),
        (3, $$どこへも$$),
        (4, $$何も$$),
        (4, $$なにも$$),
        (5, $$どれも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
