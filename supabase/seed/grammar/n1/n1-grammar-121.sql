-- n1-grammar-121 — 〜に先駆けて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-121',
    'grammar',
    'N1',
    $$〜に先駆けて$$,
    $$ni sakigakete$$,
    $$À frente de / Antes de / Pioneiro em relação a$$,
    $$に先駆けて indica que algo é feito antes de outros, sendo o primeiro ou pioneiro. Equivale a "à frente de" ou "antes de".

É usado para destacar que alguém ou algo foi o primeiro a fazer algo novo. Por exemplo, "esta empresa lançou o produto antes de todas as outras".

É uma expressão formal, comum em notícias e anúncios.$$,
    $$É parecido com に先立って, mas に先駆けて destaca o pioneirismo, enquanto に先立って indica apenas o que vem antes como preparação.

Expressões comuns são 世界に先駆けて e 他社に先駆けて.$$,
    $$Substantivo + に先駆けて / に先駆け
Substantivo + に先駆けた + Substantivo$$,
    $$に先駆けて$$,
    $$に先駆けて|に先駆け|にさきがけて$$,
    ARRAY['に', '先駆けて']::text[],
    ARRAY['に先駆けて', 'に先駆け']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-121', $$この会社は他社に先駆けて、新製品を発売した。$$, $$このかいしゃはたしゃにさきがけて、しんせいひんをはつばいした。$$, $$Esta empresa lançou o novo produto antes das concorrentes.$$),
    ('n1-grammar-121', $$日本は世界に先駆けて、この技術を開発した。$$, $$にほんはせかいにさきがけて、このぎじゅつをかいはつした。$$, $$O Japão desenvolveu esta tecnologia à frente do resto do mundo.$$),
    ('n1-grammar-121', $$全国に先駆け、この町でごみの分別が始まった。$$, $$ぜんこくにさきがけ、このまちでごみのぶんべつがはじまった。$$, $$A separação de lixo começou nesta cidade antes de todo o país.$$),
    ('n1-grammar-121', $$一般公開に先駆けて、記者向けの発表会が開かれた。$$, $$いっぱんこうかいにさきがけて、きしゃむけのはっぴょうかいがひらかれた。$$, $$Antes da abertura ao público, houve uma apresentação para a imprensa.$$),
    ('n1-grammar-121', $$彼は時代に先駆けて、ネットビジネスを始めた。$$, $$かれはじだいにさきがけて、ネットビジネスをはじめた。$$, $$Ele começou um negócio na internet à frente do seu tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この病院は国内____、新しい治療法を取り入れた。$$, $$Este hospital adotou o novo tratamento antes de todos no país.$$),
        (2, $$発売日____、ファンだけに先行販売した。$$, $$Antes do dia de lançamento, fizemos uma pré-venda só para os fãs.$$),
        (3, $$世界____、宇宙旅行の計画を発表した。$$, $$Anunciaram o plano de turismo espacial à frente do resto do mundo.$$),
        (4, $$他の店____、セールを始めた。$$, $$Começamos a liquidação antes das outras lojas.$$),
        (5, $$彼女はみんな____、新しいことに挑戦する。$$, $$Ela sempre tenta coisas novas antes de todo mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に先駆けて$$),
        (1, $$に先駆け$$),
        (1, $$にさきがけて$$),
        (2, $$に先駆けて$$),
        (2, $$に先駆け$$),
        (2, $$にさきがけて$$),
        (3, $$に先駆けて$$),
        (3, $$に先駆け$$),
        (3, $$にさきがけて$$),
        (4, $$に先駆けて$$),
        (4, $$に先駆け$$),
        (4, $$にさきがけて$$),
        (5, $$に先駆けて$$),
        (5, $$に先駆け$$),
        (5, $$にさきがけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
