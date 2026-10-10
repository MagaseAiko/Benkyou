-- n1-grammar-113 — 〜に限ったことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-113',
    'grammar',
    'N1',
    $$〜に限ったことではない$$,
    $$ni kagitta koto dewa nai$$,
    $$Não é só / Não se limita a / Não é exclusivo de$$,
    $$に限ったことではない indica que algo não acontece apenas em um caso específico, mas é comum em outros também. Equivale a "não é só" ou "não se limita a".

Muitas vezes é usado para falar de problemas ou hábitos negativos. Por exemplo, "ele se atrasar não é só hoje" ou "esse problema não é exclusivo do Japão".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$Costuma vir com a estrutura 〜のは〜に限ったことではない.

É parecido com だけではない.$$,
    $$Substantivo + に限ったことではない
Frase + のは + Substantivo + に限ったことではない$$,
    $$に限ったことではない$$,
    $$に限ったことではない|に限ったことではありません|に限ったことじゃない|にかぎったことではない$$,
    ARRAY['に', '限った', 'こと', 'では', 'ない']::text[],
    ARRAY['に限ったことではない', 'に限ったことではありません', 'に限ったことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-113', $$彼が遅刻するのは、今日に限ったことではない。$$, $$かれがちこくするのは、きょうにかぎったことではない。$$, $$Ele se atrasar não é só hoje.$$),
    ('n1-grammar-113', $$少子化は日本に限ったことではない。$$, $$しょうしかはにほんにかぎったことではない。$$, $$A baixa natalidade não é exclusiva do Japão.$$),
    ('n1-grammar-113', $$こういうミスは、新人に限ったことではありません。$$, $$こういうミスは、しんじんにかぎったことではありません。$$, $$Esse tipo de erro não se limita aos novatos.$$),
    ('n1-grammar-113', $$駅が混むのは、朝に限ったことじゃない。$$, $$えきがこむのは、あさにかぎったことじゃない。$$, $$A estação lotada não é só de manhã.$$),
    ('n1-grammar-113', $$この問題は、若者に限ったことではない。$$, $$このもんだいは、わかものにかぎったことではない。$$, $$Este problema não se limita aos jovens.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が文句を言うのは、今回____。$$, $$Ela reclamar não é só desta vez.$$),
        (2, $$物価が上がっているのは、この国____。$$, $$A alta dos preços não é exclusiva deste país.$$),
        (3, $$ストレスを感じるのは、大人____。$$, $$Sentir estresse não se limita aos adultos.$$),
        (4, $$交通渋滞は、都市部____。$$, $$O trânsito congestionado não é exclusivo das áreas urbanas.$$),
        (5, $$彼が嘘をつくのは、今日____。$$, $$Ele mentir não é só hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限ったことではない$$),
        (1, $$に限ったことではありません$$),
        (1, $$に限ったことじゃない$$),
        (2, $$に限ったことではない$$),
        (2, $$に限ったことではありません$$),
        (2, $$に限ったことじゃない$$),
        (3, $$に限ったことではない$$),
        (3, $$に限ったことではありません$$),
        (3, $$に限ったことじゃない$$),
        (4, $$に限ったことではない$$),
        (4, $$に限ったことではありません$$),
        (4, $$に限ったことじゃない$$),
        (5, $$に限ったことではない$$),
        (5, $$に限ったことではありません$$),
        (5, $$に限ったことじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
