-- n1-grammar-34 — 〜ほどのことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-34',
    'grammar',
    'N1',
    $$〜ほどのことではない$$,
    $$hodo no koto dewa nai$$,
    $$Não é para tanto / Não chega a ser / Não precisa$$,
    $$ほどのことではない indica que algo não é tão grave ou importante a ponto de justificar uma reação. Equivale a "não é para tanto" ou "não chega a ser".

A pessoa minimiza a situação. Por exemplo, "é um resfriado leve, não é para ir ao hospital" ou "não é algo para se preocupar".

É usado para tranquilizar alguém ou para mostrar que algo é simples.$$,
    $$Na fala, aparece como ほどのことじゃない.

É parecido com までもない, que significa "nem é preciso".$$,
    $$Verbo (forma dicionário) + ほどのことではない
Verbo (forma dicionário) + ほどのことでもない$$,
    $$ほどのことではない$$,
    $$ほどのことではない|ほどのことでもない|ほどのことじゃない|ほどのことではありません$$,
    ARRAY['ほど', 'の', 'こと', 'では', 'ない']::text[],
    ARRAY['ほどのことではない', 'ほどのことでもない', 'ほどのことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-34', $$軽い風邪だから、病院に行くほどのことではない。$$, $$かるいかぜだから、びょういんにいくほどのことではない。$$, $$É um resfriado leve, não é para ir ao hospital.$$),
    ('n1-grammar-34', $$そんなに心配するほどのことではないよ。$$, $$そんなにしんぱいするほどのことではないよ。$$, $$Não é para se preocupar tanto.$$),
    ('n1-grammar-34', $$わざわざ電話するほどのことでもない。$$, $$わざわざでんわするほどのことでもない。$$, $$Não chega a ser motivo para ligar.$$),
    ('n1-grammar-34', $$怒るほどのことじゃないでしょう。$$, $$おこるほどのことじゃないでしょう。$$, $$Não é para ficar bravo, né?$$),
    ('n1-grammar-34', $$人に話すほどのことではありません。$$, $$ひとにはなすほどのことではありません。$$, $$Não é algo que valha a pena contar aos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$小さな傷だから、薬をつける____。$$, $$É um machucado pequeno, não precisa passar remédio.$$),
        (2, $$これは会議で話し合う____。$$, $$Isto não chega a ser assunto para discutir na reunião.$$),
        (3, $$お礼を言われる____。$$, $$Não é para me agradecer.$$),
        (4, $$泣く____よ。元気出して。$$, $$Não é para chorar. Anime-se.$$),
        (5, $$専門家に相談する____。$$, $$Não chega a ser preciso consultar um especialista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほどのことではない$$),
        (1, $$ほどのことでもない$$),
        (1, $$ほどのことじゃない$$),
        (1, $$ほどのことではありません$$),
        (2, $$ほどのことではない$$),
        (2, $$ほどのことでもない$$),
        (2, $$ほどのことじゃない$$),
        (2, $$ほどのことではありません$$),
        (3, $$ほどのことではない$$),
        (3, $$ほどのことでもない$$),
        (3, $$ほどのことじゃない$$),
        (3, $$ほどのことではありません$$),
        (4, $$ほどのことではない$$),
        (4, $$ほどのことでもない$$),
        (4, $$ほどのことじゃない$$),
        (5, $$ほどのことではない$$),
        (5, $$ほどのことでもない$$),
        (5, $$ほどのことじゃない$$),
        (5, $$ほどのことではありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
