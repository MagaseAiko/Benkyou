-- n1-grammar-116 — 〜にかこつけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-116',
    'grammar',
    'N1',
    $$〜にかこつけて$$,
    $$ni kakotsukete$$,
    $$Com a desculpa de / A pretexto de / Usando como desculpa$$,
    $$にかこつけて indica que alguém usa um motivo como desculpa para fazer outra coisa que realmente quer. Equivale a "com a desculpa de" ou "a pretexto de".

O motivo apresentado não é o verdadeiro. Por exemplo, "com a desculpa de uma viagem de trabalho, ele foi passear" ou "a pretexto de estar doente, faltou à reunião".

O tom é de crítica.$$,
    $$É parecido com を口実に, que tem o mesmo sentido.

Expressões comuns são 出張にかこつけて, 病気にかこつけて e 仕事にかこつけて.$$,
    $$Substantivo + にかこつけて + Verbo$$,
    $$にかこつけて$$,
    $$にかこつけて|に託けて$$,
    ARRAY['に', 'かこつけて']::text[],
    ARRAY['にかこつけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-116', $$彼は出張にかこつけて、観光を楽しんだ。$$, $$かれはしゅっちょうにかこつけて、かんこうをたのしんだ。$$, $$Com a desculpa de uma viagem de trabalho, ele aproveitou para passear.$$),
    ('n1-grammar-116', $$病気にかこつけて、会議を休んだ。$$, $$びょうきにかこつけて、かいぎをやすんだ。$$, $$A pretexto de estar doente, faltou à reunião.$$),
    ('n1-grammar-116', $$仕事にかこつけて、家事を手伝わない夫が多い。$$, $$しごとにかこつけて、かじをてつだわないおっとがおおい。$$, $$Muitos maridos não ajudam em casa usando o trabalho como desculpa.$$),
    ('n1-grammar-116', $$雨にかこつけて、ジョギングをさぼった。$$, $$あめにかこつけて、ジョギングをさぼった。$$, $$Com a desculpa da chuva, matei a corrida.$$),
    ('n1-grammar-116', $$誕生日にかこつけて、高いバッグを買ってもらった。$$, $$たんじょうびにかこつけて、たかいバッグをかってもらった。$$, $$A pretexto do aniversário, ganhei uma bolsa cara.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勉強____、友達の家に遊びに行った。$$, $$Com a desculpa de estudar, fui brincar na casa de um amigo.$$),
        (2, $$忙しさ____、親に連絡しない。$$, $$Com a desculpa de estar ocupado, não entro em contato com meus pais.$$),
        (3, $$会議____、昼から外出した。$$, $$A pretexto de uma reunião, saí a partir do meio-dia.$$),
        (4, $$取材____、有名人に会いに行った。$$, $$Com a desculpa de uma entrevista, fui ver uma celebridade.$$),
        (5, $$頭痛____、宿題をしなかった。$$, $$A pretexto de dor de cabeça, não fiz a lição de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかこつけて$$),
        (2, $$にかこつけて$$),
        (3, $$にかこつけて$$),
        (4, $$にかこつけて$$),
        (5, $$にかこつけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
