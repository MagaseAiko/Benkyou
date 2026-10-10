-- n2-grammar-72 — 〜ものがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-72',
    'grammar',
    'N2',
    $$〜ものがある$$,
    $$mono ga aru$$,
    $$Há algo de / Tem um quê de / É realmente$$,
    $$ものがある serve para expressar uma impressão forte que a pessoa sente diante de algo. Equivale a "há algo de..." ou "é realmente...".

A pessoa não descreve um fato objetivo, mas um sentimento ou avaliação pessoal. Por exemplo, "a música dele tem algo de comovente" ou "é realmente difícil aceitar isso".

É uma expressão um pouco formal, comum em comentários e opiniões.$$,
    $$Costuma vir com palavras que expressam sentimento, como 感動する, 寂しい, 厳しい ou 難しい.

Não se usa para falar de coisas concretas, apenas de impressões.$$,
    $$Verbo (forma dicionário) + ものがある
Adjetivo い + ものがある
Adjetivo な + な + ものがある$$,
    $$ものがある$$,
    $$ものがある|ものがあります|ものがあった$$,
    ARRAY['もの', 'が', 'ある']::text[],
    ARRAY['ものがある', 'ものがあります', 'ものがあった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-72', $$彼の歌には人の心を動かすものがある。$$, $$かれのうたにはひとのこころをうごかすものがある。$$, $$As músicas dele têm algo que mexe com o coração das pessoas.$$),
    ('n2-grammar-72', $$この年で一人暮らしをするのは寂しいものがある。$$, $$このとしでひとりぐらしをするのはさびしいものがある。$$, $$Morar sozinho nesta idade tem algo de solitário.$$),
    ('n2-grammar-72', $$彼女の才能には驚くべきものがある。$$, $$かのじょのさいのうにはおどろくべきものがある。$$, $$O talento dela tem algo de surpreendente.$$),
    ('n2-grammar-72', $$毎日三時間の通勤はつらいものがある。$$, $$まいにちさんじかんのつうきんはつらいものがある。$$, $$Três horas de deslocamento por dia é realmente duro.$$),
    ('n2-grammar-72', $$この町の景色には懐かしいものがあります。$$, $$このまちのけしきにはなつかしいものがあります。$$, $$A paisagem desta cidade tem algo de nostálgico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供の成長の速さには驚く____。$$, $$A rapidez com que as crianças crescem é realmente surpreendente.$$),
        (2, $$彼の作品には何か特別な____。$$, $$As obras dele têm algo de especial.$$),
        (3, $$この年で新しいことを始めるのは難しい____。$$, $$Começar algo novo nesta idade é realmente difícil.$$),
        (4, $$彼の演技には心に響く____。$$, $$A atuação dele tem algo que toca o coração.$$),
        (5, $$友達と別れるのはつらい____。$$, $$Se despedir de um amigo é realmente doloroso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものがある$$),
        (1, $$ものがあります$$),
        (2, $$ものがある$$),
        (2, $$ものがあります$$),
        (3, $$ものがある$$),
        (3, $$ものがあります$$),
        (4, $$ものがある$$),
        (4, $$ものがあります$$),
        (5, $$ものがある$$),
        (5, $$ものがあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
