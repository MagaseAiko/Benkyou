-- n1-grammar-141 — 〜のやら / 〜ものやら / 〜ことやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-141',
    'grammar',
    'N1',
    $$〜のやら / 〜ものやら / 〜ことやら$$,
    $$no yara / mono yara / koto yara$$,
    $$Será que / Quem sabe / Não faço ideia de$$,
    $$のやら, ものやら e ことやら expressam dúvida ou incerteza, muitas vezes com preocupação. Equivalem a "será que...?" ou "não faço ideia de...".

A pessoa se pergunta algo para si mesma, sem esperar resposta. Costumam vir com palavras interrogativas, como どこ, 何, いつ ou どう. Por exemplo, "será que ele está bem?" ou "não faço ideia de onde ele foi".

É uma expressão um pouco literária e emotiva.$$,
    $$É parecido com のだろうか e かな, mas のやら expressa mais preocupação ou impaciência.

Muitas vezes termina com わからない ou 心配だ.$$,
    $$Palavra interrogativa + Verbo (forma simples) + のやら
Palavra interrogativa + Verbo (forma simples) + ものやら
Palavra interrogativa + Verbo (forma simples) + ことやら$$,
    $$のやら$$,
    $$のやら|ものやら|ことやら$$,
    ARRAY['の', 'やら']::text[],
    ARRAY['のやら', 'ものやら', 'ことやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-141', $$彼は今どこにいるのやら。$$, $$かれはいまどこにいるのやら。$$, $$Será que ele está onde agora?$$),
    ('n1-grammar-141', $$この先どうなることやら。$$, $$このさきどうなることやら。$$, $$Quem sabe o que vai acontecer daqui em diante.$$),
    ('n1-grammar-141', $$何を考えているのやら、さっぱりわからない。$$, $$なにをかんがえているのやら、さっぱりわからない。$$, $$Não faço a menor ideia do que ele está pensando.$$),
    ('n1-grammar-141', $$いつになったら終わるものやら。$$, $$いつになったらおわるものやら。$$, $$Será que isso vai acabar algum dia?$$),
    ('n1-grammar-141', $$息子は元気でやっているのやら、心配だ。$$, $$むすこはげんきでやっているのやら、しんぱいだ。$$, $$Será que meu filho está bem? Estou preocupado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの子は誰に似た____。$$, $$Será que essa criança puxou a quem?$$),
        (2, $$この仕事はいつ終わる____。$$, $$Quem sabe quando este trabalho vai terminar.$$),
        (3, $$どうすればいい____、わからない。$$, $$Não faço ideia do que devo fazer.$$),
        (4, $$彼女は何を言いたい____。$$, $$Será que ela quer dizer o quê?$$),
        (5, $$一体どうなる____。$$, $$Quem sabe o que vai acontecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のやら$$),
        (2, $$ことやら$$),
        (2, $$のやら$$),
        (2, $$ものやら$$),
        (3, $$のやら$$),
        (3, $$ものやら$$),
        (4, $$のやら$$),
        (5, $$ことやら$$),
        (5, $$のやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
