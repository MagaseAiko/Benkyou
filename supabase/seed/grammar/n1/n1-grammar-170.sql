-- n1-grammar-170 — 〜そびれる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-170',
    'grammar',
    'N1',
    $$〜そびれる$$,
    $$sobireru$$,
    $$Perder a chance de / Acabar não / Deixar de$$,
    $$そびれる indica que a pessoa perdeu a oportunidade de fazer algo que queria ou devia fazer. Equivale a "perder a chance de" ou "acabar não...".

Muitas vezes há arrependimento. Por exemplo, "perdi a chance de dizer obrigado" ou "acabei não almoçando".

É uma expressão coloquial, comum na fala.$$,
    $$Combinações comuns são 言いそびれる, 聞きそびれる, 食べそびれる, 寝そびれる e 買いそびれる.

É parecido com 損なう, mas そびれる é mais coloquial.$$,
    $$Verbo (forma ます sem ます) + そびれる$$,
    $$そびれる$$,
    $$そびれる|そびれた|そびれて|そびれ$$,
    ARRAY['そびれる']::text[],
    ARRAY['そびれる', 'そびれた', 'そびれて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-170', $$忙しくて、お礼を言いそびれた。$$, $$いそがしくて、おれいをいいそびれた。$$, $$Estava tão ocupado que perdi a chance de agradecer.$$),
    ('n1-grammar-170', $$会議が長引いて、昼ご飯を食べそびれた。$$, $$かいぎがながびいて、ひるごはんをたべそびれた。$$, $$A reunião se estendeu e acabei não almoçando.$$),
    ('n1-grammar-170', $$大事なことを聞きそびれてしまった。$$, $$だいじなことをききそびれてしまった。$$, $$Acabei perdendo a chance de perguntar algo importante.$$),
    ('n1-grammar-170', $$コーヒーを飲みすぎて、寝そびれた。$$, $$コーヒーをのみすぎて、ねそびれた。$$, $$Tomei café demais e acabei não conseguindo dormir.$$),
    ('n1-grammar-170', $$人気のチケットを買いそびれた。$$, $$にんきのチケットをかいそびれた。$$, $$Perdi a chance de comprar os ingressos concorridos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女に本当の気持ちを言い____。$$, $$Perdi a chance de dizer a ela o que eu realmente sentia.$$),
        (2, $$先生に質問し____しまった。$$, $$Acabei perdendo a chance de fazer uma pergunta ao professor.$$),
        (3, $$あの映画を見____。$$, $$Perdi a chance de ver aquele filme.$$),
        (4, $$夜遅くまで話していて、寝____。$$, $$Fiquei conversando até tarde e acabei não dormindo.$$),
        (5, $$駅で友達に会ったが、挨拶し____。$$, $$Encontrei um amigo na estação, mas perdi a chance de cumprimentá-lo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-170', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そびれた$$),
        (2, $$そびれて$$),
        (3, $$そびれた$$),
        (4, $$そびれた$$),
        (5, $$そびれた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
