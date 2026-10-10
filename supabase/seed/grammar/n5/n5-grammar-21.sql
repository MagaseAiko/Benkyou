-- n5-grammar-21 — か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-21',
    'grammar',
    'N5',
    $$か$$,
    $$ka$$,
    $$Partícula de pergunta / Será que$$,
    $$か é a partícula que transforma uma frase em pergunta. Ela fica no final da frase e funciona como o ponto de interrogação falado do japonês.

Com a forma educada (です e ます), basta colocar か no final para fazer uma pergunta. Por isso, na escrita japonesa tradicional, muitas vezes nem se usa o símbolo de interrogação: o か já mostra que é uma pergunta.

か também aparece no meio da frase para formar perguntas indiretas, como "sei onde...", "não sei a que horas...". Nesse caso, a pergunta fica dentro de uma frase maior.

Com ませんか, か forma convites educados. E na resposta そうですか, ele não é exatamente uma pergunta, mas mostra que você recebeu e entendeu a informação, como "ah, é?" ou "entendi".$$,
    $$Na fala informal, か no final costuma ser substituído por entonação subindo ou pela partícula の. Usar か sozinho com a forma simples pode soar brusco, principalmente na fala masculina.

Com substantivos e adjetivos な na forma simples, o だ desaparece antes de か na pergunta indireta.

A entonação de そうですか muda o sentido: descendo, mostra que você entendeu; subindo, mostra surpresa ou dúvida.$$,
    $$Frase educada (です / ます) + か
Palavra interrogativa + … + か
Frase na forma simples + か + 知っています / わかりません (pergunta indireta)
Verbo ません + か (convite)
そうですか (reação a uma informação)$$,
    $$か$$,
    $$か$$,
    ARRAY['か']::text[],
    ARRAY['か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-21', $$これは何ですか。$$, $$これはなんですか。$$, $$O que é isto?$$),
    ('n5-grammar-21', $$明日、学校に行きますか。$$, $$あした、がっこうにいきますか。$$, $$Você vai à escola amanhã?$$),
    ('n5-grammar-21', $$田中さんがどこにいるか知っていますか。$$, $$たなかさんがどこにいるかしっていますか。$$, $$Você sabe onde o Tanaka está?$$),
    ('n5-grammar-21', $$一緒に行きませんか。$$, $$いっしょにいきませんか。$$, $$Quer ir junto?$$),
    ('n5-grammar-21', $$「明日は休みです。」「そうですか。」$$, $$「あしたはやすみです。」「そうですか。」$$, $$"Amanhã é folga." "Ah, é?"$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたは学生です____。$$, $$Você é estudante?$$),
        (2, $$すみません、トイレはどこです____。$$, $$Com licença, onde fica o banheiro?$$),
        (3, $$昨日、何を食べました____。$$, $$O que você comeu ontem?$$),
        (4, $$会議が何時に始まる____わかりません。$$, $$Não sei a que horas a reunião começa.$$),
        (5, $$「来週、テストがあります。」「そうです____。」$$, $$"Semana que vem tem prova." "Ah, é?"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か$$),
        (2, $$か$$),
        (3, $$か$$),
        (4, $$か$$),
        (5, $$か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
