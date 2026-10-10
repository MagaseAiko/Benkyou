-- n3-grammar-174 — 〜ようがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-174',
    'grammar',
    'N3',
    $$〜ようがない$$,
    $$you ga nai$$,
    $$Não há como / Não tem jeito de / É impossível$$,
    $$ようがない é usado para dizer que não existe nenhum meio ou método de fazer algo. Equivale a "não há como", "não tem jeito de" ou "é impossível".

よう aqui significa "modo" ou "maneira". Assim, a estrutura diz literalmente "não existe maneira de fazer isso".

Ela é formada tirando ます do verbo e acrescentando ようがない. Por exemplo, 連絡しようがない (não há como entrar em contato).

A diferença em relação a できない é o motivo. できない pode indicar falta de habilidade. ようがない indica que faltam meios, informações ou condições para fazer aquilo, como não ter o endereço, não ter materiais ou o objeto estar quebrado demais.

A forma ようもない, com も, reforça a impossibilidade. A expressão どうしようもない significa "não tem jeito nenhum".$$,
    $$Com する verbos, a forma fica 〜しようがない: 説明しようがない (não há como explicar).

言いようがない (não há palavras para descrever) é usado para sentimentos muito fortes.

どうしようもない também descreve pessoas sem jeito ou situações irremediáveis.$$,
    $$Verbo na forma ます sem ます + ようがない
Verbo sem ます + ようもない (mais enfático)
どうしようもない (não tem jeito nenhum)

Educado: ようがありません$$,
    $$ようがない$$,
    $$ようがない|ようもない|ようがありません$$,
    ARRAY['よう', 'が', 'ない']::text[],
    ARRAY['ようがない', 'ようもない', 'ようがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-174', $$連絡先がわからないので、連絡しようがない。$$, $$れんらくさきがわからないので、れんらくしようがない。$$, $$Não sei o contato, então não há como entrar em contato.$$),
    ('n3-grammar-174', $$こんなに壊れていたら、直しようがない。$$, $$こんなにこわれていたら、なおしようがない。$$, $$Quebrado desse jeito, não tem como consertar.$$),
    ('n3-grammar-174', $$材料がないので、作りようがない。$$, $$ざいりょうがないので、つくりようがない。$$, $$Não tenho os ingredientes, então não há como fazer.$$),
    ('n3-grammar-174', $$その時の気持ちは、言葉では言いようがない。$$, $$そのときのきもちは、ことばではいいようがない。$$, $$Não há palavras para descrever o que senti naquele momento.$$),
    ('n3-grammar-174', $$道がわからないから、行きようがない。$$, $$みちがわからないから、いきようがない。$$, $$Não sei o caminho, então não há como ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$住所がわからないので、手紙を送り____。$$, $$Não sei o endereço, então não há como enviar a carta.$$),
        (2, $$証拠がないから、警察も調べ____。$$, $$Sem provas, nem a polícia tem como investigar.$$),
        (3, $$何も知らないので、答え____。$$, $$Não sei de nada, então não há como responder.$$),
        (4, $$もう終わったことだから、どうし____。$$, $$Já acabou, então não tem jeito nenhum.$$),
        (5, $$電話番号を知らないから、電話をかけ____。$$, $$Não sei o número, então não há como ligar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようがない$$),
        (1, $$ようがありません$$),
        (2, $$ようがない$$),
        (2, $$ようがありません$$),
        (3, $$ようがない$$),
        (3, $$ようがありません$$),
        (4, $$ようもない$$),
        (4, $$ようがない$$),
        (5, $$ようがない$$),
        (5, $$ようがありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
