-- n1-grammar-146 — 〜をいいことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-146',
    'grammar',
    'N1',
    $$〜をいいことに$$,
    $$wo ii koto ni$$,
    $$Aproveitando-se de / Tirando proveito de / Já que$$,
    $$をいいことに indica que alguém se aproveita de uma situação para fazer algo que não deveria. Equivale a "aproveitando-se de" ou "tirando proveito de".

O tom é sempre de crítica, porque a pessoa age de forma egoísta ou desonesta. Por exemplo, "aproveitando que os pais não estavam, ele deu uma festa".

É uma expressão coloquial.$$,
    $$A segunda parte costuma ser algo que a pessoa normalmente não poderia fazer.

É parecido com に乗じて, que é mais formal.$$,
    $$Substantivo + をいいことに
Frase (forma simples) + の + をいいことに$$,
    $$をいいことに$$,
    $$をいいことに|を良いことに$$,
    ARRAY['を', 'いい', 'こと', 'に']::text[],
    ARRAY['をいいことに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-146', $$親が留守なのをいいことに、彼は友達を呼んで騒いだ。$$, $$おやがるすなのをいいことに、かれはともだちをよんでさわいだ。$$, $$Aproveitando que os pais não estavam, ele chamou os amigos e fez bagunça.$$),
    ('n1-grammar-146', $$先生が優しいのをいいことに、学生たちは宿題をしない。$$, $$せんせいがやさしいのをいいことに、がくせいたちはしゅくだいをしない。$$, $$Tirando proveito da bondade do professor, os alunos não fazem a lição.$$),
    ('n1-grammar-146', $$誰も見ていないのをいいことに、ごみを捨てた。$$, $$だれもみていないのをいいことに、ごみをすてた。$$, $$Aproveitando que ninguém estava olhando, jogou lixo no chão.$$),
    ('n1-grammar-146', $$上司が休みなのをいいことに、早く帰った。$$, $$じょうしがやすみなのをいいことに、はやくかえった。$$, $$Aproveitando a folga do chefe, fui embora cedo.$$),
    ('n1-grammar-146', $$彼の好意をいいことに、何度もお金を借りた。$$, $$かれのこういをいいことに、なんどもおかねをかりた。$$, $$Tirando proveito da gentileza dele, pedi dinheiro emprestado várias vezes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店長がいないの____、店員がさぼっている。$$, $$Aproveitando que o gerente não está, os atendentes estão enrolando.$$),
        (2, $$子供なの____、わがままを言う。$$, $$Aproveitando-se de ser criança, faz birra.$$),
        (3, $$規則があいまいなの____、勝手なことをする人がいる。$$, $$Tem gente que faz o que quer aproveitando que as regras são vagas.$$),
        (4, $$母が何も言わないの____、彼は毎晩遅く帰ってくる。$$, $$Aproveitando que a mãe não diz nada, ele volta tarde toda noite.$$),
        (5, $$雨____、ジョギングをさぼった。$$, $$Aproveitando a chuva, matei a corrida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をいいことに$$),
        (2, $$をいいことに$$),
        (3, $$をいいことに$$),
        (4, $$をいいことに$$),
        (5, $$をいいことに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
