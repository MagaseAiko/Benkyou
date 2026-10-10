-- n2-grammar-39 — 〜かのように
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-39',
    'grammar',
    'N2',
    $$〜かのように$$,
    $$ka no you ni$$,
    $$Como se / Como se fosse$$,
    $$かのように é usado para dizer que algo acontece ou é feito como se fosse outra coisa, mesmo que não seja verdade. Equivale a "como se" ou "como se fosse".

A parte antes de かのように descreve uma situação imaginária ou falsa. Por exemplo, "ele agiu como se não soubesse de nada" (mas sabia) ou "está quente como se a primavera tivesse chegado" (mas ainda não chegou).

Muitas vezes, aparece junto com まるで, que reforça a comparação.

Antes de um substantivo, usa-se かのような: 夢を見ているかのような顔 (uma cara de quem está sonhando).

No fim da frase, usa-se かのようだ.$$,
    $$Comparado a ように, かのように destaca mais que a situação é falsa ou imaginária.

A expressão 何もなかったかのように ("como se nada tivesse acontecido") é muito comum.

É um pouco literário e aparece muito em romances e descrições.$$,
    $$Verbo / Adjetivo (forma simples) + かのように + Verbo / Adjetivo
Substantivo + である + かのように
… + かのような + Substantivo
… + かのようだ
まるで + … + かのように$$,
    $$かのように$$,
    $$かのように|かのような|かのようだ$$,
    ARRAY['か', 'の', 'ように']::text[],
    ARRAY['かのように', 'かのような', 'かのようだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-39', $$彼は何も知らないかのように振る舞った。$$, $$かれはなにもしらないかのようにふるまった。$$, $$Ele agiu como se não soubesse de nada.$$),
    ('n2-grammar-39', $$彼女はまるで夢を見ているかのような顔をしていた。$$, $$かのじょはまるでゆめをみているかのようなかおをしていた。$$, $$Ela estava com uma cara de quem estava sonhando.$$),
    ('n2-grammar-39', $$まだ二月なのに、春が来たかのように暖かい。$$, $$まだにがつなのに、はるがきたかのようにあたたかい。$$, $$Ainda é fevereiro, mas está quente como se a primavera tivesse chegado.$$),
    ('n2-grammar-39', $$彼はまるで自分の家にいるかのようにくつろいでいる。$$, $$かれはまるでじぶんのいえにいるかのようにくつろいでいる。$$, $$Ele está à vontade como se estivesse na própria casa.$$),
    ('n2-grammar-39', $$何もなかったかのように、彼は笑った。$$, $$なにもなかったかのように、かれはわらった。$$, $$Ele riu como se nada tivesse acontecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はまるで社長である____話す。$$, $$Ele fala como se fosse o presidente.$$),
        (2, $$彼女は何も聞かなかった____、黙っていた。$$, $$Ela ficou calada como se não tivesse ouvido nada.$$),
        (3, $$十月なのに、夏が戻ってきた____暑い日だった。$$, $$Era outubro, mas foi um dia quente como se o verão tivesse voltado.$$),
        (4, $$彼は全部知っている____顔をしている。$$, $$Ele está com cara de quem sabe de tudo.$$),
        (5, $$まるで時間が止まった____静かだ。$$, $$Está tão silencioso como se o tempo tivesse parado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かのように$$),
        (2, $$かのように$$),
        (3, $$かのような$$),
        (4, $$かのような$$),
        (5, $$かのように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
