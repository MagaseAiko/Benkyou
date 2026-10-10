-- n1-grammar-64 — 〜ことなしに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-64',
    'grammar',
    'N1',
    $$〜ことなしに$$,
    $$koto nashi ni$$,
    $$Sem / Sem que / A menos que$$,
    $$ことなしに indica que algo é feito sem uma ação que normalmente seria necessária. Equivale a "sem" ou "sem que".

Muitas vezes a segunda parte é negativa, mostrando que, sem aquela ação, algo não é possível. Por exemplo, "sem esforço, não há sucesso".

É uma expressão formal, parecida com ないで e ずに.$$,
    $$A forma ことなしには reforça a condição, com o sentido de "sem isso, não dá".

É mais formal que ないで e ずに, e aparece mais na escrita.$$,
    $$Verbo (forma dicionário) + ことなしに
Verbo (forma dicionário) + ことなしには + Frase negativa$$,
    $$ことなしに$$,
    $$ことなしに|ことなく$$,
    ARRAY['こと', 'なし', 'に']::text[],
    ARRAY['ことなしに', 'ことなしには', 'ことなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-64', $$努力することなしに、成功はありえない。$$, $$どりょくすることなしに、せいこうはありえない。$$, $$Sem esforço, não há sucesso possível.$$),
    ('n1-grammar-64', $$彼は誰にも相談することなしに、会社を辞めた。$$, $$かれはだれにもそうだんすることなしに、かいしゃをやめた。$$, $$Ele saiu da empresa sem consultar ninguém.$$),
    ('n1-grammar-64', $$苦労することなしには、本当の喜びは得られない。$$, $$くろうすることなしには、ほんとうのよろこびはえられない。$$, $$Sem sofrimento, não se alcança a verdadeira alegria.$$),
    ('n1-grammar-64', $$許可を得ることなしに、写真を撮ってはいけない。$$, $$きょかをえることなしに、しゃしんをとってはいけない。$$, $$Não se pode tirar fotos sem obter permissão.$$),
    ('n1-grammar-64', $$彼女は休むことなく働き続けた。$$, $$かのじょはやすむことなくはたらきつづけた。$$, $$Ela continuou trabalhando sem descansar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞く____、問題は解決できない。$$, $$Sem ouvir os outros, não dá para resolver o problema.$$),
        (2, $$失敗する____、成長はない。$$, $$Sem errar, não há crescimento.$$),
        (3, $$彼は一度も振り返る____、去っていった。$$, $$Ele foi embora sem olhar para trás nenhuma vez.$$),
        (4, $$練習を重ねる____、上達はありえない。$$, $$Sem treinar repetidamente, não há progresso possível.$$),
        (5, $$相手を理解する____、いい関係は作れない。$$, $$Sem compreender o outro, não dá para construir uma boa relação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことなしに$$),
        (1, $$ことなしには$$),
        (2, $$ことなしに$$),
        (2, $$ことなしには$$),
        (3, $$ことなしに$$),
        (3, $$ことなく$$),
        (4, $$ことなしに$$),
        (4, $$ことなしには$$),
        (5, $$ことなしに$$),
        (5, $$ことなしには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
