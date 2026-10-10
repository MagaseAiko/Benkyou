-- n5-grammar-34 — も
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-34',
    'grammar',
    'N5',
    $$も$$,
    $$mo$$,
    $$Também / Nem / Tanto... quanto...$$,
    $$も é uma partícula que significa "também". Ela mostra que a mesma coisa vale para mais de um elemento.

も ocupa o lugar de は, が e を: em vez de usar essas partículas, você coloca も. Já com outras partículas, como に, で e と, も fica depois delas, formando にも, でも e とも.

Quando aparece duas vezes, na forma A も B も, significa "tanto A quanto B" em frases afirmativas, e "nem A nem B" em frases negativas.

Depois de palavras interrogativas, como 何, 誰 e どこ, e com o verbo no negativo, も forma ideias como "nada", "ninguém" e "nenhum lugar".

Depois de uma quantidade, も dá ênfase, mostrando que o número é maior do que o esperado.$$,
    $$Dizer 何もありません é a forma natural de "não tem nada". Com 何 e も, o verbo precisa estar no negativo.

Um erro comum é juntar も com は, が ou を, como dizer 私はも. O correto é só 私も.

Na resposta curta, 私も sozinho significa "eu também", e é muito usado em conversas.$$,
    $$Substantivo + も (no lugar de は / が / を)
Substantivo + partícula + も (にも / でも / とも / へも)
A + も + B + も + afirmativo (tanto A quanto B)
A + も + B + も + negativo (nem A nem B)
Palavra interrogativa + も + negativo (nada / ninguém / nenhum lugar)
Quantidade + も (ênfase: "todo esse tanto")$$,
    $$も$$,
    $$も$$,
    ARRAY['も']::text[],
    ARRAY['も']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-34', $$私も学生です。$$, $$わたしもがくせいです。$$, $$Eu também sou estudante.$$),
    ('n5-grammar-34', $$兄も姉も東京に住んでいます。$$, $$あにもあねもとうきょうにすんでいます。$$, $$Tanto meu irmão quanto minha irmã moram em Tóquio.$$),
    ('n5-grammar-34', $$今日は何も食べていません。$$, $$きょうはなにもたべていません。$$, $$Hoje não comi nada.$$),
    ('n5-grammar-34', $$旅行で京都にも行きました。$$, $$りょこうできょうとにもいきました。$$, $$Na viagem, também fui a Kyoto.$$),
    ('n5-grammar-34', $$昨日は十時間も寝ました。$$, $$きのうはじゅうじかんもねました。$$, $$Ontem dormi dez horas inteiras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは医者です。山田さん____医者です。$$, $$O Tanaka é médico. O Yamada também é médico.$$),
        (2, $$教室には誰____いません。$$, $$Não tem ninguém na sala de aula.$$),
        (3, $$肉____魚も好きです。$$, $$Gosto tanto de carne quanto de peixe.$$),
        (4, $$「私はコーヒーが好きです。」「私____。」$$, $$"Eu gosto de café." "Eu também."$$),
        (5, $$駅まで一時間____かかりました。$$, $$Levou uma hora inteira até a estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も$$),
        (2, $$も$$),
        (3, $$も$$),
        (4, $$も$$),
        (5, $$も$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
