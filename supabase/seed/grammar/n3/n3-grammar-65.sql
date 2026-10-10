-- n3-grammar-65 — 〜ないことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-65',
    'grammar',
    'N3',
    $$〜ないことはない$$,
    $$nai koto wa nai$$,
    $$Não é que não / Até dá para / Não é impossível$$,
    $$ないことはない é uma dupla negação usada para dizer que algo é possível, mas com hesitação ou limitação. Equivale a "não é que não...", "até dá para..." ou "não é impossível".

A ideia é uma afirmação fraca. Em vez de dizer simplesmente "consigo" ou "quero", a pessoa diz "não é que eu não consiga", deixando claro que há alguma dificuldade ou falta de entusiasmo.

Por exemplo, "não é que eu não consiga comer comida apimentada" (consigo, mas não gosto muito) ou "se correr, não é impossível chegar a tempo".

É muito usado com a forma potencial e com verbos de sentimento. Muitas vezes, a frase continua com が ou けど, explicando a limitação.$$,
    $$ないこともない soa ainda mais suave e hesitante que ないことはない.

Essa estrutura é útil para responder com honestidade, sem prometer demais.

Não confunda com ことはない (não precisa), que usa o verbo afirmativo.$$,
    $$Verbo na forma ない + ことはない
Verbo potencial negativo + ことはない
Adjetivo い sem い + くないことはない
Adjetivo な + じゃないことはない

Variações: ないこともない / なくはない$$,
    $$ないことはない$$,
    $$ないことはない|ないこともない|ないことはありません|なくはない$$,
    ARRAY['ない', 'こと', 'は', 'ない']::text[],
    ARRAY['ないことはない', 'ないこともない', 'なくはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-65', $$辛い料理は食べられないことはない。$$, $$からいりょうりはたべられないことはない。$$, $$Não é que eu não consiga comer comida apimentada.$$),
    ('n3-grammar-65', $$今から急げば、間に合わないことはない。$$, $$いまからいそげば、まにあわないことはない。$$, $$Se nos apressarmos agora, não é impossível chegar a tempo.$$),
    ('n3-grammar-65', $$行きたくないことはないが、あまり時間がない。$$, $$いきたくないことはないが、あまりじかんがない。$$, $$Não é que eu não queira ir, mas não tenho muito tempo.$$),
    ('n3-grammar-65', $$この問題は難しいけど、できないことはない。$$, $$このもんだいはむずかしいけど、できないことはない。$$, $$Esta questão é difícil, mas não é impossível.$$),
    ('n3-grammar-65', $$お酒は飲まないこともないですが、あまり好きではありません。$$, $$おさけはのまないこともないですが、あまりすきではありません。$$, $$Não é que eu não beba, mas não gosto muito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本語は話せ____が、上手ではない。$$, $$Não é que eu não fale japonês, mas não falo bem.$$),
        (2, $$今から行けば、間に合わ____。$$, $$Se for agora, até dá para chegar a tempo.$$),
        (3, $$一人でやれ____けど、手伝ってほしい。$$, $$Não é que eu não consiga fazer sozinho, mas queria ajuda.$$),
        (4, $$彼の気持ちもわから____。$$, $$Não é que eu não entenda os sentimentos dele.$$),
        (5, $$高いけど、買え____。$$, $$É caro, mas não é impossível de comprar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないことはない$$),
        (2, $$ないことはない$$),
        (2, $$ないこともない$$),
        (3, $$ないことはない$$),
        (4, $$ないことはない$$),
        (4, $$ないこともない$$),
        (5, $$ないことはない$$),
        (5, $$ないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
