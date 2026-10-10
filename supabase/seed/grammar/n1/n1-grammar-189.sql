-- n1-grammar-189 — 〜て済むことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-189',
    'grammar',
    'N1',
    $$〜て済むことではない$$,
    $$te sumu koto dewa nai$$,
    $$Não se resolve com / Não basta / Não é algo que se resolva$$,
    $$て済むことではない indica que uma situação é tão grave que não pode ser resolvida de forma simples. Equivale a "não se resolve com" ou "não basta".

Muitas vezes é usado quando alguém tenta resolver um problema sério apenas pedindo desculpas ou pagando. Por exemplo, "isso não se resolve só pedindo desculpas".

O tom é de crítica forte.$$,
    $$Expressões comuns são 謝って済むことではない e お金で済む問題ではない.

É parecido com では済まない.$$,
    $$Verbo (forma て) + 済むことではない
Verbo (forma て) + 済む問題ではない$$,
    $$て済むことではない$$,
    $$て済むことではない|て済む問題ではない|て済むことじゃない|て済む話ではない|てすむことではない$$,
    ARRAY['て', '済む', 'こと', 'では', 'ない']::text[],
    ARRAY['て済むことではない', 'て済む問題ではない', 'て済むことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-189', $$人を傷つけておいて、謝って済むことではない。$$, $$ひとをきずつけておいて、あやまってすむことではない。$$, $$Machucar alguém não é algo que se resolva só pedindo desculpas.$$),
    ('n1-grammar-189', $$これはお金を払って済む問題ではない。$$, $$これはおかねをはらってすむもんだいではない。$$, $$Isso não é um problema que se resolva pagando.$$),
    ('n1-grammar-189', $$知らなかったと言って済むことではない。$$, $$しらなかったといってすむことではない。$$, $$Não basta dizer que não sabia.$$),
    ('n1-grammar-189', $$ごめんと言って済むことじゃないよ。$$, $$ごめんといってすむことじゃないよ。$$, $$Não basta dizer desculpa.$$),
    ('n1-grammar-189', $$会社の信用を失ったのは、謝って済む話ではない。$$, $$かいしゃのしんようをうしなったのは、あやまってすむはなしではない。$$, $$Perder a confiança na empresa não se resolve só pedindo desculpas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破っておいて、謝っ____。$$, $$Quebrar a promessa não é algo que se resolva só pedindo desculpas.$$),
        (2, $$命に関わることだ。笑っ____。$$, $$É algo que envolve vidas. Não se resolve com risadas.$$),
        (3, $$反省していると言っ____。$$, $$Não basta dizer que está arrependido.$$),
        (4, $$この被害は、お金で弁償し____。$$, $$Estes danos não se resolvem só indenizando com dinheiro.$$),
        (5, $$ミスを隠そうとしたのは、忘れていたと言っ____。$$, $$Tentar esconder o erro não se resolve dizendo que esqueceu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て済むことではない$$),
        (1, $$て済む問題ではない$$),
        (1, $$て済むことじゃない$$),
        (2, $$て済むことではない$$),
        (2, $$て済む問題ではない$$),
        (2, $$て済むことじゃない$$),
        (3, $$て済むことではない$$),
        (3, $$て済む問題ではない$$),
        (3, $$て済むことじゃない$$),
        (4, $$て済むことではない$$),
        (4, $$て済む問題ではない$$),
        (5, $$て済むことではない$$),
        (5, $$て済む問題ではない$$),
        (5, $$て済むことじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
