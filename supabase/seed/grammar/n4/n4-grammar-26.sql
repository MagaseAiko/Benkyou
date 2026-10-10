-- n4-grammar-26 — 〜かどうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-26',
    'grammar',
    'N4',
    $$〜かどうか$$,
    $$ka dou ka$$,
    $$Se... ou não$$,
    $$かどうか é usado para incluir uma pergunta de "sim ou não" dentro de uma frase maior. Equivale a "se... ou não".

Ele aparece quando a pessoa não sabe, quer saber, vai verificar ou vai perguntar se algo é verdade. Por isso, combina muito com verbos como わかる, 知る, 聞く, 確認する e 調べる.

A frase antes de かどうか fica na forma simples. Com substantivos e adjetivos な, o だ desaparece.

Para perguntas com palavras interrogativas, como "onde", "quem" ou "quando", usa-se só か, sem どうか.$$,
    $$かどうか é a forma resumida de "か、〜ないか". Por isso, a estrutura A か A ないか tem o mesmo sentido.

Não use かどうか com palavras interrogativas: para "não sei onde ele está", usa-se どこにいるか.

Em pedidos formais, かどうか aparece em frases como "gostaria de saber se...", seguido de 教えていただけますか.$$,
    $$Verbo (forma simples) + かどうか
Adjetivo い + かどうか
Adjetivo な (sem だ) + かどうか
Substantivo (sem だ) + かどうか

… かどうか + わからない / 知らない / 聞く / 確認する$$,
    $$かどうか$$,
    $$かどうか$$,
    ARRAY['か', 'どう', 'か']::text[],
    ARRAY['かどうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-26', $$明日雨が降るかどうか、わかりません。$$, $$あしたあめがふるかどうか、わかりません。$$, $$Não sei se amanhã vai chover ou não.$$),
    ('n4-grammar-26', $$彼が来るかどうか、聞いてみます。$$, $$かれがくるかどうか、きいてみます。$$, $$Vou perguntar se ele vem ou não.$$),
    ('n4-grammar-26', $$この答えが正しいかどうか、確認してください。$$, $$このこたえがただしいかどうか、かくにんしてください。$$, $$Verifique se esta resposta está correta, por favor.$$),
    ('n4-grammar-26', $$その店がおいしいかどうか、行ってみないとわからない。$$, $$そのみせがおいしいかどうか、いってみないとわからない。$$, $$Só indo lá para saber se a comida é boa ou não.$$),
    ('n4-grammar-26', $$その話が本当かどうか、まだ誰も知らない。$$, $$そのはなしがほんとうかどうか、まだだれもしらない。$$, $$Ninguém sabe ainda se essa história é verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$パーティーに行ける____、まだわかりません。$$, $$Ainda não sei se vou poder ir à festa.$$),
        (2, $$このサイズが合う____、着てみてください。$$, $$Experimente para ver se este tamanho serve.$$),
        (3, $$一人暮らしの彼女が元気____、心配です。$$, $$Estou preocupado se ela, que mora sozinha, está bem.$$),
        (4, $$試験に合格した____、来週わかります。$$, $$Semana que vem vou saber se passei na prova.$$),
        (5, $$ドアの鍵を閉めた____、覚えていない。$$, $$Não lembro se tranquei a porta ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かどうか$$),
        (2, $$かどうか$$),
        (3, $$かどうか$$),
        (4, $$かどうか$$),
        (5, $$かどうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
