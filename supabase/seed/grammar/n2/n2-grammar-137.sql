-- n2-grammar-137 — 〜次第
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-137',
    'grammar',
    'N2',
    $$〜次第$$,
    $$shidai$$,
    $$Assim que / Logo que / Tão logo$$,
    $$次第, depois da raiz de um verbo, indica que algo será feito imediatamente depois que outra coisa acontecer. Equivale a "assim que" ou "logo que".

A segunda parte costuma ser uma ação intencional, como entrar em contato, enviar ou começar. Por exemplo, "assim que eu chegar, entro em contato".

É uma expressão formal, muito usada no trabalho e em e-mails.$$,
    $$Não se usa com acontecimentos passados. A frase sempre fala do futuro.

É parecido com たらすぐに, mas 次第 é mais formal.

Não se confunde com 次第で, que significa "dependendo de".$$,
    $$Verbo (forma ます sem ます) + 次第
Substantivo (ação) + 次第$$,
    $$次第$$,
    $$次第|しだい$$,
    ARRAY['次第']::text[],
    ARRAY['次第', 'しだい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-137', $$着き次第、連絡します。$$, $$つきしだい、れんらくします。$$, $$Assim que eu chegar, entro em contato.$$),
    ('n2-grammar-137', $$準備ができ次第、出発しましょう。$$, $$じゅんびができしだい、しゅっぱつしましょう。$$, $$Assim que tudo estiver pronto, vamos partir.$$),
    ('n2-grammar-137', $$結果がわかり次第、お知らせします。$$, $$けっかがわかりしだい、おしらせします。$$, $$Assim que soubermos o resultado, avisaremos.$$),
    ('n2-grammar-137', $$商品が届き次第、お送りいたします。$$, $$しょうひんがとどきしだい、おおくりいたします。$$, $$Assim que o produto chegar, enviaremos.$$),
    ('n2-grammar-137', $$雨がやみ次第、試合を再開します。$$, $$あめがやみしだい、しあいをさいかいします。$$, $$Assim que a chuva parar, a partida será retomada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事が終わり____、そちらに向かいます。$$, $$Assim que o trabalho terminar, vou até aí.$$),
        (2, $$詳細が決まり____、ご連絡いたします。$$, $$Assim que os detalhes forem definidos, entraremos em contato.$$),
        (3, $$部長が戻り____、会議を始めます。$$, $$Assim que o gerente voltar, começaremos a reunião.$$),
        (4, $$確認でき____、お返事します。$$, $$Assim que eu puder confirmar, respondo.$$),
        (5, $$席が空き____、ご案内します。$$, $$Assim que vagar uma mesa, nós o levaremos até ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第$$),
        (1, $$しだい$$),
        (2, $$次第$$),
        (2, $$しだい$$),
        (3, $$次第$$),
        (3, $$しだい$$),
        (4, $$次第$$),
        (4, $$しだい$$),
        (5, $$次第$$),
        (5, $$しだい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
