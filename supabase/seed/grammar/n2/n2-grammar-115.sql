-- n2-grammar-115 — 〜のももっともだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-115',
    'grammar',
    'N2',
    $$〜のももっともだ$$,
    $$no mo mottomo da$$,
    $$É compreensível que / É natural que / Faz sentido que$$,
    $$のももっともだ indica que uma reação ou atitude é compreensível diante da situação. Equivale a "é compreensível que" ou "faz sentido que".

A pessoa que fala mostra que entende e aceita o motivo do outro. Por exemplo, "depois de esperar duas horas, é compreensível que ele esteja bravo".

É parecido com のも当然だ e のも無理はない.$$,
    $$O tom é de compreensão e empatia, não de crítica.

Também aparece como のももっともです, na forma educada.

A palavra もっとも sozinha, como adjetivo, significa "razoável".$$,
    $$Verbo (forma simples) + のももっともだ
Adjetivo い + のももっともだ
Adjetivo な + な + のももっともだ$$,
    $$のももっともだ$$,
    $$のももっとも$$,
    ARRAY['の', 'も', 'もっとも', 'だ']::text[],
    ARRAY['のももっともだ', 'のももっともです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-115', $$二時間も待たされたのだから、彼が怒るのももっともだ。$$, $$にじかんもまたされたのだから、かれがおこるのももっともだ。$$, $$Ele esperou duas horas, então é compreensível que esteja bravo.$$),
    ('n2-grammar-115', $$初めての海外なら、不安に思うのももっともだ。$$, $$はじめてのかいがいなら、ふあんにおもうのももっともだ。$$, $$Se é a primeira vez no exterior, é natural ficar inseguro.$$),
    ('n2-grammar-115', $$あれだけ練習したのだから、優勝したのももっともです。$$, $$あれだけれんしゅうしたのだから、ゆうしょうしたのももっともです。$$, $$Com tanto treino, faz sentido que tenha vencido.$$),
    ('n2-grammar-115', $$毎日残業では、疲れるのももっともだ。$$, $$まいにちざんぎょうでは、つかれるのももっともだ。$$, $$Fazendo hora extra todo dia, é compreensível ficar cansado.$$),
    ('n2-grammar-115', $$この値段なら、人気があるのももっともだ。$$, $$このねだんなら、にんきがあるのももっともだ。$$, $$Com este preço, é natural que seja popular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ひどいことを言われたのだから、彼女が泣く____。$$, $$Ouviu coisas horríveis, então é compreensível que ela chore.$$),
        (2, $$約束を何度も破られたら、信じられなくなる____。$$, $$Se a promessa for quebrada várias vezes, é natural deixar de confiar.$$),
        (3, $$こんなに暑いなら、食欲がない____。$$, $$Com este calor, é compreensível não ter apetite.$$),
        (4, $$子供が心配な____。$$, $$É natural se preocupar com o filho.$$),
        (5, $$一人で住むのが寂しい____。$$, $$É compreensível que morar sozinho seja solitário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のももっともだ$$),
        (1, $$のももっともです$$),
        (2, $$のももっともだ$$),
        (2, $$のももっともです$$),
        (3, $$のももっともだ$$),
        (3, $$のももっともです$$),
        (4, $$のももっともだ$$),
        (4, $$のももっともです$$),
        (5, $$のももっともだ$$),
        (5, $$のももっともです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
