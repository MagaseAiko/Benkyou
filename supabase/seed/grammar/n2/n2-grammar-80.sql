-- n2-grammar-80 — 〜中を / 〜中では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-80',
    'grammar',
    'N2',
    $$〜中を / 〜中では$$,
    $$naka wo / naka dewa$$,
    $$Em meio a / Debaixo de / Apesar de$$,
    $$中を indica que uma ação acontece em meio a uma situação, geralmente difícil ou desfavorável. Equivale a "em meio a" ou "debaixo de". Por exemplo, "correu debaixo de chuva forte".

Também é muito usado em agradecimentos formais, como "obrigado por ter vindo apesar de estar tão ocupado". Nesse caso, mostra respeito pelo esforço da outra pessoa.

中では indica a situação em que algo acontece ou é avaliado, com o sentido de "nessa situação" ou "nesse contexto".$$,
    $$As expressões お忙しい中を e お足元の悪い中を são muito usadas em discursos e cartas.

Nesse uso, 中 é lido なか. Não se confunde com 中 lido ちゅう, como em 会議中.$$,
    $$Substantivo + の + 中を
Verbo (forma simples) + 中を
Adjetivo い / Adjetivo な + な + 中を
Substantivo + の + 中では$$,
    $$中を$$,
    $$中を|中では|なかを$$,
    ARRAY['中', 'を']::text[],
    ARRAY['中を', '中では', 'お忙しい中を']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-80', $$お忙しい中を、来ていただきありがとうございます。$$, $$おいそがしいなかを、きていただきありがとうございます。$$, $$Obrigado por ter vindo apesar de estar tão ocupado.$$),
    ('n2-grammar-80', $$激しい雨の中を、彼は走って帰った。$$, $$はげしいあめのなかを、かれははしってかえった。$$, $$Ele voltou correndo debaixo de uma chuva forte.$$),
    ('n2-grammar-80', $$寒い中を、長い時間待たせてしまった。$$, $$さむいなかを、ながいじかんまたせてしまった。$$, $$Fiz você esperar muito tempo nesse frio.$$),
    ('n2-grammar-80', $$皆が見守る中を、選手が入場した。$$, $$みながみまもるなかを、せんしゅがにゅうじょうした。$$, $$Os atletas entraram em meio aos olhares de todos.$$),
    ('n2-grammar-80', $$厳しい状況の中では、助け合うことが大切だ。$$, $$きびしいじょうきょうのなかでは、たすけあうことがたいせつだ。$$, $$Em meio a uma situação difícil, é importante se ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お足元の悪い____、お越しいただきありがとうございます。$$, $$Obrigado por ter vindo apesar do mau tempo.$$),
        (2, $$大雪の____、救助隊が出発した。$$, $$A equipe de resgate partiu em meio à forte neve.$$),
        (3, $$多くの人が注目する____、彼はスピーチを始めた。$$, $$Ele começou o discurso em meio à atenção de muitas pessoas.$$),
        (4, $$暑い____、手伝ってくれてありがとう。$$, $$Obrigado por me ajudar nesse calor.$$),
        (5, $$このような状況の____、計画を変えるしかない。$$, $$Em meio a uma situação como esta, só resta mudar os planos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$中を$$),
        (2, $$中を$$),
        (3, $$中を$$),
        (4, $$中を$$),
        (5, $$中では$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
