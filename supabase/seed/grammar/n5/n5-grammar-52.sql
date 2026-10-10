-- n5-grammar-52 — 〜のです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-52',
    'grammar',
    'N5',
    $$〜のです$$,
    $$no desu$$,
    $$É que / Acontece que / O fato é que$$,
    $$のです tem a mesma função de んです: ele explica, justifica ou pede explicação sobre uma situação. Equivale a "é que...", "acontece que...".

A diferença está no tom. んです é a forma falada e mais natural na conversa. のです é a forma completa, que soa mais formal, mais séria e mais adequada à escrita, como em textos, discursos e explicações cuidadosas.

Com のです, quem fala deixa claro que está apresentando o motivo ou o contexto de algo. Em perguntas, のですか pede uma explicação de forma educada.

Na forma simples, usa-se のだ, que é comum em textos escritos e em reflexões, como quando alguém chega a uma conclusão.$$,
    $$Na fala do dia a dia, usar のです o tempo todo pode soar rígido. Prefira んです em conversas comuns.

Na fala informal, a explicação também pode terminar só com の, principalmente em perguntas e respostas entre amigos.

Com substantivos e adjetivos な, não se esqueça do な antes de のです.$$,
    $$Verbo / Adjetivo い (forma simples) + のです
Substantivo / Adjetivo な + な + のです

Pergunta: 〜のですか
Forma simples: 〜のだ
Forma falada: 〜んです / 〜んだ$$,
    $$のです$$,
    $$のです|のだ$$,
    ARRAY['の', 'です']::text[],
    ARRAY['のです', 'のですか', 'のだ', 'んです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-52', $$今日は体の調子が悪いのです。$$, $$きょうはからだのちょうしがわるいのです。$$, $$É que hoje não estou me sentindo bem.$$),
    ('n5-grammar-52', $$どうして遅れたのですか。$$, $$どうしておくれたのですか。$$, $$Por que você se atrasou?$$),
    ('n5-grammar-52', $$実は、この店は百年前からあるのです。$$, $$じつは、このみせはひゃくねんまえからあるのです。$$, $$Na verdade, esta loja existe há cem anos.$$),
    ('n5-grammar-52', $$明日は大事な試験なのです。$$, $$あしたはだいじなしけんなのです。$$, $$É que amanhã tenho uma prova importante.$$),
    ('n5-grammar-52', $$私が間違っていたのだ。$$, $$わたしがまちがっていたのだ。$$, $$Eu é que estava errado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「どうして休んだのですか。」「熱があった____。」$$, $$"Por que você faltou?" "É que eu estava com febre."$$),
        (2, $$この町は、昔は海だった____。$$, $$Esta cidade, antigamente, era mar.$$),
        (3, $$こんな時間に、どこへ行く____か。$$, $$Aonde você vai a esta hora?$$),
        (4, $$彼は本当に親切な人な____。$$, $$Ele é realmente uma pessoa gentil.$$),
        (5, $$「なぜ日本語を勉強している____か。」「日本で働きたいからです。」$$, $$"Por que você está estudando japonês?" "Porque quero trabalhar no Japão."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のです$$),
        (2, $$のです$$),
        (2, $$のだ$$),
        (3, $$のです$$),
        (4, $$のです$$),
        (4, $$のだ$$),
        (5, $$のです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
