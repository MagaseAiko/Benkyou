-- n5-grammar-79 — よ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-79',
    'grammar',
    'N5',
    $$よ$$,
    $$yo$$,
    $$Viu / Sabia? / Olha$$,
    $$よ é uma partícula de final de frase usada para transmitir uma informação que o ouvinte provavelmente não sabe. Ela dá um tom de "viu?", "sabia?" ou "olha...".

Com よ, quem fala mostra confiança no que está dizendo e quer que o outro preste atenção. É comum ao dar avisos, recomendações, correções ou informações úteis.

A diferença entre よ e ね é a direção da informação. ね busca concordância sobre algo que os dois já sabem ou sentem. よ apresenta algo novo para o outro.

Com substantivos e adjetivos な na forma simples, usa-se だよ.$$,
    $$Usar よ com muita força, ou o tempo todo, pode soar insistente ou mandão. Principalmente com superiores, é bom usar com moderação.

A combinação よね mostra que quem fala tem quase certeza, mas quer a confirmação do outro.

Em avisos de perigo, よ é muito natural e ajuda a chamar a atenção rapidamente.$$,
    $$Frase (forma educada) + よ
Frase (forma simples) + よ
Substantivo / Adjetivo な + ですよ / だよ
よね (informação + confirmação)$$,
    $$よ$$,
    $$よ$$,
    ARRAY['よ']::text[],
    ARRAY['よ', 'よね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-79', $$この店のラーメン、おいしいですよ。$$, $$このみせのラーメン、おいしいですよ。$$, $$O ramen desta loja é gostoso, viu?$$),
    ('n5-grammar-79', $$もう八時だよ。早く起きて。$$, $$もうはちじだよ。はやくおきて。$$, $$Já são oito horas, viu? Levanta logo.$$),
    ('n5-grammar-79', $$明日は休みですよ。$$, $$あしたはやすみですよ。$$, $$Amanhã é folga, sabia?$$),
    ('n5-grammar-79', $$「この席、空いていますか。」「ええ、空いていますよ。」$$, $$「このせき、あいていますか。」「ええ、あいていますよ。」$$, $$"Este lugar está livre?" "Sim, está livre."$$),
    ('n5-grammar-79', $$危ないよ！$$, $$あぶないよ！$$, $$Cuidado, é perigoso!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、財布が落ちました____。$$, $$Com licença, sua carteira caiu, viu?$$),
        (2, $$その映画、おもしろかった____。$$, $$Esse filme foi bem interessante, viu?$$),
        (3, $$早くしないと、遅れる____。$$, $$Se você não se apressar, vai se atrasar, viu?$$),
        (4, $$「田中さんはどこですか。」「会議室にいます____。」$$, $$"Onde está o Tanaka?" "Ele está na sala de reunião."$$),
        (5, $$大丈夫だ____。心配しないで。$$, $$Está tudo bem, viu? Não se preocupe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よ$$),
        (2, $$よ$$),
        (3, $$よ$$),
        (4, $$よ$$),
        (5, $$よ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
