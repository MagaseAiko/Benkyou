-- n5-grammar-27 — まだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-27',
    'grammar',
    'N5',
    $$まだ$$,
    $$mada$$,
    $$Ainda / Ainda não$$,
    $$まだ significa "ainda". Ele mostra que uma situação continua igual e ainda não mudou.

Com frases afirmativas, まだ indica que algo continua acontecendo ou continua sendo verdade, como ainda estar dormindo, ainda ter tempo ou ainda ser estudante.

Com frases negativas, まだ significa "ainda não", ou seja, algo que se espera que aconteça, mas que não aconteceu até agora.

Sozinho, na resposta まだです ou só まだ, ele significa "ainda não". É a resposta natural quando alguém pergunta se você já fez alguma coisa.

O oposto de まだ é もう, que significa "já".$$,
    $$Na resposta まだです, não é preciso repetir o verbo; o contexto já deixa claro do que se trata.

まだ pode indicar que ainda falta pouco ou que ainda há margem, como em ainda ter tempo, ainda dar para ir.

Muitas vezes まだ tem um tom de "ainda não, mas vai acontecer". Por isso, ele combina com coisas que se espera fazer no futuro.$$,
    $$まだ + Verbo na forma ている (ainda está fazendo)
まだ + Adjetivo / Substantivo + です
まだ + Verbo na forma ていない / ていません (ainda não fez)
まだです / まだ (resposta: ainda não)$$,
    $$まだ$$,
    $$まだ$$,
    ARRAY['まだ']::text[],
    ARRAY['まだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-27', $$弟はまだ寝ています。$$, $$おとうとはまだねています。$$, $$Meu irmão mais novo ainda está dormindo.$$),
    ('n5-grammar-27', $$まだ時間がありますよ。$$, $$まだじかんがありますよ。$$, $$Ainda temos tempo.$$),
    ('n5-grammar-27', $$外はまだ明るいです。$$, $$そとはまだあかるいです。$$, $$Lá fora ainda está claro.$$),
    ('n5-grammar-27', $$「宿題は終わった？」「ううん、まだ。」$$, $$「しゅくだいはおわった？」「ううん、まだ。」$$, $$"Terminou a lição?" "Não, ainda não."$$),
    ('n5-grammar-27', $$日本語はまだ下手ですが、毎日勉強しています。$$, $$にほんごはまだへたですが、まいにちべんきょうしています。$$, $$Meu japonês ainda é fraco, mas estudo todo dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が____降っています。$$, $$Ainda está chovendo.$$),
        (2, $$「もう昼ご飯を食べましたか。」「いいえ、____です。」$$, $$"Você já almoçou?" "Não, ainda não."$$),
        (3, $$父は____会社にいます。$$, $$Meu pai ainda está na empresa.$$),
        (4, $$私は____学生です。$$, $$Eu ainda sou estudante.$$),
        (5, $$____五時なのに、外はもう暗い。$$, $$Ainda são cinco horas, mas lá fora já está escuro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まだ$$),
        (2, $$まだ$$),
        (3, $$まだ$$),
        (4, $$まだ$$),
        (5, $$まだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
