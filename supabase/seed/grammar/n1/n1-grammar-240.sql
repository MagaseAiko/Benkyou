-- n1-grammar-240 — 〜やしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-240',
    'grammar',
    'N1',
    $$〜やしない$$,
    $$ya shinai$$,
    $$Nem / De jeito nenhum / Nunca que$$,
    $$やしない é uma forma coloquial e enfática de negação. Equivale a "nem..." ou "de jeito nenhum".

A pessoa nega algo com força, muitas vezes com irritação ou desânimo. Por exemplo, "ninguém me ouve nem um pouco" ou "isso nunca que vai dar certo".

Na fala, também aparece como やしねえ ou ゃしない.$$,
    $$É uma forma enfática de ない, usada na fala.

Expressões comuns são わかりやしない, できやしない e 来やしない.$$,
    $$Verbo (forma ます sem ます) + やしない
する → しやしない
来る → 来やしない$$,
    $$やしない$$,
    $$やしない|やしません|ゃしない$$,
    ARRAY['や', 'しない']::text[],
    ARRAY['やしない', 'やしません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-240', $$そんなこと、誰も信じやしない。$$, $$そんなこと、だれもしんじやしない。$$, $$Ninguém vai acreditar numa coisa dessas, de jeito nenhum.$$),
    ('n1-grammar-240', $$いくら説明しても、彼はわかりやしない。$$, $$いくらせつめいしても、かれはわかりやしない。$$, $$Por mais que eu explique, ele nem entende.$$),
    ('n1-grammar-240', $$こんなに遅いと、間に合いやしない。$$, $$こんなにおそいと、まにあいやしない。$$, $$Desse jeito tão lento, nunca que vai dar tempo.$$),
    ('n1-grammar-240', $$待っても、彼は来やしないよ。$$, $$まっても、かれはきやしないよ。$$, $$Mesmo esperando, ele não vem de jeito nenhum.$$),
    ('n1-grammar-240', $$そんな簡単に、夢がかないやしない。$$, $$そんなかんたんに、ゆめがかないやしない。$$, $$Sonhos não se realizam assim tão fácil, de jeito nenhum.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんな問題、子供にでき____。$$, $$Uma criança nunca que consegue fazer um problema desses.$$),
        (2, $$怒鳴っても、犬は言うことを聞き____。$$, $$Mesmo gritando, o cachorro não obedece de jeito nenhum.$$),
        (3, $$そんなに急いでも、終わり____。$$, $$Mesmo correndo tanto, não vai terminar de jeito nenhum.$$),
        (4, $$一人で行っても、楽しくあり____。$$, $$Ir sozinho não tem graça nenhuma.$$),
        (5, $$彼女は私の話なんか聞き____。$$, $$Ela nem ouve o que eu digo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-240', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やしない$$),
        (2, $$やしない$$),
        (3, $$やしない$$),
        (4, $$やしない$$),
        (5, $$やしない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
