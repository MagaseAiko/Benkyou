-- n2-grammar-100 — 〜に際して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-100',
    'grammar',
    'N2',
    $$〜に際して$$,
    $$ni saishite$$,
    $$Por ocasião de / Ao / No momento de$$,
    $$に際して indica o momento em que algo especial é feito. Equivale a "por ocasião de" ou "ao".

É usado em situações formais, antes ou durante um acontecimento importante, como uma inscrição, uma viagem ou uma cerimônia. Por exemplo, "ao se inscrever, apresente um documento de identidade".

É comum em avisos, discursos e documentos oficiais.$$,
    $$É muito parecido com にあたって. A diferença é pequena, mas に際して foca mais no momento em si, enquanto にあたって destaca uma etapa importante.

に際し é ainda mais formal.$$,
    $$Substantivo + に際して / に際し
Verbo (forma dicionário) + に際して / に際し$$,
    $$に際して$$,
    $$に際して|に際し|にさいして$$,
    ARRAY['に', '際して']::text[],
    ARRAY['に際して', 'に際し', 'に際しての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-100', $$申し込みに際して、身分証明書が必要です。$$, $$もうしこみにさいして、みぶんしょうめいしょがひつようです。$$, $$Ao fazer a inscrição, é necessário um documento de identidade.$$),
    ('n2-grammar-100', $$出発に際して、注意事項を説明します。$$, $$しゅっぱつにさいして、ちゅういじこうをせつめいします。$$, $$Antes da partida, vou explicar os cuidados necessários.$$),
    ('n2-grammar-100', $$入学に際し、学長がお祝いの言葉を述べた。$$, $$にゅうがくにさいし、がくちょうがおいわいのことばをのべた。$$, $$Por ocasião da entrada na universidade, o reitor deu uma mensagem de felicitações.$$),
    ('n2-grammar-100', $$契約するに際して、内容をよく読んでください。$$, $$けいやくするにさいして、ないようをよくよんでください。$$, $$Ao assinar o contrato, leia bem o conteúdo.$$),
    ('n2-grammar-100', $$帰国に際して、友人たちがパーティーを開いてくれた。$$, $$きこくにさいして、ゆうじんたちがパーティーをひらいてくれた。$$, $$Por ocasião da minha volta ao país, meus amigos fizeram uma festa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご利用____、以下の点にご注意ください。$$, $$Ao utilizar, preste atenção aos pontos abaixo.$$),
        (2, $$退職____、お世話になった方々に挨拶をした。$$, $$Por ocasião da minha aposentadoria, cumprimentei as pessoas que me ajudaram.$$),
        (3, $$工事を行う____、ご迷惑をおかけします。$$, $$Durante a realização da obra, pedimos desculpas pelo incômodo.$$),
        (4, $$就職____、スーツを新しく買った。$$, $$Por ocasião do novo emprego, comprei um terno novo.$$),
        (5, $$試験を受ける____、受験票を忘れないでください。$$, $$Ao fazer a prova, não esqueça o comprovante de inscrição.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に際して$$),
        (1, $$に際し$$),
        (1, $$にさいして$$),
        (2, $$に際して$$),
        (2, $$に際し$$),
        (2, $$にさいして$$),
        (3, $$に際して$$),
        (3, $$に際し$$),
        (3, $$にさいして$$),
        (4, $$に際して$$),
        (4, $$に際し$$),
        (4, $$にさいして$$),
        (5, $$に際して$$),
        (5, $$に際し$$),
        (5, $$にさいして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
