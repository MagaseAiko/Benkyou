-- n3-grammar-171 — わざと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-171',
    'grammar',
    'N3',
    $$わざと$$,
    $$wazato$$,
    $$De propósito / Intencionalmente / Por querer$$,
    $$わざと é um advérbio que significa "de propósito" ou "intencionalmente". Ele indica que a pessoa fez algo sabendo o que estava fazendo, geralmente algo que não deveria ou que causa algum efeito em outra pessoa.

O tom costuma ser negativo, ligado a travessuras, maldades ou estratégias. Por exemplo, "ele perdeu de propósito" ou "fingiu que não ouviu, de propósito".

Na forma わざとじゃない, é muito usado para pedir desculpas, explicando que algo foi sem querer: "desculpa, não foi de propósito".

O oposto é うっかり ou つい, que indicam algo feito sem querer.$$,
    $$Não confunda わざと com わざわざ. わざと significa "de propósito" (muitas vezes com má intenção). わざわざ significa "dar-se ao trabalho de", com esforço especial.

Em brincadeiras entre amigos, わざと também pode ter um tom leve, como provocar de propósito.

わざとらしい é um adjetivo que significa "forçado", "artificial", como um sorriso falso.$$,
    $$わざと + Verbo
わざとじゃない / わざとではない (não foi de propósito)$$,
    $$わざと$$,
    $$わざと$$,
    ARRAY['わざと']::text[],
    ARRAY['わざと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-171', $$彼は子供に勝たせるために、わざと負けた。$$, $$かれはこどもにかたせるために、わざとまけた。$$, $$Ele perdeu de propósito para deixar a criança ganhar.$$),
    ('n3-grammar-171', $$母に呼ばれたが、わざと聞こえないふりをした。$$, $$ははによばれたが、わざときこえないふりをした。$$, $$Minha mãe me chamou, mas fingi de propósito que não ouvi.$$),
    ('n3-grammar-171', $$ごめん、わざとじゃないんだ。$$, $$ごめん、わざとじゃないんだ。$$, $$Desculpa, não foi de propósito.$$),
    ('n3-grammar-171', $$子供はわざと大きな声を出した。$$, $$こどもはわざとおおきなこえをだした。$$, $$A criança gritou de propósito.$$),
    ('n3-grammar-171', $$彼女はわざと遅れてきた。$$, $$かのじょはわざとおくれてきた。$$, $$Ela chegou atrasada de propósito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は____私のケーキを食べた。$$, $$Meu irmão mais novo comeu meu bolo de propósito.$$),
        (2, $$____間違えたわけじゃない。$$, $$Não é que eu tenha errado de propósito.$$),
        (3, $$彼は____知らないふりをしている。$$, $$Ele está fingindo de propósito que não sabe.$$),
        (4, $$猫は____テーブルのコップを落とした。$$, $$O gato derrubou o copo da mesa de propósito.$$),
        (5, $$けんかの後、彼女は____私を無視した。$$, $$Depois da briga, ela me ignorou de propósito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わざと$$),
        (2, $$わざと$$),
        (3, $$わざと$$),
        (4, $$わざと$$),
        (5, $$わざと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
