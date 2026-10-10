-- n4-grammar-140 — 〜ことにしている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-140',
    'grammar',
    'N4',
    $$〜ことにしている$$,
    $$koto ni shite iru$$,
    $$Ter como regra / Ter o hábito de (por decisão)$$,
    $$ことにしている é usado para falar de um hábito ou de uma regra pessoal que a própria pessoa decidiu seguir. Equivale a "tenho como regra" ou "tenho o costume de".

Ele vem de ことにする (decidir), na forma ている. A ideia é que a pessoa tomou uma decisão no passado e continua seguindo essa decisão até hoje.

Por exemplo, decidir acordar às seis todos os dias, não comer doces à noite ou passar os fins de semana com a família.

Com a forma ない, indica uma regra de não fazer algo: ないことにしている.

A diferença em relação a ようにしている é que ことにしている soa mais firme, como uma regra fixa. ようにしている indica um esforço para manter um hábito, mesmo que nem sempre dê certo.$$,
    $$Compare: ことにする (decisão no momento), ことにしている (regra pessoal contínua) e ことになっている (regra externa, que aparece no N3).

É muito usado ao explicar rotinas e princípios pessoais em entrevistas ou conversas.

Para hábitos que não foram decididos conscientemente, basta usar ている ou いつも.$$,
    $$Verbo na forma de dicionário + ことにしている
Verbo na forma ない + ことにしている

Educado: ことにしています$$,
    $$ことにしている$$,
    $$ことにしている|ことにしています$$,
    ARRAY['こと', 'に', 'している']::text[],
    ARRAY['ことにしている', 'ことにしています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-140', $$毎朝、六時に起きることにしています。$$, $$まいあさ、ろくじにおきることにしています。$$, $$Tenho como regra acordar às seis toda manhã.$$),
    ('n4-grammar-140', $$夜は甘い物を食べないことにしている。$$, $$よるはあまいものをたべないことにしている。$$, $$Tenho como regra não comer doces à noite.$$),
    ('n4-grammar-140', $$週末は家族と過ごすことにしています。$$, $$しゅうまつはかぞくとすごすことにしています。$$, $$Tenho o costume de passar os fins de semana com a família.$$),
    ('n4-grammar-140', $$寝る前に日記を書くことにしている。$$, $$ねるまえににっきをかくことにしている。$$, $$Tenho o hábito de escrever um diário antes de dormir.$$),
    ('n4-grammar-140', $$健康のために、エレベーターを使わないことにしています。$$, $$けんこうのために、エレベーターをつかわないことにしています。$$, $$Pela saúde, tenho como regra não usar o elevador.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日、日本語のニュースを聞く____。$$, $$Tenho como regra ouvir notícias em japonês todos os dias.$$),
        (2, $$お酒は週末だけ飲む____。$$, $$Tenho como regra beber só nos fins de semana.$$),
        (3, $$仕事のメールは夜は見ない____。$$, $$Tenho como regra não olhar e-mails de trabalho à noite.$$),
        (4, $$月に一度、両親に電話する____。$$, $$Tenho o costume de ligar para os meus pais uma vez por mês.$$),
        (5, $$一か月に一冊、本を読む____。$$, $$Tenho como regra ler um livro por mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにしています$$),
        (1, $$ことにしている$$),
        (2, $$ことにしています$$),
        (2, $$ことにしている$$),
        (3, $$ことにしています$$),
        (3, $$ことにしている$$),
        (4, $$ことにしています$$),
        (4, $$ことにしている$$),
        (5, $$ことにしています$$),
        (5, $$ことにしている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
