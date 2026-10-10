-- n1-grammar-85 — もしくは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-85',
    'grammar',
    'N1',
    $$もしくは$$,
    $$moshiku wa$$,
    $$Ou / Ou então / Ou ainda$$,
    $$もしくは serve para apresentar opções, com o sentido de "ou" ou "ou então". É uma forma formal de または e か.

É muito usado em documentos, avisos, regras e explicações oficiais. Por exemplo, "entre em contato por telefone ou por e-mail".

Na fala do dia a dia, usa-se mais か ou または.$$,
    $$É parecido com または e あるいは.

Em textos legais, もしくは é usado para opções menores dentro de um grupo, e または para grupos maiores.$$,
    $$Substantivo + もしくは + Substantivo
Frase + もしくは + Frase$$,
    $$もしくは$$,
    $$もしくは|若しくは$$,
    ARRAY['もしくは']::text[],
    ARRAY['もしくは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-85', $$お問い合わせは電話もしくはメールでお願いします。$$, $$おといあわせはでんわもしくはメールでおねがいします。$$, $$Entre em contato por telefone ou por e-mail.$$),
    ('n1-grammar-85', $$本人もしくは家族の署名が必要です。$$, $$ほんにんもしくはかぞくのしょめいがひつようです。$$, $$É necessária a assinatura da própria pessoa ou de um familiar.$$),
    ('n1-grammar-85', $$黒もしくは青のペンで記入してください。$$, $$くろもしくはあおのペンできにゅうしてください。$$, $$Preencha com caneta preta ou azul.$$),
    ('n1-grammar-85', $$参加できない場合は、事前に連絡するか、もしくは代理人を立ててください。$$, $$さんかできないばあいは、じぜんにれんらくするか、もしくはだいりにんをたててください。$$, $$Se não puder participar, avise antes ou então indique um representante.$$),
    ('n1-grammar-85', $$会議は月曜日もしくは火曜日に行います。$$, $$かいぎはげつようびもしくはかようびにおこないます。$$, $$A reunião será na segunda ou na terça-feira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$申し込みは窓口____郵送で受け付けます。$$, $$As inscrições são aceitas no guichê ou pelo correio.$$),
        (2, $$パスポート____運転免許証を見せてください。$$, $$Mostre o passaporte ou a carteira de motorista.$$),
        (3, $$支払いは現金____カードでお願いします。$$, $$O pagamento pode ser em dinheiro ou cartão.$$),
        (4, $$詳しくは担当者____受付にお尋ねください。$$, $$Para mais detalhes, pergunte ao responsável ou na recepção.$$),
        (5, $$明日____明後日にお届けします。$$, $$Entregaremos amanhã ou depois de amanhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしくは$$),
        (2, $$もしくは$$),
        (3, $$もしくは$$),
        (4, $$もしくは$$),
        (5, $$もしくは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
