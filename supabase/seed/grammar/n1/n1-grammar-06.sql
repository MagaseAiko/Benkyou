-- n1-grammar-06 — 〜ばこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-06',
    'grammar',
    'N1',
    $$〜ばこそ$$,
    $$ba koso$$,
    $$Justamente porque / É precisamente por / Só porque$$,
    $$ばこそ indica uma razão de forma muito enfática. Equivale a "justamente porque" ou "é precisamente por".

A pessoa destaca que o motivo verdadeiro de algo é aquele, muitas vezes um motivo positivo que outros podem não perceber. Por exemplo, "é justamente por amar os filhos que os pais são rígidos".

É uma expressão formal, mais comum na escrita e em discursos.$$,
    $$Costuma terminar com のだ ou のです.

É parecido com からこそ, que é mais comum na fala.$$,
    $$Verbo (forma ば) + こそ
Adjetivo い (forma ければ) + こそ
Adjetivo な / Substantivo + であれば + こそ$$,
    $$ばこそ$$,
    $$ばこそ$$,
    ARRAY['ば', 'こそ']::text[],
    ARRAY['ばこそ', 'ればこそ', 'であればこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-06', $$子供を愛していればこそ、厳しく叱るのだ。$$, $$こどもをあいしていればこそ、きびしくしかるのだ。$$, $$É justamente por amar os filhos que os pais repreendem com rigor.$$),
    ('n1-grammar-06', $$健康であればこそ、仕事も楽しめる。$$, $$けんこうであればこそ、しごともたのしめる。$$, $$É justamente por ter saúde que se consegue aproveitar o trabalho.$$),
    ('n1-grammar-06', $$あなたのことを思えばこそ、忠告するのです。$$, $$あなたのことをおもえばこそ、ちゅうこくするのです。$$, $$É justamente porque penso em você que dou este conselho.$$),
    ('n1-grammar-06', $$努力すればこそ、夢がかなうのだ。$$, $$どりょくすればこそ、ゆめがかなうのだ。$$, $$É precisamente com esforço que os sonhos se realizam.$$),
    ('n1-grammar-06', $$信頼していればこそ、この仕事を任せたのだ。$$, $$しんらいしていればこそ、このしごとをまかせたのだ。$$, $$Confiei este trabalho a você justamente porque confio em você.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族がいれ____、頑張れる。$$, $$Consigo me esforçar justamente porque tenho família.$$),
        (2, $$会社の将来を考えれ____、改革が必要なのだ。$$, $$É justamente pensando no futuro da empresa que a reforma é necessária.$$),
        (3, $$君を信じていれ____、本当のことを話すのだ。$$, $$Conto a verdade justamente porque acredito em você.$$),
        (4, $$好きであれ____、長く続けられる。$$, $$É justamente por gostar que se consegue continuar por muito tempo.$$),
        (5, $$平和であれ____、安心して暮らせる。$$, $$É justamente por haver paz que dá para viver tranquilo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばこそ$$),
        (2, $$ばこそ$$),
        (3, $$ばこそ$$),
        (4, $$ばこそ$$),
        (5, $$ばこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
