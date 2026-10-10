-- n1-grammar-71 — 〜まじき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-71',
    'grammar',
    'N1',
    $$〜まじき$$,
    $$majiki$$,
    $$Que não se deve / Inadmissível / Impróprio de$$,
    $$まじき indica que uma ação é totalmente inadequada para alguém em determinada posição. Equivale a "que não se deve" ou "inadmissível".

Costuma aparecer na estrutura "Pessoa + にあるまじき + Ação", como "uma atitude inadmissível para um professor".

É uma expressão muito formal e antiga, usada para criticar com força.$$,
    $$A forma mais comum é にあるまじき, como 教師にあるまじき行為.

É uma forma da linguagem clássica, ligada a まい e べからず.$$,
    $$Substantivo (posição) + にあるまじき + Substantivo
Verbo (forma dicionário) + まじき + Substantivo
する → すまじき$$,
    $$まじき$$,
    $$まじき$$,
    ARRAY['まじき']::text[],
    ARRAY['まじき', 'にあるまじき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-71', $$生徒に暴力を振るうなど、教師にあるまじき行為だ。$$, $$せいとにぼうりょくをふるうなど、きょうしにあるまじきこういだ。$$, $$Agredir alunos é um ato inadmissível para um professor.$$),
    ('n1-grammar-71', $$それは政治家にあるまじき発言だ。$$, $$それはせいじかにあるまじきはつげんだ。$$, $$Essa é uma declaração imprópria de um político.$$),
    ('n1-grammar-71', $$患者の秘密をもらすのは、医者にあるまじきことだ。$$, $$かんじゃのひみつをもらすのは、いしゃにあるまじきことだ。$$, $$Revelar segredos de pacientes é inadmissível para um médico.$$),
    ('n1-grammar-71', $$許すまじき犯罪だ。$$, $$ゆるすまじきはんざいだ。$$, $$É um crime que não se deve perdoar.$$),
    ('n1-grammar-71', $$警察官にあるまじき態度に、市民は怒った。$$, $$けいさつかんにあるまじきたいどに、しみんはおこった。$$, $$Os cidadãos ficaram revoltados com a atitude imprópria de um policial.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$客に失礼なことを言うのは、店員にある____ことだ。$$, $$Dizer coisas rudes aos clientes é inadmissível para um atendente.$$),
        (2, $$賄賂を受け取るなど、公務員にある____行為だ。$$, $$Aceitar propina é um ato inadmissível para um funcionário público.$$),
        (3, $$試合中に相手を殴るのは、選手にある____ことだ。$$, $$Agredir o adversário durante a partida é impróprio de um atleta.$$),
        (4, $$子供を置いて出かけるなんて、親にある____行為だ。$$, $$Sair deixando a criança sozinha é um ato inadmissível para um pai.$$),
        (5, $$嘘の記事を書くのは、記者にある____ことだ。$$, $$Escrever matérias falsas é impróprio de um jornalista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まじき$$),
        (2, $$まじき$$),
        (3, $$まじき$$),
        (4, $$まじき$$),
        (5, $$まじき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
