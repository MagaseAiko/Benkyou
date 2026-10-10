-- n1-grammar-222 — 〜としたことが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-222',
    'grammar',
    'N1',
    $$〜としたことが$$,
    $$to shita koto ga$$,
    $$Logo eu / Justo eu / Que vergonha$$,
    $$としたことが expressa surpresa e arrependimento por alguém ter cometido um erro que normalmente não cometeria. Equivale a "logo eu" ou "justo eu".

Geralmente é usado pela própria pessoa para falar de si mesma, com um tom de autocrítica. Por exemplo, "logo eu, esqueci a reunião".

Também pode ser usado para falar de alguém muito confiável que cometeu um erro.$$,
    $$A forma mais comum é 私としたことが.

Costuma terminar com てしまった ou なんて.$$,
    $$Substantivo (pessoa) + としたことが + Erro$$,
    $$としたことが$$,
    $$としたことが$$,
    ARRAY['と', 'した', 'こと', 'が']::text[],
    ARRAY['としたことが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-222', $$私としたことが、会議の時間を忘れてしまった。$$, $$わたしとしたことが、かいぎのじかんをわすれてしまった。$$, $$Logo eu, acabei esquecendo o horário da reunião.$$),
    ('n1-grammar-222', $$僕としたことが、こんな簡単なミスをするなんて。$$, $$ぼくとしたことが、こんなかんたんなミスをするなんて。$$, $$Justo eu, cometer um erro tão simples...$$),
    ('n1-grammar-222', $$あの慎重な彼としたことが、財布を落としたらしい。$$, $$あのしんちょうなかれとしたことが、さいふをおとしたらしい。$$, $$Logo ele, tão cuidadoso, parece que perdeu a carteira.$$),
    ('n1-grammar-222', $$私としたことが、大事な書類を家に置いてきた。$$, $$わたしとしたことが、だいじなしょるいをいえにおいてきた。$$, $$Que vergonha, deixei os documentos importantes em casa.$$),
    ('n1-grammar-222', $$ベテランの彼女としたことが、道に迷ったそうだ。$$, $$ベテランのかのじょとしたことが、みちにまよったそうだ。$$, $$Logo ela, tão experiente, parece que se perdeu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____、約束を忘れてしまった。$$, $$Logo eu, acabei esquecendo a promessa.$$),
        (2, $$僕____、寝坊するなんて。$$, $$Justo eu, dormir demais...$$),
        (3, $$真面目な彼____、遅刻したらしい。$$, $$Logo ele, tão sério, parece que se atrasou.$$),
        (4, $$私____、鍵を閉め忘れた。$$, $$Que vergonha, esqueci de trancar a porta.$$),
        (5, $$料理上手の母____、塩と砂糖を間違えた。$$, $$Logo minha mãe, que cozinha tão bem, confundiu sal com açúcar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-222', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$としたことが$$),
        (2, $$としたことが$$),
        (3, $$としたことが$$),
        (4, $$としたことが$$),
        (5, $$としたことが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
