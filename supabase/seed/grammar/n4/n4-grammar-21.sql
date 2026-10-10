-- n4-grammar-21 — 〜必要がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-21',
    'grammar',
    'N4',
    $$〜必要がある$$,
    $$hitsuyou ga aru$$,
    $$É necessário / Precisar (fazer) / Ter que$$,
    $$必要がある é usado para dizer que é necessário fazer uma ação. Equivale a "é necessário", "é preciso" ou "precisar fazer".

A estrutura junta o verbo na forma de dicionário com 必要がある. A ideia literal é "existe a necessidade de fazer isso".

Comparado a なければならない, 必要がある soa mais objetivo e menos pessoal. Ele apresenta a necessidade como um fato, e não como uma obrigação imposta. Por isso, é comum em explicações, instruções e textos formais.

Na forma negativa, 必要はない significa "não há necessidade" e é uma maneira educada de dizer que algo não precisa ser feito. Nesse caso, が costuma virar は.$$,
    $$Para dizer que uma coisa é necessária, usa-se が必要. Para uma ação, usa-se 必要がある. A diferença é a palavra que vem antes: substantivo ou verbo.

A forma 必要はない é uma ótima opção para tranquilizar alguém, porque soa gentil e objetiva.

Em textos formais, também aparece a forma 必要があると考えられる, usada para fazer recomendações.$$,
    $$Verbo na forma de dicionário + 必要がある
Verbo na forma de dicionário + 必要があります (educado)

Negativo: Verbo + 必要はない / 必要はありません
Variação: 必要がない$$,
    $$必要がある$$,
    $$必要がある|必要があります|必要はない|必要はありません|必要がない|ひつようがある$$,
    ARRAY['必要', 'が', 'ある']::text[],
    ARRAY['必要がある', '必要があります', '必要はない', '必要はありません', '必要がない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-21', $$明日までにレポートを出す必要があります。$$, $$あしたまでにレポートをだすひつようがあります。$$, $$É necessário entregar o relatório até amanhã.$$),
    ('n4-grammar-21', $$海外に行く前に、ビザを申請する必要がある。$$, $$かいがいにいくまえに、ビザをしんせいするひつようがある。$$, $$Antes de ir ao exterior, é preciso pedir o visto.$$),
    ('n4-grammar-21', $$急ぐ必要はありませんよ。$$, $$いそぐひつようはありませんよ。$$, $$Não há necessidade de ter pressa.$$),
    ('n4-grammar-21', $$もう一度確認する必要があると思います。$$, $$もういちどかくにんするひつようがあるとおもいます。$$, $$Acho que é preciso confirmar mais uma vez.$$),
    ('n4-grammar-21', $$日本では、家に入るとき靴を脱ぐ必要があります。$$, $$にほんでは、いえにはいるときくつをぬぐひつようがあります。$$, $$No Japão, é preciso tirar os sapatos ao entrar em casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験の前に、もっと勉強する____。$$, $$Antes da prova, é preciso estudar mais.$$),
        (2, $$このことは、すぐ社長に報告する____。$$, $$É necessário informar isso ao presidente imediatamente.$$),
        (3, $$そんなに心配する____。$$, $$Não há necessidade de se preocupar tanto.$$),
        (4, $$会議に出る前に、資料を読む____。$$, $$Antes de participar da reunião, é preciso ler os documentos.$$),
        (5, $$もう払ったので、お金を持ってくる____。$$, $$Já está pago, então não precisa trazer dinheiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$必要があります$$),
        (1, $$必要がある$$),
        (2, $$必要があります$$),
        (2, $$必要がある$$),
        (3, $$必要はありません$$),
        (3, $$必要はない$$),
        (4, $$必要があります$$),
        (4, $$必要がある$$),
        (5, $$必要はありません$$),
        (5, $$必要はない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
