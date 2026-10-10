-- n2-grammar-132 — ろくに〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-132',
    'grammar',
    'N2',
    $$ろくに〜ない$$,
    $$roku ni ~ nai$$,
    $$Mal / Quase não / Direito não$$,
    $$ろくに junto com uma forma negativa indica que algo não é feito de forma suficiente ou adequada. Equivale a "mal", "quase não" ou "não... direito".

O tom é negativo e muitas vezes de crítica ou reclamação. Por exemplo, "mal dormi ontem" ou "ele nem cumprimenta direito".

É uma expressão coloquial, comum na fala.$$,
    $$A forma ろくな, antes de substantivos, significa "decente" ou "que preste", como em ろくなものがない, "não tem nada que preste".

É parecido com ほとんど〜ない, mas ろくに tem um tom mais crítico.$$,
    $$ろくに + Verbo (forma ない)
ろくな + Substantivo + がない / ではない$$,
    $$ろくに〜ない$$,
    $$ろくに|ろくな$$,
    ARRAY['ろく', 'に', 'ない']::text[],
    ARRAY['ろくに〜ない', 'ろくな〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-132', $$昨日はろくに寝ていない。$$, $$きのうはろくにねていない。$$, $$Ontem mal dormi.$$),
    ('n2-grammar-132', $$彼はろくに挨拶もしない。$$, $$かれはろくにあいさつもしない。$$, $$Ele nem cumprimenta direito.$$),
    ('n2-grammar-132', $$ろくに勉強しないで試験を受けた。$$, $$ろくにべんきょうしないでしけんをうけた。$$, $$Fiz a prova quase sem estudar.$$),
    ('n2-grammar-132', $$忙しくて、ろくに食事もとれない。$$, $$いそがしくて、ろくにしょくじもとれない。$$, $$Estou tão ocupado que mal consigo comer.$$),
    ('n2-grammar-132', $$この店にはろくな物がない。$$, $$このみせにはろくなものがない。$$, $$Esta loja não tem nada que preste.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$説明書も____読まずに、使い始めた。$$, $$Comecei a usar sem nem ler o manual direito.$$),
        (2, $$彼は人の話を____聞かない。$$, $$Ele mal ouve o que os outros dizem.$$),
        (3, $$最近は____休みも取れない。$$, $$Ultimamente mal consigo tirar folga.$$),
        (4, $$____調べもしないで、文句を言うな。$$, $$Não reclame sem nem pesquisar direito.$$),
        (5, $$あいつは____ことをしない。$$, $$Aquele cara não faz nada que preste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ろくに$$),
        (2, $$ろくに$$),
        (3, $$ろくに$$),
        (4, $$ろくに$$),
        (5, $$ろくな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
