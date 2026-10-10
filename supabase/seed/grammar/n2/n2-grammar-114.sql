-- n2-grammar-114 — 〜にて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-114',
    'grammar',
    'N2',
    $$〜にて$$,
    $$nite$$,
    $$Em / Por meio de / Com$$,
    $$にて é uma forma formal e escrita da partícula で. Equivale a "em", "por meio de" ou "com".

Pode indicar o lugar onde algo acontece, como "no salão principal", o meio usado, como "por e-mail", ou o momento em que algo termina, como "encerramos hoje".

É muito comum em avisos, convites, anúncios e documentos oficiais.$$,
    $$Na fala do dia a dia, usa-se で.

Expressões comuns são 会場にて, メールにて, 本日にて e 以上にて.$$,
    $$Substantivo (lugar) + にて
Substantivo (meio / método) + にて
Substantivo (tempo) + にて + 終了する / 締め切る$$,
    $$にて$$,
    $$にて$$,
    ARRAY['にて']::text[],
    ARRAY['にて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-114', $$式は本館ホールにて行います。$$, $$しきはほんかんホールにておこないます。$$, $$A cerimônia será realizada no salão do prédio principal.$$),
    ('n2-grammar-114', $$結果はメールにてお知らせします。$$, $$けっかはメールにておしらせします。$$, $$Os resultados serão informados por e-mail.$$),
    ('n2-grammar-114', $$本日にて受付を終了いたします。$$, $$ほんじつにてうけつけをしゅうりょういたします。$$, $$Com o dia de hoje, encerramos as inscrições.$$),
    ('n2-grammar-114', $$以上にて説明を終わります。$$, $$いじょうにてせつめいをおわります。$$, $$Com isso, encerro a explicação.$$),
    ('n2-grammar-114', $$詳細は受付にてお尋ねください。$$, $$しょうさいはうけつけにておたずねください。$$, $$Para detalhes, pergunte na recepção.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議は三階の会議室____行います。$$, $$A reunião será realizada na sala de reuniões do terceiro andar.$$),
        (2, $$申し込みは電話____受け付けます。$$, $$As inscrições são aceitas por telefone.$$),
        (3, $$これ____本日の授業を終わります。$$, $$Com isto, encerro a aula de hoje.$$),
        (4, $$商品は宅配便____お届けします。$$, $$Entregaremos o produto por serviço de entrega.$$),
        (5, $$チケットは駅の窓口____販売しております。$$, $$Os ingressos estão à venda no guichê da estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にて$$),
        (2, $$にて$$),
        (3, $$にて$$),
        (4, $$にて$$),
        (5, $$にて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
