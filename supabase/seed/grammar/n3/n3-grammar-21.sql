-- n3-grammar-21 — どうしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-21',
    'grammar',
    'N3',
    $$どうしても$$,
    $$doushitemo$$,
    $$De qualquer jeito / A todo custo / De jeito nenhum$$,
    $$どうしても é um advérbio que expressa um desejo ou uma situação muito forte, que não muda por nada. O sentido depende de a frase ser afirmativa ou negativa.

Em frases afirmativas, principalmente com たい, ほしい ou obrigações, significa "de qualquer jeito" ou "a todo custo". Por exemplo, "quero entrar nesta faculdade de qualquer jeito".

Em frases negativas, principalmente com a forma potencial, significa "de jeito nenhum", mostrando que algo é impossível apesar do esforço. Por exemplo, "não consigo lembrar o nome dele de jeito nenhum".

A expressão どうしてもと言うなら significa "se você insiste tanto" e é usada quando alguém cede a um pedido.$$,
    $$Não confunda com どうして (por quê). どうしても tem も no final e muda completamente o sentido.

Em recusas educadas, どうしても都合がつかない significa "de jeito nenhum consigo encaixar na agenda".

どうしても transmite emoção forte, então é comum em pedidos sinceros e em desabafos.$$,
    $$どうしても + Verbo たい / ほしい (de qualquer jeito)
どうしても + Verbo なければならない (a todo custo)
どうしても + Verbo potencial negativo (de jeito nenhum)
どうしてもと言うなら (se você insiste)$$,
    $$どうしても$$,
    $$どうしても$$,
    ARRAY['どうしても']::text[],
    ARRAY['どうしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-21', $$どうしてもこの大学に入りたい。$$, $$どうしてもこのだいがくにはいりたい。$$, $$Quero entrar nesta faculdade de qualquer jeito.$$),
    ('n3-grammar-21', $$どうしても彼の名前が思い出せない。$$, $$どうしてもかれのなまえがおもいだせない。$$, $$Não consigo lembrar o nome dele de jeito nenhum.$$),
    ('n3-grammar-21', $$明日は大事な会議があるので、どうしても休めません。$$, $$あしたはだいじなかいぎがあるので、どうしてもやすめません。$$, $$Amanhã tenho uma reunião importante, então não posso faltar de jeito nenhum.$$),
    ('n3-grammar-21', $$どうしてもと言うなら、行ってもいいよ。$$, $$どうしてもというなら、いってもいいよ。$$, $$Se você insiste tanto, pode ir.$$),
    ('n3-grammar-21', $$どうしても納豆が食べられない。$$, $$どうしてもなっとうがたべられない。$$, $$De jeito nenhum consigo comer natto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____日本で働きたいです。$$, $$Quero trabalhar no Japão de qualquer jeito.$$),
        (2, $$この漢字が____覚えられない。$$, $$Não consigo decorar este kanji de jeito nenhum.$$),
        (3, $$この仕事は____今日中に終わらせなければならない。$$, $$Este trabalho tem que ser terminado hoje a todo custo.$$),
        (4, $$引っ越す前に、彼に____会いたい。$$, $$Antes da mudança, quero ver ele de qualquer jeito.$$),
        (5, $$鍵が壊れて、ドアが____開かない。$$, $$A fechadura quebrou e a porta não abre de jeito nenhum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうしても$$),
        (2, $$どうしても$$),
        (3, $$どうしても$$),
        (4, $$どうしても$$),
        (5, $$どうしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
