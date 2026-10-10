-- n5-grammar-75 — は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-75',
    'grammar',
    'N5',
    $$は$$,
    $$wa$$,
    $$Quanto a / Falando de / Já (contraste)$$,
    $$は é a partícula que marca o tema da frase, ou seja, aquilo sobre o que se vai falar. Uma boa forma de entender é pensar em "falando de...", "quanto a...".

Depois de は, vem o comentário sobre esse tema. O tema costuma ser algo já conhecido ou que acabou de ser apresentado na conversa.

は também é usado para contraste. Quando duas coisas são comparadas, cada uma recebe は, mostrando que uma é assim e a outra é diferente.

は pode substituir が e を, ou vir depois de outras partículas, como に, で e と, formando には, では e とは. Nesses casos, ele transforma aquela parte em tema ou em ponto de contraste.

A diferença entre は e が é um dos pontos centrais do japonês: は apresenta o assunto, e が aponta exatamente quem ou o quê.$$,
    $$Como partícula, は é escrita com o caractere は, mas pronunciada "wa".

Em frases negativas, は aparece com frequência porque traz uma ideia de contraste: "isso, não".

Quando se apresenta algo novo, como em uma história, usa-se が na primeira vez e は nas vezes seguintes, porque a coisa já se tornou conhecida.$$,
    $$Substantivo + は + Comentário
Substantivo + partícula + は (には / では / とは / へは)
Contraste: A + は + …、B + は + …
Objeto como tema: Substantivo + は + Verbo$$,
    $$は$$,
    $$は$$,
    ARRAY['は']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-75', $$私はブラジル人です。$$, $$わたしはブラジルじんです。$$, $$Eu sou brasileiro.$$),
    ('n5-grammar-75', $$今日は天気がいいですね。$$, $$きょうはてんきがいいですね。$$, $$Hoje o tempo está bom, né?$$),
    ('n5-grammar-75', $$肉は好きですが、魚は好きじゃありません。$$, $$にくはすきですが、さかなはすきじゃありません。$$, $$Carne eu gosto, mas peixe não.$$),
    ('n5-grammar-75', $$東京には友達がたくさんいます。$$, $$とうきょうにはともだちがたくさんいます。$$, $$Em Tóquio, tenho muitos amigos.$$),
    ('n5-grammar-75', $$この本は先週買いました。$$, $$このほんはせんしゅうかいました。$$, $$Este livro, eu comprei semana passada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さん____先生です。$$, $$O Tanaka é professor.$$),
        (2, $$父は医者ですが、母____看護師です。$$, $$Meu pai é médico, mas minha mãe é enfermeira.$$),
        (3, $$今度の日曜日____どこへも行きません。$$, $$No próximo domingo, não vou a lugar nenhum.$$),
        (4, $$「コーヒーは飲みますか。」「いいえ、コーヒー____飲みません。」$$, $$"Você bebe café?" "Não, café eu não bebo."$$),
        (5, $$家では英語を話しますが、学校で____日本語を話します。$$, $$Em casa falo inglês, mas na escola falo japonês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は$$),
        (2, $$は$$),
        (3, $$は$$),
        (4, $$は$$),
        (5, $$は$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
